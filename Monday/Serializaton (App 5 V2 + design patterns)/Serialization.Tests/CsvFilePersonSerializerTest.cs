using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Serialization.Tests
{
    [TestClass]
    public class CsvFilePersonSerializerTests
    {
        private IFilePersonSerializer CreateTarget()
        {
            return new CsvFilePersonSerializer();
        }

        [TestMethod]
        [DeploymentItem("TextFile1.txt")]
        public void WhenSerializin2PersonsWeGetSamePersonsFile()
        {
            var expected = new Person[]
            {
                new Person { FirstName = "A", LastName = "B", Age = 12 },
                new Person { FirstName = "C", LastName = "D", Age = 22 }
            };

            var target = CreateTarget();

            target.Serializer(expected, "TextFile1.txt");

            var actual = target.Deserializer("TextFile1.txt");

            Assert.AreEqual(expected.Length, actual.Length);

            for (int i = 0; i < expected.Length; i++)
            {
                var actualElement = actual[i];
                var expectedElement = expected[i];

                Assert.AreEqual(expectedElement.FirstName, actualElement.FirstName);
                Assert.AreEqual(expectedElement.LastName, actualElement.LastName);
                Assert.AreEqual(expectedElement.Age, actualElement.Age);

            }
        }
    }
}
