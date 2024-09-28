const std = @import("std");

const Character = struct {
    const Self = @This();
    const out = std.io.getStdOut().writer();
    const in = std.io.getStdIn().reader();
    const buf_size = 4096;
    var input = [_]u8{0} ** buf_size;
    var buf = std.io.fixedBufferStream(&input);
    const writer = buf.writer();
    const body_skill = .{ "Finesse", "Athletics", "Acrobatics", "Stealth", "Fine Motor Skills", "Music" };
    const wit_skill = .{ "Persuasion", "Perception", "Leadership", "Improvisation", "Survival" };
    const mind_skill = .{ "History", "Magical Knowledge", "Insight", "Alchemy", "Enchanting" };
    const martial_arts = .{ "Unarmed", "Trauma and Cleaving", "Sword and Hilt Weapons", "Spears and Polearms", "Bows", "Crossbows", "Throwing Weapons" };
    const magic = .{ "Ritual Magic", "Catalytic Magic", "Freeform Magic" };
    name: []const u8,
    species: []const u8,
    pst: []const u8,
    body: u8,
    wit: u8,
    mind: u8,
    endurance: u8,
    max_hp: u8,
    hp: u8,
    max_mvmt: u8,
    eff_mvmt: u8,
    currency: u32,
    body_skill_mastery: [6]u8,
    wit_skill_mastery: [5]u8,
    mind_skill_mastery: [5]u8,
    martial_arts_mastery: [7]u8,
    magic_mastery: [3]u8,

    fn createCharacter(name: []const u8, species: []const u8, pst: []const u8, body: u8, wit: u8, mind: u8) Character {
        return Character{
            .name = name,
            .species = species,
            .pst = pst,
            .body = body,
            .wit = wit,
            .mind = mind,
            .endurance = 0,
            .max_hp = body,
            .hp = body,
            .max_mvmt = body,
            .eff_mvmt = @divFloor(body, 2),
            .currency = 0,
            .body_skill_mastery = .{ 0, 0, 0, 0, 0, 0 },
            .wit_skill_mastery = .{ 0, 0, 0, 0, 0 },
            .mind_skill_mastery = .{ 0, 0, 0, 0, 0 },
            .martial_arts_mastery = .{ 0, 0, 0, 0, 0, 0, 0 },
            .magic_mastery = .{ 0, 0, 0 },
        };
    }
    fn loadCharacter() Character {
        return Character; // TODO: do some json magic or smthn
    }
    fn print(self: Self) !void {
        try out.print("{s}\n", .{self.name});
        try in.streamUntilDelimiter(writer, '\n', buf_size);
        const end: usize = getEnd();
        try out.print("{s}\n", .{input[0..end]});
    }
    fn getEnd() usize {
        var end: usize = buf_size;
        for (0..buf_size) |i| {
            if (input[i] == 0) {
                end = i;
                break;
            }
        }
        return end;
    }
    fn takeDamage(self: Self, dmg: u8) void {
        self.hp -= dmg;
    }
};

pub fn main() !void {
    var c = Character.createCharacter("sinep", "corps", "", 5, 2, 11);
    try c.print();
}
