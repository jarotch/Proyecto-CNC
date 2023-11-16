function ControlCNC3018()

    % Crear la figura del menú de selección de idioma
    figIdioma = figure('Name', 'Selecciona Idioma / Choose Language', 'Position', [100, 100, 400, 200]);

    % Definir colores personalizados para el menú
    colorFondoMenu = [0.87, 0.94, 1]; % Azul claro para el fondo
    colorTextoMenu = [0.2, 0.2, 0.2]; % Gris oscuro para el texto
    colorBotonEspanol = [0.65, 0.16, 0.16]; % Rojo oscuro para el botón en español
    colorBotonIngles = [0.16, 0.65, 0.16]; % Verde oscuro para el botón en inglés

    % Establecer colores de fondo y texto para la figura del menú
    set(figIdioma, 'Color', colorFondoMenu);
    set(figIdioma, 'DefaultTextColor', colorTextoMenu);

    % Crear un panel principal para el menú
    panelIdioma = uipanel(figIdioma, 'Position', [0.05, 0.05, 0.9, 0.9]);

    % Crear un botón para seleccionar español
    btnEspanol = uicontrol(panelIdioma, 'Style', 'pushbutton', 'String', 'Espa�ol', 'Position', [70, 20, 100, 40], 'Callback', @abrirGuiEspanol, 'BackgroundColor', colorBotonEspanol, 'FontSize', 14);

    % Crear un botón para seleccionar inglés
    btnIngles = uicontrol(panelIdioma, 'Style', 'pushbutton', 'String', 'English', 'Position', [190, 20, 100, 40], 'Callback', @abrirGuiIngles, 'BackgroundColor', colorBotonIngles, 'FontSize', 14);

    % Función de callback para abrir la GUI en español
    function abrirGuiEspanol(~, ~)
        close(figIdioma); % Cerrar el menú de selección de idioma
        GUIEspanol(); % Abrir la GUI en español
    end

    % Función de callback para abrir la GUI en inglés
    function abrirGuiIngles(~, ~)
        close(figIdioma); % Cerrar el menú de selección de idioma
        GUIEnglish(); % Abrir la GUI en inglés
    end

    % Crear un texto grande y centrado para "Escoge tu idioma / Choose your Language"
    uicontrol(figIdioma, 'Style', 'text', 'String', 'Escoge tu idioma / Choose your Language', 'Position', [0, 100, 400, 40], 'FontSize', 16, 'HorizontalAlignment', 'center');

end

function GUIEspanol()
% Crear la figura principal de la GUI
fig = figure('Name', 'Control de CNC 3018', 'Position', [100, 100, 800, 600]);

% Definir colores personalizados
colorFondo = [0.8, 0.8, 0.8]; % Gris claro
colorTexto = [0.2, 0.2, 0.2]; % Gris oscuro
colorBoton = [0.4, 0.6, 0.9]; % Azul claro
colorBotonSeleccionado = [0.4, 0.6, 0.9]; % Azul medio
colorBotonEliminar = [0.9, 0.4, 0.4]; % Rojo claro
colorBotonInstrucciones = [0.4, 0.9, 0.4]; % Verde claro
colorBotonListaComandos = [0.9, 0.9, 0.2]; % Amarillo claro
colorBotonGuiaUsuario = [0.9, 0.5, 0.6]; % Rosado para el botón "Guía de Usuario"
colorBotonEjecutarGcode = [0.9, 0.7, 0.2]; % Naranja para el botón "Ejecutar G-code"

% Inicializar la variable comandosGcode en español
    comandosGcode = {}; % Agrega esta línea

% Establecer colores de fondo y texto para la figura
set(fig, 'Color', colorFondo);
set(fig, 'DefaultTextColor', colorTexto);

% Crear un panel principal
panelPrincipal = uipanel(fig, 'Title', 'Control de CNC 3018', 'Position', [0.05, 0.05, 0.9, 0.9]);

% Crear una lista para mostrar los comandos G-code
listBoxGcode = uicontrol(panelPrincipal, 'Style', 'listbox', 'Position', [20, 120, 400, 400], 'BackgroundColor', colorBotonSeleccionado, 'FontSize', 12);

% Crear un cuadro de texto para ingresar comandos G-code
editGcode = uicontrol(panelPrincipal, 'Style', 'edit', 'Position', [20, 60, 400, 30], 'BackgroundColor', colorBoton, 'FontSize', 12);

% Crear un botón para agregar comandos G-code a la lista
btnAgregar = uicontrol(panelPrincipal, 'Style', 'pushbutton', 'String', 'Agregar G-code', 'Position', [450, 60, 180, 30], 'Callback', @agregarGcode, 'BackgroundColor', colorBoton, 'FontSize', 12);

% Crear un botón para eliminar comandos G-code de la lista
btnEliminar = uicontrol(panelPrincipal, 'Style', 'pushbutton', 'String', 'Eliminar G-code', 'Position', [450, 120, 180, 30], 'Callback', @eliminarGcode, 'BackgroundColor', colorBotonEliminar, 'FontSize', 12);

% Crear un botón para ejecutar los comandos G-code
btnEjecutar = uicontrol(panelPrincipal, 'Style', 'pushbutton', 'String', 'Ejecutar G-code', 'Position', [450, 150, 180, 30], 'Callback', @ejecutarGcode, 'BackgroundColor', colorBotonEjecutarGcode, 'FontSize', 12);

