﻿using SomePatterns.RealObjectPool;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SomePatterns.ObjectPool
{
    public class FarfuririiRozBejFactory : IFarfurieFactory, IObjectFactory<Farfurie>
    {
        public int counter = 1000;
        public Farfurie Create()
        {
            return new Farfurie
            {
                Id = counter++
            };
        }
    }
}
