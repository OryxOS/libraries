module au.elf;

private static immutable char[4] ElfIdent = [0x7F, 'E', 'L', 'F'];

// Arch specific good values
private version (X86_64) {
	enum Abi    = 0x00;
	enum Arch   = 0x3E;
	enum Endian = 0x01;
}

// Important indices into ident array
private enum IdentBits   = 4;
private enum IdentEndian = 5;
private enum IdentElfVer = 6;
private enum IdentOsABi  = 7;

struct Elf64Header {
	align(1):
	ubyte[16] ident;            // ELF identification info
	ushort type;                // Executable or otherwise
	ushort arch;                // Amd64 or else
	uint ver;                   // Elf specification version

	ulong entry;                // Executable's entry point	
	ulong prog_hdr_offset;      // File offset of the program headers
	ulong sect_hdr_offset;      // File offset of the section headers
	uint flags;
	ushort hdr_size;            // Size of this header
	ushort prog_hdr_size;       // Size of the program headers
	ushort prog_hdr_count;      // Number of program headers
	ushort sect_header_size;    // Size of the section headers
	ushort sect_header_count;   // Number of section headers
	ushort sect_header_section; // Index of the section containing the names of the section headers


}

struct ElfProgramHeader {
	uint type;       // Type of segment
	uint flags;      // Flags to load segment by
	ulong offset;    // Offset of the segment in the file
	ulong v_addr;    // Virtual address the segment would like to be loaded at
	ulong p_addr;    // Physical address the segment would like to be loaded at (Not always needed)
	ulong f_size;    // Size of the program on disk
	ulong m_size;    // Size of the program in memory
	ulong alignment; // Desired alignment of the segment

	enum Type {
		Null = 0x0,
		Load = 0x1,
	}
}

struct ElfSectionHeader {
	uint  str_offset; // Offset into the .shstrtab section
	uint  type;       // Type of section
	ulong flags;      // Flags to load the section by
	ulong address;    // Desired virtual address of the section
	ulong offset;     // Offset of the section in the file
	ulong size;       // Size of the section
	uint  link;       // `type` dependant
	uint  info;       // `type` dependant
	ulong addr_align; // Desired alignment of the section
	ulong entry_size; // Size of an entry into this section, if it contains entries
}