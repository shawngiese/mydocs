docbook
=======

# Some DocBook solutions

There are two solutions here.  The first, uses AsciiDoc markup to create multiple text files that can be built into a book or website.  The second is a collection of DocBook customizations that I have found useful.

My wiki pages here give information on creating a DocBook toolchain to build documents but you can also use the software that comes with AsciiDoc or export your text from AsciiDoc to DocBook and then use your preferred DocBook tools to make the final document output.  

## Why use a markup langauge?
This enables you to use any text editor on any operating system to update and create documents.  You can even use a web browser to edit the files if those files are stored on a server like GitHub.  

## Why use AsciiDoc?
There are many other markup languages that allow users to edit and format files but AsciiDoc allows you to link multiple text files together when you export, and export using the DocBook format.  You can also export text to HTML slideshows, HTML websites and documents in ePub and PDF formats.  Using the DocBook files enables automatic indexes, table of contents, and exporting to custom PDFs and webhelp depending on your DocBook tools.  AsciiDoc is free so any user can build final documents.

## Where's the power?
With AsciiDoc files stored in a server solution like GitHub, multiple users can edit documents online, edit documents using their preferred editor or submit change requests. Combine this with a continuous integration server like Jenkins, and you can script daily builds of the final document and immediate builds of a changed file to verify formatting and document structure.  Using scripts to build the final document ensures that all documents have a consistent look and contain any necessary content like legal text or project introductions. 

AsciiDoc can be downloaded from http://www.methods.co.nz/asciidoc/.