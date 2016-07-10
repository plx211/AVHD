#include <amxmodx>

new files[][] = {
  "addons/amxmodx/plugins/admin.amxx",
  "addons/amxmodx/plugins/adminchat.amxx",
  "addons/amxmodx/plugins/admincmd.amxx",
  "addons/amxmodx/plugins/adminhelp.amxx",
  "addons/amxmodx/plugins/adminslots.amxx",
  "addons/amxmodx/plugins/admin_sql.amxx",
  "addons/amxmodx/plugins/adminvote.amxx",
  "addons/amxmodx/plugins/amxmod_compat.amxx",
  "addons/amxmodx/plugins/antiflood.amxx",
  "addons/amxmodx/plugins/cmdmenu.amxx",
  "addons/amxmodx/plugins/imessage.amxx",
  "addons/amxmodx/plugins/mapchooser.amxx",
  "addons/amxmodx/plugins/mapsmenu.amxx",
  "addons/amxmodx/plugins/menufront.amxx",
  "addons/amxmodx/plugins/miscstats.amxx",
  "addons/amxmodx/plugins/multilingual.amxx",
  "addons/amxmodx/plugins/nextmap.amxx",
  "addons/amxmodx/plugins/pausecfg.amxx",
  "addons/amxmodx/plugins/plmenu.amxx",
  "addons/amxmodx/plugins/pluginmenu.amxx",
  "addons/amxmodx/plugins/restmenu.amxx",
  "addons/amxmodx/plugins/scrollmsg.amxx",
  "addons/amxmodx/plugins/statscfg.amxx",
  "addons/amxmodx/plugins/stats_logging.amxx",
  "addons/amxmodx/plugins/statsx.amxx",
  "addons/amxmodx/plugins/telemenu.amxx",
  "addons/amxmodx/plugins/timeleft.amxx"
};

new files_hash[][] = {
  "46d6b9375bce1fba47bc043cda662963",
  "207c0593128afe0e76423adec5771c50",
  "ad80dcef313455ebf5191203cbd2ef60",
  "0b3bb043f98bd10b3d3f6d5c00657775",
  "bca3b511cbaa8afc047e1e4ef25c232e",
  "024b0faeba106b7082f6b4300d6c1b32",
  "f97092cc50ba777d95debe08c19525ec",
  "3dc877a6017de2c3e432ae0cc1f7d853",
  "61177525cf172387c288917fcd91c737",
  "054cfef03bd9bbb6936cb1589f23deee",
  "a30536ab5af701306eac3f8a299e7bd1",
  "132da5ce65d847c785be47f1ec32fe6b",
  "ba9570d1a4c746e58c89ca1075d8ab54",
  "a67f63783baba67ab85819d990ea27f2",
  "8155a89813b59c15b6d8864c1d882331",
  "15ce6fa68f1c061b0b338ac1cca813fb",
  "380b40ef01ebc15885a0e7b913dc77a7",
  "ba1e514aa72381ac466a9559348d8ba6",
  "b01c66967da5d0d32660059537855ccb",
  "a516cafaefbb4818ccd2e2e38d658f65",
  "63889b305acb16a891b40e93fb81241c",
  "b35324df0c6089231003ca8b5643737f",
  "95a2d0b5d6293b1cfac0db31ae508687",
  "51f87ae5041b2f74003ff38e449c18d8",
  "5a52ecbb0f0f83c292e4dc2340880261",
  "ed4247c9da7d67576017fb6156026d1f",
  "09021abe08dafd92cf9d6fa05f4843c5"
};

public plugin_init() {
  register_plugin("Amxx Vanillia Hash Detector", "0.1", "PLX");
  register_concmd("plx_check_file", "on_check_file", ADMIN_RCON);
}

public on_check_file(id, level, cid) {
  check_all_file_hash();
}

stock check_all_file_hash() {
  new hash[34];
  new good = 0;
  new bad = 0;

  for (new i = 0; i < sizeof(files); ++i) {
    hash = encrypt_file(files[i]);

    if (equal(hash, files_hash[i], 32)) {
      ++good;
      server_print("[OK]%s status: hash equal", files[i]);
    } else {
      ++bad;
      server_print("[ERROR] %s status: hash not equal", files[i]);
    }
  }
  server_print("Count [OK / Error]: %d / %d", good, bad);

}

stock encrypt_file(const file[]) {
  new hash_sum_file[34]
  md5_file(file,hash_sum_file)
  return hash_sum_file;
}
