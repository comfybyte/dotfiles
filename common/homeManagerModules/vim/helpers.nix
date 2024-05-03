rec {
  mkMap = key: mode: action: { inherit key mode action; };
  mkN = key: action: mkMap key "n" action;
  mkV = key: action: mkMap key "v" action;
  mkS = key: action: mkMap key "s" action;
  mkNLua = key: action: (mkN key action) // { lua = true; };
}
