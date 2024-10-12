const std = @import("std");

const print = std.debug.print;

pub fn main() void {
    var var1 = foo();
    const pvar1 = &var1;
    const pvar2 = &var1;
    pvar1.* += 1;
    pvar2.* += 1;
    print("Updated value: {}\n", .{pvar1.*}); // This should print 12
    print("Updated value: {}\n", .{pvar2.*}); // This should print 12
}

fn foo() i32 {
    return 10;
}
