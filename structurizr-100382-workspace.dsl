workspace {

    model {
        user = person "Cliente" {
            description "Un cliente que interactúa con el sistema bancario a través de la aplicación web o móvil."
        }

        coreSystem = softwareSystem "Sistema Bancario" {
            description "Sistema de banca por internet donde los usuarios pueden consultar sus movimientos, realizar transferencias y pagos."

            webApp = container "Aplicación Web (SPA)" {
                description "Aplicación web de una sola página (SPA) donde los clientes pueden acceder a sus cuentas y realizar transacciones."
             
                
                 appWeb = component "Aplicación Web" {
                    description "Frontend para clientes basado en navegadores."
                    technology "Angular, Tailwind CSS, ReactJS"
                }
            }

            mobileApp = container "Aplicación Móvil" {
                description "Aplicación móvil multiplataforma que permite realizar las mismas operaciones que la aplicación web."
                
                appMobile = component "Aplicación Móvil" {
                    description "Aplicación móvil para acceso a servicios bancarios."
                    technology "Flutter / React Native"
                
                }
            }

            apiGateway = container "API Gateway" {
                description "Enrutador central que dirige las solicitudes hacia los microservicios correspondientes."
                technology "NGINX / Kong"
            }

            authService = container "Servicio de Autenticación" {
                description "Servicio encargado de gestionar la autenticación de los usuarios mediante OAuth2.0."
                technology "Auth0 / Okta"
            }

            coreService = container "Servicio Core" {
                description "Microservicio que consulta la base de datos principal con la información del cliente, cuentas y movimientos."
                technology "Spring Boot"
            }

            notificationService = container "Servicio de Notificaciones" {
                description "Servicio encargado de enviar notificaciones a los usuarios sobre sus movimientos, pagos y transacciones."
                technology "AWS SNS / Twilio"
            }

            auditService = container "Servicio de Auditoría" {
                description "Microservicio que registra todas las acciones realizadas por el cliente para auditoría."
                technology "Elasticsearch / MongoDB"
            }

            facialRecognitionService = container "Servicio de Reconocimiento Facial" {
                description "Microservicio que gestiona el proceso de onboarding usando reconocimiento facial."
                technology "AWS Rekognition / Azure Face API"
            }

            externalPaymentApi = container "API de Pagos Externos" {
                description "API externa que permite realizar pagos y transferencias entre cuentas interbancarias."
                technology "REST API"
            }
        }

        user -> webApp "Accede a la aplicación web"
        user -> mobileApp "Accede a la aplicación móvil"
        webApp -> apiGateway "Hace solicitudes a través del API Gateway"
        mobileApp -> apiGateway "Hace solicitudes a través del API Gateway"
        apiGateway -> authService "Gestiona la autenticación de usuarios"
        apiGateway -> coreService "Consulta datos de cliente, cuentas y movimientos"
        apiGateway -> notificationService "Envía notificaciones a través de servicios de mensajería"
        apiGateway -> facialRecognitionService "Utiliza el servicio de reconocimiento facial para onboarding"
        coreService -> externalPaymentApi "Realiza transferencias y pagos interbancarios"
        coreService -> auditService "Registra las acciones del cliente para auditoría"
    }

    views {
        systemContext coreSystem {
            include *
            autolayout lr
        }

        container coreSystem {
            include *
            autolayout lr
        }

        component webApp {
            include *
            autolayout lr
        }

        component mobileApp {
            include *
            autolayout lr
        }
   

    styles {
        // Definimos los estilos de los elementos
        element "Person" {
            background "#ff9900"
            color "#ffffff"
        }
        element "SoftwareSystem" {
            background "#3366cc"
            color "#ffffff"
        }
        element "Container" {
            background "#009900"
            color "#ffffff"
        }
        element "Component" {
            background "#66cc66"
            color "#ffffff"
        }
    }
}
  
}
