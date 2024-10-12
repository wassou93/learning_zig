const std = @import("std");

pub fn main() void {
    const sum = add(8999, 2);
    std.debug.print("8999 + 2 = {d}\n", .{sum});

    const user = User{
        .power = User.SUPER_POWER,
        .name = "superman",
    };
    std.debug.print("{s}'s power is {}\n", .{ user.name, user.power });

    user.diagnose();
    User.diagnose(user);

    const goku = User.init("Goku", 9001);
    std.debug.print("{}\n", .{goku});

    const matrix: [3][3][2]i32 = .{
        .{ .{ 0, 1 }, .{ 1, 2 }, .{ 2, 3 } },
        .{ .{ 3, 4 }, .{ 4, 5 }, .{ 5, 6 } },
        .{ .{ 6, 7 }, .{ 7, 8 }, .{ 8, 9 } },
    };
    // Print the matrix
    for (matrix) |row| {
        for (row) |pair| {
            std.debug.print("[{}, {}] ", .{ pair[0], pair[1] });
        }
        std.debug.print("\n", .{});
    }
}

fn add(a: i64, b: i64) i64 {
    return a + b;
}

pub const User = struct {
    power: u64 = 0,
    name: []const u8 = undefined,

    pub const SUPER_POWER = 9000;

    pub fn diagnose(user: User) void {
        if (user.power >= SUPER_POWER) {
            std.debug.print("it's over {d}!!!\n", .{SUPER_POWER});
        }
    }

    pub fn init(name: []const u8, power: u64) User {
        // Instead of return User{...}
        return .{
            .name = name,
            .power = power,
        };
    }
};
