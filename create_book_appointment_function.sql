-- Create the book_appointment function
CREATE OR REPLACE FUNCTION public.book_appointment(
    customer_name TEXT,
    contact TEXT,
    barber TEXT DEFAULT NULL,
    appointment_time TEXT,
    service TEXT
)
RETURNS VOID
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
    INSERT INTO public.appointments (customer_name, customer_email, customer_phone, selected_barber, time, service)
    VALUES (customer_name,
            CASE WHEN contact LIKE '%@%' THEN contact ELSE NULL END,  -- customer_email
            CASE WHEN contact LIKE '%@%' THEN NULL ELSE contact END,  -- customer_phone
            barber,
            appointment_time,
            service);
END;
$$;

-- Revoke execute permission from public
REVOKE EXECUTE ON FUNCTION public.book_appointment(TEXT, TEXT, TEXT, TEXT, TEXT) FROM public;

-- Grant execute permission to authenticated role
GRANT EXECUTE ON FUNCTION public.book_appointment(TEXT, TEXT, TEXT, TEXT, TEXT) TO authenticated;
