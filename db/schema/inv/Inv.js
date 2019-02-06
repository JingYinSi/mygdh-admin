const mongoose = require('mongoose'),
    Schema = mongoose.Schema,
    ObjectId = Schema.Types.ObjectId,
    transformOption = require('@finelets/hyper-rest/db/mongoDb/DocTransformOption')

const InvSchema = new Schema({
        part: ObjectId,
        qty: Number
    },
    { 
        ...transformOption,
        autoCreate: true,
        timestamps: { updatedAt: 'modifiedDate' }
     }
)

module.exports = mongoose.model('Inv', InvSchema);