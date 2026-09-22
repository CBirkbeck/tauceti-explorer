# Handoff: PAPER-KISIN-PAPPAS-ZHOU-26

Issue #1342. Agent Codex, session `codex-c83e7a`. Status: partial checkpoint.

## Completed

Read all 89 pages of the published KPZ paper, including proofs, errata and bibliography; use published numbering. Read Pappas95 PDF23–24, Hoff v1 PDF12–16, and DvHKZ PDF36–40 and49–52. The result records source URLs, hashes and exact read scopes. Page31 was visually inspected to verify the printed surface anomaly.

Extracted203 items:14 library,13 planned,176 missing. There are67 definitions/constructions,201 API statements and201 specified tests. Eight routes assign every missing item exactly once. The graph is acyclic and references resolve. Retain the stable ids and the existing candidate owners. In particular reconcile HE21's `RootSystemsPartIIDominanceAndDemazure` with KZ25's later overlapping `RootSystemsDominancePartII` at design intake.

The pins are Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 and TauCeti f790474821cf4256814db967cb154e7af3d0c369. The22 cited declarations were statement-read at those pins. The atlas input manifest and all38 prior extraction manifests are in the JSON. No claimed implementation exceeds those statements.

Eight exact Python regressions pass, covering the signed root bound, spin lattice, D4 bound, tilde composition and torsion kernel, tangent obstruction, common multiplier and conjugated level. API unit tests remain specifications. No Lean file was authorized or compiled.

## Resume here

1. Close `G-reps` and `G-roots`: read Jantzen, check the general adjacent-weight/nonzero-root-action assertion in characteristic p, and finish the all-rank dominance/Cartan proof. Preserve the explicit Corollary4.2.19 negative-root correction and B/D lattice conventions.
2. Close `G-display` and `G-purity`: original Zink/Lau/Hoff inputs, canonical relative-frame c, integral tensor torsors and exact Anschütz/PR24 purity. The free tilde functor is not an image construction in p-torsion. Use c from residual to universal tilde module, then reduce to m²+pi_E for horizontality.
3. Close `G-models` and `G-diamonds`: original local-model representability/normality suppliers, normal integral recovery and perfect-scheme comparison. Keep3.3.25 before3.2.15.
4. Close `G-shtukas` and `G-prismatic`: DvHKZ4.1.4 canonical axioms, PR24/26 completion theorem, AppendixA1–A2 prismatic inputs. The all-case connected reduction requires crystalline compatibility. Retain the self-dual smooth Siegel base actually used in AppendixA3.3.
5. Close `G-siegel`,`G-components`,`G-global`,`G-shimura`: parahoric Siegel moduli, KP18 quotient/component constructions with conjugated levels, Deligne/Satake cover and explicit Zarhin form. Reconstruct the garbled positivity sentence in7.2.8. C in condition(D) is ker(G_sc→G_der), not Z_G. Reflex splitting uses E.E2. Torsion-free inertia coinvariants remain conditional.
6. Split the remaining long constructions and grouped supplier contracts into original-source declaration-sized items before setting complete. Read the report's route briefs and gap ledger before changing ownership.

## Checks

Final checks passed: `scripts/check_paper.py` reports ok; `research/blueprint/intake.py check-files` reports3files,0problems. All original manifested source blobs match; the two late Hacon–Witaszek outputs were inspected for ownership; all planned stage ids resolve and all3 deliverables exist. Details are in the JSON validation field. This is not a complete recursive blueprint and nothing here is claimed formalized. Only the three named deliverables are submitted.
