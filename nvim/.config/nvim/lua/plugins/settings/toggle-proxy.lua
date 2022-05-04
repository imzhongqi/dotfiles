local M = {}

function M.setup()
    function _G.toggle_proxy()
        local proxies = {
            http_proxy = vim.g.http_proxy or "http://localhost:1080",
            https_proxy = vim.g.https_proxy or "http://localhost:1080",
        }

        local enable = nil

        if not os.getenv("http_proxy") then
            enable = true
            vim.notify(
                "enable proxy: \n"
                    .. "http_proxy="
                    .. proxies["http_proxy"]
                    .. "\n"
                    .. "https_proxy="
                    .. proxies["https_proxy"],
                "info",
                { title = "Toggle Proxy" }
            )
        else
            vim.notify("disable proxy", "info", { title = "Toggle Proxy" })
        end

        for k, v in pairs(proxies) do
            if enable then
                vim.fn.setenv(k, v)
            else
                vim.fn.setenv(k, nil)
            end
        end
    end
end

return M