% Crear un botón "Leer antes de usar" que muestra las instrucciones
btnLeerAntesDeUsar = uicontrol(panelPrincipal, 'Style', 'pushbutton', 'String', 'Leer antes de usar', 'Position', [450, 240, 180, 30], 'Callback', @mostrarInstrucciones, 'BackgroundColor', colorBotonInstrucciones, 'FontSize', 12);

% Crear un botón "Lista de comandos" que muestra una lista de comandos predefinidos
btnListaDeComandos = uicontrol(panelPrincipal, 'Style', 'pushbutton', 'String', 'Lista de comandos', 'Position', [450, 270, 180, 30], 'Callback', @mostrarListaDeComandos, 'BackgroundColor', colorBotonListaComandos, 'FontSize', 12);

% Crear un botón "Guía de Usuario" para abrir un archivo PDF
btnGuiaUsuario = uicontrol(panelPrincipal, 'Style', 'pushbutton', 'String', 'Gu�a de Usuario', 'Position', [450, 300, 180, 30], 'Callback', @abrirGuiaUsuario, 'BackgroundColor', colorBotonGuiaUsuario, 'FontSize', 12);

    % Agregar el botón "Desplazamiento Rapido" a la GUI
    btnDesplazamientoRapido = uicontrol(panelPrincipal, 'Style', 'pushbutton', 'String', 'Desplazamiento R�pido', 'Position', [450, 460, 180, 35], 'Callback', @abrirVentanaEmergente, 'BackgroundColor', colorBoton, 'FontSize', 12);

     % Agregar el botón "Desplazamiento Lento" a la GUI
    btnDesplazamientoLento = uicontrol(panelPrincipal, 'Style', 'pushbutton', 'String', 'Desplazamiento Lento', 'Position', [450, 430, 180, 35], 'Callback', @abrirVentanEmergente, 'BackgroundColor', colorBoton, 'FontSize', 12);

    % Realizar un muestreo
    btnMuestra = uicontrol(panelPrincipal, 'Style', 'pushbutton', 'String', 'Muestrear', 'Position', [450, 400, 180, 30],'Callback', @abrirMuestreo, 'BackgroundColor',colorBoton, 'FontSize', 12);


% Función de callback para el botón de agregar G-code
function agregarGcode(~, ~)
    % Obtener el comando G-code desde el cuadro de texto
    gcode = get(editGcode, 'String');
    
    % Agregar el comando G-code a la lista
    comandosGcode{end + 1} = gcode;
    
    % Actualizar la lista en la GUI
    set(listBoxGcode, 'String', comandosGcode);
    
    % Borrar el cuadro de texto
    set(editGcode, 'String', '');
end

% Función de callback para el botón de eliminar G-code
function eliminarGcode(~, ~)
    % Obtener el índice del elemento seleccionado en la lista
    selectedIndex = get(listBoxGcode, 'Value');
    
    % Eliminar el comando G-code seleccionado de la lista
    comandosGcode(selectedIndex) = [];
    
    % Actualizar la lista en la GUI
    set(listBoxGcode, 'String', comandosGcode);
end

% Función de callback para el botón de ejecutar G-code
function ejecutarGcode(~, ~)
    % Ruta al archivo grblControl.exe, ajusta la ruta según tu instalación
    grblcontrol_path = 'C:\Users\Labo402\Downloads\Candle_1.1.7\Candle\candle.exe';
    
    % Crear un archivo temporal G-code
    gcode_file = 'temp.nc';
    fileID = fopen(gcode_file, 'w');
    
    % Escribir todos los comandos G-code en el archivo
    for i = 1:length(comandosGcode)
        fprintf(fileID, '%s\n', comandosGcode{i});
    end
    
    fclose(fileID);
    
    try
        % Ejecutar grblControl.exe y cargar el archivo G-code
        cmd = ['"' grblcontrol_path '" -f "' gcode_file '"'];
        system(cmd);
        disp('Comandos G-code ejecutados con �xito.');
    catch
        disp('Error al ejecutar los comandos G-code.');
    end
    
    % Eliminar el archivo temporal G-code
    delete(gcode_file);
end

% Función de callback para el botón "Leer antes de usar"
function mostrarInstrucciones(~, ~)
    % Crear una ventana de diálogo con las instrucciones
    msgbox('Instrucciones: Aqu� puedes agregar comandos G-code a la lista y ejecutarlos con el bo�n "Ejecutar G-code". Puedes usar el bot�n "Agregar G-code" para agregar comandos y el bot�n "Eliminar G-code" para quitar comandos de la lista.', 'Instrucciones');
end

% Función de callback para el botón "Lista de comandos"
function mostrarListaDeComandos(~, ~)
    % Crear una ventana de diálogo con una lista de comandos predefinidos
    comandos = {'G00 X10 Y10', 'G01 X20 Y20 F100', 'G02 X30 Y30 I5 J5', 'G03 X40 Y40 I5 J5'};
    msgbox(sprintf('Lista de comandos predefinidos:\n\n%s', strjoin(comandos, '\n')), 'Lista de comandos');
end

% Función de callback para el botón "Guía de Usuario"
function abrirGuiaUsuario(~, ~)
    % Ruta al archivo PDF (asegúrate de tenerlo en la misma carpeta que este archivo MATLAB)
    archivoPDF = 'GuiaUsuario.pdf';
    
    try
        % Abrir el archivo PDF con el visor predeterminado
        open(archivoPDF);
        disp(['Gu�a de Usuario abierta: ' archivoPDF]);
    catch
        disp('Error al abrir la Gu�a de Usuario.');
    end
