local CESAR = {}

CESAR.alfabet = {
    [1] = 'a',
    [2] = 'b',
    [3] = 'c',
    [4] = 'd',
    [5] = 'e',
    [6] = 'f',
    [7] = 'g',
    [8] = 'h',
    [9] = 'i',
    [10] = 'j',
    [11] = 'k',
    [12] = 'l',
    [13] = 'm',
    [14] = 'n',
    [15] = 'o',
    [16] = 'p',
    [17] = 'q',
    [18] = 'r',
    [19] = 's',
    [20] = 't',
    [21] = 'u',
    [22] = 'v',
    [23] = 'w',
    [24] = 'x',
    [25] = 'y',
    [26] = 'z',
}

function CESAR:split(str, delimiter)
    local result = {}
    delimiter = delimiter or "" -- Define o delimitador padrão como uma string vazia (se não for fornecido)

    for i = 1, #str do
        table.insert(result, str:sub(i, i))
    end

    return result
end

function CESAR:create(msg, desloc)
    local splitMsg = self:split(string.lower(msg), "")

    return self:encrypt(splitMsg, desloc)
end

function CESAR:encrypt(msg, desloc)
    local newMsg = {}
    for _, value in pairs(msg) do
        for k, v in pairs(self.alfabet) do
            if value == v then
                if k + desloc > 26 then
                    local diff = k + desloc - 26
                    table.insert(newMsg, self.alfabet[diff])
                else
                    table.insert(newMsg, self.alfabet[k + desloc])
                end
            end
        end
    end

    return table.concat(newMsg, ""), newMsg
end

function CESAR:descrypt(msg, desloc)
    local newMsg = {}
    for _, value in pairs(msg) do
        for k, v in pairs(self.alfabet) do
            if string.lower(value) == v then
                if k - desloc < 1 then
                    local diff = 26 - desloc - 1
                    table.insert(newMsg, self.alfabet[diff])
                else
                    table.insert(newMsg, self.alfabet[k - desloc])
                end
            end
        end
    end

    return table.concat(newMsg, "")
end
return CESAR
