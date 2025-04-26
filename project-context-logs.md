# Project Context Logs

This file contains relevant and key information about the project to help a new developer quickly catch up to speed.

## Supabase Setup

-   Supabase Project ID: bymzpajiewfzsbbxrzun
-   Supabase Project URL: https://bymzpajiewfzsbbxrzun.supabase.co
-   Supabase Anon Key: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ5bXpwYWppZXdmenNiYnhyenVuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDU2NDA4MzUsImV4cCI6MjA2MTIxNjgzNX0.kExBbYt778cyzN4fAWO8kdQOjHW5SnMeu0-xUf0RXZ0

## ElevenLabs Webhook Tool Configuration

To enable AgentDaniel to interact with the Supabase database for appointment booking, you need to create a Webhook Tool in ElevenLabs that calls an external API endpoint. This endpoint will execute SQL queries against your Supabase database.

Here's how to configure the `supabase_query` Webhook Tool in ElevenLabs:

*   Tool type: Webhook
*   Configuration:
    *   Name: `supabase_query`
    *   Description: `Executes a SQL query against the Supabase database to retrieve or modify appointment data.`
    *   Method: `POST`
    *   URL: `https://bymzpajiewfzsbbxrzun.supabase.co/functions/v1/supabase-query`
    *   Request Body Schema:
        ```json
        {
          "type": "object",
          "properties": {
            "query": {
              "type": "string",
              "description": "The SQL query to execute against the Supabase database."
            }
          },
          "required": ["query"]
        }
        ```
    *   Headers:
        *   Type: `Secret`
        *   Name: `SUPABASE_ANON_KEY`
    *   Body parameters:
        *   Click "Disable" to enable Body parameters, then click "Add property"
            *   Data type: `String`
            *   Identifier: `customer_name`
            *   Required: `True` (checkbox checked)
            *   Value Type: `LLM Prompt`
            *   Description: `The name of the customer booking the appointment.`
        *   Click "Add property"
            *   Data type: `String`
            *   Identifier: `contact`
            *   Required: `True` (checkbox checked)
            *   Value Type: `LLM Prompt`
            *   Description: `The contact information (phone number or email) of the customer.`
         *   Click "Add property"
            *   Data type: `String`
            *   Identifier: `barber`
            *   Required: `False` (checkbox unchecked)
            *   Value Type: `LLM Prompt`
            *   Description: `The name of the barber for the appointment (if specified).`
        *   Click "Add property"
            *   Data type: `String`
            *   Identifier: `appointment_time`
            *   Required: `True` (checkbox checked)
            *   Value Type: `LLM Prompt`
            *   Description: `The date and time of the appointment.`
        *   Click "Add property"
            *   Data type: `String`
            *   Identifier: `service`
            *   Required: `True` (checkbox checked)
            *   Value Type: `LLM Prompt`
            *   Description: `The service being booked (e.g., Men's haircut).`
*   Workspace Secrets: Add a secret with the following details:
    *   Name: `SUPABASE_ANON_KEY`
    *   Value: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ5bXpwYWppZXdmenNiYnhyenVuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDU2NDA4MzUsImV4cCI6MjA2MTIxNjgzNX0.kExBbYt778cyzN4fAWO8kdQOjHW5SnMeu0-xUf0RXZ0

## Edge Function

-   Edge Function Name: supabase-query
-   Edge Function URL: https://bymzpajiewfzsbbxrzun.supabase.co/functions/v1/supabase-query
-   The Edge Function code is located in `daniel-dapper-web/functions/supabase-query/index.ts`
-   The Edge Function import map is located in `daniel-dapper-web/functions/supabase-query/import_map.json`

## AgentDaniel System Prompt

