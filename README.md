# 🛡️ Backups - Sistema de Conciliación Bancaria

Este repositorio contiene las copias de seguridad automáticas de la base de datos del **Sistema de Conciliación Bancaria**.

## 📂 Contenido
Los archivos almacenados aquí son volcados (dumps) de PostgreSQL generados automáticamente por el sistema.

- **Formato**: `.sql`
- **Nomenclatura**: `dump-YYYY-MM-DDTHH-mm-ss-msZ.sql`

## ⚠️ Seguridad y Privacidad
Este repositorio es **PRIVADO** y contiene información sensible de la base de datos.
- **No compartir** el acceso a este repositorio con personal no autorizado.
- **No hacer público** este repositorio bajo ninguna circunstancia.

## 🔄 Restauración
Para restaurar una copia de seguridad:

1. Clonar este repositorio o descargar el archivo `.sql` deseado.
2. Utilizar el comando `psql` o una herramienta como pgAdmin.

### Ejemplo de comando de restauración:
```bash
psql -U [usuario] -h [host] -d [nombre_db] -f archivo_backup.sql
```

## 🤖 Automatización
Estos backups son generados por un Cron Job que se ejecuta diariamente en el servidor de producción.
- **Frecuencia**: Diaria (3:00 AM)
- **Retención Local**: 7 días (en el servidor)
- **Nube**: Historial completo (en este repositorio)
