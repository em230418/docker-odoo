from odoo.addons.sugarcrm_to_sugarodoo.tools.importing import *
db = env['res.config.settings'].sugarcrm_get_db()
import_contacts(env, db)
