import { serve } from "https://deno.land/std@0.140.0/http/server.ts";
import { RtcRole, RtcTokenBuilder } from "npm:agora-token";

// Load environment variables
const APP_ID = Deno.env.get("AGORA_APP_ID")!;
const APP_CERTIFICATE = Deno.env.get("AGORA_APP_CERTIFICATE")!;
const TOKEN_EXPIRY_SECONDS = 3600; // 1 hour
const PRIVILEGE_EXPIRY_SECONDS = 3600; // 1 hour

serve(async (req) => {
  try {
    if (req.method !== "POST") {
      return new Response(JSON.stringify({ error: "Method not allowed" }), {
        status: 405,
        headers: { "Content-Type": "application/json" },
      });
    }

    const { channelName, uid, role } = await req.json();

    if (!channelName || !uid || !role) {
      return new Response(JSON.stringify({ error: "Missing parameters" }), {
        status: 400,
        headers: { "Content-Type": "application/json" },
      });
    }

    // Determine user role
    const agoraRole = role === "publisher"
      ? RtcRole.PUBLISHER
      : RtcRole.SUBSCRIBER;

    // Token expiration time
    const currentTimestamp = Math.floor(Date.now() / 1000);
    const tokenExpire = currentTimestamp + TOKEN_EXPIRY_SECONDS;
    const privilegeExpire = currentTimestamp + PRIVILEGE_EXPIRY_SECONDS;

    // ✅ Corrected function call with all required arguments
    const token = RtcTokenBuilder.buildTokenWithUid(
      APP_ID,
      APP_CERTIFICATE,
      channelName,
      Number(uid),
      agoraRole,
      tokenExpire,
      privilegeExpire,
    );

    return new Response(JSON.stringify({ token }), {
      status: 200,
      headers: { "Content-Type": "application/json" },
    });
  } catch (error) {

    const errorMessage = error instanceof Error
      ? error.message
      : "Unknown error occurred";

    return new Response(
      JSON.stringify({ error: "Internal Server Error", details: errorMessage }),
      {
        status: 500,
        headers: { "Content-Type": "application/json" },
      },
    );
  }
});
