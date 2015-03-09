-- Innovation Roleplay Engine
--
-- Author		Kernell
-- Copyright	© 2011 - 2015
-- License		Proprietary Software
-- Version		1.0

class. IniFile
{
	IniFile		= function( fileName, parse )
		this.Sections	= {};
		
		this.File	= File.Open( fileName, "r" );
		
		if not this.File then
			error( tostring( fileName ) + " - file not found", 3 );
		end
		
		local path	= fileName:split( "[\\/]" );
		
		local file	= path[ table.getn( path ) ];
		
		table.remove( path );
		
		local content	= this.File.Read();
		
		if content[ 1 ]:byte() == 0xEF and content[ 2 ]:byte() == 0xBB and content[ 3 ]:byte() == 0xBF then
			content = content:sub( 4, -1 );
			
			Debug( "Loading '" + fileName + "' in UTF-8 with BOM", 0 );
		end
		
		this.Code	=
		{
			Path	= table.concat( path, "\\" );
			File	= file;
			Content	= content;
			Length	= content:len();
		};
		
		this.File.Close();
		
		if parse ~= false then
			this.Parse();
		end
	end;
	
	_IniFile		= function()
		this.Sections	= NULL;
		this.Code		= NULL;
		this.File		= NULL;
	end;
	
	SectionExist	= function( sectionName )
		return this.Sections[ sectionName ] ~= NULL;
	end;
	
	LineExist		= function( sectionName, key )
		return this.Sections[ sectionName ] and this.Sections[ sectionName ][ key ] ~= NULL;
	end;
	
	LineCount		= function( sectionName )
		return sizeof( this.Sections[ sectionName ] );
	end;
	
	ReadBool		= function( sectionName, key )
		local value = this.Sections[ sectionName ] and (string)(this.Sections[ sectionName ][ key ]);
		
		return value == "true" or value == "1" or value == "yes";
	end;
	
	ReadFloat		= function()
		return this.Sections[ sectionName ] and (float)(this.Sections[ sectionName ][ key ]);
	end;
	
	ReadString		= function()
		return this.Sections[ sectionName ] and (string)(this.Sections[ sectionName ][ key ]);
	end;
	
	Parse			= function()
		local lines = this.Code.Content:split( '\n' );
		
		for lineNumber, line in ipairs( lines ) do
			this.ParseLine( lineNumber, line );
		end
	end;
	
	ParseLine		= function( lineNumber, line )
		local len = line:len();
		
		if len > 0 then
			local token =
			{
				Pos			= 0;
				Line		= line;
				LineNumber	= lineNumber;
				Key			= "";
				Value		= NULL;
				Char		= NULL;
			};
			
			while true do
				this.GetToken( token );
				
				if token.Char == "\r" then
					return;
				elseif this.IsComment( token ) then
					return;
				elseif token.Char == "#" then
					this.ParsePreprocessor( token );
					
					return;
				elseif token.Char == "[" then
					this.ParseSection( token );
					
					return;
				elseif this.IsWhiteSpace( token ) then
					-- continue;
				elseif this.IsKey( token ) then
					token.Key = token.Key .. token.Char;
				elseif token.Char == "=" then
					this.ParseValue( token );
					
					return;
				else
					this.Error( token, "Unexpected token %q", token.Char );
				end
			end
		end
	end;
	
	ParseValue		= function( token )
		local values =
		{
			[ 1 ] = "";
		};
		
		local nValue = 1;
		
		local inQuote = false;
		
		while true do
			this.GetToken( token );
			
			if token.Char == "\r" then
				if inQuote then
					this.Error( token, "Syntax error. Unexpected end of line" );
				end
				
				break;
			else
				if inQuote then
					if inQuote == token.Char then
						inQuote = false;
					else
						values[ nValue ] = values[ nValue ] .. token.Char;
					end
				else
					if not inQuote and ( token.Char == "'" or token.Char == "\"" ) then
						inQuote = token.Char;
					elseif token.Char == "," then
						nValue = nValue + 1;
						
						values[ nValue ] = "";
					elseif this.IsComment( token ) then
						break;
					elseif this.IsWhiteSpace( token ) then
						-- continue;
					else
						values[ nValue ] = values[ nValue ] .. token.Char;
					end
				end
			end
		end
		
		for i, v in ipairs( values ) do
			v = v:trim();
			
			if v == "true" or v == "false" then
				values[ i ] = v == "true";
			elseif tonumber( v ) then
				values[ i ] = tonumber( v );
			elseif v[ -1 ] == "f" and tonumber( v:sub( 1, -2 ) ) then
				values[ i ] = tonumber( v:sub( 1, -2 ) );
			elseif v[ 1 ] == "'" or v[ 1 ] == "\"" then
				if v[ 1 ] ~= v[ -1 ] then
					this.Error( token, "Syntax error" );
				end
				
