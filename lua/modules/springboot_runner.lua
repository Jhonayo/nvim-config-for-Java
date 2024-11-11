-- lua/modules/springboot_runner.lua

local M = {}

M.pid = nil
M.terminal_bufnr = nil

function M.boot_run()
    -- Si hay un proceso en ejecución, detenerlo
    if M.pid then
        M.stop()
    end

    -- Abrir una nueva ventana de terminal para ejecutar el comando
    vim.cmd('botright split | resize 15') -- Abrir una ventana en la parte inferior
    vim.cmd('term mvn spring-boot:run')
    local bufnr = vim.fn.bufnr()
    M.terminal_bufnr = bufnr

    -- Obtener el PID del proceso iniciado
    vim.fn.chansend(vim.b.terminal_job_id, '\n')
    M.pid = vim.b.terminal_job_id

    print("Spring Boot application started with PID: " .. M.pid)
end

function M.stop()
    if M.pid then
        -- Enviar señal para terminar el proceso
        vim.fn.jobstop(M.pid)
        M.pid = nil
        print("Spring Boot application stopped.")

        -- Cerrar el buffer del terminal si existe
        if M.terminal_bufnr and vim.api.nvim_buf_is_valid(M.terminal_bufnr) then
            vim.api.nvim_buf_delete(M.terminal_bufnr, { force = true })
            M.terminal_bufnr = nil
        end
    else
        print("No Spring Boot application is running.")
    end
end

return M