end

% Callback para el botón "Muestreo"

function abrirMuestreo(~, ~)

        % Crear una nueva figura para la ventana emergente
        figVentana = figure('Name', 'Muestreo', 'Position', [300, 300, 300, 200], 'Color', [0.9, 0.9, 0.2]);
        
        % Agregar boton de muestreo

        btnMuestreo_X = uicontrol(figVentana, 'Style', 'pushbutton', 'String', 'Muestrear en X', 'Position', [62, 145, 180, 30], 'Callback', @ejecutarGcodeMuestra_X, 'BackgroundColor', [0.9, 0.6, 0.2], 'FontSize', 14, 'ForegroundColor', [1, 1, 1]);
        btnMuestreo_Y = uicontrol(figVentana, 'Style', 'pushbutton', 'String', 'Muestrear en Y', 'Position', [62, 110, 180, 30], 'Callback', @ejecutarGcodeMuestra_Y, 'BackgroundColor', [0.9, 0.6, 0.2], 'FontSize', 14, 'ForegroundColor', [1, 1, 1]);
    
        % Agregar campos de entrada para la longitud de muestra y el tiempo con colores personalizados
        uicontrol(figVentana, 'Style', 'text', 'String', 'Longitud', 'Position', [20, 50, 70, 20], 'BackgroundColor', [0.9, 0.6, 0.2], 'FontSize', 13, 'ForegroundColor', [1, 1, 1]);
        editLongitud = uicontrol(figVentana, 'Style', 'edit', 'Position', [90, 50, 50, 20], 'BackgroundColor', [1, 1, 1], 'FontSize', 12, 'ForegroundColor', [0.9, 0.6, 0.2]);
        uicontrol(figVentana, 'Style', 'text', 'String', 'Tiempo antes de ejecuci�n (s):', 'Position', [20, 20, 70, 20], 'BackgroundColor', [0.9, 0.6, 0.2], 'FontSize', 13, 'ForegroundColor', [1, 1, 1]);
        editTiempo = uicontrol(figVentana, 'Style', 'edit', 'Position', [90, 20, 50, 20], 'BackgroundColor', [1, 1, 1], 'FontSize', 12, 'ForegroundColor', [0.9, 0.6, 0.2]);


        % Función de callback para ejecutar el comando G-code con pausa (ejemplo: G00 X19, G04 P11)
        
        function ejecutarGcodeConPausa(comando, tiempo)
            % Agregar el comando G-code con pausa a la lista
            comandoConPausa = sprintf('%s', comando);
            if tiempo > 0
                comandoConPausa = sprintf('%s; G04 P%.1f', comandoConPausa, tiempo);
            end
            comandosGcode{end + 1} = comandoConPausa;
            
            % Actualizar la lista en la GUI
            set(listBoxGcode, 'String', comandosGcode);
            
            % Cerrar ventana
            close(figVentana);
        end

        % Funciones de callback para muestra
    function ejecutarGcodeMuestra_X(~, ~)
            Longitud = str2double(get(editLongitud, 'String'));
            tiempo = str2double(get(editTiempo, 'String'));
            if isnan(Longitud) || isnan(tiempo)
                msgbox('Ingresar valores válidos para longitud y tiempo.', 'Error', 'error');
                return;
            end

            mitadL1 = -Longitud*0.5;
            mitadL2 = Longitud;

            ejecutarGcodeConPausa(sprintf('G00 X%.2f', mitadL1), tiempo);
            ejecutarGcodeConPausa(sprintf('G00 X%.2f', mitadL2), tiempo);
    end

    function ejecutarGcodeMuestra_Y(~, ~)
            Longitud = str2double(get(editLongitud, 'String'));
            tiempo = str2double(get(editTiempo, 'String'));
            if isnan(Longitud) || isnan(tiempo)
                msgbox('Ingresar valores válidos para longitud y tiempo.', 'Error', 'error');
                return;
            end

            mitadL1 = Longitud*0.5+(-1);
            mitadL2 = mitadL1*(-1);

            ejecutarGcodeConPausa(sprintf('G00 Y%.2f', mitadL1), tiempo);
            ejecutarGcodeConPausa(sprintf('G00 Y%.2f', mitadL2), tiempo);
        end

        
    end

     % Callback para el botón "Desplazamiento Rapido"
    function abrirVentanaEmergente(~, ~)
        % Crear una nueva figura para la ventana emergente
        figEmergente = figure('Name', 'Desplazamiento R�pido', 'Position', [300, 300, 300, 200], 'Color', [0.4, 0.7, 0.9]);
        
        % Agregar botones para las flechas con colores personalizados
        btnArriba = uicontrol(figEmergente, 'Style', 'pushbutton', 'String', '↑', 'Position', [120, 155, 50, 30], 'Callback', @ejecutarGcodeArriba, 'BackgroundColor', [0.4, 0.7, 0.9], 'FontSize', 14, 'ForegroundColor', [1, 1, 1]);
        btnAbajo = uicontrol(figEmergente, 'Style', 'pushbutton', 'String', '↓', 'Position', [120, 85, 50, 30], 'Callback', @ejecutarGcodeAbajo, 'BackgroundColor', [0.4, 0.7, 0.9], 'FontSize', 14, 'ForegroundColor', [1, 1, 1]);
        btnIzquierda = uicontrol(figEmergente, 'Style', 'pushbutton', 'String', '�?', 'Position', [70, 120, 50, 30], 'Callback', @ejecutarGcodeIzquierda, 'BackgroundColor', [0.4, 0.7, 0.9], 'FontSize', 14, 'ForegroundColor', [1, 1, 1]);
        btnDerecha = uicontrol(figEmergente, 'Style', 'pushbutton', 'String', '→', 'Position', [170, 120, 50, 30], 'Callback', @ejecutarGcodeDerecha, 'BackgroundColor', [0.4, 0.7, 0.9], 'FontSize', 14, 'ForegroundColor', [1, 1, 1]);

        % Agregar campos de entrada para la distancia y el tiempo con colores personalizados
        uicontrol(figEmergente, 'Style', 'text', 'String', 'Distancia:', 'Position', [20, 50, 70, 20], 'BackgroundColor', [0.4, 0.7, 0.9], 'FontSize', 13, 'ForegroundColor', [1, 1, 1]);
        editDistancia = uicontrol(figEmergente, 'Style', 'edit', 'Position', [90, 50, 50, 20], 'BackgroundColor', [1, 1, 1], 'FontSize', 12, 'ForegroundColor', [0.4, 0.7, 0.9]);
        
        uicontrol(figEmergente, 'Style', 'text', 'String', 'Tiempo antes de ejecuci�n (s):', 'Position', [20, 20, 70, 20], 'BackgroundColor', [0.4, 0.7, 0.9], 'FontSize', 13, 'ForegroundColor', [1, 1, 1]);
        editTiempo = uicontrol(figEmergente, 'Style', 'edit', 'Position', [90, 20, 50, 20], 'BackgroundColor', [1, 1, 1], 'FontSize', 12, 'ForegroundColor', [0.4, 0.7, 0.9]);


        % Función de callback para ejecutar el comando G-code con pausa (ejemplo: G00 X19, G04 P11)
        function ejecutarGcodeConPausa(comando, tiempo)
            % Agregar el comando G-code con pausa a la lista
            comandoConPausa = sprintf('%s', comando);
            if tiempo > 0
                comandoConPausa = sprintf('%s; G04 P%.1f', comandoConPausa, tiempo);
            end
            comandosGcode{end + 1} = comandoConPausa;
            
            % Actualizar la lista en la GUI
            set(listBoxGcode, 'String', comandosGcode);
            
            % Cerrar la ventana emergente
            close(figEmergente);
        end

        % Funciones de callback para las flechas
        function ejecutarGcodeArriba(~, ~)
            distancia = str2double(get(editDistancia, 'String'));
            tiempo = str2double(get(editTiempo, 'String'));
            if isnan(distancia) || isnan(tiempo)
                msgbox('Ingresa valores válidos para distancia y tiempo.', 'Error', 'error');
                return;
            end
            ejecutarGcodeConPausa(sprintf('G00 Y%.2f', distancia), tiempo);
        end

        function ejecutarGcodeAbajo(~, ~)
            distancia = str2double(get(editDistancia, 'String'));
            tiempo = str2double(get(editTiempo, 'String'));
            if isnan(distancia) || isnan(tiempo)
                msgbox('Ingresa valores válidos para distancia y tiempo.', 'Error', 'error');
                return;
            end
            ejecutarGcodeConPausa(sprintf('G00 Y-%.2f', distancia), tiempo);
        end

        function ejecutarGcodeIzquierda(~, ~)
            distancia = str2double(get(editDistancia, 'String'));
            tiempo = str2double(get(editTiempo, 'String'));
            if isnan(distancia) || isnan(tiempo)
                msgbox('Ingresa valores válidos para distancia y tiempo.', 'Error', 'error');
                return;
            end
            ejecutarGcodeConPausa(sprintf('G00 X-%.2f', distancia), tiempo);
        end

        function ejecutarGcodeDerecha(~, ~)
            distancia = str2double(get(editDistancia, 'String'));
            tiempo = str2double(get(editTiempo, 'String'));
            if isnan(distancia) || isnan(tiempo)
                msgbox('Ingresa valores válidos para distancia y tiempo.', 'Error', 'error');
                return;
            end
            ejecutarGcodeConPausa(sprintf('G00 X%.2f', distancia), tiempo);
        end
    end

     % Callback para el botón "Desplazamiento Lento"
    function abrirVentanEmergente(~, ~)
        % Crear una nueva figura para la ventana emergente
        figEmergente = figure('Name', 'Desplazamiento Lento', 'Position', [300, 300, 300, 200], 'Color', [0.4, 0.7, 0.9]);
        
        % Agregar botones para las flechas con colores personalizados
        btnArriba = uicontrol(figEmergente, 'Style', 'pushbutton', 'String', '↑', 'Position', [120, 150, 50, 30], 'Callback', @ejecutarGcodeArriba, 'BackgroundColor', [0.4, 0.7, 0.9], 'FontSize', 14, 'ForegroundColor', [1, 1, 1]);
        btnAbajo = uicontrol(figEmergente, 'Style', 'pushbutton', 'String', '↓', 'Position', [120, 90, 50, 30], 'Callback', @ejecutarGcodeAbajo, 'BackgroundColor', [0.4, 0.7, 0.9], 'FontSize', 14, 'ForegroundColor', [1, 1, 1]);
        btnIzquierda = uicontrol(figEmergente, 'Style', 'pushbutton', 'String', '�?', 'Position', [70, 120, 50, 30], 'Callback', @ejecutarGcodeIzquierda, 'BackgroundColor', [0.4, 0.7, 0.9], 'FontSize', 14, 'ForegroundColor', [1, 1, 1]);
        btnDerecha = uicontrol(figEmergente, 'Style', 'pushbutton', 'String', '→', 'Position', [170, 120, 50, 30], 'Callback', @ejecutarGcodeDerecha, 'BackgroundColor', [0.4, 0.7, 0.9], 'FontSize', 14, 'ForegroundColor', [1, 1, 1]);
        
        % Agregar campos de entrada para la distancia y el tiempo con colores personalizados
        uicontrol(figEmergente, 'Style', 'text', 'String', 'Distancia:', 'Position', [20, 50, 70, 20], 'BackgroundColor', [0.4, 0.7, 0.9], 'FontSize', 12, 'ForegroundColor', [1, 1, 1]);
        editDistancia = uicontrol(figEmergente, 'Style', 'edit', 'Position', [90, 50, 50, 20], 'BackgroundColor', [1, 1, 1], 'FontSize', 12, 'ForegroundColor', [0.4, 0.7, 0.9]);
        uicontrol(figEmergente, 'Style', 'text', 'String', 'Tiempo (s):', 'Position', [20, 20, 70, 20], 'BackgroundColor', [0.4, 0.7, 0.9], 'FontSize', 12, 'ForegroundColor', [1, 1, 1]);
        editTiempo = uicontrol(figEmergente, 'Style', 'edit', 'Position', [90, 20, 50, 20], 'BackgroundColor', [1, 1, 1], 'FontSize', 12, 'ForegroundColor', [0.4, 0.7, 0.9]);

        % Función de callback para ejecutar el comando G-code con pausa (ejemplo: G01 X19, G04 P11)
        function ejecutarGcodeConPausa(comando, tiempo)
            % Agregar el comando G-code con pausa a la lista
            comandoConPausa = sprintf('%s', comando);
            if tiempo > 0
                comandoConPausa = sprintf('%s; G04 P%.1f', comandoConPausa, tiempo);
            end
            comandosGcode{end + 1} = comandoConPausa;
            
            % Actualizar la lista en la GUI
            set(listBoxGcode, 'String', comandosGcode);
            
            % Cerrar la ventana emergente
            close(figEmergente);
        end

        % Funciones de callback para las flechas
        function ejecutarGcodeArriba(~, ~)
            distancia = str2double(get(editDistancia, 'String'));
            tiempo = str2double(get(editTiempo, 'String'));
            if isnan(distancia) || isnan(tiempo)
                msgbox('Ingresa valores válidos para distancia y tiempo.', 'Error', 'error');
                return;
            end
            ejecutarGcodeConPausa(sprintf('G01 Y%.2f', distancia), tiempo);
        end

        function ejecutarGcodeAbajo(~, ~)
            distancia = str2double(get(editDistancia, 'String'));
            tiempo = str2double(get(editTiempo, 'String'));
            if isnan(distancia) || isnan(tiempo)
                msgbox('Ingresa valores válidos para distancia y tiempo.', 'Error', 'error');
                return;
            end
            ejecutarGcodeConPausa(sprintf('G01 Y-%.2f', distancia), tiempo);
        end

        function ejecutarGcodeIzquierda(~, ~)
            distancia = str2double(get(editDistancia, 'String'));
            tiempo = str2double(get(editTiempo, 'String'));
            if isnan(distancia) || isnan(tiempo)
                msgbox('Ingresa valores válidos para distancia y tiempo.', 'Error', 'error');
                return;
            end
            ejecutarGcodeConPausa(sprintf('G01 X-%.2f', distancia), tiempo);
        end

        function ejecutarGcodeDerecha(~, ~)
            distancia = str2double(get(editDistancia, 'String'));
            tiempo = str2double(get(editTiempo, 'String'));
            if isnan(distancia) || isnan(tiempo)
                msgbox('Ingresa valores válidos para distancia y tiempo.', 'Error', 'error');
                return;
            end
            ejecutarGcodeConPausa(sprintf('G01 X%.2f', distancia), tiempo);
        end
    end
