package system
{
	import Core;
	public class Parser
	{
		public function Parser()
		{

		}

		private var serachObjects = {};

		public function addSearchable(item, name):void
		{
			serachObjects[name] = item;
		}

		private function replaceTemplate(brackted, containerName, templateName, index, full):String
		{
			var result = "";
			if (typeof(serachObjects[containerName][templateName]) === "function")
			{
				result = serachObjects[containerName][templateName]();
			}
			else
			{
				result = serachObjects[containerName][templateName].toString();
			}

			return (result);
		}

		public function parse(inputString):String
		{
			// Regular expresion that finds words in brackets like [word] or [cmd]
			var regex = /\[(\w+)\.(\w+)\]/g; 
			var parseText = inputString.replace(regex,replaceTemplate);

			return parseText;
		}

	}

}