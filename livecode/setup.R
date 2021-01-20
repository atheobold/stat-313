library(livecode)

server = livecode::serve_file()

server$send_msg("Hello World!", type = "success")
server$send_msg("Oh no!\n\n Something bad has happened.", type = "error")

server$stop()