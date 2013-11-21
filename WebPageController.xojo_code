#tag Class
Protected Class WebPageController
	#tag Method, Flags = &h0
		Sub AddWebPage(Name As String, Page As WebPage)
		  // Add the passed WebPage to the private collection of WebPage(s)
		  p_WebPageCollection.Value(Name) = Page
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  // Initialize Dictionary collection of WebPage(s)
		  p_WebPageCollection = New Dictionary()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadDefaultWebPage()
		  // Hide current page.
		  If (Session.CurrentPage <> Nil) Then ' Make sure there is currently a page being shown.
		    Session.CurrentPage.Visible = False
		  End If
		  
		  // Show first page in collection of WebPage(s)
		  Dim firstPage As String
		  firstPage = p_WebPageCollection.Key(0).StringValue
		  
		  // Loop through collection of WebPage(s). 
		  For Each wpName As String In p_WebPageCollection.Keys
		    If (wpName = firstPage) Then
		      WebPage(p_WebPageCollection.Value(wpName)).Show()
		    End If
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LoadWebPage(Name As String) As Boolean
		  // Hide current page.
		  If (Session.CurrentPage <> Nil) Then ' Make sure there is currently a page being shown. 
		    Session.CurrentPage.Visible = False
		  End If
		  
		  // Loop through collection of WebPage(s). If we have a match for a webpage then show it.
		  For Each wpName As String In p_WebPageCollection.Keys
		    If (wpName = Name) Then
		      WebPage(p_WebPageCollection.Value(wpName)).Show()
		      Return True
		    End If
		  Next
		  
		  // Return False if no pages matched the passed name.
		  Return False
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private p_WebPageCollection As Dictionary
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
