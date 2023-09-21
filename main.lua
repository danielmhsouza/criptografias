local OTP = require('Scripts.OTP')
local CESAR = require('Scripts.CESAR')

local otp = function(value, password)
    local res, binary = OTP:create(value, password)

    if res then
        print("encriptado: ")
        print(res)

        local decripted = OTP:descrypt(binary)

        print('descriptado:')
        print(decripted)
        return true
    end
    return false
end

local cesar = function(value, password)
   local res, tableMsg = CESAR:create(value, password)

   print("Encriptado:")
   print(res)

   local decripted = CESAR:descrypt(tableMsg, password)

   print("Descriptado")
   print(decripted)
end

local menu = function()
    print("Qual algoritmo de criptografia quer usar?")
    print("1-OTP\n2-cifra de CESAR")
    local op = tonumber(io.read())

    if op == 1 then
        local res = false
        while res == false do     
            print("digite a mensagem que quer criptografar (apenas numeros):")
            local value = tonumber(io.read())
            print("digite a senha: ")
            local password = tonumber(io.read())
            res = otp(value, password)
        end
    end

    if op == 2 then
        print("digite a mensagem que quer criptografar (apenas letras):")
        local value = io.read()
        print("digite a quantidade de deslocamento: ")
        local password = tonumber(io.read())
        cesar(value, password)
    end
end

menu()
