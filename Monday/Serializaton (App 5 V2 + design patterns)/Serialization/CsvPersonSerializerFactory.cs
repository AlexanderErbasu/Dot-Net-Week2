﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Serialization
{
    public class CsvPersonSerializerFactory
    {
        public IPersonSerializer Create()
        {
            return new CsvPersonSerializer();
        }
    }
}
