import { Request, Response } from "express";
import { getRepository } from "typeorm";
import { Student } from "../entity/Student";

export async function vratiStudente(req: Request, res: Response) {

    const studenti = await getRepository(Student).find();
    res.json(studenti);
}