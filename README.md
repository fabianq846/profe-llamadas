1.-Definir Entidades DB.
2.- Crear Proyecto rails con :
	rails new callcenter -d postgresql
3.- Configurar DB.
4.- Probar coneccion DB:
	rails db:create
5.- Instalacion de Gemas:
	bundle add devise pg_search pagy
6.- Instalar Estructura Devise
	rails generate devise:install
7.- Instalar custonizacion de componentes Devise
	rails g devise:views
8.- Generar usuario device:
	rails generate devise user
9.- Crear en schema DB:
	rails db:migrate
10.- Crear Scaffolding para entidad o modelo Cliente
	rails g scaffold Client name phone email
11.- Crear Scaffold para entidad o modelo de llamadas
	rails g scaffold Call reason detail client:references
12.- Ejecutamos la migracion hacia nuestra DB:
	rails db:migrate
13.- Levantar app para corroborar que esta todo OK
	rails s -b 0
14.- Agregar Relacion Muchos a uno en Cliente:
	- Ir a modelo client.rb
	- Agregar:
		has_many :calls
15.- Probamos relaciones de modelo en DB:
	- Ingresar a consola de rails:
		rails c
	- Creamos un Cliente y una llamda y la obtenemos:
		Client.create(name:"Test name 2",phone: "+56987654320",email: "correo2@mail.com")
		Call.create(reason: "Consulta",detail: "Llamada de consulta", client_id:1 )
		Client.last
		Client.last.calls
16.- Agregamos Bootsrap a nuestro application.html.erb
	- Importacion por CDN
	o
	- Intslacion de gemas
		https://asalvarez.notion.site/Instalaci-n-de-Bootstrap-cdd64efa580842808d91230dcf7d80ef
		
===== Pendientes:

- Home a logging 
- Seguridad en los controladores de Client y Call
- Registro de llamadas, modificar controller Call , agregar id de cliente.
- Agregar combobox para motivo en agregar llamada:
    - Agregar restriccion en modelo Call (opcional):
        validates :reason, inclusion: { in: %w[requirement claim consultation] }
    - Agregar Enum (opcional):
        enum reason: {
            requirement: 'Requerimiento',
            claim: 'Reclamo',
            consultation: 'Consulta'
    }, _default: 'consultation'

- Estilos:
    - Call
    - Agregar Cliente
    - Agregar llamada