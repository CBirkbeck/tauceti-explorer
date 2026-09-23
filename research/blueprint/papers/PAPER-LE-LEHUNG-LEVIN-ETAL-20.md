# PAPER-LE-LEHUNG-LEVIN-ETAL-20: Serre weights and Breuil's lattice conjecture in dimension three

Daniel Le, Bao V. Le Hung, Brandon Levin and Stefano Morra, *Serre weights and Breuil's lattice conjecture in dimension three*, [Forum of Mathematics, Pi 8 (2020), e5, 135 pages](https://doi.org/10.1017/fmp.2020.1); arXiv [1608.06570](https://arxiv.org/abs/1608.06570).

The extraction was done by Claude Code, session `cc-2aeb03`, on 23 September 2026 (issue #1402). It continues the Codex checkpoints #2197 and #2212. Status: **complete**. The machine-readable extraction is [PAPER-LE-LEHUNG-LEVIN-ETAL-20.result.json](PAPER-LE-LEHUNG-LEVIN-ETAL-20.result.json), and it contains:

- **593 items:** 6 in the libraries, 25 planned and 562 missing. Every item id of the checkpoints is kept, and its statement has been re-read and restated from the page.
- **7 routes:** the checkpoint's seven routes, in the same order.
- **28 prerequisites:** one per paper, each with its DOI.
- **132 mistakes in the paper** (`sourceIssues`): 89 misprints, 32 gaps and 11 errors; 19 reach a stated result and 23 a proof. Of these:
  - E01–E18 come from the checkpoints and were re-checked;
  - E101–E125 are the authors' own corrections to LLHLM18, printed in §6 of this paper;
  - the other 89 are new.

**Source.** I read the published version (135 pages) from the typeset PDF on B. Levin's page, which carries the Cambridge footer and doi. The reading covered every page, statement and proof, on rendered page images. Locators are to published pages, and arXiv 1608.06570 v1–v4 were consulted wherever a mistake is recorded.

**Checking.**

- Tables 1–6 and the explicit computations of §§2.3, 3.6, 4.2 and 5.1 were recomputed by script: Python, and Singular via passagemath for the ideals of §3.6 and Proposition 5.1.8.
- Every new error, and every new mistake reaching a proof or a stated result (19 claims), was checked a second time, independently, on the page image. 13 were confirmed; 6 claimed gaps were rejected and are not recorded.

## What the paper proves

**The global setting.** Let F/F⁺ be a CM field, unramified at all finite places, with p unramified in F⁺ and every place of F⁺ above p split in F. Let G be a definite unitary group in three variables. Let r̄ : G_F → GL₃(𝔽) satisfy the Taylor–Wiles conditions, have split ramification, and be semisimple and 10-generic at the places above p.

**Main theorems.**

- **Breuil's lattice conjecture for GL₃ (Theorem 5.3.5).** Let r be a potentially crystalline, minimally ramified automorphic lift of Hodge–Tate weights (2,1,0), and τ a 13-generic tame type. Then the lattice σ(τ)⁰ = σ(τ) ∩ S̃(U^p, W)[λ] that completed cohomology cuts out in the type depends only on the restrictions r|_{G_{F_ṽ}} to the places above p.
- **Along the way:**
  - the weight part of Serre's conjecture, W(r̄) = W^?(ρ̄), Herzig's predicted set (Theorem 5.3.3);
  - mod p multiplicity one (Theorem 5.3.4);
  - automorphy lifting (Theorem 5.3.1);
  - numerical Breuil–Mézard for weak minimal patching functors (Theorem 3.5.2);
  - the geometry of the tamely potentially crystalline deformation rings of weight (2,1,0) (Theorem 3.5.3);
  - geometric Breuil–Mézard (Proposition 3.6.1).

**The two engines.**

1. **The local model theory of LLHLM18, extended beyond Q_p.** Kisin modules with tame descent datum and their shapes (§§3.1–3.3), and explicit charts and ideal computations for each shape (Tables 3–4, §3.6). These match the components of the special fibre with the predicted Serre weights.
2. **A complete description of generic lattices (Theorem 4.1.9).** Take a 13-generic Deligne–Lusztig representation R of GL₃ over a finite field and a lattice with irreducible cosocle σ. Then:
   - radical depth equals distance in the extension graph;
   - the Loewy length is 3f − Def(σ) + 1;
   - the extension graphs are the predicted ones;
   - the reduction is rigid;
   - saturated inclusions are controlled by powers of p.

   It is proved with the modular representation theory of GL₃ (§4.2: Frobenius kernels G₁T, injective envelopes, Weyl modules, Ext¹ between simple modules) and a lattice-theoretic induction on the defect (§4.3).

**How they combine.** Section 5 joins the two: cyclicity of patched modules (Theorem 5.1.1), a gauge ideal defined by Hartogs extension across codimension two (Theorem 5.2.3), and the global applications.

**Section 6** corrects 25 points of LLHLM18.

## What the libraries and the atlas have

**The libraries.** Six items are library items:

- the module socle (Tau Ceti's `TauCeti.socle`);
- Nakayama's lemma;
- local cohomology and its dependence only on the radical (`localCohomology`, `localCohomology.isoOfSameRadical`);
- the module–sheaf equivalence on an affine scheme (`AlgebraicGeometry.tildeEquiv`);
- minimal primes (`minimalPrimes`).

Each was read at Mathlib 082e2d3 and Tau Ceti f790474. Three checkpoint library claims were withdrawn, because the items now state the paper's own content:

- L01, the ambient finite abelian category;
- L04, the root datum of GL₃;
- L05, the affine and extended affine Weyl groups.

Mathlib has root pairings and finite Weyl groups, but not these.

**The atlas plans almost none of this.** 25 items are planned, and they are general inputs:

- inertial types, Hodge–Tate weights and potentially crystalline deformation rings (LocalGaloisDeformationRings L7, R08.1–R08.3);
- Breuil–Kisin modules over the Kummer tower with descent data (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4) and tame inertia characters (R07.1);
- étale φ-modules and Fontaine's equivalence (PhiGammaModulesAndIwasawaCohomology PG.0);
- the Iwahori group scheme (ReductiveGroupsPartII RG2.3);
- the local Artin map (Tau Ceti's ClassFieldTheory Layer 7);
- complete local rings and Cohen–Macaulay modules (DeformationAndDerivedPatchingAlgebra R03.1, R03.3);
- the completed towers and their duals (CompletedCohomologyPartII CC.1–CC.3, CC.8);
- minimally ramified conditions, base change, and local–global compatibility (R08.2, PotentialModularityAndCompatibleSystems R24.5, AutomorphicGaloisRepresentationsPartII AG2.6).

No layer has any of the following: affine Weyl groups and alcoves with the p-dot action, Deligne–Lusztig representations, Jantzen's modular representation theory (Frobenius kernels, Q₁, the translation principle), the extension graph, set-valued Serre weights for GL₃, weak minimal patching functors, or Breuil–Mézard for GL₃.

## Routes

The checkpoint's routes are kept. The sibling extraction of LLHLM23 (PAPER-LE-LEHUNG-LEVIN-ETAL-23) uses the same two Part II ids, so each should become one roadmap, not two.

1. **Source of DeformationAndDerivedPatchingAlgebra R03.1/R03.3/R03.6** (15 missing items and 3 planned). The commutative algebra is reusable within those layers:
   - Hilbert–Samuel multiplicity in a fixed dimension, corrected as in §6(12);
   - Cohen–Macaulayness and reducedness under completion;
   - the surjection criterion of Lemma 3.6.11;
   - radical ideals in completed tensor products;
   - depth and the torsion-free specialization of §5.3.
2. **Source of LocalGaloisDeformationRings L7** (132 missing items and 1 planned). L7 owns bounded-height lattice moduli and potentially crystalline rings in every rank. The shapes and Kisin varieties of §3, the explicit rings, charts and component matchings of §3.6 (Tables 3–4, Lemmas 3.6.10–3.6.16), and the structure of the type rings (Theorem 3.5.3, Lemma 3.5.4) are precise source obligations within it.
3. **Source of CompletedCohomologyPartII CC.1–CC.3, CC.8** (3 planned items). The completed definite unitary tower and its Pontryagin and Schikhof duals.
4. **Part II `ModularRepresentationsOfFiniteReductiveGroups`**, "Reductive algebraic groups, Part II: modular representations and generic GL₃ lattices" (241 items). It covers the combinatorics of §§1.4, 2.1 and 2.3, Deligne–Lusztig representations and their reductions, the Loewy theory of §4.1.1, the modular representation theory of §4.2 with its cited inputs, and the lattice theory of §4.3. Its target is Theorem 4.1.9. The brief also asks for coordination with `ReductiveGroupsIntegralRepresentationsPartII`, which Kisin–Pappas and Kisin–Pappas–Zhou propose for integral and modular representations of reductive groups, so that one foundation serves both.
5. **Part II `GenericGL3SerreWeightsAndLattices`**, "Algebraic modular forms, reduction and Serre weights, Part II: generic GL₃ weights and Breuil lattices" (165 items). It covers tame types and Herzig's W^? (§2.2), shapes and Serre weights (§3.4), patching and Breuil–Mézard (§3.5), cyclicity, gauges and the global theorems (§5), and Proposition 6.0.2. It imports the local rings from L7 and the lattice theorem from route 4.
6. **Source of SchemeAndStackFoundations SF.0** (6 missing items): coherent Hartogs extension and the Hartogs closure of an ideal, as used in Theorem 5.2.3.
7. **Source of SchemeAndStackFoundations SF.2** (3 missing items): flat base change for sections over an open and the local-cohomology exact sequence.

## Mistakes in the paper

No correction has been published. I searched:

- Crossref;
- the Cambridge Core page;
- the authors' pages (Levin, Morra);
- LLHLM23 (the authors' later paper).

Almost every mistake is already in arXiv v4, and most in earlier versions; exceptions are dated in their entries. **None changes a main theorem as it is used, but several statements are false or unproved as printed:**

**Statements false as printed.**

- **E32 (error).** Proposition 3.4.2 needs a hypothesis on the shape: w̃* ∈ W_a t_η, or w̃ ∈ Adm^∨(η). Counterexample: for the shape t_{(1,0,0)} the left side is empty and the right side has four weights. The paper's applications satisfy the hypothesis. In the same proposition the label should be σ^{(s,μ+η+1̲)} (a separate misprint).
- **E67 (error).** Proposition 4.2.9 says Ext¹ between the relevant simple modules is nonzero only for alcoves sharing a face. The paper's own Tables 5–6 give nonzero Ext¹ between alcoves A and E, which share no face. Proposition 4.2.12 uses the correct pattern, so nothing downstream breaks. The proposition first appears in arXiv v4.
- **E24 (error).** The remark on p. 22 that Σ_w̃ is empty exactly for w̃ ∉ Adm(η)X⁰(T) fails outside W_a X⁰(T). Checked by computer: 50 of 324 classes outside that coset have nonempty Σ. Every use in the paper stays inside the coset.
- **E57 (error).** The last step of the proof of Lemma 4.2.4 is false for small p. The lemma survives by a linkage argument.

**Tables.**

- **E46.** Table 3, identity row: the component c_(0,1) should have generator (b−c)c₂₁c₃₂ − (a−c)c₃₁c₂₂*. As printed, it is not a minimal prime of the ring. This was checked in Singular and against the paper's own computation on p. 68.
- **E49.** Table 4, γαγ row (and p. 66): the coefficient should be −1−b′+c′.
- **E05–E08.** The checkpoint's Table 3 misprints are confirmed and made precise.

**Proofs that need more.**

- **E96.** Theorem 5.3.1 (automorphy lifting) is proved only by reference to [LLHLM18, Theorem 7.4], whose proof the authors' own §6(16) says was omitted. Theorem 5.3.5 depends on Theorem 5.3.1.
- **E69.** Theorem 4.2.7(3) and Propositions 4.2.10, 4.2.12 and 4.2.15 assume μ is 6-deep, but apply Lemma 4.2.6 to constituents that are only 4-deep. Assuming μ 8-deep fixes it; the main theorems assume 13-generic.
- **E79, E80, E84.** In the gluing proof of Theorem 5.1.1:
  - the auxiliary types τ′ can be only 11-generic, while Theorem 4.1.9 is applied to them;
  - V must be a quotient of the τ′-lattice reduction, but Theorem 4.1.9 matches only constituents and graphs, not the modules themselves;
  - in the induction step, the induction hypothesis does not literally apply, because the top of the relevant part of V² violates condition (5.1).
- **E86.** The sketch of Proposition 5.1.8 fails for shapes of length one: the relevant ideals are principal, which was checked by Gröbner bases. The statement is not used later.

**Kept from the checkpoint.**

- E01–E18 are kept. E13 and E14 are misspellings present only in the arXiv versions and corrected in print.
- E101–E125 are the authors' own corrections to LLHLM18, printed in §6 of this paper (published pp. 128–133). They are recorded with their transcription checked. They concern LLHLM18, not this paper; an extraction of LLHLM18 should import them.

## Prerequisites not yet covered

None of these papers is in the paper registry. The result file lists 28 entries with links:

- **The same authors' earlier work:** LLHLM18 (with the §6 corrections), LLHL19.
- **The Serre weight framework:** Emerton–Gee–Savitt 2015, the GL₂ model; Herzig 2009; Gee–Herzig–Savitt 2018; Emerton–Gee 2014.
- **Patching and the global inputs:** CEG⁺16; CHT08; Taylor 2008; Gee 2011; Guerberoff 2011; Herzig–Le–Morra 2017; Le 2018; Emerton–Gee–Herzig 2013.
- **Local models:** Caraiani–Levin 2018; Kisin 2008; Enns 2019.
- **Modular representation theory:** Jantzen's book; Pillen 1993 and 1997; Andersen 1987; Andersen–Kaneda 2001; Bowman–Doty–Martin 2015; Humphreys 2006; Deligne–Lusztig 1976.
- **Other:** Hassett–Kovács 2004; Breuil 2014; the Stacks Project tags used.

## Judgement calls for the reviewer

1. **The routes are the checkpoint's.** Two things from the sibling LLHLM23 extraction bear on them:
   - It shares both Part II ids, and its briefs broaden them to all ranks.
   - It proposes the common patching-functor construction in `CompletedCohomologyAndLocalGlobalCompatibilityPartIIPatchedGLdDensity`.

   The GL₃ design jobs should read both extractions together.
2. **Routing within the two Part IIs.**
   - Rep-theoretic objects (Deligne–Lusztig representations, V(τ̄), the map ℛ) go to route 4, even when they sit in §2.2.
   - Galois-side objects (tame types, genericity of ρ̄, W^?) go to route 5.
   - Shapes and explicit rings go to L7 even when they appear in §3.5.
   - The patched-module statements of §3.6 go to route 5.
3. **Six claimed gaps were rejected by the second check** and are not recorded. They concerned the multiplicity-freeness aside after Remark 3.5.10, Corollary 3.5.16, the sketch in the proof of Theorem 3.5.3, the unwritten matchings of §3.6.2, the p. 61 application of Lemma 3.6.11, and Proposition 3.6.1(2). A reviewer who reads those proofs differently can reinstate them from the verification notes.
4. **E101–E125 are kept as the checkpoint recorded them**, although they are mistakes in LLHLM18 corrected in this paper, not mistakes in this paper.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-LE-LEHUNG-LEVIN-ETAL-20.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on the three files: 0 problems.
- Every missing item is routed exactly once.
- Every planned layer exists in data/atlas.json.
- Every library declaration was read at the pinned commits.
- Lean: none. Nothing here is formalised.

## Review checkpoint (REV-PAPER-LE-LEHUNG-LEVIN-ETAL-20, 23 September 2026)

Claude Code, session `cc-7b31c4`, issue #1403, submitted a **partial** review: the structural work is
complete and one correction is made, four of the 132 findings carry verdicts, and the rest are listed
as remaining work. The record is
[REV-PAPER-LE-LEHUNG-LEVIN-ETAL-20.md](../reviews/REV-PAPER-LE-LEHUNG-LEVIN-ETAL-20.md).

Complete: the recorded hash reproduces and all 135 pages were re-extracted; 593 items with every
missing one routed exactly once; all stage ids, all 25 planned layer ids and all six library items'
declarations check out at the pins; both Part II titles reproduce their parents' atlas titles
exactly; 401 of 461 locator checks land exactly and a sample of the other 60 shows them to be
deliberately precise ("paragraph before Lemma 3.6.10, p.58", the lemma being on p.59), so no locator
error was found; and for 113 of the 132 findings the quoted text is located at its own locator.

**Correction.** The `GenericGL3SerreWeightsAndLattices` route's area was `modular`, the parent's
atlas group rather than a galaxy id; it is now `automorphic`, as in `PAPER-LE-LEHUNG-LEVIN-ETAL-23`,
which proposes the same roadmap id.

**Verdicts.** E32 (Proposition 3.4.2 omits the `w̃ ∈ W_a t_η` hypothesis that Corollary 2.3.11, which
its proof invokes, requires), E96 (Theorem 5.3.1's proof rests on [LLHLM18, Theorem 7.4], which the
paper's own §6(16) says was omitted there), and E13/E14 (arXiv-only misprints, consistent with the
published text). The remaining 128 need verification in substance, sixteen of them with [LLHLM18]
open; the checkpoint says so and suggests the order.

## Review completed (REV-PAPER-LE-LEHUNG-LEVIN-ETAL-20, 23 September 2026)

The same worker (Claude Code, session `cc-7b31c4`, issue #1403) took the job again and finished it.
**Verdict: accept.** All seven routes are accepted, all 132 findings now carry verdicts, and all 132
are **confirmed**; no further correction was needed beyond the area fix recorded above. The record is
[REV-PAPER-LE-LEHUNG-LEVIN-ETAL-20.md](../reviews/REV-PAPER-LE-LEHUNG-LEVIN-ETAL-20.md), which now
replaces the checkpoint.

For the 19 findings whose quoted text the published PDF's fonts do not extract — Tables 3–6, the
matrix charts of §3.6.2, several displays in §§4–5 — the arXiv v4 e-print source settles every
quotation exactly. Many findings then decide themselves: Table 3 prints the `βα` row twice with
different first relations (`c11c33 = 0` against `c11c32 = 0`, and the mod-`v` rank condition picks the
first); the `αβ` matrix and relation differ between Table 3 and the body at (3.14); Tables 5 and 6
attach `ε′1` and `ε′2` to the alcoves `C, D, E, F` in exactly transposed ways; and the change of
variables in the case `αt_1` assigns six of seven coordinates, leaving `c22` and `c′21` unmatched,
with the corrected assignment turning the primed relation into the negative of the unprimed one.

Two checks improve on the record. `E24` fails already at the identity, where
`Σ_1 = Σ_0 ∩ r(Σ_0)` has six elements while `1 ∉ Adm(η)X⁰(T)`, so no computation with `t_{(1,0,0)}` is
needed. And `E67` holds without choosing a row of Table 5: the dot action puts `A` at `(0,p)³` and
`C, D, E, F` at `(0,p)×(p,2p)×(p,2p)`, `(p,2p)×(0,p)×(p,2p)`, `(0,p)×(p,2p)×(2p,3p)` and
`(p,2p)×(0,p)×(2p,3p)`, none of which shares a face with `A`, while Lemma 4.2.6 makes all of them
`gr_1` alcoves and (4.8) turns each into a nonzero `Ext¹`.

Two findings are recorded twice and should be merged: `E89` and `E90` are the same sentence of the
proof of Theorem 5.2.3 with the same correction (keep `E90`'s `misprint`, since the printed statement
is false and not merely unproved), and `E58` and `E133` are the same bibliography entry, once at its
citation and once at the reference list. The review also notes, without changing it, that `E31` is
graded `affects: nothing` although the equality it corrects is false as printed, which is how `E02`
earns `a stated result`.

The review states its own limits: the sixteen §6 findings are confirmed as faithful reports of the
authors' addendum to [LLHLM18], not checked against [LLHLM18] itself, and five findings (`E62`,
`E63`, `E79`, `E81`, `E86`) rest on computations the reviewer did not reproduce, with each verdict
saying which part was verified independently.
