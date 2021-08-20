/**
 * 
 */

	function sub1()
	{
		
		if(document.getElementsByClassName("c1").length==0)
		{ 
		var li1 = document.getElementById("li1");
		var ultag = document.createElement("ul");
		var litag1 = document.createElement("li");
		var litag2 = document.createElement("li");
		var litag3 = document.createElement("li");
		var atag1 =  document.createElement("a");
		var atag2 =  document.createElement("a");
		var atag3 =  document.createElement("a");
		atag1.innerHTML="SUB1";
		atag2.innerHTML="SUB2";
		atag3.innerHTML="SUB3";
		atag1.setAttribute("href","#");
		atag2.setAttribute("href","#");
		atag3.setAttribute("href","#");
		litag1.setAttribute("class","c1");
		litag2.setAttribute("class","c1");
		litag3.setAttribute("class","c1");
		litag1.appendChild(atag1);
		litag2.appendChild(atag2);
		litag3.appendChild(atag3);
		
		ultag.appendChild(litag1);
		ultag.appendChild(litag2);
		ultag.appendChild(litag3);
		
		li1.appendChild(ultag);
		
		var li2 = document.getElementById("li2");
		li2.style.position="relative";
		li2.style.top="99px";
		li2.style.left="0px";
		var li3 = document.getElementById("li3");
		li3.style.position="relative";
		li3.style.top="99px";
		li3.style.left="0px";
		}
		else
		{	
			var rmtag = document.getElementsByClassName("c1");
			rmtag[0].remove();
			rmtag[0].remove();
			rmtag[0].remove();
			var li2 = document.getElementById("li2");
			li2.style.position="relative";
			li2.style.top="0px";
			li2.style.left="0px";
			var li3 = document.getElementById("li3");
			li3.style.position="relative";
			li3.style.top="0px";
			li3.style.left="0px";
		}
		
		
	}
	function sub2()
	{
		
		if(document.getElementsByClassName("c2").length==0)
		{ 
		var li2 = document.getElementById("li2");
		var ultag = document.createElement("ul");
		var litag1 = document.createElement("li");
		var litag2 = document.createElement("li");
		var litag3 = document.createElement("li");
		var atag1 =  document.createElement("a");
		var atag2 =  document.createElement("a");
		var atag3 =  document.createElement("a");
		atag1.innerHTML="SUB1";
		atag2.innerHTML="SUB2";
		atag3.innerHTML="SUB3";
		atag1.setAttribute("href","#");
		atag2.setAttribute("href","#");
		atag3.setAttribute("href","#");
		litag1.setAttribute("class","c2");
		litag2.setAttribute("class","c2");
		litag3.setAttribute("class","c2");
		litag1.appendChild(atag1);
		litag2.appendChild(atag2);
		litag3.appendChild(atag3);
		
		ultag.appendChild(litag1);
		ultag.appendChild(litag2);
		ultag.appendChild(litag3);
		
		li1.appendChild(ultag);
		
		var li3 = document.getElementById("li3");
		li3.style.position="relative";
		li3.style.top="96px";
		li3.style.left="0px";
		}
		else
		{	
			var rmtag = document.getElementsByClassName("c2");
			rmtag[0].remove();
			rmtag[0].remove();
			rmtag[0].remove();
			var li3 = document.getElementById("li3");
			li3.style.position="relative";
			li3.style.top="0px";
			li3.style.left="0px";
		}
	
}
