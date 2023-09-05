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

17.- Home y Login
    Crea una ruta en config/routes.rb para la página de inicio:
    devise_scope :user do
        root to: 'devise/sessions#new'
    end
18.- Registrar Operadores:
    a.- Por app.
        Registrarlo atraves del formulario de device.
    b.- por consola.
        rails c
        User.create(email: "nombre",password: "123456")
    c.- por seed
            Agregarlo dentro seed.rb User.create(email: "nombre",password: "123456")


19.- Agregar combobox para motivo en agregar llamada
Si deseas agregar un campo de motivo (reason) a la creación de llamadas con un combobox, debes modificar la vista de creación de llamadas (app/views/calls/_form.html.erb). Puedes usar un select para esto.

<div class="field">
  <%= f.label :reason %>
  <%= f.select :reason, ["Requerimiento", "Reclamo", "Consulta"] %>
</div>
Luego, en el modelo Call (app/models/call.rb), puedes validar que el motivo esté incluido en las opciones especificadas:

validates :reason, inclusion: { in: %w[Requerimiento Reclamo Consulta] }
19.- Estilos
Para agregar estilos a tus vistas, puedes utilizar CSS o un framework como Bootstrap. Si ya has agregado Bootstrap a tu aplicación, puedes personalizar los estilos de las vistas específicas. Para modificar los estilos de las vistas de Client y Call, debes editar los archivos de vistas correspondientes en app/views/clients y app/views/calls y agregar clases de Bootstrap o tus propias reglas CSS según sea necesario.	
Configurar pagy en tu controlador:

20.- En el controlador donde desees agregar la paginación (por ejemplo, CallsController), primero importa pagy y configura la paginación en tu acción index:

ApplicationController:
    Pagy::DEFAULT[:items] = 10
    include Pagy::Backend

ApplicationHelper:
    include Pagy::Frontend

class CallsController < ApplicationController
  def index
    @calls = Call.all
    @pagy, @calls = pagy(@calls)
  end
end
Aquí, hemos utilizado Call.all para obtener todas las llamadas y luego hemos usado pagy(@calls) para aplicar la paginación a esa lista.

Agregar la paginación en la vista:

En la vista donde deseas mostrar la paginación (por ejemplo, app/views/calls/index.html.erb), puedes agregar la paginación de la siguiente manera:

<div class="pagination">
  <%= pagy_nav(@pagy) %>
</div>

Esto generará los enlaces de paginación para que los usuarios puedan navegar entre las páginas.
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