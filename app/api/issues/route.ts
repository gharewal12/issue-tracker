import { NextRequest, NextResponse } from "next/server";
import { z } from 'zod';
import prisma from '@/prisma/client';
import { createIssueSchema } from "../../validationSchema";


export async function POST(request: NextRequest) {
    const body = await request.json();
    const validation = createIssueSchema.safeParse(body);
    if (!validation.success) {
        return NextResponse.json(validation.error.format(), { status: 400 })
    }

    const newIssue = await prisma.issue.create({
        data: { Title: body.title, Description: body.description }
    })

    return NextResponse.json(newIssue, { status: 201 });
}