```
# Personality
You are AgentDaniel, a friendly and helpful voice agent for Daniel's Barber Shop. You are knowledgeable about the services offered, the location, and the hours of operation. You are reliable and always aim to provide accurate information. You can also answer general questions about haircuts.

# Environment
You are interacting with customers over the phone. The customer may be calling to inquire about services, location, hours, to book an appointment, or ask general questions about haircuts.

# Tone
Your responses are clear, concise, and friendly. Use a professional tone and incorporate brief affirmations ("I understand," "Great question") to maintain engagement. Adapt your language based on the user's familiarity with barber services. Use strategic pauses and emphasis for clarity.

# Goal
Your primary goal is to assist customers with their inquiries and help them book appointments.

1.  Provide information about the services offered at Daniel's Barber Shop.
2.  Provide the location and hours of operation.
3.  Answer questions about the barbers. (Note: You don't have information about the barbers at this time, so you can say "I don't have information about the barbers at this time.")
4.  Answer general questions about haircuts.
5.  Guide the user to book an appointment.

# Tools
You have access to the following information:

- **Title:** Daniel's Barber Shop
- **Description:** Best barber haircuts at Daniel's Barber Shop. Our experienced barbers provide top-notch services and give you the perfect haircut.
- **Keywords:** Barber Shop, mens and boys haircuts, beard trims, and shaves
- **Author:** Daniel's Barber Shop
- **URL:** https://danielsbarbershop.org/
- **Phone:** 936-539-8593
- **Address:** 3708 West Davis Street, Suite C, Conroe, Texas 77304, United States
- **Hours:**
    - Mon: Closed
    - Tue: 09:00 am – 06:00 pm
    - Wed: 09:00 am – 06:00 pm
    - Thu: 09:00 am – 06:00 pm
    - Fri: 09:00 am – 06:00 pm
    - Sat: 08:00 am – 03:00 pm
    - Sun: Closed
- **Booking:** App download and online booking available.
- **Services:** mens and boys haircuts, beard trims, and shaves

## Services

### haircuts

#### Men's haircut
40

#### Men's haircut for seniors, military/veterans, first responders and kids
35
Seniors 65 or older. Kids 9 and under.

#### Buzz cut
30

#### Nape Undercut
30

#### Shaved Head
30

#### Skin Tight Bald Fade
45

#### ***Package services available - see booking site for pricing

#### ***Discount for Seniors, Military, Veterans, and First Responders available

### Grooming

#### Beard Trim and Shaves
30

#### Line Up back of neck and sideburns
18

#### Line Up forehead, back of neck and sideburn
25

#### Nose and Ears wax
15

#### Eyebrow wax/razor
15

#### Shampoo and Conditioner hair wash
10

#### Hair Design
15+
designs start at $15, pricing varies depending on art difficulty.

To check appointment availability or book an appointment, please download our app or visit our website.

You also have access to the `supabase_query` tool. Use this tool to:

*   Check appointment availability: When a customer asks about availability, use the `supabase_query` tool with a JSON payload containing the SQL query to select available time slots from the `appointments` table. The JSON payload should have the format: `{"query": "YOUR_SQL_QUERY"}`.
*   Book an appointment: When a customer wants to book an appointment, use the `supabase_query` tool with a JSON payload containing the SQL query to insert a new record into the `appointments` table. The JSON payload should have the format: `{"query": "YOUR_SQL_QUERY"}`.

When answering general questions about haircuts, rely on your general knowledge and avoid providing medical or personal advice.
```

## Security

-   The `.env` file has been added to the `.gitignore` file to prevent sensitive information from being committed to GitHub.

## Tables and Columns

-   Table: appointments
    -   Columns: id, created\_at, service, time, details, customer\_name, customer\_email, customer\_phone, selected\_barber

## Supabase CLI

-   The Supabase CLI is not installed or not in the PATH.

## Frontend & Development

-   The project uses Vite as the build tool. Main config: `vite.config.ts` (port 8080, React SWC, alias `@` to `./src`).
-   Local development server runs at http://localhost:8080 (start with `npm run dev`).
-   To get started locally:
    1. Clone the repository
    2. Run `npm install`
    3. Run `npm run dev`
-   If you encounter npm/esbuild permission errors, fix with:
    ```sh
    sudo chown -R $(id -u):$(id -g) ~/.npm
    rm -rf node_modules package-lock.json bun.lockb
    ```

## Environment Variables

-   `.env` file is used for storing environment variables (e.g., Supabase keys). It is gitignored for security.
-   For Supabase, the required variables are typically `NEXT_PUBLIC_SUPABASE_URL` and `NEXT_PUBLIC_SUPABASE_ANON_KEY`.

## Supabase Client

-   Supabase client is initialized in `src/lib/supabaseClient.ts` using environment variables (`NEXT_PUBLIC_SUPABASE_URL`, `NEXT_PUBLIC_SUPABASE_ANON_KEY`).
-   All Supabase features (auth, DB, storage) use this client.
-   To change Supabase project, update the variables in `.env`.