end




function GUIEnglish()
    % Create the main GUI figure
    fig = figure('Name', 'CNC 3018 Control', 'Position', [100, 100, 800, 600]);

    % Define custom colors
    backgroundColor = [0.8, 0.8, 0.8]; % Light gray
    textColor = [0.2, 0.2, 0.2]; % Dark gray
    buttonColor = [0.4, 0.4, 0.9]; % Light blue
    selectedButtonColor = [0.3, 0.3, 0.8]; % Medium blue
    deleteButtonColor = [0.9, 0.4, 0.4]; % Light red
    instructionsButtonColor = [0.4, 0.9, 0.4]; % Light green
    commandListButtonColor = [0.9, 0.9, 0.2]; % Light yellow
    userGuideButtonColor = [0.9, 0.6, 0.6]; % Pink for "User Guide"
    executeGcodeButtonColor = [0.9, 0.7, 0.2]; % Orange for "Execute G-code"

    % Initialize the comandosGcode variable in English
    comandosGcode = {}; % Add this line

    % Set background and text colors for the figure
    set(fig, 'Color', backgroundColor);
    set(fig, 'DefaultTextColor', textColor);

    % Create a main panel
    mainPanel = uipanel(fig, 'Title', 'CNC 3018 Control', 'Position', [0.05, 0.05, 0.9, 0.9]);

    % Create a listbox to display G-code commands
    listBoxGcode = uicontrol(mainPanel, 'Style', 'listbox', 'Position', [20, 120, 400, 400], 'BackgroundColor', selectedButtonColor, 'FontSize', 12);

    % Create an edit box for entering G-code commands
    editGcode = uicontrol(mainPanel, 'Style', 'edit', 'Position', [20, 60, 400, 30], 'BackgroundColor', buttonColor, 'FontSize', 14);

    % Create a button to add G-code commands to the list
    btnAdd = uicontrol(mainPanel, 'Style', 'pushbutton', 'String', 'Add G-code', 'Position', [450, 60, 150, 35], 'Callback', @addGcode, 'BackgroundColor', buttonColor, 'FontSize', 13);

    % Create a button to delete G-code commands from the list
    btnDelete = uicontrol(mainPanel, 'Style', 'pushbutton', 'String', 'Delete G-code', 'Position', [450, 120, 150, 35], 'Callback', @deleteGcode, 'BackgroundColor', deleteButtonColor, 'FontSize', 13);

    % Create a button to execute G-code commands
    btnExecute = uicontrol(mainPanel, 'Style', 'pushbutton', 'String', 'Execute G-code', 'Position', [450, 180, 150, 35], 'Callback', @executeGcode, 'BackgroundColor', executeGcodeButtonColor, 'FontSize', 13);

    % Create a button "Read Before Use" that displays instructions
    btnReadBeforeUse = uicontrol(mainPanel, 'Style', 'pushbutton', 'String', 'Read Before Use', 'Position', [450, 240, 150, 35], 'Callback', @showInstructions, 'BackgroundColor', instructionsButtonColor, 'FontSize', 13);

    % Create a button "Command List" that displays a list of predefined commands
    btnCommandList = uicontrol(mainPanel, 'Style', 'pushbutton', 'String', 'Command List', 'Position', [450, 300, 150, 35], 'Callback', @showCommandList, 'BackgroundColor', commandListButtonColor, 'FontSize', 13);

    % Create a button "User Guide" to open a PDF file
    btnUserGuide = uicontrol(mainPanel, 'Style', 'pushbutton', 'String', 'User Guide', 'Position', [450, 360, 150, 35], 'Callback', @openUserGuide, 'BackgroundColor', userGuideButtonColor, 'FontSize', 13);

    % Agregar el botón "Desplazamiento Rapido" a la GUI
    btnDesplazamientoRapido = uicontrol(mainPanel, 'Style', 'pushbutton', 'String', 'Fast Forward', 'Position', [450, 460, 150, 35], 'Callback', @abrirVentanaEmergente, 'BackgroundColor', buttonColor, 'FontSize', 13);

     % Agregar el botón "Desplazamiento Lento" a la GUI
    btnDesplazamientoLento = uicontrol(mainPanel, 'Style', 'pushbutton', 'String', 'Slow Move', 'Position', [450, 410, 150, 35], 'Callback', @abrirVentanEmergente, 'BackgroundColor', buttonColor, 'FontSize', 13);

    
    % Callback function for the "Add G-code" button
    function addGcode(~, ~)
        % Get the G-code command from the edit box
        gcode = get(editGcode, 'String');

        % Add the G-code command to the list
        comandosGcode{end + 1} = gcode;

        % Update the list in the GUI
        set(listBoxGcode, 'String', comandosGcode);

        % Clear the edit box
        set(editGcode, 'String', '');
    end

    % Callback function for the "Delete G-code" button
    function deleteGcode(~, ~)
        % Get the index of the selected item in the list
        selectedIndex = get(listBoxGcode, 'Value');

        % Delete the selected G-code command from the list
        comandosGcode(selectedIndex) = [];

        % Update the list in the GUI
        set(listBoxGcode, 'String', comandosGcode);
    end

    % Callback function for the "Execute G-code" button
    function executeGcode(~, ~)
        % Path to the grblControl.exe file, adjust the path according to your installation
        grblcontrol_path = 'C:\Users\Labo402\Downloads\Candle_1.1.7\Candle\candle.exe';

        % Create a temporary G-code file
        gcode_file = 'temp.nc';
        fileID = fopen(gcode_file, 'w');

        % Write all G-code commands to the file
        for i = 1:length(comandosGcode)
            fprintf(fileID, '%s\n', comandosGcode{i});
        end

        fclose(fileID);

        try
            % Execute grblControl.exe and load the G-code file
            cmd = ['"' grblcontrol_path '" -f "' gcode_file '"'];
            system(cmd);
            disp('.');
        catch
            disp('Error executing G-code commands.');
        end

        % Delete the temporary G-code file
        delete(gcode_file);
    end

    % Callback function for the "Read Before Use" button
    function showInstructions(~, ~)
        % Create a dialog box with instructions
        msgbox('Instructions: Here you can add G-code commands to the list and execute them with the "Execute G-code" button. You can use the "Add G-code" button to add commands and the "Delete G-code" button to remove commands from the list.', 'Instructions');
    end

    % Callback function for the "Command List" button
    function showCommandList(~, ~)
        % Create a dialog box with a list of predefined commands
        commands = {'G00 X10 Y10', 'G01 X20 Y20 F100', 'G02 X30 Y30 I5 J5', 'G03 X40 Y40 I5 J5'};
        msgbox(sprintf('List of predefined commands:\n\n%s', strjoin(commands, '\n')), 'Command List');
    end

    % Callback function for the "User Guide" button
    function openUserGuide(~, ~)
        % Path to the PDF file (make sure to have it in the same folder as this MATLAB file)
        pdfFile = 'UserGuide.pdf';

        try
            % Open the PDF file with the default viewer
            open(pdfFile);
            disp(['User Guide already open: ' pdfFile]);
        catch
            disp('Error opening the User Guide.');
        end
    end

 % Callback para el botón "Desplazamiento Rapido"
    function abrirVentanaEmergente(~, ~)
        % Crear una nueva figura para la ventana emergente
        figEmergente = figure('Name', 'Fast forward', 'Position', [300, 300, 300, 200], 'Color', [0.4, 0.7, 0.9]);
        
        % Agregar botones para las flechas con colores personalizados
        btnArriba = uicontrol(figEmergente, 'Style', 'pushbutton', 'String', '↑', 'Position', [120, 155, 50, 30], 'Callback', @ejecutarGcodeArriba, 'BackgroundColor', [0.4, 0.7, 0.9], 'FontSize', 14, 'ForegroundColor', [1, 1, 1]);
        btnAbajo = uicontrol(figEmergente, 'Style', 'pushbutton', 'String', '↓', 'Position', [120, 85, 50, 30], 'Callback', @ejecutarGcodeAbajo, 'BackgroundColor', [0.4, 0.7, 0.9], 'FontSize', 14, 'ForegroundColor', [1, 1, 1]);
        btnIzquierda = uicontrol(figEmergente, 'Style', 'pushbutton', 'String', '�?', 'Position', [70, 120, 50, 30], 'Callback', @ejecutarGcodeIzquierda, 'BackgroundColor', [0.4, 0.7, 0.9], 'FontSize', 14, 'ForegroundColor', [1, 1, 1]);
        btnDerecha = uicontrol(figEmergente, 'Style', 'pushbutton', 'String', '→', 'Position', [170, 120, 50, 30], 'Callback', @ejecutarGcodeDerecha, 'BackgroundColor', [0.4, 0.7, 0.9], 'FontSize', 14, 'ForegroundColor', [1, 1, 1]);
        
        % Agregar campos de entrada para la distancia y el tiempo con colores personalizados
        uicontrol(figEmergente, 'Style', 'text', 'String', 'Distancia:', 'Position', [20, 50, 70, 20], 'BackgroundColor', [0.4, 0.7, 0.9], 'FontSize', 13, 'ForegroundColor', [1, 1, 1]);
        editDistancia = uicontrol(figEmergente, 'Style', 'edit', 'Position', [90, 50, 50, 20], 'BackgroundColor', [1, 1, 1], 'FontSize', 12, 'ForegroundColor', [0.4, 0.7, 0.9]);
        uicontrol(figEmergente, 'Style', 'text', 'String', 'Tiempo antes de ejecuci�n (s):', 'Position', [20, 20, 70, 20], 'BackgroundColor', [0.4, 0.7, 0.9], 'FontSize', 13, 'ForegroundColor', [1, 1, 1]);
        editTiempo = uicontrol(figEmergente, 'Style', 'edit', 'Position', [90, 20, 50, 20], 'BackgroundColor', [1, 1, 1], 'FontSize', 12, 'ForegroundColor', [0.4, 0.7, 0.9]);

        % Función de callback para ejecutar el comando G-code con pausa (ejemplo: G00 X19, G04 P11)
        function ejecutarGcodeConPausa(comando, tiempo)
            % Agregar el comando G-code con pausa a la lista
            comandoConPausa = sprintf('%s', comando);
            if tiempo > 0
                comandoConPausa = sprintf('%s; G04 P%.1f', comandoConPausa, tiempo);
            end
            comandosGcode{end + 1} = comandoConPausa;
            
            % Actualizar la lista en la GUI
            set(listBoxGcode, 'String', comandosGcode);
            
            % Cerrar la ventana emergente
            close(figEmergente);
        end

        % Funciones de callback para las flechas
        function ejecutarGcodeArriba(~, ~)
            distancia = str2double(get(editDistancia, 'String'));
            tiempo = str2double(get(editTiempo, 'String'));
            if isnan(distancia) || isnan(tiempo)
                msgbox('Ingresa valores válidos para distancia y tiempo.', 'Error', 'error');
                return;
            end
            ejecutarGcodeConPausa(sprintf('G00 Y%.2f', distancia), tiempo);
        end

        function ejecutarGcodeAbajo(~, ~)
            distancia = str2double(get(editDistancia, 'String'));
            tiempo = str2double(get(editTiempo, 'String'));
            if isnan(distancia) || isnan(tiempo)
                msgbox('Ingresa valores válidos para distancia y tiempo.', 'Error', 'error');
                return;
            end
            ejecutarGcodeConPausa(sprintf('G00 Y-%.2f', distancia), tiempo);
        end

        function ejecutarGcodeIzquierda(~, ~)
            distancia = str2double(get(editDistancia, 'String'));
            tiempo = str2double(get(editTiempo, 'String'));
            if isnan(distancia) || isnan(tiempo)
                msgbox('Ingresa valores válidos para distancia y tiempo.', 'Error', 'error');
                return;
            end
            ejecutarGcodeConPausa(sprintf('G00 X-%.2f', distancia), tiempo);
        end

        function ejecutarGcodeDerecha(~, ~)
            distancia = str2double(get(editDistancia, 'String'));
            tiempo = str2double(get(editTiempo, 'String'));
            if isnan(distancia) || isnan(tiempo)
                msgbox('Ingresa valores válidos para distancia y tiempo.', 'Error', 'error');
                return;
            end
            ejecutarGcodeConPausa(sprintf('G00 X%.2f', distancia), tiempo);
        end
    end

     % Callback para el botón "Desplazamiento Lento"
    function abrirVentanEmergente(~, ~)
        % Crear una nueva figura para la ventana emergente
        figEmergente = figure('Name', 'Desplazamiento Lento', 'Position', [300, 300, 300, 200], 'Color', [0.4, 0.7, 0.9]);
        
        % Agregar botones para las flechas con colores personalizados
        btnArriba = uicontrol(figEmergente, 'Style', 'pushbutton', 'String', '↑', 'Position', [120, 150, 50, 30], 'Callback', @ejecutarGcodeArriba, 'BackgroundColor', [0.4, 0.7, 0.9], 'FontSize', 14, 'ForegroundColor', [1, 1, 1]);
        btnAbajo = uicontrol(figEmergente, 'Style', 'pushbutton', 'String', '↓', 'Position', [120, 90, 50, 30], 'Callback', @ejecutarGcodeAbajo, 'BackgroundColor', [0.4, 0.7, 0.9], 'FontSize', 14, 'ForegroundColor', [1, 1, 1]);
        btnIzquierda = uicontrol(figEmergente, 'Style', 'pushbutton', 'String', '�?', 'Position', [70, 120, 50, 30], 'Callback', @ejecutarGcodeIzquierda, 'BackgroundColor', [0.4, 0.7, 0.9], 'FontSize', 14, 'ForegroundColor', [1, 1, 1]);
        btnDerecha = uicontrol(figEmergente, 'Style', 'pushbutton', 'String', '→', 'Position', [170, 120, 50, 30], 'Callback', @ejecutarGcodeDerecha, 'BackgroundColor', [0.4, 0.7, 0.9], 'FontSize', 14, 'ForegroundColor', [1, 1, 1]);
        
        % Agregar campos de entrada para la distancia y el tiempo con colores personalizados
        uicontrol(figEmergente, 'Style', 'text', 'String', 'Distance:', 'Position', [20, 50, 70, 20], 'BackgroundColor', [0.4, 0.7, 0.9], 'FontSize', 12, 'ForegroundColor', [1, 1, 1]);
        editDistancia = uicontrol(figEmergente, 'Style', 'edit', 'Position', [90, 50, 50, 20], 'BackgroundColor', [1, 1, 1], 'FontSize', 12, 'ForegroundColor', [0.4, 0.7, 0.9]);
        uicontrol(figEmergente, 'Style', 'text', 'String', 'Time (s):', 'Position', [20, 20, 70, 20], 'BackgroundColor', [0.4, 0.7, 0.9], 'FontSize', 12, 'ForegroundColor', [1, 1, 1]);
        editTiempo = uicontrol(figEmergente, 'Style', 'edit', 'Position', [90, 20, 50, 20], 'BackgroundColor', [1, 1, 1], 'FontSize', 12, 'ForegroundColor', [0.4, 0.7, 0.9]);

        % Función de callback para ejecutar el comando G-code con pausa (ejemplo: G01 X19, G04 P11)
        function ejecutarGcodeConPausa(comando, tiempo)
            % Agregar el comando G-code con pausa a la lista
            comandoConPausa = sprintf('%s', comando);
            if tiempo > 0
                comandoConPausa = sprintf('%s; G04 P%.1f', comandoConPausa, tiempo);
            end
            comandosGcode{end + 1} = comandoConPausa;
            
            % Actualizar la lista en la GUI
            set(listBoxGcode, 'String', comandosGcode);
            
            % Cerrar la ventana emergente
            close(figEmergente);
        end

        % Funciones de callback para las flechas
        function ejecutarGcodeArriba(~, ~)
            distancia = str2double(get(editDistancia, 'String'));
            tiempo = str2double(get(editTiempo, 'String'));
            if isnan(distancia) || isnan(tiempo)
                msgbox('Ingresa valores válidos para distancia y tiempo.', 'Error', 'error');
                return;
            end
            ejecutarGcodeConPausa(sprintf('G01 Y%.2f', distancia), tiempo);
        end

        function ejecutarGcodeAbajo(~, ~)
            distancia = str2double(get(editDistancia, 'String'));
            tiempo = str2double(get(editTiempo, 'String'));
            if isnan(distancia) || isnan(tiempo)
                msgbox('Ingresa valores válidos para distancia y tiempo.', 'Error', 'error');
                return;
            end
            ejecutarGcodeConPausa(sprintf('G01 Y-%.2f', distancia), tiempo);
        end

        function ejecutarGcodeIzquierda(~, ~)
            distancia = str2double(get(editDistancia, 'String'));
            tiempo = str2double(get(editTiempo, 'String'));
            if isnan(distancia) || isnan(tiempo)
                msgbox('Ingresa valores válidos para distancia y tiempo.', 'Error', 'error');
                return;
            end
            ejecutarGcodeConPausa(sprintf('G01 X-%.2f', distancia), tiempo);
        end

        function ejecutarGcodeDerecha(~, ~)
            distancia = str2double(get(editDistancia, 'String'));
            tiempo = str2double(get(editTiempo, 'String'));
            if isnan(distancia) || isnan(tiempo)
                msgbox('Ingresa valores válidos para distancia y tiempo.', 'Error', 'error');
                return;
            end
            ejecutarGcodeConPausa(sprintf('G01 X%.2f', distancia), tiempo);
        end
    end

end