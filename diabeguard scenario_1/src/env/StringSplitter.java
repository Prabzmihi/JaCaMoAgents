package diabeguard;

import jason.JasonException;
import jason.asSemantics.*;
import jason.asSyntax.*;
import jason.asSyntax.parser.*;

public class StringSplitter extends DefaultInternalAction{
    @Override
    public Object execute(TransitionSystem ts, Unifier un, Term[] args) throws Exception 
    {
        // Ensure we have the correct number of arguments
        if (args.length != 2) 
        {
            throw new JasonException("Invalid number of arguments.");
        }

        // Extract the arguments
        StringTerm strTerm = (StringTerm) args[0];
        String separator = ((StringTerm) args[1]).getString();

        // Perform the split
        String[] parts = strTerm.getString().split(separator);

        // Convert the result to a ListTerm
        ListTerm listTerm = new ListTermImpl();
        for (String part : parts) 
        {
            listTerm.add(new StringTermImpl(part));
        }

        // Unify the result with the third argument
        return un.unifies(listTerm, args[2]);
    }
}