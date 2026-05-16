local path = lighty.env["physical.path"]
local uri  = lighty.env["uri.path"]

local function exists(p)
  local s = lighty.stat(p)
  return s ~= nil and s.st_size and s.st_size > 0
end

-- If BlueMap requested an uncompressed asset but only .gz exists, serve it.
-- This covers .prbm tiles and things like maps/<id>/textures.json.
if uri:match("%.prbm$") or uri:match("/textures%.json$") then
  local gz = path .. ".gz"

  if exists(gz) then
    lighty.env["physical.path"] = gz
    lighty.header["Content-Encoding"] = "gzip"
  end
end

-- Optional: missing map tiles as 204 instead of 404.
if uri:match("^/maps/[^/]+/tiles/") and not exists(lighty.env["physical.path"]) then
  return 204
end
