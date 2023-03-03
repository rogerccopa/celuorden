<h2>MENU</h2>
<br/>

<cfoutput>
    <cfloop query="prc.menu">
        <strong>#title#</strong>
        <p>#description#</p>
        <p>#price#</p>
        <button>Add</button>
    </cfloop>
</cfoutput>

<h3>CONTINUE HERE...</h3>