const std = @import("std");

const Character = struct {
    const Self = @This();
    var name = "";
    var species = "";
    body: u8,
    wit: u8,
    mind: u8,
    endurance: u8,
    max_hp: u8,
    hp: u8,
    max_mvmt: u8,
    eff_mvmt: u8,
    currency: u32,
    var armor_and_garments = std.SinglyLinkedList(*const u8);
    var weapons = std.SinglyLinkedList(*const u8);
    var tmp_effects = std.SinglyLinkedList(*const u8);
    var perm_effects = std.SinglyLinkedList(*const u8);
    var relics = std.SinglyLinkedList(*const u8);
    var misc_items = std.SinglyLinkedList(*const u8);
    var feats = std.SinglyLinkedList(*const u8);
    var potions_and_bombs = std.SinglyLinkedList(*const u8);

    fn init(self: Self, body: u8, wit: u8, mind: u8) void {
        self.body = body;
        self.wit = wit;
        self.mid = mind;
        self.max_hp = body;
        self.hp = body;
        self.max_mvmt = body;
        self.eff_mvmt = @floor(body / 2);
    }
};

pub fn main() !void {
    var c = Character;
    c.init();
    const stdout_file = std.io.getStdOut().writer();
    var bw = std.io.bufferedWriter(stdout_file);
    const stdout = bw.writer();

    try stdout.print("hi", .{});

    try bw.flush();
}