				values[ i ] = v:sub( 2, -2 );
			else
				values[ i ] = v;
			end
		end
		
		if this.CurrentSection then
			local len = table.getn( values );
			
			if len == 1 then
				this.CurrentSection[ token.Key ] = values[ 1 ];
			elseif len > 1 then
				this.CurrentSection[ token.Key ] = values;
			end
		end
	end;
	
	ParseSection	= function( token )
		this.CurrentSection = NULL;
		
		local sectionName = "";
		
		while true do
			this.GetToken( token );
			
			if this.IsSection( token ) then
				sectionName = sectionName + token.Char;
			elseif token.Char == "]" then
				break;
			else
				this.Error( token, "Syntax error" );
			end
		end
		
		if sectionName:len() > 0 then
			this.Sections[ sectionName ] = {};
			
			this.CurrentSection = this.Sections[ sectionName ];
		end
		
		this.GetToken( token );
		
		if token.Char == ":" and this.CurrentSection then
			local sectionNames = "";
			
			while true do
				this.GetToken( token );
				
				if this.IsSection( token ) then
					sectionNames = sectionNames + token.Char;
				elseif token.Char == "," then
					sectionNames = sectionNames + token.Char;
				elseif token.Char == ";" or token.Char == "#" or token.Char == "\r" then
					break;
				end
			end
			
			if sectionNames:len() > 0 then
				local inherited = sectionNames:split( "," );
				
				for i, sectName in ipairs( inherited ) do
					local section = this.Sections[ sectName ];
					
					ASSERT( section ~= this.CurrentSection );
					
					if section then
						for k, v in pairs( section ) do
							this.CurrentSection[ k ] = v;
						end
					else
						this.Error( token, "Undeclared section '%s'", sectName );
					end
				end
			end
		end
	end;
	
	ParsePreprocessor	= function( token )
		local Preprocessors	=
		{
			include		= true;
		};
		
		local preprocessor = "";
		
		local value = NULL;
		
		while true do
			this.GetToken( token );
			
			if this.IsComment( token ) then
				if not Preprocessors[ preprocessor ] then
					this.Error( token, "Unexpected token %q", token.Char );
				end
				
				break;
			elseif this.IsWhiteSpace( token ) then
				if not Preprocessors[ preprocessor ] then
					this.Error( token, "Invalid preprocessor %q", (string)(preprocessor) );
				end
				
				while true do
					this.GetToken( token );
					
					if this.IsComment( token ) then
						break;
					else
						if value == NULL then
							value = "";
						end
						
						value = value + token.Char;
					end
				end
				
				value	= value:trim();
					
				if value:len() > 0 then
					if ( value[ 1 ] == "'" and value[ -1 ] == "'" ) or ( value[ 1 ] == "\"" and value[ -1 ] == "\"" ) then
						value = value:sub( 2, -2 );
					else
						this.Error( token, "Expected value" );
					end
				else
					this.Error( token, "Unexpected token %q", token.Char );
				end
				
				-- continue;
			else
				preprocessor = preprocessor .. token.Char;
			end
		end
		
		if value then	
			local INI = new. IniFile( this.Code.Path + "\\" + value, false );
			
			INI.Sections = this.Sections;
			
			INI.Parse();
			
			delete ( INI );
		else
			this.Error( token, "Expected value" );
		end
	end;
	
	IsWhiteSpace	= function( token )
		return token.Char == " " or token.Char == "\t";
	end;
	
	IsComment		= function( token )
		local token2 = table.clone( token );
		
		this.GetToken( token2 );
		
		return token.Char == ";" or token.Char == "\r" or ( token.Char == "/" and token2.Char == "/" );
	end;
	
	IsIdentifier	= function( token )
		if ( token.Char >= 'A' and token.Char <= 'Z' ) or ( token.Char >= 'a' and token.Char <= 'z' ) then
			return true;
		end
		
		if tonumber( token.Char ) then
			return true;
		end
		
		if token.Char == "_" then
			return true;
		end
		
		return false;
	end;
	
	IsKey			= function( token )
		return not token.Char:find( "[^A-Za-z0-9_\\$]" );
	end;
	
	IsValue			= function( token )
		return not token.Char:find( "[^A-Za-z0-9_\\]" );
	end;
	
	IsSection		= function( token )
		return not token.Char:find( "[^A-Za-z0-9--\.\_]" );
	end;
	
	GetToken		= function( token )
		token.Pos	= token.Pos + 1;
		token.Char	= token.Line[ token.Pos ] and token.Line[ token.Pos ] ~= "" and token.Line[ token.Pos ] or "\r";
	end;
	
	Error			= function( token, format, ... )
		error( this.Code.Path + "\\" + this.Code.File + " [" + token.LineNumber + "/" + token.Pos + "] " + string.format( format, ... ), 3 );
	end;
};