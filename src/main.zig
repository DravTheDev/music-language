const std = @import("std");
const print = std.debug.print;

fn process_line(line: []u8) {

};

fn process_file(reader: std.Io.Reader) {

};

pub fn main(init: std.process.Init) !void {
    const cwd = std.Io.Dir.cwd();
    const file = try cwd.openFile(
        init.io, "main.music", .{ .mode = .read_only },
    );
    defer file.close(init.io);

    var read_buffer: [300]u8 = undefined;
    var fr = file.reader(init.io, &read_buffer);
    var reader = &fr.interface;

    while (try reader.takeDelimiter('\n')) |line| {
        print("{s}\n", .{line});
    }
}
