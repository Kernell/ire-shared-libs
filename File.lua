-- Innovation Roleplay Engine
--
-- Author		Kernell
-- Copyright	© 2011 - 2015
-- License		Proprietary Software
-- Version		1.0

class. File
{
	static
	{
		Create	= function( path )
			local file = new. File();
			
			file.__file = fileCreate( path );
			
			return file;
		end;
		
		Open	= function( path, mode )
			local file = new. File( path, mode );
			
			if file.IsValid() then
				return file;
			end
			
			return NULL;
		end;
		
		Exists	= function( path )
			return fileExists( path );
		end;
		
		Delete	= function( path )
			return fileDelete( path );
		end;
		
		Rename	= function( path, newPath )
			return fileRename( path, newPath );
		end;
		
		Copy	= function( path, newPath, overwrite )
			return fileCopy( path, newPath, overwrite );
		end;
	};
	
	File		= function( path, mode )
		if type( path ) == "string" then
			local readOnly = true;
			
			if type( mode ) == "string" and ( mode[ 1 ] == "w" or mode == "rw" ) then
				readOnly = false;
			end
			
			this.__file	= fileOpen( path, readOnly );
			this.__path	= path;
		end
	end;
	
	Close		= function()
		return fileClose( this.__file );
	end;
	
	Flush		= function()
		return fileFlush( this.__file );
	end;
	
	GetPos		= function()
		return fileGetPos( this.__file );
	end;
	
	SetPos		= function( offset )
		return fileSetPos( this.__file, offset );
	end;
	
	GetSize		= function()
		return fileGetSize( this.__file );
	end;
	
	IsValid		= function()
		return this.__file and fileExists( this.__path );
	end;
	
	IsEOF		= function()
		return fileIsEOF( this.__file );
	end;
	
	Read		= function( size )
		return fileRead( this.__file, size or this.GetSize() );
	end;
	
	ReadLine	= function()
		local lines	= this.Read():split( "\n" );
		local i		= 0;
		
		local function iter()
			i = i + 1;
			
			return lines[ i ];
		end
		
		return iter;
	end;
	
	Write		= function( ... )
		return fileWrite( this.__file, ... );
	end;
	
	WriteLine	= function( line )
		return fileWrite( this.__file, line + "\n" );
	end;
}