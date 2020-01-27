

Array.prototype.sample = function(){
    return this[Math.floor(Math.random()*this.length)];
  }

export const genders = ["male", "female"]

export const factions = ["alliance", "horde"]

export const realms = ["Sulfuras", "Faerlina", "Heartseeker", "Whitemane", "Westfall"]

// export const classes = ["druid", "paladin", "rogue", "warrior", "priest", "mage", "hunter", "warlock", "shaman"]

export const classes = ["warrior"]

export const races = {
    alliance: ["human", "dwarf", "gnome", "nightelf"],
    horde: ["tauren", "orc", "troll", "undead"]
}
// export const playableClasses = {
//     alliance: ["druid", "paladin", "rogue", "warrior", "priest", "mage", "hunter", "warlock"],
//     horde: ["druid", "shaman", "rogue", "warrior", "priest", "mage", "hunter", "warlock"]
// }

export const playableClasses = {
    alliance: ["warrior"],
    horde: ["warrior"]
}

export const guildTypes = ["raiding", "social", "roleplaying", "pvp", "leveling"]

// export const playableRaces = {
//     alliance: {
//         druid: ["nightelf"],
//         paladin: ["human", "dwarf"],
//         rogue: ["human", "gnome", "nightelf", "dwarf"],
//         warrior: ["human", "gnome", "nightelf", "dwarf"],
//         priest: ["human", "dwarf", "nightelf"],
//         mage: ["human", "gnome"],
//         hunter: ["dwarf", "nightelf"],
//         warlock: ["gnome", "human"]
//     },
//     horde: {
//         druid: ["tauren"],
//         shaman: ["tauren", "troll", "orc"],
//         rogue: ["troll", "orc", "undead"],
//         warrior: ["tauren", "troll", "undead", "orc"],
//         priest: ["troll", "undead"],
//         mage: ["undead", "troll"],
//         hunter: ["orc", "tauren", "troll"],
//         warlock: ["orc", "undead"]
//     }
// }

export const playableRaces = {
    alliance: {
        warrior: ["human"],
    },
    horde: {
        warrior: ["tauren"],
    }
}