----------------


To enable AgentDaniel to book appointments, you need to configure the supabase_query Webhook Tool in ElevenLabs and ensure the Supabase Edge Function is correctly implemented.

Here's a refined step-by-step guide:

ElevenLabs Setup: Ensure you have an ElevenLabs account and have created a Conversational AI agent.
Server Tool Creation: Create a new Webhook Tool in ElevenLabs, filling out the form as follows:
Tool type: Webhook (select the "Webhook" option)
Configuration:
Name: supabase_query
Description: Executes a SQL query against the Supabase database to retrieve or modify appointment data.
Method: POST
URL: https://bymzpajiewfzsbbxrzun.supabase.co/functions/v1/supabase-query
Request Body Schema:
{
  "type": "object",
  "properties": {
    "customer_name": {
      "type": "string",
      "description": "The name of the customer booking the appointment."
    },
    "contact": {
      "type": "string",
      "description": "The contact information (phone number or email) of the customer."
    },
    "barber": {
      "type": "string",
      "description": "The name of the barber for the appointment (if specified)."
    },
    "appointment_time": {
      "type": "string",
      "description": "The date and time of the appointment."
    },
    "service": {
      "type": "string",
      "description": "The service being booked (e.g., Men's haircut)."
    }
  },
  "required": ["customer_name", "contact", "appointment_time", "service"]
}
Headers:
Type: Secret
Name: SUPABASE_ANON_KEY
Path parameters: (Leave this section empty)
Query parameters: (Leave this section empty)
API Endpoint Implementation: Implement the Supabase Edge Function (e.g., https://bymzpajiewfzsbbxrzun.supabase.co/functions/v1/supabase-query) that the Webhook Tool will call. This endpoint should:
Retrieve the Supabase URL and Anon Key from environment variables. You can use these values:
supabaseUrl: https://bymzpajiewfzsbbxrzun.supabase.co
supabaseAnonKey: Use the SUPABASE_ANON_KEY workspace secret.
Initialize the Supabase client using these credentials.
Accept a JSON payload with the following fields: customer_name, contact, barber (optional), appointment_time, and service.
IMPORTANT: For security, do NOT allow arbitrary SQL. Instead, create a dedicated Postgres function (RPC) called book_appointment with parameters for customer_name, contact, barber, appointment_time, and service.
Construct a SQL query to call the book_appointment function with the provided information. For example: SELECT book_appointment(customer_name := $1, contact := $2, barber := $3, appointment_time := $4, service := $5);
Execute the query against the Supabase database.
Return the result as a JSON object.
Agent Configuration: In the ElevenLabs agent configuration, update the AgentDaniel personality to include the supabase_query tool.
Modify the AgentDaniel instructions to explain how to use the tool to book appointments. For example: "To book an appointment, use the supabase_query tool with a JSON payload containing the customer's name, contact information, desired barber (if any), appointment time, and service. The JSON payload should have the format: {"customer_name": "...", "contact": "...", "barber": "...", "appointment_time": "...", "service": "..."}. The query parameter should contain a SQL query that calls the book_appointment function with the provided parameters. For example: {"query": "SELECT book_appointment(customer_name := 'John Doe', contact := '555-123-4567', barber := 'Daniel', appointment_time := '2025-04-27 10:00', service := 'Men's haircut');"}."
Testing: Test the integration by interacting with AgentDaniel and asking it to book an appointment.
To deploy the Supabase Edge Function, you need to install the Supabase CLI. You can find instructions on how to do this here: https://supabase.com/docs/reference/cli/install

Here's a refined system prompt for AgentDaniel:

# Personality
You are AgentDaniel, a friendly and helpful voice agent for Daniel's Barber Shop. You are knowledgeable about the services offered, the location, and the hours of operation. You are reliable and always aim to provide accurate information. You can also answer general questions about haircuts.

# Environment
You are interacting with customers over the phone. The customer may be calling to inquire about services, location, hours, to book an appointment, or ask general questions about haircuts.

# Tone
Your responses are clear, concise, and friendly. Use a professional tone and incorporate brief affirmations ("I understand," "Great question") to maintain engagement. Adapt your language based on the user's familiarity with barber services. Use strategic pauses and emphasis for clarity.

# Goal
Your primary goal is to assist customers with their inquiries and help them book appointments.

1.  Provide information about the services offered at Daniel's Barber Shop.
2.  Provide the location and hours of operation.
3.  Answer questions about the barbers. (Note: You don't have information about the barbers at this time, so you can say "I don't have information about the barbers at this time.")
4.  Answer general questions about haircuts.
5.  Guide the user to book an appointment.

# Tools
You have access to the following information:

- **Title:** Daniel's Barber Shop
- **Description:** Best barber haircuts at Daniel's Barber Shop. Our experienced barbers provide top-notch services and give you the perfect haircut.
- **Keywords:** Barber Shop, mens and boys haircuts, beard trims, and shaves
- **Author:** Daniel's Barber Shop
- **URL:** https://danielsbarbershop.org/
- **Phone:** 936-539-8593
- **Address:** 3708 West Davis Street, Suite C, Conroe, Texas 77304, United States
- **Hours:**
    - Mon: Closed
    - Tue: 09:00 am – 06:00 pm
    - Wed: 09:00 am – 06:00 pm
    - Thu: 09:00 am – 06:00 pm
    - Fri: 09:00 am – 06:00 pm
    - Sat: 08:00 am – 03:00 pm
    - Sun: Closed
- **Booking:** App download and online booking available.
- **Services:** mens and boys haircuts, beard trims, and shaves

## Services

### haircuts

#### Men's haircut
40

#### Men's haircut for seniors, military/veterans, first responders and kids
35
Seniors 65 or older. Kids 9 and under.

#### Buzz cut
30

#### Nape Undercut
30

#### Shaved Head
30

#### Skin Tight Bald Fade
45

#### ***Package services available - see booking site for pricing

#### ***Discount for Seniors, Military, Veterans, and First Responders available

### Grooming

#### Beard Trim and Shaves
30

#### Line Up back of neck and sideburns
18

#### Line Up forehead, back of neck and sideburn
25

#### Nose and Ears wax
15

#### Eyebrow wax/razor
15

#### Shampoo and Conditioner hair wash
10

#### Hair Design
15+
designs start at $15, pricing varies depending on art difficulty.

To check appointment availability or book an appointment, please download our app or visit our website.

You also have access to the `supabase_query` tool. Use this tool to:

*   Check appointment availability: This functionality is not yet implemented.
*   Book an appointment: When a customer wants to book an appointment, use the `supabase_query` tool with a JSON payload containing the customer's name, contact information, desired barber (if any), appointment time, and service. The JSON payload should have the format: `{"customer_name": "...", "contact": "...", "barber": "...", "appointment_time": "...", "service": "..."}`. For example: `{"customer_name": "John Doe", "contact": "555-123-4567", "barber": "Daniel", "appointment_time": "2025-04-27 10:00", "service": "Men's haircut"}`.

When answering general questions about haircuts, rely on your general knowledge and avoid providing medical or personal advice.
Security
The .env file has been added to the .gitignore file to prevent sensitive information from being committed to GitHub.
Tables and Columns
Table: appointments
Columns: id, created_at, service, time, details, customer_name, customer_email, customer_phone, selected_barber
Supabase CLI
The Supabase CLI is not installed or not in the PATH. To deploy the Supabase Edge Function, you need to install the Supabase CLI. You can find instructions on how to do this here: https://supabase.com/docs/reference/cli/install
Frontend & Development
The project uses Vite as the build tool. Main config: vite.config.ts (port 8080, React SWC, alias @ to ./src).
Local development server runs at http://localhost:8080 (start with npm run dev).
To get started locally:
Clone the repository
Run npm install
Run npm run dev
If you encounter npm/esbuild permission errors, fix with:
sudo chown -R $(id -u):$(id -g) ~/.npm
rm -rf node_modules package-lock.json bun.lockb
Environment Variables
.env file is used for storing environment variables (e.g., Supabase keys). It is gitignored for security.
For Supabase, the required variables are typically NEXT_PUBLIC_SUPABASE_URL and NEXT_PUBLIC_SUPABASE_ANON_KEY.
Supabase Client
Supabase client is initialized in src/lib/supabaseClient.ts using environment variables (NEXT_PUBLIC_SUPABASE_URL, NEXT_PUBLIC_SUPABASE_ANON_KEY).
All Supabase features (auth, DB, storage) use this client.
To change Supabase project, update the variables in .env.
