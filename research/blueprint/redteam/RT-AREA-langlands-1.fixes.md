# RT-AREA-langlands-1: fixes

Fixer: Claude Code, session `cc-58621d`, 29 September 2026 (issue #3967, job FIX-RT-AREA-langlands-1).
- **Findings:** `RT-AREA-langlands-1.result.json`, 35 findings (9 high, 18 medium, 8 low), by `cc-39fac3`.
- **Verdicts:** `RT-AREA-langlands-1.review.json` and `research/blueprint/reviews/REV-RT-AREA-langlands-1.md`, by `codex-hjdg0j`. 32 are confirmed and 3 rejected (/11, /23, /28).
- **Scope:** the 25 confirmed findings of high or medium severity: /1–/10, /12–/22 and /24–/27.
  - The rejected medium findings /11 and /23 are not applied.
  - The seven confirmed low findings (/29–/35) are outside a fix job (PROTOCOL.md section 17).
- **Baseline:** everything below was checked at origin/main `546852b1`.
  - The graph checks use the atlas as `scripts/build.py` assembles it at that commit: accepted restructurings, links, promoted blueprints, decompositions and new roadmaps included (2840 stages, 7792 stage edges).
  - "The cycle test for A → B" asks whether that graph has a path B → … → A; "acyclic" means it has none.
  - For a new stage with prerequisites P and consumers C, the test asks whether any consumer reaches any prerequisite.
  - All the edges this report proposes (104, with the optional ones) were also tested together, with the 15 new stages added, and form no cycle. The new stages are ET.4b, ET.6b, SR.3b, GS.1:grassmannian, AG2.1a:kottwitz, AG2.1b:shin-datum, AG2.1b:shin-igusa, AG2.1b:mantovan, AG2.8, R28.4:finite-field, R01.3:saito, R01.3:ogg, TC.3:factor-separation, TC.5 and PA.6.
  - None of these keys is in use or reserved in `research/blueprint/reserved-ids.json`.

## How to read this report

This report is the job's only deliverable; the intake accepts no other file for it. Every fix is therefore written as an exact edit, for the maintainer or for the blueprint and design jobs of these roadmaps:
- **Roadmap prose** (`content/campaign/<Roadmap>/README.md`): the old sentence is quoted and the replacement given in full.
- **Stage records and edges** in `data/atlas.json`: the new stage (key, title, requirements, consumers, description) and the `stageEdges` to add. Removals are marked as the maintainer's.
- **Paper routes** (`research/blueprint/papers/PAPER-<id>.result.json`): the route, field, old value and new value.
- **New sub-stages** take a key with a colon under the parent and set `parentStageId`. The atlas has two patterns, and both are used below: a component that its parent requires (as `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison`), and a successor that requires its parent (as `CrystallineCohomology:CR.3:duality`). A new sibling stage takes a letter suffix, as ET.6a and SR.3a do.

The binding rule is the verifier's: a confirmation authorizes only the corrected scope in its reason. So each section starts with those corrections, then says what `main` says now, and then gives the fix.

**Route verdicts.** `make_queue` applies a paper route only when the paper's review carries a verdict for it.
- Where a fix edits a route but keeps its kind and roadmap, the existing verdict still describes it.
- Where a fix moves items to another route, the report names the verdict entry to record.
- The maintainer decides whether to record it on the strength of the confirmed finding, or to wait for the paper's next review.

**Disclosure.** This session wrote neither the red team (`cc-39fac3`) nor its verification (`codex-hjdg0j`), and none of the roadmaps these fixes touch. It extracted none of the papers whose routes are edited here. A search of the repository's extractions, red teams, restructurings, links and roadmap documents for this session's id finds it only in the LLHLM23 extraction, which none of these fixes touches.

**Sources read for this report**, on 29 September 2026. Each section names the passages its fix rests on. The files, with the first characters of their SHA-256:
- Scholze, *The local Langlands correspondence for GL_n over p-adic fields*, arXiv:1010.1540v1, §§1, 8–14 (06201ae7…).
- Scholze, *On torsion in the cohomology of locally symmetric varieties*: the Annals 182 (2015) PDF named by the TorsionCohomologyInfrastructure README (ebac854f…, the file PAPER-SCHOLZE-15 records), and arXiv:1306.2070v2 (e15abf4e…), whose numbering V.x.y the verifier cites.
- Allen–Calegari–Caraiani–Gee–Helm–Le Hung–Newton–Scholze–Taylor–Thorne, *Potential automorphy over CM fields*, Annals 197 (2023): the author-hosted published PDF named by the PotentialAutomorphyInfrastructure README (https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf, c5429e4f…). Printed page = PDF page + 896.
- Calegari–Geraghty, *Modularity lifting beyond the Taylor–Wiles method*, published PDF (https://www.math.uchicago.edu/~fcale/papers/CG.pdf, c0ba8de0…).
- Shin: *Galois representations arising from some compact Shimura varieties* (StableGal.pdf, 93f4fe32…); *Counting points on Igusa varieties* (IgusaVar.pdf, 022defdc…); *Stable trace formula for Igusa varieties* (StableIgusa.pdf, e74cbbe4…); all from https://math.berkeley.edu/~swshin/.
- Kottwitz, *Points on some Shimura varieties over finite fields*, JAMS 5 (1992), printed pp. 373–377 and §10.
- Varshavsky, arXiv:math/0505564v2, §2 (8b4cb7ee…).
- Kottwitz–Shelstad, arXiv:1201.5658v1 (eaa0a8ab…), and the arXiv abstract of Lemaire–Mœglin–Waldspurger, arXiv:1506.03383v1.
- Chenevier, arXiv:0809.0415v2 (f3c0e0d8…); Deligne–Serre, *Formes modulaires de poids 1*, Lemme 6.13 (Numdam); Iyengar–Khare–Manning, arXiv:2206.08212v3 (8f061724…); Darmon–Diamond–Taylor, *Fermat's Last Theorem*, §§5.1–5.2 (254f6e29…).
- Liu, *Formule d'Ogg d'après Saito* (https://www.math.u-bordeaux.fr/~qliu/Notes/Ogg-Saito.pdf), pp. 1–5; Ünver, arXiv:math/0006043v1, §1.
- Birkbeck–Heuer–Williams, arXiv:1902.03985v4, §§3.4 and 6 (8ee48970…).
- A'Campo–Hevesi–Thorne–Whitmore, arXiv:2607.11763v1 (a5a56b79…), §§1–2 and pp. 5–7, 18.

Not re-read here: AGIKMS (arXiv:2410.13504v3), for which the verifier's reading and the quotations in `RT-AREA-langlands-3.fixes.md` are used; the Harris–Taylor and Arthur–Clozel books; Saito 1988; Honda 1968 and Tate 1966.

## Summary

The "When" column says when an edit takes effect:
- **now:** the maintainer can apply it to `main`;
- **blueprint:** it goes into a packet through the roadmap's blueprint job;
- **verdict:** a new or re-kinded paper route needs a review verdict first;
- **review:** it is for the pending review of a paper extraction;
- **revision:** it is for the next revision of a paper whose overall review is `revise`;
- **maintainer:** a choice the report leaves to the maintainer.

| # | Finding | Verdict | Fix | When |
|---|---|---|---|---|
| /1 | high, error | confirmed | A new stage ET.4b owns cyclic base change and automorphic induction for GL_n (Arthur–Clozel local lifting and global Ch. 3, Harris–Taylor §VI unitary base change), before ET.6, ET.7a and R17.4. ET.6 gets explicit §13 and §14 targets, and ET.7a is narrowed. | now |
| /2 | high, error | confirmed | EDC.8 owns the Fujiwara–Varshavsky trace theorem (Varshavsky Theorem 2.3.2). ET.5 keeps only the Igusa hypotheses, and AG2.1a names the theorem as its Lefschetz step. | now |
| /3 | high, missing | confirmed | A new local stage ET.6b owns the EL-type Mantovan functor and Harris–Taylor's computation of it, including JL⁻¹(Sp_s(π)); a new sub-stage AG2.1b:mantovan owns Shin's global product formula for his compact datum. Both feed AG2.1b. | now |
| /4 | high, error | confirmed | The accepted CARAIANI-SCHOLZE-17 routes already widen IG.0–IG.1 and ET.5 to unramified PEL data of type (A) or (C); that covers Shin's datum only for p unramified in F. A compact prefix AG2.1b:shin-datum instantiates them and adds Shin's ramified extension; AG2.1b:shin-igusa (Shin's Theorem 6.1) replaces the ET.7b import on the Shin route. | now; the IG/ET widening is blueprint |
| /5 | high, missing | confirmed | One finite-field producer, the new sub-stage R28.4:finite-field, where the accepted SMITH-24 and KISIN-MADAPUSIPERA-SHIN-22 routes already send finite-field Tate and Honda–Tate. AG2.1a:kottwitz specializes Kottwitz's virtual c-polarized variant and point count; ET.5 imports the producer for effectivity. | now |
| /6 | high, missing | confirmed | Two successor sub-stages of R01.3 own the comparison once: R01.3:saito (Saito's conductor–discriminant theorem for relative curves, with the determinant of cohomology it needs) and R01.3:ogg (Ogg's formula in every residue characteristic, with the strict-henselian reductions). R01.6 stays the early Tate-module producer and no longer claims the comparison; R01.3:ogg feeds R11.5, R11.6 and R29.4. | now (prose, records, edges); blueprint (nodes) |
| /7 | high, missing | confirmed | A new endpoint PA.6 states and proves ACC+ Theorems 6.1.1 (Fontaine–Laffaille) and 6.1.2 (ordinary) for unpolarized representations over CM and totally real fields. It imports PA.1–PA.5, G7/G8, L7/L8 and R08.2 and feeds ML.2. The two accepted paper routes that put these theorems at PA.3 and at PA.4 point to PA.6. | now |
| /8 | high, error | confirmed | Five RS-14 handoffs IG.1 → Hilbert consumers become HodgeTateAndCanonicalSubgroups T5 handoffs; IG.1 → AutomorphicCongruences L5w and L5 stay, with a GU(2,2) reason; KU-hilberteisenstein gets the tower through L3 and I.3; two requests to T5 (formal model, CM points). | now (maintainer, RS-14 record); requests at blueprint |
| /9 | high, missing | confirmed | A new stage TC.5 states and proves Scholze's Theorems 5.3.1 and 5.4.1 (Annals 182) with Corollaries 5.4.3–5.4.4, including the GL_n Borel–Serre induction and the gluing across nilpotent kernels. It feeds IG.6 and PA.0, and CC.8, IG and PA name it. | now; review (PAPER-SCHOLZE-15) |
| /10 | medium, missing | confirmed | Kottwitz's Tamagawa formula, with τ(G_sc) = 1 and the ι(G, H) constant, becomes an explicit ET.4 target for the groups used; ET.5 reuses it. | now |
| /12 | medium, duplicate | confirmed | ET.2b imports Bun_G from GS.0 and the affine Grassmannian from a new geometric prefix GS.1:grassmannian; ET.3 imports FA.2's adeles. | now |
| /13 | medium, error | confirmed | ET.5 stops calling the twisted fundamental lemma unproved; ET.3 names the nonstandard lemma's role in Waldspurger's reduction and keeps it. | now |
| /14 | medium, error | confirmed | ET.1 adds Kottwitz–Shelstad 2012: the twisted splitting invariant, Δ_I^new, the corrected factors Δ′ and Δ_D, and tests of the actual factor identities. ET.4, ET.6 and ET.7a state which normalization they use. | now |
| /15 | medium, missing | confirmed | A new early stage SR.3b owns Harish-Chandra and Clozel twisted characters, the stable Weyl integration formula and the elliptic relations, and feeds ET.4, ET.4b and ET.6. The proposed characters Part II imports it. | now; the brief edit is a route correction |
| /16 | medium, error | confirmed | Register arXiv:2607.11763v1 for extraction; plan its Theorem 1.2.1 and Corollary 1.2.2 as a terminal successor AG2.8, keeping the preprint status; correct AG2.6's and AG2.7's sentences and the decomposition's note on Varma's order. | now; verdict for the extraction's routes |
| /17 | medium, missing | confirmed | IHG.1 exports Brauer–Nesbitt over algebraically closed and finite fields, with a proof route that does not cite Brauer–Nesbitt itself; R01.1 imports it through the new edge IHG.1 → R01.1 and states the lattice-independence argument. | now (prose, edge); blueprint (nodes) |
| /18 | medium, error | confirmed | AG2.3 → TC.3, so TC's unitary branch takes AG2.3's arbitrary regular polarized package. AG2.2 → TC.4 becomes redundant (its removal is the maintainer's). AG2.7 names the subpackage TC uses. | now; maintainer |
| /19 | medium, duplicate | confirmed | Calegari–Geraghty's nine GSp_4 items move from source route 11 to a new route 28, which joins the GSp_4 Part II proposed by BCGP21 route 4. Pilloni's route 15 becomes the same join. The Bellaïche–Chenevier sign theorem stays at AG2.2. | verdict |
| /20 | medium, duplicate | confirmed | R24.5:operations → AG2.6; AG2.6 instantiates that carrier instead of building its own. | now; blueprint |
| /21 | medium, duplicate | confirmed | PA.4 stops constructing Taylor–Wiles sets and imports ACC+ Proposition 6.2.33 from G7 (edge G7 → PA.4). It keeps the auxiliary levels, the neatness places v₀, v₀′, the finite-level complexes, the uniform bounds and the specialization. CH-L15 is re-quoted to the v₀ sentence. | now |
| /22 | medium, missing | confirmed | PA.3 names its two systems of local conditions, branch by branch, and imports them: G7, G8, L7, L8 and R08.2 → PA.3. L7's export sentence routes the arithmetic application through PA.3. There is no L7 → P9 edge. | now |
| /24 | medium, error | confirmed | TC states the three branches of Remark 5.4.6. It names Shin's similitude base change as the unconditional input and marks CM fields without an imaginary-quadratic subfield as conditional on Mok. It corrects the Theorem 1.0.3 sentence. | now; blueprint |
| /25 | medium, duplicate | confirmed | R19.6 applies IHG.4's interpolation (new edge IHG.4 → R19.6) and IHG.1's representability under Chenevier 2.22(i)'s exact hypotheses, and keeps only its geometric Hecke instance, bounds, specialization and deformation-map conditions. | now |
| /26 | medium, duplicate | confirmed | A new sub-stage TC.3:factor-separation holds Scholze's input-free §5.3 algebra (Lemma 5.3.8 and what it needs). TC.3 and AG2.4 import it, and AG2.4 also imports IHG.4. | now; review (PAPER-SCHOLZE-15) |
| /27 | medium, missing | confirmed | IHG.1 owns the codimension-zero congruence ideal and congruence module, with IKM Proposition 2.10's depth hypothesis and the finite-flat comparison Ψ ≅ O/η; R20.1, PadicFamilies:L1 and I.5 instantiate it (new edges IHG.1 → L1 and IHG.1 → I.5). The rejected IKM Part II is not activated. | now; revision (IKM coordination note) |

## /1 (high, error): a new stage ET.4b for cyclic base change and automorphic induction, before ET.6

### What the verifier corrected
- **The missing inputs are confirmed.** Scholze (arXiv:1010.1540v1) uses three families of automorphic results:
  - §10 (PDF 25–28) uses Harris–Taylor Chapter VI;
  - §12 (PDF 31–32) uses Arthur–Clozel Lemma 6.10, Theorem 6.2 and Proposition 6.7;
  - §§13–14 (PDF 32–36) use non-Galois automorphic induction and highly ramified twisting.

  ET.6 does not expose these, and ET.7a, which comes after ET.6, cannot supply them.
- **ET.7a is not the only owner.** GL2AutomorphicRepresentationsAndTransfer:R17.4 already plans cyclic and solvable base change, and R17.5 and ML.5 mention induction. So factor the general early input once, specialize it in R17.4, and keep ET.7a's residual-spectrum and cohomological comparison work.
- **Graph.** The route AS.6, ET.3, ET.4 → early base-change stage → ET.6, ET.7a, R17.4 passes the assembled-graph check.
- **Keep Scholze's proof order.** Theorem 10.6 is invoked only after parts (a) and (b) of Theorem 1.2 are proved; it is not an input to their proof.
- **Keep §14's two kinds of factor apart:** L-factors defined through supercuspidal support, and the general Weil–Deligne normalization.
- **Scope of the evidence.** The source invocations establish the dependency defect. They are not a completed extraction of the cited books.

### What main says now
- **ET.6** (`content/campaign/EndoscopicTransferAndUnitaryTraceComparison/README.md`) asks for "irreducibility/bijectivity, and L/epsilon-factor compatibility". Its sources are "Scholze's *Local Langlands for GL_n* §§2–14; *Deformation spaces* §§2–7; Harris–Taylor and Deligne–Kazhdan–Vignéras for the local character comparison; Badulescu's extended Jacquet–Langlands". No base-change or induction input is named.
- **ET.6's assembled prerequisites:** AG2.1a, AL.1–AL.3, ET.4 and SR.2–SR.5.
- **ET.7a** says: "Develop the required GL_m residual-spectrum/Speh classification and cyclic automorphic-induction/base-change steps from the Arthur–Clozel and Moeglin–Waldspurger proofs, with central characters and cuspidality hypotheses." It requires ET.4 and ET.6.
- **R17.4** says: "Prove cyclic base change and descent for GL₂, local compatibility and the exact failure-of-cuspidality criterion." It requires only R17.3.
- **Scholze 1010.1540v1**, read 29 September 2026 (https://arxiv.org/pdf/1010.1540v1, sha256 06201ae7…):
  - §10 builds the global realization from Harris–Taylor: Corollary 10.1 uses Corollary VI.2.3; Theorem 10.2 uses Corollary VI.2.5 and Lemma VI.2.11; Theorem 10.5 uses Theorem VI.1.1, Lemma VI.2.10 and Theorems VI.2.9 and VI.2.1; Theorem 10.7 uses Corollary VI.2.6.
  - §12, in the proof of Theorem 12.3, uses Arthur–Clozel Lemma 6.10 (irreducibility of σ(π)), Theorem 6.2 (existence of a lift) and Proposition 6.7 (uniqueness of lifts).
  - §13 (Corollary 13.2, Theorems 13.5–13.6) uses automorphic induction [AC] and Theorem 10.6. Theorem 10.6 is stated on PDF 27 under the standing assumption that parts (a) and (b) of Theorem 1.2 hold.
  - §14 (Theorem 14.1, Lemma 14.2) uses Brauer induction, the functional equation of pairs and Henniart's highly ramified twisting ([13, Corollary 2.4]). Footnote 9 warns that its L-factors, defined through supercuspidal support, are not the usual ones in general.

### Fix
**1. New stage** `EndoscopicTransferAndUnitaryTraceComparison:ET.4b`, "Cyclic base change and automorphic induction for GL_n".
- Requires: `AutomorphicSpectralTheory:AS.6`, `ET.3`, `ET.4` and `SmoothRepresentationsOfLocalGroups:SR.3b` (the new character stage of /15).
- Consumed by: `ET.6`, `ET.7a`, `GL2AutomorphicRepresentationsAndTransfer:R17.4` and `PotentialAutomorphyInfrastructure:PA.6` (the new lifting endpoint of /7, whose soluble base change and descent, ACC+ Proposition 6.5.13, come from Arthur–Clozel Ch. 3).
- README section, inserted after ET.4:

  > <a id="et-4b"></a>
  > ### ET.4b. Cyclic base change and automorphic induction for GL_n
  >
  > Construct the automorphic base-change and induction inputs that ET.6 uses (Scholze 1010.1540 §§10, 12–13), before ET.6, so that ET.7a and GL2AutomorphicRepresentationsAndTransfer:R17.4 specialize them rather than prove them again.
  >
  > **Local cyclic base change for GL_n** (Arthur–Clozel, Ch. 1 §6). For a cyclic extension F_1/F of p-adic fields of prime degree g with generator τ, define the base-change lift by its twisted-character identity, using SR.3b's twisted characters, and prove the three statements used in Scholze §12:
  > - **Lemma 6.10:** if a supercuspidal π of GL_n(F) has a base change Π to F_1 that is not supercuspidal, then Π = Π_1 ⊞ Π_1^τ ⊞ … ⊞ Π_1^{τ^{g−1}}, for a supercuspidal Π_1 of GL_{n/g}(F_1) with Π_1 ≇ Π_1^τ.
  > - **Theorem 6.2:** a supercuspidal π_1 of GL_n(F_1) with π_1^τ ≅ π_1 is the base change of a supercuspidal representation of GL_n(F).
  > - **Proposition 6.7:** two representations with the same base change differ by a character of F^× trivial on the norms from F_1^×.
  >
  > **Global cyclic base change and automorphic induction for GL_n** over cyclic extensions of prime degree (Arthur–Clozel, Ch. 3). Prove local–global compatibility at every place, strong multiplicity one, and the descent of Galois-invariant cuspidal representations up to twist, as Scholze's induction step in Theorem 13.6 uses them.
  >
  > **Harris–Taylor Chapter VI base change** from their unitary group G, through D^×, to GL_n, in the setting of Scholze §§8–10:
  > - F = F_0K, with F_0 totally real of even degree over Q and K imaginary quadratic;
  > - a place x of F split over F_0;
  > - conjugate self-dual Π with Π_∞ regular algebraic and Π_x square-integrable.
  >
  > The results needed are Theorem VI.1.1, Theorem VI.2.1, Theorem VI.2.9, Lemma VI.2.10, Corollaries VI.2.3, VI.2.5 and VI.2.6, and Lemma VI.2.11. These are the statements behind Scholze's Corollary 10.1 and Theorems 10.2, 10.5 and 10.7. Their trace-formula comparison is proved here for the Harris–Taylor group from ET.4's kernel and truncation machinery; ET.4's CSnc identity is not that comparison.
  >
  > **Limits.** No Galois representation is constructed here. Scholze's Theorem 10.6 is used only after parts (a) and (b) of his Theorem 1.2 are proved, and it stays in ET.6. The Harris–Taylor and Arthur–Clozel books remain source-access requests until they are registered.
  >
  > **Acceptance:**
  > - GL_1: base change is composition with the norm, and induction is the induced character.
  > - GL_2: the dihedral lift from a quadratic extension, with its failure of cuspidality when the character is Galois-invariant.
  > - The decomposition of Lemma 6.10 for a supercuspidal π whose base change to an unramified extension of degree n is a principal series.
- Stage edges: `AutomorphicSpectralTheory:AS.6 → ET.4b`, `ET.3 → ET.4b`, `ET.4 → ET.4b`, `SmoothRepresentationsOfLocalGroups:SR.3b → ET.4b`, `ET.4b → ET.6`, `ET.4b → ET.7a`, `ET.4b → GL2AutomorphicRepresentationsAndTransfer:R17.4` and `ET.4b → PotentialAutomorphyInfrastructure:PA.6`.
- **Cycle test.** None of ET.6, ET.7a, R17.4 or ML.2 (PA.6's consumer) reaches AS.6, ET.3, ET.4, SR.3, ET.1 or RG2.0. The joint test with every other edge of this report finds no cycle.

**2. ET.6.** In its second paragraph, the old text:

> Prove independence, integrality/
> rationality properties required of the test functions, Lubin–Tate tower
> comparison, irreducibility/bijectivity, and L/epsilon-factor compatibility.

becomes:

> Prove independence, integrality/rationality properties required of the test functions, Lubin–Tate tower comparison, irreducibility/bijectivity, and L/epsilon-factor compatibility. The automorphic inputs of these steps come from ET.4b:
> - Harris–Taylor's Chapter VI base change, for the global realization of Scholze §10;
> - Arthur–Clozel's local cyclic lifting (Lemma 6.10, Theorem 6.2, Proposition 6.7), for §12's irreducibility and bijectivity.
>
> Two targets stay here, and both come after parts (a) and (b) of Scholze's Theorem 1.2 are proved.
> - **Harris's non-Galois automorphic induction** (§13: Corollary 13.2 and Theorems 13.5–13.6). It uses Theorem 10.6, and hence the already constructed local correspondence, together with ET.4b's automorphic induction for cyclic extensions.
> - **The L- and ε-factor compatibility of pairs** (§14: Theorem 14.1 by Brauer induction, the globalization Lemma 14.2, and Henniart's twist by highly ramified characters, Invent. Math. 139 (2000), Corollary 2.4). §14's factors are those of the free group A_F on supercuspidal representations, extended through supercuspidal support; for a general irreducible π they are not the usual factors (Scholze §14, footnote 9). The Weil–Deligne normalization of the full correspondence remains the segment construction of the first paragraph.

Add "Arthur–Clozel, *Simple algebras, base change, and the advanced theory of the trace formula* (through ET.4b)" to ET.6's sources.

**3. ET.7a.** The old text:

> Develop the
> required GL_m residual-spectrum/Speh classification and cyclic automorphic-
> induction/base-change steps from the Arthur–Clozel and Moeglin–Waldspurger proofs,
> with central characters and cuspidality hypotheses.

becomes:

> Develop the required GL_m residual-spectrum/Speh classification from the Moeglin–Waldspurger proof, with central characters and cuspidality hypotheses. Import ET.4b's cyclic base change and automorphic induction; do not prove them again.

Its opening words, "Using ET.4/6", become "Using ET.4, ET.4b and ET.6".

**4. R17.4** (`content/campaign/GL2AutomorphicRepresentationsAndTransfer/README.md`).
- The old text "Prove cyclic base change and descent for GL₂, local compatibility and the exact failure-of-cuspidality criterion." becomes: "Specialize EndoscopicTransferAndUnitaryTraceComparison:ET.4b's cyclic base change and descent to GL₂. Prove local compatibility and the exact failure-of-cuspidality criterion in rank two."
- Its "**Dependencies:** R17.3 (preceding layer)." becomes "**Dependencies:** R17.3 (preceding layer); EndoscopicTransferAndUnitaryTraceComparison:ET.4b (cyclic base change for GL_n)."
- R17.5 reaches ET.4b through R17.4 and is not edited. Its monomial construction may cite ET.4b's rank-two induction.

**5. Implementation handoff line** of the ET README: add ET.4b to the "**Stages:**" list, after ET.4.

**When:** now.

## /2 (high, error): EDC.8 owns the Fujiwara–Varshavsky theorem; ET.5 and AG2.1a apply it

### What the verifier corrected
- **The missing stronger theorem is confirmed.** The claim that no EDC.8 path exists is rejected. The assembled atlas already has EDC.8 → WeilConjectures:WC.3 → WeightsInEtaleCohomology:R34.5 → AG2.1a.
- **EDC.8's statement leaves the strengthening to ET.5.** Scholze 1010.1540v1 §9 (PDF 23) invokes Varshavsky's Theorem 2.3.2 at the early raw trace step. Varshavsky (math/0505564v2, pp. 19–21) states and proves the large-power formula, with these hypotheses:
  - c_1 proper over the open;
  - c_2 quasi-finite there;
  - a locally invariant complement;
  - constructible coefficients of finite Tor-dimension, supported on the open;
  - q^n larger than the ramification bound.
- **Repair.** Promote the general theorem into EDC.8 or a single early successor, and keep the Igusa-specific properness, isolation and contraction checks in ET.5. With EDC.8 as owner, AG2.1a already depends on it transitively and ET.5 imports it directly, so a direct AG2.1a edge is optional documentation.
- Ordinary point counting does not prove the stronger theorem.

### What main says now
- **EDC.8** (`content/campaign/EtaleDualityAndPerverseSheaves/README.md`): "Ordinary Frobenius point counting is still PR196 TraceFormula's theorem; ET.5 retains its genuinely stronger contracting-boundary/Fujiwara application with isolation and large-power hypotheses."
- **ET.5:** "Import EDC.8's general cohomological correspondence/duality maps, then prove the required contracting-boundary Lefschetz–Verdier/Fujiwara trace theorem for correspondences".
- **AG2.1a:** "Prove the raw geometric fixed-point/nearby-cycle trace identities needed for the simple auxiliary Shimura test functions."
- **Graph.** The path EDC.8 → WC.3 → R34.5 → AG2.1a exists, and so does EDC.8 → ET.5.
- **Varshavsky, math/0505564v2**, read 29 September 2026 (https://arxiv.org/pdf/math/0505564v2, sha256 8b4cb7ee…): Theorem 2.3.2 is on PDF 20 (printed p. 20), after the construction 2.3.1 of RΓ_c(u), with Lemma 2.2.3 and Corollary 2.2.4 on PDF 19–20.

### Fix
**1. EDC.8.** The old text:

> Ordinary Frobenius point counting is
> still PR196 TraceFormula's theorem; ET.5 retains its genuinely stronger
> contracting-boundary/Fujiwara application with isolation and large-power
> hypotheses. An arbitrary fixed-point set does not supply a numerical trace.

becomes:

> Ordinary Frobenius point counting is still PR196 TraceFormula's theorem. EDC.8 also owns the stronger trace theorem for Frobenius-twisted correspondences: Varshavsky's generalization of Fujiwara (GAFA 17 (2007); arXiv math/0505564v2, Theorem 2.3.2).
>
> Let c : C → X × X be a correspondence of schemes of finite type over F̄_q, defined over F_q, and let c^{(n)} be its twist by the n-th power of Frobenius.
> - **(a)** If c_2 is quasi-finite, then Fix(c^{(n)}) is finite for q^n > ram(c_2).
> - **(b)** Let U ⊂ X be an open subset defined over F_q, with c_1 proper over U, c_2 quasi-finite over U, and X ∖ U locally c-invariant. Then there is d ≥ ram(c_2 restricted to c_2^{-1}(U)) with the following property. For every F ∈ D^b_ctf(X, Λ) with F|_{X∖U} = 0, every n with q^n > d, and every c^{(n)}-morphism u,
>
>   Tr(RΓ_c(u)) = Σ_{y ∈ Fix(c^{(n)}) ∩ c_2^{-1}(U)} Tr(u_y),
>
>   with RΓ_c(u) defined as in Varshavsky 2.3.1.
> - **(c)** If X and C are proper, then d = max{ram(c_2 restricted to c_2^{-1}(U)), ram(c_2, X ∖ U)} works.
>
> Prove the contraction statements behind this (Lemma 2.2.3 and Corollary 2.2.4) and the identification of the local terms at the fixed points. For U = X and Weil sheaves this is Deligne's conjecture, proved by Fujiwara. ET.5 and AutomorphicGaloisRepresentationsPartII:AG2.1a apply the theorem; neither proves it again. An arbitrary fixed-point set does not supply a numerical trace.

**2. ET.5.** The old text:

> Import EDC.8's general cohomological
> correspondence/duality maps, then prove the required contracting-boundary
> Lefschetz–Verdier/Fujiwara trace theorem for correspondences, extending the
> existing point-count trace formula: a general correspondence is not an ordinary
> endomorphism point count. Prove isolation, properness and sufficiently large
> Frobenius-power hypotheses before evaluating a trace.

becomes:

> Import EDC.8's cohomological correspondences and its Fujiwara–Varshavsky trace theorem for Frobenius-twisted correspondences; a general correspondence is not an ordinary endomorphism point count. Prove here only its hypotheses for the Igusa correspondences: c_1 proper over the chosen open, c_2 quasi-finite there, the boundary locally invariant, the fixed points isolated, and the Frobenius power sufficiently large. Prove these before evaluating a trace.

**3. AG2.1a** (optional documentation). After "Prove the raw geometric fixed-point/nearby-cycle trace identities needed for the simple auxiliary Shimura test functions." add:

> Their Lefschetz step is EtaleDualityAndPerverseSheaves:EDC.8's Fujiwara–Varshavsky theorem, applied to the Frobenius-twisted Hecke correspondences with nearby-cycle coefficients, as in Scholze 1010.1540 §9. AG2.1a proves the hypotheses for these correspondences, not the theorem.

The direct edge `EtaleDualityAndPerverseSheaves:EDC.8 → AutomorphicGaloisRepresentationsPartII:AG2.1a` is optional; the path through WC.3 and R34.5 already exists. The cycle test for EDC.8 → AG2.1a finds no reverse path. The sentence composes with the AG2.1a edits of /5.

**When:** now.

## /3 (high, missing): the Mantovan functor in ET.6b, Shin's product formula in AG2.1b:mantovan

### What the verifier corrected
- **The gap is real.** Shin's route reaches the Galois side from Igusa cohomology only through Mantovan's product formula and Harris–Taylor's computation of Mant_{b,μ}. No assembled stage names Mantovan, and ET.6a ends at the supercuspidal realization.
- **One local producer.** Put the functor and its computation in one local stage that extends ET.6a (or an early shared prefix). Put the global, Weil-equivariant product formula at AG2.1b. ET.6a → AG2.1b is acyclic. Do not feed the late comparison back into the raw AG2.1a.
- **Not the HKW22 functor.** The local-shtuka candidate of PAPER-HANSEN-KALETHA-WEINSTEIN-22 (item /017) does not supply this formula because its functor has a similar name.
- **Shin's ramified case is specific.** His extension to p ramified in F (p. 33) depends on his signature and on p split in E, and uses Drinfeld-level models instead of the unramified deformation theory. It is not a theorem for ramified PEL data in general.
- **Normalizations.** Keep the Tate, parabolic and Jacquet–Langlands normalizations. The conclusions are identities in Grothendieck groups, not statements in individual degrees.

### What main says now
- **AG2.1b** (`content/campaign/AutomorphicGaloisRepresentationsPartII/README.md`): "In the Shin route, import only the basic central-leaf/Igusa geometry IG.0–IG.1 and the characteristic-zero counting/trace identity ET.5/ET.7b". In the assembled atlas it requires AG2.1a, ET.5, ET.6, ET.7b and IgusaVarietiesAndTorsionConcentration:IG.1.
- **ET.6a** (`content/campaign/EndoscopicTransferAndUnitaryTraceComparison/README.md`): "Only the supercuspidal realization needed by FS IX.7.4 is the required endpoint here". It requires AG2.1a, ET.4, ET.6 and HeckeStacksAndLocalShtukas:HS2; its only consumer is ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison.
- **No stage names Mantovan.** No description in the assembled atlas contains the word. PAPER-CARAIANI-SCHOLZE-17's accepted route 2 sends Mantovan's Igusa varieties (Definition 4.3.6, Proposition 4.3.8) to IG.1, but neither the functor nor the product formula.
- **Sources read for this fix** (29 September 2026). Shin, "Galois representations arising from some compact Shimura varieties", author PDF https://math.berkeley.edu/~swshin/StableGal.pdf (62 pages, SHA-256 93f4fe322200a646f337ae8d4aa9a036a866df1bb59ad5fe7bf09373324da75b; published in Ann. of Math. 173 (2011)). Page numbers are the author PDF's.
  - §2.2, pp. 8–9: the datum (F, V, μ, b), with "We do not assume that F is unramified over Q_p"; the restriction Σ_σ p_σ ≤ 1; M_{b,μ} "non-canonically isomorphic to Z-copies of the Lubin-Tate deformation space"; the definition (2.1) of Mant_{b,μ} : Groth(J_b(Q_p)) → Groth(G(Q_p) × W_E).
  - §2.4, pp. 10–11: the normalization n-Mant (2.2) with the Kottwitz sign e(J_{n−h,h}); Lemma 2.1; Proposition 2.2 (i) for supercuspidal π, (ii) for JL_n^{−1}(Sp_s(π)), (iii) for parabolic induction. The proof: "Both (i) and (ii) follow from a reinterpretation of [HT01, Thm VII.1.3, VII.1.5]", through [Har05, Thm 4.3.11] and [Man04, Thm 8.7]; (iii) from [Har05, Prop 4.3.14, 4.3.17] "(where p is allowed to ramify in F)". Then Red_{n−h,h} and n-Red_{n−h,h} (the Jacquet module followed by Badulescu's LJ), and Proposition 2.3, the identity (2.3).
  - §5.2, pp. 33–34: Mantovan's results "carry over to our case (where p may be ramified in F)", because "we are in the special case where p splits in E and the condition (v) of §5.1 is satisfied". Proposition 5.2, "the theorem 22 of [Man05]": H(Sh, L_ξ) = Σ_{b∈B(G_{Q_p},−μ)} Mant_{b,μ}(H_c(Ig_b, L_ξ)) in Groth(G(A^∞) × W_{F_w}); and the product decomposition (5.6) of Mant_{b,μ}.

### Fix
**1. New stage ET.6b**, inserted in `content/campaign/EndoscopicTransferAndUnitaryTraceComparison/README.md` after the ET.6a section and before "## ET.7. Coherent comparison exports". ET.6a is left as it is: its consumer ES7:GLn-comparison needs only the supercuspidal endpoint.

> <a id="et-6b"></a>
> ### ET.6b. EL-type Rapoport–Zink cohomology and the Mantovan functor
>
> **Construct and export.** Let F/Q_p be finite (p may ramify in F), V = F^n, G = Res_{F/Q_p} GL_F(V), μ a cocharacter with weights 0 and 1, and b ∈ B(G, −μ), with Σ_σ p_σ ≤ 1 (Shin 2011, §2.2, pp. 8–9).
> - The Rapoport–Zink tower M^rig_{b,μ,U} over the completion of F^ur, identified with copies of ET.6a's Lubin–Tate tower (Rapoport–Zink 1996, 3.78–3.79; Strauch 2005, §2.3). Its compactly supported Berkovich cohomology, with the commuting actions of J_b(Q_p), W_E and G(Q_p).
> - The functor Mant_{b,μ}(ρ) = Σ_{i,j≥0} (−1)^{i+j} lim_U Ext^i_{J_b(Q_p)-smooth}(H^j_c(M^rig_{b,μ,U}), ρ)(−D) of Shin (2.1), and its well-definedness: the Ext groups vanish in large degree and have finite length for each U (Fargues 2004, §4.4).
> - The normalized functors n-Mant_{n−h,h} of Shin (2.2), with the Kottwitz sign e(J_{n−h,h}) and the character δ̄^{1/2}_{P_{n−h,h}}.
> - Shin's Lemma 2.1 (the étale case), Proposition 2.2 (i) (supercuspidal π), (ii) (JL_n^{−1}(Sp_s(π))) and (iii) (parabolic induction), the maps Red_{n−h,h} and n-Red_{n−h,h}, and Proposition 2.3: Σ_{h=0}^{n−1} n-Mant_{n−h,h}(n-Red_{n−h,h}(π)) = [π][L_{n,F}(π)] in Groth(GL_n(F) × W_F).
>
> Every conclusion is an identity in a Grothendieck group. Fix L_{n,F}(π) = rec_{n,F}(π^∨) ⊗ |·|^{−(n−1)/2} (Shin §2.3) and prove its dictionary with ET.6's normalization.
>
> **Proof obligations beyond ET.6a.**
> - Proposition 2.2(ii) needs Harris–Taylor's computation for JL_n^{−1}(Sp_s(π)) (HT01 Theorem VII.1.5). ET.6a's supercuspidal endpoint does not give it; extend ET.6a's Harris–Taylor argument to it.
> - Proposition 2.2(iii) uses Harris 2005 (Astérisque 298), Propositions 4.3.14 and 4.3.17, where p may ramify; Mantovan 2008 (Ann. Sci. ENS 41), Corollary 5, covers only p unramified.
> - If the route of PAPER-HANSEN-KALETHA-WEINSTEIN-22 for RΓ(G, b, μ) (item /017) is adopted, prove that its functor agrees with this one on EL-type data. Do not define the functor twice.
>
> **Inputs.** ET.6a; ET.6 (Jacquet–Langlands and Badulescu's extended map). **Consumers.** AutomorphicGaloisRepresentationsPartII AG2.1b:mantovan and AG2.1b:shin-igusa.

- **Stage record:** key `ET.6b`, owner EndoscopicTransferAndUnitaryTraceComparison, title "EL-type Rapoport–Zink cohomology and the Mantovan functor".
- **Edges:** ET.6a → ET.6b, ET.6 → ET.6b, ET.6b → AG2.1b:mantovan, ET.6b → AG2.1b:shin-igusa.

**2. New sub-stage AG2.1b:mantovan**, inserted in `content/campaign/AutomorphicGaloisRepresentationsPartII/README.md` after the AG2.1b paragraph:

> <a id="stage-AG2.1b:mantovan"></a>
> #### AG2.1b:mantovan — Mantovan's product formula for Shin's compact datum
>
> **Construct and export.** Shin 2011, Proposition 5.2 (Mantovan, Duke Math. J. 129 (2005), Theorem 22; Mantovan, Fields Inst. Commun. 58, Theorem 1): H(Sh, L_ξ) = Σ_{b∈B(G_{Q_p},−μ)} Mant_{b,μ}(H_c(Ig_b, L_ξ)) in Groth(G(A^∞) × W_{F_w}). The datum is Shin's §5.1: conditions (i)–(v), p split in the imaginary quadratic field E, and a fixed place w | p.
> - Include the bijection (5.3) of B(G_{Q_p}, −μ) with {0, …, n−1}, the isomorphism (5.4) for J_b(Q_p), and the decomposition (5.6) of Mant_{b,μ} into EL-type factors, each supplied by ET.6b.
> - When p ramifies in F, use the models and Igusa varieties of AG2.1b:shin-datum, with the Rapoport–Zink spaces over the ring of integers of the completion of F_w^ur (Shin p. 33).
> - The conclusion is a Grothendieck-group identity, with the Tate twist (−D) and the Weil action at w. Only Shin's case is claimed; no product formula for other ramified PEL data is asserted.
>
> **Inputs.** AG2.1a; AG2.1b:shin-datum (finding /4); EndoscopicTransferAndUnitaryTraceComparison ET.6b. **Consumer.** AG2.1b.

- **Stage record:** key `AG2.1b:mantovan`, title "Mantovan's product formula for Shin's compact datum".
- **Edges:** AG2.1a → AG2.1b:mantovan, AG2.1b:shin-datum → AG2.1b:mantovan, ET.6b → AG2.1b:mantovan, AG2.1b:mantovan → AG2.1b.

**3. AG2.1b's own text** is rewritten in finding /4, item 3, to import these two stages. Shin's Theorem 6.4 and Corollaries 6.5–6.10, which combine Proposition 5.2 with Proposition 2.3 and Theorem 6.1, stay in AG2.1b.

**4. Cycle tests.** Assembled atlas at 546852b1 (2840 stages, 7792 stage edges), with every edge of this section and of /4, /5 and /8 added at once: no cycle. In particular AG2.1b reaches none of ET.6a, ET.6, AG2.1a, IG.1 or ET.5, so no edge above closes a cycle through AG2.1b.

**When:** now (README sections, stage records and edges). The Harris–Taylor extension in ET.6b is blueprint work.

## /4 (high, error): Shin's compact datum gets its own prefix; ET.7b leaves the Shin route

### What the verifier corrected
- **The mismatch is real.** The Igusa README and IG.0–IG.1 fix the split U(n,n) datum of CSnc with unramified local data, while AG2.1b imports them for Shin's compact unitary datum.
- **Shin's datum** (StableGal pp. 30, 32–34): signature (1, n−1) at one place and (0, n) elsewhere, anisotropic modulo the centre, p split in E, and his particular ramified extension. His Theorem 6.1 (p. 43; the verifier cites pp. 43–44) computes the Igusa cohomology with its own groups and normalizations.
- **PELModuli M4 does not help.** Its general moduli framework does not supply the compact central-leaf and Igusa geometry.
- **The repair.** Broaden the shared definitions to explicitly supported type-(A) PEL data and construct the compact instance with its precise hypotheses, keeping the CSnc perfectoid and boundary stages specialized. Alternatively, use one compact prefix with compatibility maps. Do not define Igusa varieties a second time.
- **Limits.** Do not promise that a good-reduction generalization covers Shin's ramified case, or assert product formulas for arbitrary ramified PEL data. Keep the characteristic-zero comparison of the Shin route distinct from CSnc's ET.7b application.

### What main says now
- **The IG scope** (`content/campaign/IgusaVarietiesAndTorsionConcentration/README.md`): "The geometric branch uses the particular PEL unitary similitude datum of CSnc §2.1 … At principal level N≥3 take p unramified in F … These geometric constructions do not assert results for every Hodge-type or arbitrary Shimura datum." IG.1: "**Dependencies:** IG.0, with the same fixed PEL datum and central-leaf objects."
- **ET.5**: "Consume only IG.0–IG.1's finite-level Igusa varieties". **ET.7b**: "Combine ET.5 with ET.4 and the explicit CSnc §5.6 test functions". ET.7b's consumers are AG2.1b, ET.7 and IgusaVarietiesAndTorsionConcentration:IG.5.
- **Two accepted routes already widen the shared layers.** Both are accepted by the review of PAPER-CARAIANI-SCHOLZE-17 (overall verdict accept); the red team did not consider them.
  - Route 2 (a source route to IG.0, IG.1, IG.3 and IG.4): "IG.0, IG.1 and the local and product-formula parts of IG.3 must be blueprinted for unramified PEL data of type (A) or (C) with hyperspecial level at p, with no compactness (pp. 696–697, 713–714)". It routes Mantovan's Igusa varieties (Definition 4.3.6) and Proposition 4.3.8 to IG.1.
  - Route 8 (a source route to ET.0, ET.1, ET.4, ET.5, ET.6 and ET.7b) widens them "to the groups G_n⃗ of every rank n, inner forms of arbitrary signature at ∞ (p. 738) and both parities".

  These widenings cover Shin's compact datum when p is unramified in F. They do not cover his extension to p ramified in F, which needs the Drinfeld-level models.
- **Shin StableGal** (read 29 September 2026, author PDF as in /3):
  - §5.1, p. 30: conditions (i)–(v), and "(ii) and (v) imply that G is anisotropic modulo center".
  - §5.2, pp. 32–33: the integral models Sh_{U^p,m⃗} with Drinfeld w^{m_1}-structure are "projective and flat over O_{F,w} for all m⃗ and smooth if m_1 = 0", proved "exactly as in [HT01, Lem III.4.1]"; projectivity from [Lan08, Thm 5.3.3.1]; the Newton strata are indexed by 0 ≤ h ≤ n−1; each central leaf "coincides with the corresponding stratum", since Σ_b is unique up to isomorphism; and "we can work without the unramified hypothesis since we are in the special case where p splits in E and the condition (v) of §5.1 is satisfied".
  - p. 33, on the counting papers: "the only place where the unramified hypothesis is necessary is the proof of [Shi09, Lem 11.1]", which is then argued "as in the proof of [HT01, Lem V.4.1]".
  - Theorem 6.1, p. 43 (proof pp. 43–46): (Case ST) and (Case END), with C_G = |ker^1(Q, G)|·τ(G) and signs e_0, e_1, e_2 ∈ {±1}.
- **PELModuli M4**: at higher p-level it defines normalizations and says "Do not assert smoothness, a fine moduli interpretation, or a universal abelian scheme on such a normalization without a separate theorem". So it does not provide Harris–Taylor's Drinfeld-level models.

### Fix
**1. IG scope and IG.1: record the widening and its limit.** In `content/campaign/IgusaVarietiesAndTorsionConcentration/README.md`, after "These geometric constructions do not assert results for every Hodge-type or arbitrary Shimura datum.", add:
> The accepted source route of PAPER-CARAIANI-SCHOLZE-17 (review route 2) widens IG.0, IG.1 and the local and product-formula parts of IG.3 to unramified PEL data of type (A) or (C) with hyperspecial level at p, with no compactness assumption, and adds compact-case strengthenings to IG.4. IG.2 and IG.5–IG.7 stay with the split datum above, and IG.4 keeps its non-compact bounds. Shin's compact unitary datum (Shin 2011, §5.1) with p unramified in F is then an instance; the case p ramified in F is not. That case is AutomorphicGaloisRepresentationsPartII AG2.1b:shin-datum's own construction, with comparison maps to this one.

In IG.1, after "Sources: CSnc §§2.2–2.4; CS17 §4; Shin's counting paper finite-level constructions.", add:
> Acceptance for the widened datum: Shin's compact unitary datum (signature (1, n−1) at one place and (0, n) elsewhere, p split in E and unramified in F), for which the Newton strata are the central leaves and the Igusa varieties are Mantovan's (Shin 2011, p. 33).

**2. New sub-stage AG2.1b:shin-datum**, in the AG2 README after the AG2.1b paragraph:

> <a id="stage-AG2.1b:shin-datum"></a>
> #### AG2.1b:shin-datum — Shin's compact datum: models, strata and Igusa varieties
>
> **Construct and export.** For the datum of Shin 2011, §5.1 (conditions (i)–(v); p split in E; a fixed w | p):
> - **p unramified in F.** Instantiate the constructions of IgusaVarietiesAndTorsionConcentration IG.0–IG.1 and the counting and stabilization of EndoscopicTransferAndUnitaryTraceComparison ET.5, as widened by PAPER-CARAIANI-SCHOLZE-17's accepted routes 2 and 8. No new definition of central leaves or Igusa varieties is made here.
> - **p ramified in F.**
>   - Construct the integral models Sh_{U^p,m⃗} over O_{F_w} with a Drinfeld w^{m_1}-structure (Shin §5.2, pp. 32–33). Prove that they are projective and flat, and smooth for m_1 = 0, as in Harris–Taylor 2001, Lemma III.4.1, using Drinfeld's theory of formal O-modules (HT01 Chapter II) in place of Grothendieck–Messing; projectivity is Lan 2008, Theorem 5.3.3.1.
>   - Construct the Newton stratification indexed by 0 ≤ h ≤ n−1 ((5.3); HT01 p. 111) and prove that each stratum is a central leaf.
>   - Construct Mantovan's Igusa varieties Ig_{b,U^p,m} over the strata, finite étale Galois and smooth over F̄_p (Mantovan 2005, Proposition 4). Prove comparison maps with the unramified instance where both apply.
> - **Counting at ramified p.** Extend Shin 2009 and 2010 to the ramified case as on Shin 2011, p. 33: only Shin 2009, Lemma 11.1 changes, argued as in HT01, Lemma V.4.1, using dim Lie A[w^∞] = 1 and dim Lie A[w_i^∞] = 0 for i > 1.
>
> **Scope.** This is Shin's extension for p split in E and condition (v). It is not a theorem for ramified PEL data in general, and it is not supplied by PELModuli M4's normalized models.
>
> **Inputs.** IgusaVarietiesAndTorsionConcentration IG.1; EndoscopicTransferAndUnitaryTraceComparison ET.5; AG2.1a. **Consumers.** AG2.1b:mantovan, AG2.1b:shin-igusa, AG2.1b.

- **Stage record:** key `AG2.1b:shin-datum`, title "Shin's compact datum: models, strata and Igusa varieties".
- **Edges:** IG.1 → AG2.1b:shin-datum, ET.5 → AG2.1b:shin-datum, AG2.1a → AG2.1b:shin-datum, AG2.1b:shin-datum → AG2.1b:mantovan, AG2.1b:shin-datum → AG2.1b:shin-igusa, AG2.1b:shin-datum → AG2.1b. The existing IG.1 → AG2.1b and ET.5 → AG2.1b become transitive; the maintainer may keep or drop them.

**3. New sub-stage AG2.1b:shin-igusa, and AG2.1b's text.** In the AG2 README, after AG2.1b:shin-datum:

> <a id="stage-AG2.1b:shin-igusa"></a>
> #### AG2.1b:shin-igusa — Shin's computation of Igusa cohomology for the compact datum
>
> **Construct and export.** Shin 2011, Theorem 6.1 (p. 43; proof pp. 43–46): for each b ∈ B(G_{Q_p}, −μ), the identities (6.5) in Case ST and (6.6) in Case END for BC(H_c(Ig_b, L_ξ){Π^S}) in Groth(G_n(A^{S_fin∖{p}}) × J_b(Q_p)). They involve C_G = |ker^1(Q, G)|·τ(G), the maps Red^b of Shin §2.4, and the signs e_0, e_1, e_2 ∈ {±1}.
> - Prove the removal of the acceptability assumption (Shin p. 44, from Shin 2009, Lemmas 6.3–6.4).
> - Prove the character identities at p (Lemma 5.10) and the real sign computation of §3.6 that Case END needs.
> - The ingredients are the stable trace formula for Igusa varieties (from ET.5, through AG2.1b:shin-datum), the twisted trace formula and base change (ET.4), and Langlands–Shelstad transfer (ET.1).
>
> This comparison is distinct from ET.7b's CSnc application: ET.7b stays the supplier of IgusaVarietiesAndTorsionConcentration IG.5.
>
> **Inputs.** AG2.1b:shin-datum; EndoscopicTransferAndUnitaryTraceComparison ET.1, ET.4, ET.6 and ET.6b. **Consumer.** AG2.1b.

- **Stage record:** key `AG2.1b:shin-igusa`, title "Shin's computation of Igusa cohomology for the compact datum".
- **Edges:** AG2.1b:shin-datum → AG2.1b:shin-igusa, ET.1 → AG2.1b:shin-igusa, ET.4 → AG2.1b:shin-igusa, ET.6 → AG2.1b:shin-igusa, ET.6b → AG2.1b:shin-igusa, AG2.1b:shin-igusa → AG2.1b.
- **Maintainer's removal:** ET.7b → AG2.1b. The Shin route no longer uses ET.7b. If a design job prefers the widened ET.7b statements of PAPER-CARAIANI-SCHOLZE-17 route 8 (its Lemma 5.5.1) as an alternative input, it can restore the edge into AG2.1b:shin-igusa instead.

In the AG2.1b paragraph, replace "In the Shin route, import only the basic central-leaf/Igusa geometry IG.0–IG.1 and the characteristic-zero counting/trace identity ET.5/ET.7b; prove the required purity, weight separation, multiplicity and cancellation arguments rather than assume a torsion concentration theorem." with:
> In the Shin route, use the compact instance AG2.1b:shin-datum of IG.0–IG.1 and ET.5, Shin's computation AG2.1b:shin-igusa of the Igusa cohomology, and Mantovan's product formula AG2.1b:mantovan with the local functor of EndoscopicTransferAndUnitaryTraceComparison ET.6b. From these, prove Shin's Theorem 6.4 and Corollaries 6.5–6.10, including the purity, weight separation, multiplicity and cancellation arguments, rather than assume a torsion concentration theorem.

In "Scope and source separation", replace "AG2.1b then uses ET.5/ET.6/ET.7b's characteristic-zero counting and local comparison;" with:
> AG2.1b then uses ET.5's counting, through the compact instance AG2.1b:shin-datum, ET.6's local comparison and ET.6b's Mantovan functor;

and replace "This enumerated fence includes ET.7b but not its late IG.5 consumer." with:
> ET.7b, with its late consumer IG.5, stays outside this fence.

In "Implementation handoff", replace "**Stages:** AG2.0, AG2.1a, AG2.1b, AG2.3, AG2.4, AG2.5, AG2.6, AG2.7." with:
> **Stages:** AG2.0, AG2.1a, AG2.1a:kottwitz, AG2.1b, AG2.1b:shin-datum, AG2.1b:shin-igusa, AG2.1b:mantovan, AG2.3, AG2.4, AG2.5, AG2.6, AG2.7, AG2.8.

(AG2.1a:kottwitz is from /5 and AG2.8 from /16.)

**4. ET.5.** After "Consume only IG.0–IG.1's finite-level Igusa varieties and their Hecke/quasi-isogeny actions.", add:
> Shin's compact datum at a prime p ramified in F is not covered here; AutomorphicGaloisRepresentationsPartII AG2.1b:shin-datum extends the counting to it.

**5. Cycle tests.** The joint test of /3 also covers these edges: no cycle. AG2.1b reaches none of IG.1, ET.5, AG2.1a, ET.1, ET.4 or ET.6.

**When:** now (README text, stage records and edges; the ET.7b → AG2.1b removal is the maintainer's). The widening of IG.0–IG.1 and ET.5 itself is blueprint work under the accepted CARAIANI-SCHOLZE-17 routes.

## /5 (high, missing): one finite-field Tate/Honda–Tate producer, R28.4:finite-field

### What the verifier corrected
- **The producer is missing.** What is missing is the finite-field isogeny and classification theory, not the broad abelian or Dieudonné prerequisites.
- **The sources use it.** Scholze 1003.2451v2 §4 imports Kottwitz's triples. Kottwitz 1992 depends on Honda–Tate and on virtual c-polarized objects to recover triples satisfying the α condition. Shin 2009 §8 uses a p-adic-type version for objects with endomorphism structure.
- **One producer.** Keep one finite-field Tate/Honda–Tate producer after A6, V5 and R07.2, and specialize its polarized/endowed and virtual variants for AG2.1a and ET.5. The union of the candidate edges is acyclic.
- **Bare edges are not enough.** A6, V5 and DWP.1 already reach AG2.1a, so extra edges from them would not create the theorem.
- **Not CM.5.** AG2.1a already reaches ComplexMultiplicationAndExplicitReciprocity:CM.5.
- **Scope.** Do not substitute Faltings over number fields or assert a general Langlands–Rapoport theorem. Keep the exact PEL, unramified-model and effectiveness hypotheses.

### What main says now
- **No stage plans it.** No stage description contains "Honda"; ET.5 says only "Classify fixed points by effective Kottwitz triples, prove effectivity".
- **Two accepted routes already choose the owner.** The red team did not see them.
  - PAPER-SMITH-24, route 4 (review: accept): "Honda–Tate theory — the classification of isogeny classes of simple abelian varieties over a finite field by conjugacy classes of Weil q-numbers — is the immediate arithmetic successor of Tate's theorem over a finite field and has no other candidate owner"; routed to FaltingsFinitenessAndIsogenyTheorems:R28.4.
  - PAPER-KISIN-MADAPUSIPERA-SHIN-22, route 6 (review: accept), item T27. Its contract: "For abelian varieties over a finite field, prove Hom⊗Q_ell equals Frobenius-equivariant rational Tate-module Hom for ell≠p and the contravariant crystalline analogue for ell=p. … Import Hom/End from AbelianSchemesAndArithmeticModuli A6 and Dieudonne realization from FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2." Its reason: "Add this finite-field source contract there, explicitly separating it from the number-field proof; no duplicate finite-field Part II is proposed."
- **R28.4 today is the number-field theorem.** It derives Tate's comparison over number fields; its prerequisites include PadicHodgeTheory:R06.6, ArakelovGeometryAndAbelianHeights:R35.4, R28.1 and R28.3. A consumer of R28.4 as it stands would import Faltings' number-field proof.
- **Sources read for this fix** (29 September 2026):
  - Kottwitz, "Points on some Shimura varieties over finite fields", J. Amer. Math. Soc. 5 (1992), 373–444 (ams.org PDF, 72 pages).
    - Printed p. 374: "it relies heavily on Honda-Tate theory"; the conditions of §5 ensure that G_{Q_p} is unramified.
    - Printed p. 377: after Lemma 18.1, "one uses the analog of Honda-Tate theory developed in §10 to see that (γ0; γ, δ) comes from some (A, λ, i)".
    - §10, "Virtual abelian varieties over finite fields", printed pp. 402–409, including Lemma 10.13, the classification of simple c-polarizable virtual B-objects with the invariants of End(X_π).
    - Section list: §14, construction of (γ0; γ, δ); §15, vanishing of α(γ0; γ, δ); §16, counting fixed points within an isogeny class; §17, Q-isogeny classes within a Q̄-isogeny class; §18, the image of the map; §19, the total number of fixed points.
  - Shin, "Counting points on Igusa varieties", author PDF https://math.berkeley.edu/~swshin/IgusaVar.pdf (44 pages, SHA-256 022defdc0ebd913cdfd96d6c37b0f583dc9dc73716c23d1577c18035ff74eff8; Duke Math. J. 146 (2009)).
    - §8, "Honda-Tate theory", pp. 24–26: Definition 8.1 (p-adic types); the Honda–Tate bijection over F̄_p (p. 25); Proposition 8.4 (the bijection for the category AV^0_B); Corollary 8.5.
    - Introduction, p. 2: "In going backward, we recover (A, i) via Honda-Tate theory".
  - Scholze, arXiv:1003.2451v2, §4, "Description of isogeny classes", p. 11: "Kottwitz associates to any point x ∈ M(F_{p^r}) a triple (γ0, γ, δ)", with Lemma 4.1 normalizing δ through the Dieudonné module.
  - Tate, "Classes d'isogénie des variétés abéliennes sur un corps fini (d'après T. Honda)", Séminaire Bourbaki 1968/69, exposé 352 (Numdam record read; the exposé itself not re-read).

### Fix
**1. New sub-stage R28.4:finite-field**, the single producer. It gives the owner the accepted routes chose, with the separation from the number-field proof that KISIN-MADAPUSIPERA-SHIN-22's route asks for. In `content/campaign/FaltingsFinitenessAndIsogenyTheorems/README.md`, insert after the R28.4 section, before `<a id="r28-5"></a>`:

> <a id="stage-R28.4:finite-field"></a>
> ### R28.4:finite-field — Abelian varieties over finite fields: Tate's theorem and Honda–Tate
>
> **Construct and export.**
> - **Tate's theorem over F_q.** For abelian varieties A and B over F_q and ℓ ≠ p, Hom(A, B) ⊗ Z_ℓ ≅ Hom_{Gal}(T_ℓA, T_ℓB). The Frobenius acts semisimply on V_ℓA, and End^0(A) is semisimple with centre Q[π_A] for A simple. Also the contravariant crystalline analogue at ℓ = p, after a sufficiently divisible finite extension for geometric Hom (the contract of PAPER-KISIN-MADAPUSIPERA-SHIN-22/T27). Sources: Tate, Invent. Math. 2 (1966), and the original crystalline source named by that contract.
> - **Honda–Tate.** The Frobenius of a simple A is a Weil q-number (imported from DeligneWeightsAndPurity DWP.1), and every Weil q-number arises, by Honda's CM-lifting argument. This gives a bijection between simple isogeny classes over F_q and Weil q-numbers up to conjugacy. End^0(A) is the central division algebra over Q[π] with invariant 1/2 at real places, v(π)/v(q)·[Q[π]_v : Q_p] at places above p, and 0 elsewhere. Sources: Honda, J. Math. Soc. Japan 20 (1968); Tate, Séminaire Bourbaki 1968/69, exposé 352.
> - **The form over F̄_p** as p-adic types: (M, η) = (Q[π_A], [π_A]/s), with M the centre of End^0(A) and A[x^∞] of pure slope η_x/e_{x/p} (Shin 2009, §8, p. 25).
> - **B-objects.** The isotypic decomposition of B-objects in a semisimple Q-linear category of abelian varieties up to isogeny (Kottwitz 1992, §3).
>
> **Status.** Classical and unconditional. No number-field input: this sub-stage does not import R06.6, R35.4 or R28.1–R28.3.
>
> **Inputs.** AbelianSchemesAndArithmeticModuli A6 (Hom and End, Poincaré reducibility, Rosati positivity); ShimuraVarieties V5 (CM abelian varieties and the Shimura–Taniyama computation); FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2 (Dieudonné theory); DeligneWeightsAndPurity DWP.1 (Weil's estimate for abelian varieties).
>
> **Consumers.** R28.4, whose finite-field items (PAPER-SMITH-24/53, /5, /43, /44 and PAPER-KISIN-MADAPUSIPERA-SHIN-22/T27) it takes; AutomorphicGaloisRepresentationsPartII AG2.1a:kottwitz; EndoscopicTransferAndUnitaryTraceComparison ET.5.

In R28.4's "**Dependencies:**" line, add "[FaltingsFinitenessAndIsogenyTheorems R28.4:finite-field](#stage-R28.4:finite-field)".

- **Stage record:** key `R28.4:finite-field`, title "Abelian varieties over finite fields: Tate's theorem and Honda–Tate".
- **Edges:** A6 → R28.4:finite-field, V5 → R28.4:finite-field, R07.2 → R28.4:finite-field, DWP.1 → R28.4:finite-field, R28.4:finite-field → R28.4, R28.4:finite-field → AG2.1a:kottwitz, R28.4:finite-field → ET.5.
- **Route records:** PAPER-SMITH-24 route 4 and PAPER-KISIN-MADAPUSIPERA-SHIN-22 route 6 keep `stages: ["FaltingsFinitenessAndIsogenyTheorems:R28.4"]`. The sub-stage is R28.4's own, so their accepted verdicts still describe them, and no new verdict is needed.

**2. New sub-stage AG2.1a:kottwitz**, the virtual and polarized specialization for AG2.1a. In the AG2 README, after the AG2.1a section:

> <a id="stage-AG2.1a:kottwitz"></a>
> #### AG2.1a:kottwitz — Kottwitz's description of points over finite fields
>
> **Construct and export.** For the compact PEL data of AG2.1a at a prime p where G_{Q_p} is unramified and the level at p is hyperspecial (Kottwitz 1992, §5):
> - the category of c-polarized virtual B-abelian varieties over F_{p^r} up to isogeny, and the classification of its simple objects with the invariants of their endomorphism algebras (Kottwitz 1992, §10, printed pp. 402–409, Lemma 10.13);
> - the triple (γ0; γ, δ) of an F_{p^r}-point (§14) and the vanishing of α(γ0; γ, δ) (§15, using §§12–13);
> - the count of fixed points within an isogeny class (§16) and of Q-isogeny classes within a Q̄-isogeny class (§17, with ker^1);
> - the image of the map, Lemma 18.1, including its converse through §10's analogue of Honda–Tate (printed p. 377), and the total count (19.5).
>
> Record Scholze 1003.2451v2 §4 (p. 11, Lemma 4.1) as the form in which ET.6's global step uses this description on the good-level model.
>
> **Scope.** Kottwitz's hypotheses stay attached: PEL type (A) or (C), G_{Q_p} unramified, hyperspecial level at p, effectivity only as Lemma 18.1 states it. No Langlands–Rapoport theorem for general Shimura data is asserted, and no number-field Faltings input is used.
>
> **Inputs.** FaltingsFinitenessAndIsogenyTheorems R28.4:finite-field; EndoscopicTransferAndUnitaryTraceComparison ET.0 (stable conjugacy, Tate–Nakayama and ker^1); PELModuli M4. **Consumer.** AG2.1a, whose "raw geometric fixed-point/nearby-cycle trace identities" are sums over these triples.

In AG2.1a's second paragraph, after "Prove the raw geometric fixed-point/nearby-cycle trace identities needed for the simple auxiliary Shimura test functions.", add:
> The point count behind them is Kottwitz's description of points over finite fields, AG2.1a:kottwitz.

- **Stage record:** key `AG2.1a:kottwitz`, title "Kottwitz's description of points over finite fields".
- **Edges:** R28.4:finite-field → AG2.1a:kottwitz, ET.0 → AG2.1a:kottwitz, PELModuli:M4 → AG2.1a:kottwitz, AG2.1a:kottwitz → AG2.1a.

**3. ET.5's specialization.** In ET.5, replace "Classify fixed points by effective Kottwitz triples, prove effectivity, calculate" with:
> Classify fixed points by effective Kottwitz triples. Prove effectivity with the O-linear polarized p-adic types of Shin 2009, §8 (Definition 8.1, Proposition 8.4, Corollary 8.5, pp. 24–26), specializing the Honda–Tate classification of FaltingsFinitenessAndIsogenyTheorems R28.4:finite-field. Calculate

(the sentence then continues "automorphism groups, volume and cohomological-kernel multiplicities, …" as before).

**4. Cycle tests.** None of the consumers R28.4, AG2.1a and ET.5 reaches A6, V5, R07.2 or DWP.1, and AG2.1a does not reach ET.0 (all checked). The joint test with /3, /4 and /8 finds no cycle. CM.5 is not used.

**When:** now (README sections, stage records and edges); the route records need no change.

## /6 (high, missing): Ogg's formula is planned in two successors of R01.3, with Saito's theorem as its named input

### What the verifier corrected
- **The gap is real and so is the owner ambiguity.** R01.3 (with accepted RS-25) owns the general conductor and the elliptic comparison, but plans none of its inputs. RS-06 names a "conductor/Euler comparison interface" at R01.6.
- **Suppliers upstream.** EllipticCurves Layer 4 plans only the algorithmic exponent and leaves the identification to "a separate, related project". StableReduction Layers 4–5 supply regular models and intersection theory. NeronModels R11.2 supplies the component comparison.
- **Graph correction 1.** The assembled graph already has EllipticCurves Layer 4 → R01.3 (the red team read the raw graph). It lacks the regular-model, R11.2 and R01.6 inputs.
- **The mathematics.** Liu's public notes (pp. 1–5) give the reduction for a henselian K with algebraically closed residue field: −Art(X/S) = n − 1 + f, and the elliptic discriminant equals −Art. Their §3 isolates Saito's theorem on the determinant of cohomology as a separate result. Ünver (math/0006043v1, p. 1) proves a number-field arithmetic-surface version, not every DVR version.
- **What to plan.** The general theorem and the strict-henselian/descent comparisons, with exact hypotheses; then the elliptic formula, including residue characteristic 2 in mixed characteristic.
- **Graph correction 2.** "R01.6 → comparison" means the comparison consumes the Tate module. It does not mean R01.6 imports the comparison. Separate the early Tate-module producer from the later exported comparison; requiring both directions would close a cycle.
- **Scope.** One comparison proof owner. All wild terms stay. Dropping characteristic 2 would violate the target.

### What main says now
- `content/campaign/ArithmeticGaloisRepresentations/README.md`, R01.3 (line 48), ends: "Prove that reduction cannot increase the conductor at a prime different from p, and give the precise comparison with the conductor of an elliptic curve. Wild contributions at 2 and 3 are not omitted."
- Same file, R01.6 (line 78), ends: "Supply the conductor comparison and the local Euler-polynomial interface consumed by R29."
- **Assembled edges of R01.3.**
  - Prerequisites: R01.2, the decomposition node `R01.2/grothendieck-monodromy-and-the-weil-deligne-functor`, EllipticCurves Layer 4 and LocalFieldsRamification Layer 3.
  - Consumers: R15.6, R26.1, R27.1, R27.3, R33.1, R11.5, R11.6 and R20.1.
  - There is no path between R01.3 and R01.6 in either direction.
- **RS-25 (accepted).** Owner record: "General Artin/Swan conductor and elliptic algorithmic-versus-ramification conductor comparison, including wild terms" → R01.3 (formerly R11.5, R11.6). Its links R01.3 → R11.5 and R01.3 → R11.6 supply "the elliptic conductor comparison".
- **RS-06 (accepted).** Owner record: "Tate-module carrier, determinant, oddness, Frobenius polynomial and conductor/Euler comparison interface" → R01.6. Its link R01.6 → R29.4 gives the reason "Carayol's all-finite-place comparison, including monodromy/Ogg's formula, is stronger than equality of unramified traces."
- **The consumer's need.** The EllipticCurveModularity decomposition node `R29.4/isogeny-from-faltings-and-exact-conductor` records: "Carayol's conductor statement is a consequence of local-global compatibility at EVERY finite place including the bad ones, together with Ogg's conductor formula".
- **EllipticCurves Layer 4** (`content/tau-ceti/EllipticCurves/README.md`, lines 821–834):
  - It defines "the **algorithmic (Ogg) exponent** `v(Δ) − m + 1` (`m` the component count read off the symbol)".
  - The identification with the ramification-theoretic conductor is "a **separate, related project**, cited (Saito) for context only".
  - The accepted EllipticCurves link EllipticCurves Layer 4 → R01.3 says that R01.3 "gives the precise comparison with the conductor of an elliptic curve, wild contributions at 2 and 3 included."
- **No atlas stage plans the inputs.** A search of all 2840 assembled stage texts finds no occurrence of "determinant of cohomology", "Mumford isomorphism", "Deligne pairing" or "Noether formula". Every other occurrence of "Saito" is a different theorem: Saito–Tunnell (GZ.0, GZ.4), Kato–Saito higher class field theory (HL.6), and T. Saito's p-adic Hodge theory of Hilbert modular forms (the R19.2–R19.5 and R26.1 decomposition nodes). The EllipticCurves Layer 4 remark cites the right paper for context only.
- **Decomposition gap.** `data/decompositions/ArithmeticGaloisRepresentations.json` has the gap "The conductor of an l-adic representation with nontrivial monodromy was not read". It lists "the comparison with the conductor of an elliptic curve" as NOT verified.
- **Library.**
  - AUDIT-31 on R01.3: "Comparison with the conductor of an elliptic curve, including wild contributions at 2 and 3": absent.
  - In the pinned trees, Mathlib 082e2d3 has `WeierstrassCurve.IsMinimal` (Mathlib/AlgebraicGeometry/EllipticCurve/Reduction.lean:276) and the good, multiplicative and additive reduction classes.
  - Tau Ceti f790474 has `WeierstrassCurve.valuation_Δ_eq_of_isMinimal_smul` (TauCeti/AlgebraicGeometry/EllipticCurve/MinimalModel.lean:163). It says that two minimal models related by a change of variables have the same v(Δ). Both declarations were read at the pinned commits.
  - The pinned declaration index has no conductor exponent, Swan conductor, Tate's algorithm, regular or minimal regular model, or determinant of cohomology.

### Fix
The comparison stays owned by R01.3, as RS-25 decided. It moves into two successor sub-stages of R01.3, following the atlas's existing successor pattern (`CrystallineCohomology:CR.3:duality`, a key with a colon, `parentStageId` = the parent, and the parent upstream). R01.3 itself stays the early general-conductor stage that the Serre-target consumers import. So the Serre target does not inherit regular models and Saito's theorem.

1. **R01.3 prose** (`content/campaign/ArithmeticGaloisRepresentations/README.md`, line 48).
   - Old: "Prove that reduction cannot increase the conductor at a prime different from p, and give the precise comparison with the conductor of an elliptic curve. Wild contributions at 2 and 3 are not omitted."
   - New: "Prove that reduction cannot increase the conductor at a prime different from p. The comparison with the conductor of an elliptic curve, in every residue characteristic and with every wild term, is proved in the successors [R01.3:saito](#stage-R01.3:saito) and [R01.3:ogg](#stage-R01.3:ogg), which consume this stage."
2. **R01.6 prose** (same file, line 78).
   - Old: "Supply the conductor comparison and the local Euler-polynomial interface consumed by R29."
   - New: "Supply the local Euler-polynomial interface consumed by R29. The conductor comparison (Ogg's formula) is [R01.3:ogg](#stage-R01.3:ogg), which consumes this Tate module; this stage does not import it."
3. **New successor `ArithmeticGaloisRepresentations:R01.3:saito`.** Insert its README section after the R01.6 section, before "## Required examples and checks".
   - Atlas record:
     - key `R01.3:saito`; title "Conductor and discriminant of a relative curve — source-qualified successor"; `parentStageId` `ArithmeticGaloisRepresentations:R01.3`;
     - `requires`: `ArithmeticGaloisRepresentations:R01.3`, StableReduction Layers 2, 4, 5 and 7 (`tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`, `…#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`, `…#layer-5-regular-and-minimal-models`, `…#layer-7-semistable-reduction`), `LefschetzPencilsAndVanishingCycles:LPV.0` and `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves`;
     - `consumers`: `ArithmeticGaloisRepresentations:R01.3:ogg`.

   README text:

   > <a id="stage-R01.3:saito"></a>
   >
   > ### R01.3:saito. Conductor and discriminant of a relative curve — source-qualified successor
   >
   > **Setting.** Let K be a henselian discretely valued field whose residue field k is algebraically closed. Let O_K be its valuation ring and S = Spec O_K. Let C/K be a proper smooth geometrically connected curve of genus g ≥ 1, and f: X → S its minimal regular model (StableReduction Layer 5). For a prime ℓ ≠ char k, let ε and δ be the tame and Swan conductors of V = H¹_ét(C_K̄, Q_ℓ) (R01.3), and put f_C = ε + δ. The Artin conductor is Art(X/S) = χ(X_η̄) − χ(X_s̄) − δ, where χ is the ℓ-adic Euler characteristic (Liu §2).
   >
   > **Obligations.**
   > - **Determinant of cohomology.** Construct det Rf_* for the relative dualizing sheaf ω_{X/S} of StableReduction Layer 2 and for its tensor powers, compatibly with base change. No other stage plans it.
   > - **The canonical isomorphism.** Construct Δ_{Y/T}: det Rh_*(ω^{⊗2}) ≅ (det Rh_*ω)^{⊗13}, compatible with base change, for proper smooth h: Y → T with geometrically connected fibres of genus ≥ 1. Sources: Mumford, *Stability of projective varieties*, Theorem 5.10, for g ≥ 2; Deligne for g ≥ 1; the explicit genus-one form in Liu §4 (4)–(5).
   > - **The discriminant order.** Define ord Δ_{X/S} ∈ Z by Δ_{C/K}(M) = π^{ord Δ} N, where M = H⁰(S, det Rf_*(ω_{X/S}^{⊗2})) and N = H⁰(S, (det Rf_*ω_{X/S})^{⊗13}) (Liu §3).
   > - **Saito's theorem.** Prove ord Δ_{X/S} = −Art(X/S) (Saito 1988, Theorem 1, as stated in Liu §3 and Ünver §1).
   >   - The semistable case (Deligne; Mumford) uses the node calculations of LPV.7:semistable-curves.
   >   - The general case compares how both sides behave under finite separable extensions of K. After such an extension, StableReduction Layer 7 gives nodal reduction.
   > - **The Euler-characteristic formula.** Prove −Art(X/S) = n − 1 + f_C when the gcd of the multiplicities of the components of X_s is 1. Here n is the number of irreducible components of X_s. The hypothesis holds in particular when C(K) ≠ ∅ (Liu (2), citing Proposition 1 of Liu's genus-two paper). The proof identifies H¹(X_s̄, Q_ℓ) with the inertia invariants of V, through LPV.0's specialization sequence. That step is an obligation here; its source proof was not read.
   > - **Scope.** The theorem holds in every residue characteristic, including residue characteristic 2 in mixed characteristic, where Ogg's case-by-case proof gives nothing. Do not restrict it. Ünver reproves it only for arithmetic surfaces over number fields (arXiv:math/0006043v1, §1), which is not this local statement.
   >
   > **Sources.**
   > - Q. Liu, *Formule d'Ogg d'après Saito*, https://www.math.u-bordeaux.fr/~qliu/Notes/Ogg-Saito.pdf, pp. 1–5, read 29 September 2026.
   > - T. Saito, *Conductor, discriminant, and the Noether formula of arithmetic surfaces*, Duke Math. J. 57 (1988), 151–173, Theorem 1. Not read here; the statement is taken from Liu and Ünver.
   > - S. Ünver, arXiv:math/0006043v1, §1, read 29 September 2026.
4. **New successor `ArithmeticGaloisRepresentations:R01.3:ogg`.** Insert its README section directly after R01.3:saito.
   - Atlas record:
     - key `R01.3:ogg`; title "Ogg's formula for elliptic curves in every residue characteristic"; `parentStageId` `ArithmeticGaloisRepresentations:R01.3`;
     - `requires`: `ArithmeticGaloisRepresentations:R01.3:saito`, `ArithmeticGaloisRepresentations:R01.6`, EllipticCurves Layer 4 (`tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`) and `NeronModelsAndSemistableAbelianVarieties:R11.2`;
     - `consumers`: `NeronModelsAndSemistableAbelianVarieties:R11.5`, `NeronModelsAndSemistableAbelianVarieties:R11.6` and `EllipticCurveModularity:R29.4`.

   README text:

   > <a id="stage-R01.3:ogg"></a>
   >
   > ### R01.3:ogg. Ogg's formula for elliptic curves in every residue characteristic
   >
   > **Setting.** Let E be an elliptic curve over a henselian discretely valued field K with perfect residue field k, and let ℓ ≠ char k.
   > - f_E is the conductor exponent (R01.3) of the Tate module V_ℓ(E) of R01.6.
   > - Δ_min is the discriminant of a minimal Weierstrass equation. Its valuation does not depend on the minimal equation (Tau Ceti `WeierstrassCurve.valuation_Δ_eq_of_isMinimal_smul`).
   > - n is the number of irreducible components of the geometric special fibre of the minimal regular model.
   >
   > **Obligations.**
   > - **Strict-henselian reduction.** Prove that f_E, ν(Δ_min) and n do not change on passing to the strict henselization of O_K:
   >   - the inertia group and its ramification filtration are unchanged;
   >   - a minimal Weierstrass equation stays minimal;
   >   - the minimal regular model commutes with this étale base change.
   >
   >   After this, work with an algebraically closed residue field, as Liu does.
   > - **The two conductors agree.** Identify f_E with the f_C of R01.3:saito for C = E. V_ℓ(E) is dual to H¹_ét(E_K̄, Q_ℓ) (Kummer sequence and Pic⁰ = E), and a representation and its dual have the same conductor. DeligneWeightsAndPurity DWP.1 plans the H¹/Jacobian identification for its finite-field application. Reuse it only if its statement covers K.
   > - **Néron's lemma.** The minimal desingularization of the normal projective model W of a minimal Weierstrass equation is the minimal regular model X; equivalently, the smooth locus of W is the identity component of the Néron model (Liu §4, Lemme, using Lipman's rational singularities).
   > - **The discriminant order is the minimal discriminant.** Prove ord Δ_{X/S} = ν(Δ_min). Since E(K) ≠ ∅, ord δ_{X/S} = 0. The isomorphism Δ′_{X/S} sends 1 to Δ·ω₀^{⊗12}, where ω₀ = dx/(2y + a₁x + a₃) is a basis of H⁰(X, ω_{X/S}) (Liu §4, proof of the Théorème).
   > - **Ogg's formula.** With R01.3:saito, conclude ν(Δ_min) = −Art(X/S) = n − 1 + f_E in every residue characteristic, including 2 and 3.
   > - **The algorithmic exponent.** Identify n with the component count m read off Tate's algorithm (EllipticCurves Layer 4), through R11.2's comparison of the Néron special fibre with the algorithm. This identifies Layer 4's algorithmic exponent v(Δ) − m + 1 with the ramification-theoretic conductor exponent at every prime.
   > - **Exports.** Export the comparison to NeronModelsAndSemistableAbelianVarieties R11.5 and R11.6, and to EllipticCurveModularity R29.4, whose exact-conductor step uses Ogg's formula. EllipticCurves Layer 8 keeps its reserved semistable special case.
   >
   > **Sources.** As for R01.3:saito. The three invariances under strict henselization are standard and are proof obligations here; their sources were not re-read.
5. **Stage edges to add** (`stageEdges` and the `requires` lists above):
   - R01.3 → R01.3:saito;
   - StableReduction Layers 2, 4, 5 and 7 → R01.3:saito;
   - LPV.0 → R01.3:saito and LPV.7:semistable-curves → R01.3:saito;
   - R01.3:saito → R01.3:ogg;
   - R01.6 → R01.3:ogg, EllipticCurves Layer 4 → R01.3:ogg and R11.2 → R01.3:ogg;
   - R01.3:ogg → R11.5, R01.3:ogg → R11.6 and R01.3:ogg → R29.4.

   **Cycle test.** The joint cycle test adds the two new sub-stages with all fourteen edges to the assembled graph, together with the edges proposed for /17, /25 and /27. It finds no cycle: none of R11.5, R11.6 or R29.4 reaches any prerequisite of either sub-stage. R01.6 → R01.3:ogg is the edge the verifier asks for, "the comparison consumes the Tate module". No edge between R01.6 and R01.3 itself is added in either direction.
6. **Existing edges stay.**
   - EllipticCurves Layer 4 → R01.3 is kept. Its accepted reason (`research/blueprint/links/tauceti_TauCetiRoadmap_EllipticCurves.json`) names the comparison, which now lives in R01.3:ogg. The maintainer may retarget that link to R01.3:ogg; the new edge above exists either way.
   - RS-25's R01.3 → R11.5 and R01.3 → R11.6 stay for the general conductors. Their "elliptic conductor comparison" clause is now carried by the new R01.3:ogg edges.
   - RS-06's R01.6 → R29.4 stays for the Tate-module and Euler-polynomial comparison. Its "Ogg's formula" clause is now carried by R01.3:ogg → R29.4.
7. **Restructuring records** (maintainer's, at the next restructuring pass). RS-25's owner entry stays with R01.3 and is realized in R01.3:saito and R01.3:ogg. The conductor half of RS-06's R01.6 entry ("conductor/Euler comparison interface") is exported by R01.3:ogg; the Euler half stays at R01.6.
8. **Decomposition gap** (maintainer's edit to `data/decompositions/ArithmeticGaloisRepresentations.json`). In "The conductor of an l-adic representation with nontrivial monodromy was not read", the elliptic comparison is no longer an unplanned item. Append: "The elliptic comparison is planned in R01.3:saito and R01.3:ogg (Liu, Ogg–Saito notes pp. 1–5; Saito 1988, Theorem 1). The Weil–Deligne conductor part of this gap is unchanged."

**When:** now for the prose, the two stage records and the edges; blueprint for the nodes of the two sub-stages.

## /7 (high, missing): a PA.6 endpoint for ACC+'s automorphy lifting theorems

### What the verifier corrected
- **The gap is confirmed.** PA.1/PA.2 supply local–global compatibility and PA.3/PA.4 arithmetic patching. PA.5 only preserves a checklist under base change. ML.2 names the final potential automorphy but supplies none of the lifting statements in between.
- **The repair.** Add a dedicated PA endpoint, or a precisely separated early lifting prefix of ML.2. It imports the arithmetic branches and the matching local and global deformation problems.
- **The statements.** They are ACC+ Theorems 6.1.1–6.1.2 (published PDF pp. 133–134). The proofs run through the Fontaine–Laffaille support and lifting results 6.5.4–6.5.5 (pp. 165–168) and the ordinary Theorem 6.6.2 (pp. 178–179), then the soluble base change reductions.
- **Do not require a polarization.** These are the nonpolarized lifting statements over CM and totally real fields.
- **Keep the hypotheses separate:**
  - enormous image;
  - decomposed genericity;
  - the scalar outside G_{F(ζ_p)};
  - p > n² versus p > n;
  - crystalline versus ordinary, and the weight conditions.
- **CG Theorem 5.16** (pp. 87–88) is an arbitrary-rank theorem, but it is conditional on Conjecture B and has its own fixed-determinant and weight conditions. It cannot certify the ACC+ endpoint.
- **The ordinary branch is weaker.** Its proof does not give the full-support theorem of the Fontaine–Laffaille case.
- **Graph.** PA.6 → ML.2, together with the branch imports, is jointly acyclic. None of this licenses a blanket R = T or an all-local-properties conclusion.

### What main says now
- **`content/campaign/PotentialAutomorphyInfrastructure/README.md`, "Scope and source":** "The final potential-automorphy assembly has downstream owner ModularityAndLanglandsExtensions ML.2; symmetric powers and Sato–Tate have downstream owner ML.3. Those source-qualified endpoints require their own complete proof decomposition and do not become prerequisites of the infrastructure below."
- **PA.5:** "Supply a reusable checklist theorem which records that the input package for a chosen lifting argument survives a specified base change, while leaving the lifting theorem with its dedicated owner."
- **ML.2** (`content/campaign/ModularityAndLanglandsExtensions/README.md`): "Apply PotentialAutomorphyInfrastructure with full regularity, polarization, residual-image, local and field-extension hypotheses; track compatible systems and descent. Supply the final theorem independently of a folder merely advertising infrastructure." Its **Inputs** are ML.1 and PA.5.
- **The assembled graph:**
  - PA.1, PA.2 and PA.4 have no consumers;
  - PA.3's only consumer is PA.4;
  - PA.5 feeds ML.2 and ML.3;
  - no stage title or description contains "automorphy lifting";
  - ML.2's only descendants are ML.3 and ML.5, and neither reaches a PA, GlobalGaloisDeformations or LocalGaloisDeformationRings stage.
- **Two accepted source routes place these theorems at different PA stages, and both are wrong for the graph.**
  - **PAPER-ALLEN-ETAL-23 route 2** (the ACC+ extraction; verdict accept) sends 25 items to PotentialAutomorphyInfrastructure. Its reason assigns "PA.3: the lifting theorems themselves, Theorems 6.1.1 and 6.1.2, Corollary 6.5.5 and Theorem 6.6.2, and their deductions". These are items /181, /182, /259, /270, /276 and /289, all status `missing`.
  - **PAPER-QIAN-23 route 5** (verdict accept) sends item /072, ACC+ Theorem 6.1.2, to PA.4. It says "placing it at PA.3, which PA.4 requires, would close a cycle", and that "The ACC+ extraction places Theorems 6.1.1, 6.1.2 and 6.6.2 at PA.3 and should move them with it."
  - **Neither stage fits.** PA.3 precedes PA.4, and PA.4 would have to import PA.1, PA.2 and PA.5 to hold the theorems. QIAN-23's route 1 verdict likewise asks that "ML.2 must add PA.2, PA.4 and the Dwork Part II as prerequisites".
- **The proposed Part IIs of this roadmap leave the unpolarized theorems here.**
  - PolarizedAutomorphyLifting (the BOXER-CALEGARI-GEE-25 route 2 brief) says PotentialAutomorphyInfrastructure "treats unpolarized representations through the cohomology of locally symmetric spaces (the ACC+ route); this Part II adds the polarized (conjugate self-dual) automorphy lifting theory".
  - AutomorphyLiftingBeyondTaylorWiles (CALEGARI-GERAGHTY-18 route 2) owns CG Theorem 5.16 under Conjecture B.
  - The partial ModularityAndLanglandsExtensions packet has four ML.2 lifting nodes: minimal-, ordinary-, preliminary-pd- and pd-automorphy-lifting. They are BLGGT's polarized, adequate-image theorems and do not cite ACC+.
- **Sources read for this fix** (29 September 2026):
  - **ACC+, published version.** Author-hosted PDF https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf, sha256 c5429e4f384384045dbb48502d71547bb21699783c0f77cce27b24e742467f02, 217 pages; printed page = PDF page + 896. This is the version the PA document names. It is the one whose numbering is used below: arXiv v2 numbers some §6.2 results one lower, for example Proposition 6.2.32 for 6.2.33.
    - Theorems 6.1.1–6.1.2 and Remarks 6.1.3–6.1.4, pp. 1029–1030 (page images checked).
    - The §6.5.1 set-up (1)–(17), Lemma 6.5.2, Proposition 6.5.3, Theorem 6.5.4 and Corollary 6.5.5 with its proof, pp. 1061–1064.
    - The end of the proof of Theorem 6.5.4, p. 1070.
    - §6.5.12: Proposition 6.5.13 (soluble base change and descent, from [AC89, Ch. 3, Th. 4.2 and 5.1]) and the proof of Theorem 6.1.1, pp. 1070–1074.
    - §6.6.1: set-up (1)–(15) and Theorem 6.6.2, pp. 1074–1075, including "we do not prove an analogue of Theorem 6.5.4 here, but rather only an analogue of Corollary 6.5.5".
    - §6.6.10, the proof of Theorem 6.1.2, pp. 1081–1084.
  - **Calegari–Geraghty, published version.** https://www.math.uchicago.edu/~fcale/papers/CG.pdf, sha256 c0ba8de04d5ee92fe1a967f9487df6cb49295590dfd03762a9150a92838225c5, 137 pages. Theorem 5.16, PDF pp. 87–88: "Assume Conjecture B", p > n unramified in F, Hodge–Tate weights {0, …, n−1}, det r = ε^{n(n−1)/2}, big residual image.

### Fix

**1. `content/campaign/PotentialAutomorphyInfrastructure/README.md`: a new section after PA.5.**

> ### PA.6. Automorphy lifting over CM and totally real fields
>
> State and prove ACC+ Theorems 6.1.1 and 6.1.2 (printed pp. 1029–1030) exactly. F is an imaginary CM or totally real field, c ∈ Aut(F) is complex conjugation, p is a prime, and ρ : G_F → GL_n(Q̄_p) is continuous. No polarization or conjugate self-duality is assumed. The polarized theory belongs to the proposed Part II PolarizedAutomorphyLifting. Calegari–Geraghty's Theorem 5.16 is conditional on their Conjecture B, and belongs to the proposed Part II AutomorphyLiftingBeyondTaylorWiles; it supplies neither theorem.
>
> **Theorem 6.1.1 (Fontaine–Laffaille).**
> - **Hypotheses.**
>   - (1) ρ is unramified almost everywhere.
>   - (2) ρ|G_{F_v} is crystalline for each v | p, and p is unramified in F.
>   - (3) ρ̄ is absolutely irreducible and decomposed generic (Definition 4.3.1), and ρ̄(G_{F(ζ_p)}) is enormous (Definition 6.2.29).
>   - (4) Some σ ∈ G_F − G_{F(ζ_p)} has ρ̄(σ) scalar, and p > n².
>   - (5) There is a cuspidal automorphic π of GL_n(A_F) such that:
>     - π is regular algebraic of weight λ, with λ_{τ,1} + λ_{τc,1} − λ_{τ,n} − λ_{τc,n} < p − 2n for all τ;
>     - for some ι : Q̄_p ≅ C, ρ̄ ≅ r̄_ι(π) and HT_τ(ρ) = {λ_{ιτ,1} + n − 1, …, λ_{ιτ,n}};
>     - π_v is unramified for v | p.
> - **Conclusion.** There is a cuspidal Π of GL_n(A_F) of weight λ with ρ ≅ r_ι(Π). Π_v is unramified at every finite v with v | p, and at every finite v where ρ and π are both unramified.
>
> **Theorem 6.1.2 (ordinary).**
> - **Hypotheses.**
>   - (1) as above.
>   - (2) For each v | p, ρ|G_{F_v} is potentially semistable and ordinary with regular Hodge–Tate weights. That is, it is conjugate to an upper-triangular representation with diagonal characters ψ_{v,1}, …, ψ_{v,n}, and ψ_{v,i} agrees on an open subgroup of I_{F_v} with σ ↦ ∏_τ τ(Art_{F_v}^{−1}(σ))^{−(λ_{τ,n−i+1}+i−1)} for a weight λ ∈ (Z^n_+)^{Hom(F,Q̄_p)}.
>   - (3) as above.
>   - (4) The scalar element as above, and p > n.
>   - (5) There is a regular algebraic cuspidal π of GL_n(A_F), ι-ordinary for some ι, with r̄_ι(π) ≅ ρ̄.
> - **Conclusion.** ρ is ordinarily automorphic of weight ιλ: there is an ι-ordinary cuspidal Π of weight ιλ with ρ ≅ r_ι(Π). Π_v is unramified at each finite v ∤ p where ρ and π are both unramified.
>
> **Fontaine–Laffaille branch (§6.5).**
> - Take the set-up of §6.5.1: its assumptions (1)–(17), including:
>   - n ≥ 2, p > n², F imaginary CM;
>   - the imaginary-quadratic splitting condition (6), p unramified in F, and the weight bound (8);
>   - the degree condition (9) on the places of F⁺ above p;
>   - Iwahori level at R and pro-v Iwahori level at S − (R ∪ S_p);
>   - two places of distinct residue characteristics, for neatness (Lemma 6.5.2);
>   - decomposed genericity and enormous image (17).
> - Define the global deformation problems S_χ (p. 1062). Prove Proposition 6.5.3: a surjection R_{S_χ} → T^S(RΓ(X_K, V_λ(χ^{−1})))_m/J with J^δ = 0, where δ depends only on n and [F : Q].
> - Prove Theorem 6.5.4, that H^*(X_K, V_λ(1))_m has full support over R_{S_1}. The ingredients are the Taylor–Wiles data and ultrapatching of PA.4, the component properties of Lemma 6.2.26 and the comparison of PA.3, and Proposition 6.3.8.
> - Deduce Corollary 6.5.5 through Theorem 2.4.10.
> - Then run §6.5.12:
>   - reduce the totally real case to the CM case;
>   - choose finite sets V₀, V₁, V₂ of places and the soluble CM extension E = E₀·E_a·E_b·E_c (PA.5's base-change checklist);
>   - choose the places v₀, v₀′ (PA.4);
>   - apply Proposition 6.5.13, soluble base change and descent for GL_n, and Varma's theorem [Var14] for the unramifiedness away from p.
>
> **Ordinary branch (§6.6).**
> - Take the set-up of §6.6.1: its assumptions (1)–(15), including:
>   - p > n;
>   - π ι-ordinary with nonzero Iw_v(1,1)-invariants at v ∈ S_p;
>   - [F_v : Q_p] > n(n+1)/2 + 1 and r̄_ι(π)|G_{F_v} trivial at v ∈ S_p.
> - Use the determinant-ordinary local conditions D_v^{det,ord}, with Lemma 6.2.27 in place of Lemma 6.2.26.
> - Prove Theorem 6.6.2 through the ordinary complexes of PA.2 and Corollary 6.3.9.
> - The paper proves no analogue of Theorem 6.5.4 here (p. 1075), because the irreducible components of the D_v^{det,ord} lifting rings are not understood. Do not state a full-support theorem for this branch.
> - Then run §6.6.10, with [Ger19, Lem. 5.7] for ι-ordinarity under base change.
>
> **Imports.**
> - PA.1: Fontaine–Laffaille local–global compatibility, Theorem 4.5.1.
> - PA.2: the ordinary complexes and Theorem 5.5.1.
> - PA.3: the change of local condition and derived support.
> - PA.4: the auxiliary levels, the places v₀, v₀′ and ultrapatching.
> - PA.5: the base-change checklist.
> - GlobalGaloisDeformations G8: Definition 6.2.2, Theorem 6.2.3, Lemma 6.2.4 and Proposition 6.2.25.
> - GlobalGaloisDeformations G7: Proposition 6.2.33.
> - LocalGaloisDeformationRings L7: the Fontaine–Laffaille ring, Proposition 6.2.14, and the ordinary flag rings, Proposition 6.2.10.
> - LocalGaloisDeformationRings L8: the determinant-ordinary ring and its comparison with the flag ring, Proposition 6.2.12.
> - LocalGaloisDeformationRings R08.2: Taylor's conditions at v ∈ R, Propositions 6.2.16–6.2.17; the unrestricted rings at places with H² = 0, Proposition 6.2.21, come from R08.1, which R08.2 requires.
>
> Soluble base change for GL_n (Proposition 6.5.13), Theorem 2.4.10 and Varma's theorem come through PA.0's suppliers, as the matrix rows for §§2.1–2.2, 2.4 and §2.3, §3 state.
>
> **Keep separate.**
> - Enormous image, not adequacy and not Calegari–Geraghty's "big" image.
> - Decomposed genericity.
> - The scalar element outside G_{F(ζ_p)}.
> - p > n² in the Fontaine–Laffaille branch against p > n in the ordinary branch.
> - Crystalline against ordinary local conditions.
> - The Fontaine–Laffaille weight bound.
> - The output is the automorphy of the given ρ. No integral R = T is concluded, and no local property beyond those stated.
>
> **Acceptance.**
> - Both theorems are stated with every hypothesis above.
> - A check that the Fontaine–Laffaille branch concludes full support and the ordinary branch only the analogue of Corollary 6.5.5.
> - The case n = 2, F imaginary quadratic, with the counts of Lemma 6.2.26 and Proposition 6.2.33 written out: the local dimension 1 + 4|T| + 2, and g = 2q − 4.

In `data/atlas.json`, add the stage record PotentialAutomorphyInfrastructure:PA.6 with:
- key `PA.6`;
- the title above;
- the section above as its description;
- requires: PotentialAutomorphyInfrastructure:PA.1, PA.2, PA.3, PA.4 and PA.5, GlobalGaloisDeformations:G7 and G8, LocalGaloisDeformationRings:L7, L8 and R08.2;
- consumers: ModularityAndLanglandsExtensions:ML.2.

Add PA.6 to the roadmap's stage list, and add the ten stageEdges records and PA.6 → ML.2.

**2. The same README, elsewhere.**
- **"Scope and source", second paragraph.** Replace "The final potential-automorphy assembly has downstream owner ModularityAndLanglandsExtensions ML.2;" with:
  > Its one endpoint is PA.6, the automorphy lifting theorems of ACC+ (Theorems 6.1.1 and 6.1.2) for unpolarized representations over CM and totally real fields. The final potential-automorphy assembly has downstream owner ModularityAndLanglandsExtensions ML.2, which imports PA.6;

  The rest of the paragraph stays. PA.6 is not a prerequisite of PA.0–PA.5.
- **Source-to-owner matrix.** Add a row after the §§6.3–6.4 row:
  > | §§6.1, 6.5–6.6 | PA.6 | The two lifting theorems, Theorem 6.5.4, Corollary 6.5.5, Theorem 6.6.2 and the soluble base-change reductions |
- **"Implementation handoff".**
  - Replace "**Stages:** PA.0, PA.1, PA.2, PA.3, PA.4, PA.5." with "**Stages:** PA.0, PA.1, PA.2, PA.3, PA.4, PA.5, PA.6."
  - Replace "Export PA.5 to ModularityAndLanglandsExtensions ML.2 for final potential-automorphy assembly" with "Export PA.6's lifting theorems and PA.5 to ModularityAndLanglandsExtensions ML.2 for final potential-automorphy assembly".
  - Replace "these downstream owners are not prerequisites of PA.0–PA.5." with "these downstream owners are not prerequisites of PA.0–PA.6."

**3. `content/campaign/ModularityAndLanglandsExtensions/README.md`, ML.2.**
- **"Construct and export".** Replace "Apply PotentialAutomorphyInfrastructure with full regularity, polarization, residual-image, local and field-extension hypotheses;" with:
  > Apply the lifting theorems of PotentialAutomorphyInfrastructure PA.6 (unpolarized, ACC+ Theorems 6.1.1–6.1.2) and its transport checklist PA.5, with full regularity, residual-image, local and field-extension hypotheses, and polarization where the chosen lifting theorem requires it;
- **"Inputs".** Replace "`ModularityAndLanglandsExtensions:ML.1`, `PotentialAutomorphyInfrastructure:PA.5`" with "`ModularityAndLanglandsExtensions:ML.1`, `PotentialAutomorphyInfrastructure:PA.5`, `PotentialAutomorphyInfrastructure:PA.6`".
- **Graph.** In `data/atlas.json`, add PA.6 to ML.2's requires list.
  - PA.2 and PA.4 then reach ML.2 through PA.6, as the PAPER-QIAN-23 route 1 verdict asks.
  - The BLGGT nodes of the ModularityAndLanglandsExtensions packet are polarized theorems and are unaffected.

**4. Cycle tests.**
- PA.6 is new, so the test is whether its consumer ML.2 reaches any of its ten prerequisites. It does not: ML.2's descendants are ML.3 and ML.5.
- The union with the edges of /21 and /22 below is jointly acyclic.
- **Soluble base change.**
  - ET.7a, which develops the Arthur–Clozel base-change steps, already reaches PA.0, and so PA.6, through AutomorphicGaloisRepresentationsPartII.
  - The early GL_n base-change stage that finding /1's fix creates should be linked by an edge from it to PA.6. It is ET.4b in that section, requiring AS.6, ET.3 and ET.4.
  - That edge is acyclic, because ML.2 reaches none of AS.6, ET.3 and ET.4.

**5. Paper routes.** Both keep their kind (source) and roadmap, and change only their stages and reason, so their accept verdicts still describe them.
- **`research/blueprint/papers/PAPER-ALLEN-ETAL-23.result.json`, route 2.**
  - **Stages:** add "PotentialAutomorphyInfrastructure:PA.6".
  - **Reason:** replace "PA.3: the lifting theorems themselves, Theorems 6.1.1 and 6.1.2, Corollary 6.5.5 and Theorem 6.6.2, and their deductions; no stage states an automorphy lifting theorem, and PAPER-QIAN-23 routed Theorem 6.1.2 here." with:
    > PA.6: the lifting theorems themselves, Theorems 6.1.1 and 6.1.2, Corollary 6.5.5 and Theorem 6.6.2, and their deductions (added for RT-AREA-langlands-1/7; PA.3 cannot hold them, because PA.4 requires PA.3 and the theorems need PA.4).
- **`research/blueprint/papers/PAPER-QIAN-23.result.json`, route 5.**
  - **Stages:** replace "PotentialAutomorphyInfrastructure:PA.4" with "PotentialAutomorphyInfrastructure:PA.6".
  - **Reason:** replace "using PA.4's Taylor–Wiles primes and ultrapatching, PA.2's ordinary local–global compatibility (Theorem 5.5.1) and PA.5's base-change checklist. It is owned at PA.4; placing it at PA.3, which PA.4 requires, would close a cycle. PA.4 currently requires only PA.3, so its blueprint must add PA.2 and PA.5 as prerequisites; neither depends on PA.4. The ACC+ extraction places Theorems 6.1.1, 6.1.2 and 6.6.2 at PA.3 and should move them with it." with:
    > using PA.4's auxiliary levels and ultrapatching (with G7's Taylor–Wiles primes), PA.2's ordinary local–global compatibility (Theorem 5.5.1) and PA.5's base-change checklist. It is owned at PA.6, the lifting endpoint added for RT-AREA-langlands-1/7, which requires PA.2, PA.4 and PA.5; the ACC+ extraction's Theorems 6.1.1, 6.1.2 and 6.6.2 are there too.
  - The review's verdict reason still names PA.4. The maintainer may record a verdict for the new stage, or leave the accept, since the route keeps its roadmap and item.

**When:** now.

## /8 (high, error): Hilbert consumers take the ordinary tower from T5, not IG.1

### What the verifier corrected
- **The supplier is wrong for the Hilbert consumers.** RS-14's links forward IG.1 to them, but IG.1 fixes the split-unitary, full-p-divisible-group central-leaf torsor. That is not the Katz–Hida torsor for the dual canonical subgroup. HodgeTateAndCanonicalSubgroups T5 constructs the latter and its ordinary inverse tower.
- **The source.** BHW 1902.03985v4 §3.4 (p. 14) and §§6–7 (p. 28) distinguish the two objects and supply the Hilbert analogue with its formal model.
- **The repair.** Route the Hilbert ordinary inputs through T5, with precise requests where its present analytic statement does not suffice for the formal-model and CM-point comparisons. The seven T5 handoffs are absent and jointly acyclic.
- **Qualify the removals.** L5 and L5w also contain a GU(2,2) congruence argument; an IG edge justified by that unitary use may remain, with its Hilbert justification replaced. KU-hilberteisenstein is an aggregation checkpoint: its imports must agree with L3 and I.3, not create another tower owner.
- **No identification.** Neither the good-reduction Hilbert ordinary geometry nor the repair of /4 identifies the two torsors without a comparison theorem.

### What main says now
- **The links.** In the accepted `data/restructure/RS-14.result.json`, `links` has IG.1 → X for X among AutomorphicPadicLFunctions L3, L3h, L4, L4e, L5 and KU-hilberteisenstein; IntegralIwasawaTheory I.3; PadicFamilies L5; AutomorphicCongruences L1, L5 and L5w. The reason of each Hilbert one reads "Direct handoff of the shared prerequisite formerly exposed through AutomorphicPadicLFunctions:L3" (for L3 itself: "Import the supplier's precise contract removed from AutomorphicPadicLFunctions:L3").
- **The layer and owner entries.** `layers["AutomorphicPadicLFunctions:L3"].suppliedBy` contains IgusaVarietiesAndTorsionConcentration:IG.1, and its `keeps` text reads "For ordinary CM type, import CM abelian varieties/reflex data and the canonical geometric expansion/Igusa inputs". The `owners` entry for "Canonical special-fiber Igusa varieties, torsors and stated finite-level models/actions; mixed-characteristic Katz/EHLS lifts require additional proofs" has owner IG.1, formerly [IG.1, AutomorphicPadicLFunctions:L3, AutomorphicPadicLFunctions:L4].
- **T5** (HodgeTateAndCanonicalSubgroups): "Construct the finite Igusa torsors of trivializations of the relevant dual canonical subgroup, and their ordinary inverse tower." It requires T4 and PerfectoidSpaces:P9 (and V5 is already an ancestor); its consumers are OverconvergentAutomorphicForms O3, O5 and O7 and PerfectoidShimuraVarieties S5.
- **AutomorphicCongruences L5w**: "Prove the source-specific GU(2,2) congruence/Iwasawa theorem over a totally real field used by Wan's published 2015 Theorem 3 … Construct the Hilbert Hida family". L5w already reaches L5.
- **BHW**, arXiv:1902.03985v4 (read 29 September 2026; SHA-256 prefix 8ee48970dc500f60):
  - §3.4, p. 14, for the modular curve: "the (Z/p^nZ)^×-torsor parametrising trivialisations Z/p^nZ ≅ H_n^∨ of the canonical subgroup. Since this has a natural finite étale formal model, we can form the inverse limit … This is a pro-étale Z_p^×-torsor known as the Igusa tower".
  - §6, p. 28, for the Hilbert case: "Over this, we again have an Igusa tower with a pro-étale formal model".

### Fix
**1. Maintainer's edits to `data/restructure/RS-14.result.json`** (an accepted record; these amend it).
- **`links`, delete** the five entries with source `IgusaVarietiesAndTorsionConcentration:IG.1` and target `AutomorphicPadicLFunctions:L3`, `AutomorphicPadicLFunctions:L3h`, `AutomorphicPadicLFunctions:KU-hilberteisenstein`, `IntegralIwasawaTheory:I.3` or `PadicFamilies:L5`.
- **`links`, keep** IG.1 → `AutomorphicCongruences:L5w` and IG.1 → `AutomorphicCongruences:L5`, replacing each `reason` by:
  > IG.1 supplies its special-fibre central-leaf Igusa varieties to the GU(2,2) congruence argument of L5w (Wan 2015, Theorem 3, as used for BCS v2 Theorem 3.2.1), for a unitary datum that IG.0–IG.1 cover once widened by PAPER-CARAIANI-SCHOLZE-17's accepted route 2; L5w checks that its datum is one of them. The Hida ordinary tower of GU(2,2) is a different torsor: its comparison with IG.1's Ig^X at the ordinary Newton point is L5w's obligation. The Hilbert Hida family comes from HodgeTateAndCanonicalSubgroups T5 through PadicFamilies L5.

  For L5, append "L5 also reaches IG.1 through L5w; this edge may be dropped as transitive."
- **`links`, add** five entries with source `HodgeTateAndCanonicalSubgroups:T5` and targets `AutomorphicPadicLFunctions:L3`, `AutomorphicPadicLFunctions:L3h`, `IntegralIwasawaTheory:I.3`, `PadicFamilies:L5` and `AutomorphicCongruences:L5w`, each with the reason:
  > The Hilbert–Blumenthal ordinary Igusa tower (trivializations of the dual canonical subgroup over the ordinary locus, with its formal model; BHW §3.4 p. 14, §6 p. 28) is T5's. It replaces the handoff from IgusaVarietiesAndTorsionConcentration IG.1, whose central-leaf torsor for a split unitary datum is a different object.
- **No link to KU-hilberteisenstein.** It is an aggregation checkpoint and reaches T5 through L3 and I.3. No link T5 → AutomorphicCongruences:L5 is needed, since L5w → L5.
- **`layers["AutomorphicPadicLFunctions:L3"]`:**
  - In `suppliedBy`, replace `IgusaVarietiesAndTorsionConcentration:IG.1` by `HodgeTateAndCanonicalSubgroups:T5`.
  - In `keeps`, replace "the canonical geometric expansion/Igusa inputs" by "the canonical geometric expansion inputs and the Hilbert–Blumenthal ordinary Igusa tower of HodgeTateAndCanonicalSubgroups T5".
- **`owners`:**
  - In the IG.1 entry, set `formerly` to [`IgusaVarietiesAndTorsionConcentration:IG.1`, `AutomorphicPadicLFunctions:L4`], and change "Katz/EHLS lifts" to "EHLS lifts".
  - Add an entry:
    ```json
    {"target": "Hilbert–Blumenthal ordinary Igusa tower: finite torsors of trivializations of the dual canonical subgroup over the ordinary locus, the ordinary inverse tower and its formal model", "owner": "HodgeTateAndCanonicalSubgroups:T5", "formerly": ["AutomorphicPadicLFunctions:L3"]}
    ```
- **Untouched.** IG.1 → AutomorphicPadicLFunctions L4, L4e, L5 and → AutomorphicCongruences L1 are unitary (EHLS, Eischen–Wan, Skinner–Urban). They are outside this finding.

**2. Requests for the HodgeTateAndCanonicalSubgroups blueprint** (the roadmap has no packet yet; record them in its first one). Both requests have supplier HodgeTateAndCanonicalSubgroups:T5 and neededBy AutomorphicPadicLFunctions:L3, L3h and PadicFamilies:L5.
- **The formal model.** Over the formal completion of the Hilbert–Blumenthal integral model along the ordinary locus of its special fibre (HilbertModularVarietiesAndShimuraCurves H2), construct:
  - the finite étale torsors of trivializations of the multiplicative part of A[p^n] with its O_F-action, and their inverse tower;
  - their algebraization at finite level over the ordinary locus modulo p^m;
  - the comparison of their generic fibre with T5's analytic tower through the formal model (BHW §6, p. 28).

  State the comparison between this convention and T5's "dual canonical subgroup" convention explicitly.
- **CM points.** For a CM field with a p-ordinary CM type, the CM points of the ordinary locus lift canonically to the tower (Serre–Tate canonical lifts), with their Serre–Tate coordinates. ShimuraVarieties V5 is already an ancestor of T5, so no new edge is needed.
- **No identification with IG.1.** At the ordinary Newton point, IG.1's Γ_X-torsor is not identified with this tower without a comparison theorem; none is asserted.

**3. README text.**
- `content/campaign/AutomorphicPadicLFunctions/README.md`, L3: replace "The development includes CM abelian varieties and their integral ordinary deformation/Igusa theory," with:
  > The development includes CM abelian varieties and their integral ordinary deformation theory, the Hilbert–Blumenthal ordinary Igusa tower imported from HodgeTateAndCanonicalSubgroups T5,
- The same README, KU-hilberteisenstein: after "verify completion and map-level compatibility of [AutomorphicPadicLFunctions:L3](README.md), [IntegralIwasawaTheory:I.3](../IntegralIwasawaTheory/README.md).", add:
  > Both import the Hilbert ordinary Igusa tower from HodgeTateAndCanonicalSubgroups T5; this checkpoint owns no tower of its own.
- `content/campaign/AutomorphicCongruences/README.md`, L5w: after "Construct the Hilbert Hida family, minimal deformation/Hecke comparison, Gorenstein duality and integral specialization maps.", add:
  > The Hilbert ordinary Igusa tower comes from HodgeTateAndCanonicalSubgroups T5 through PadicFamilies L5. IgusaVarietiesAndTorsionConcentration IG.1 enters only for the GU(2,2) datum, and the comparison between its central-leaf torsor and the GU(2,2) Hida tower is proved here.

**4. Cycle tests.** T5 → L3, L3h, I.3, PadicFamilies:L5, AutomorphicCongruences:L5w (and T5 → KU-hilberteisenstein, tested but not proposed): no reverse path, and jointly acyclic, also together with the edges of /3, /4 and /5. The deletions cannot create a cycle.

**When:** now (the maintainer's amendment of the accepted RS-14 record, and the README text); the two requests at the HodgeTateAndCanonicalSubgroups blueprint.

## /9 (high, missing): a new stage TC.5 owns Scholze's torsion Galois determinants for GL_n

### What the verifier corrected
- **The endpoint is missing.** TC.4 stops at reusable comparison infrastructure, and IHG.5 is an input-parametrized schema. IG.6's lower-rank torsion systems need an actual theorem.
- **The statements.** They are arXiv v2 Theorem V.3.1 (p. 91; interior cohomology, J^{4(d+1)} = 0) and Theorem V.4.1 (pp. 100–102; full cohomology, with N depending only on [F:Q] and n).
- **The proof ingredients.** The proof uses:
  - the GL_n Borel–Serre boundary and induction on the rank;
  - the square-zero kernel of the map to the interior and boundary image algebras;
  - descent of the determinant.

  TC.3's symplectic/unitary Levi extraction supplies none of these.
- **The fix.** Add a TC terminal stage with those statements and proof nodes, importing ALS.4 and IHG.4/IHG.5, and feed it to IG.6 and PA.0. The combined candidate graph is acyclic.
- **What to preserve:**
  - finite-free algebraic coefficients;
  - level descent through Hochschild–Serre;
  - uniformity in i and m;
  - the branch and ramification hypotheses of V.4.6.

  Neither the theorem nor Remark V.4.5 establishes every conjectural local property.
- **CC.8** should point to the actual TC producer, with IHG supplying the algebra.

### What main says now
- **`content/campaign/TorsionCohomologyInfrastructure/README.md`:**
  - The purpose paragraph ends: "The target is a reusable library underlying its argument, not an additional requirement to formalize its final Galois-representation theorem."
  - TC.4 ends: "No new terminal claim about all Galois representations of all groups is part of this layer."
  - The source table has "| §5.4 | TC.4 below | Compatibility checks and reusable specialization infrastructure |".
- **IHG.5:** "Provide theorem schemas which take an actual geometric Hecke comparison … The geometric comparison itself is built by TorsionCohomologyInfrastructure".
- **CC.8** (`content/campaign/CompletedCohomologyPartII/README.md`): "This stage supplies the topological object; automorphic-section comparisons, torsion Galois determinants, vanishing, and Banach local–global compatibility remain respectively TC/IHG/IG/R31 theorems."
- **IG** (`content/campaign/IgusaVarietiesAndTorsionConcentration/README.md`):
  - The scope reads: "AutomorphicGaloisRepresentationsPartII supplies classical higher-rank Galois systems; TorsionCohomologyInfrastructure and IntegralHeckeAndGaloisDeterminants supply existing lower-rank torsion systems and determinant comparison for the boundary induction."
  - IG.6 reads: "Using lower-rank torsion Galois systems and actual Hecke polynomial factorization, prove the length obstruction of CSnc Theorem 2.8.7".
- **PA uses the theorem.** ACC+ Theorems 2.3.5 and 2.3.7 (printed pp. 937–939) are proved "From [Sch15, Cor. 5.4.3]" and by "This follows from [Sch15, Cor. 5.4.4]". Theorem 2.3.5 has its own condition on S and cites Remark 5.4.6 for unconditionality. The PotentialAutomorphyInfrastructure source matrix row "§2.3; §3" names AutomorphicGaloisRepresentationsPartII, PadicHodgeTheory and IntegralHeckeAndGaloisDeterminants, but no TC stage.
- **Graph:**
  - Assembled edges: TC.4 → IG.6, IHG.4 → IG.6, ALS.4 → IG.6, TC.3 → PA.0 and ALS.4 → PA.0.
  - No stage states Theorem 5.3.1 or 5.4.1.
- **New since the red team.** PAPER-SCHOLZE-15 was extracted on 29 September 2026 (#4563) and has no review yet.
  - It marks Theorem 5.4.1 (item 109) as planned by "TC.2–TC.4 with IHG.5's nilpotent descent". Its note reads TC.4's contract as that assembly and the README's purpose sentence as a scope statement. It likewise plans Theorem 5.3.1 (item 99) at TC.3/IHG.5, and Corollaries 5.4.3–5.4.4 and Remark 5.4.5 (items 111–113) at TC.4/IHG.
  - The verifier's confirmation and TC.4's own "no new terminal claim" sentence contradict that reading.
  - Those statuses are not in force until the extraction is reviewed.

### Fix

**1. `content/campaign/TorsionCohomologyInfrastructure/README.md`.**
- **Purpose.** Replace "The target is a reusable library underlying its argument, not an additional requirement to formalize its final Galois-representation theorem." with:
  > TC.0–TC.4 are a reusable library underlying its argument. TC.5 states and proves its final theorems for GL_n: the Galois determinants of Theorems 5.3.1 and 5.4.1, with Corollaries 5.4.3–5.4.4. IgusaVarietiesAndTorsionConcentration IG.6 and PotentialAutomorphyInfrastructure PA.0 consume them.
- **Source table.** Replace the row "| §5.4 | TC.4 below | Compatibility checks and reusable specialization infrastructure |" with:
  > | §5.4 | TC.4 and TC.5 below | Compatibility checks and reusable specialization infrastructure (TC.4); Theorem 5.4.1, Corollaries 5.4.3–5.4.4 and Remark 5.4.5 (TC.5). Corollary 5.4.2 is AutomorphicGaloisRepresentationsPartII AG2.4's theorem, proved there by the HLTT route |
- **New section TC.5**, inserted after TC.4 and before "## Completion criteria":

  > ### TC.5. Galois determinants for torsion in GL_n cohomology
  >
  > **Setting** (Scholze, Corollary 5.2.7, published p. 1045):
  > - F is totally real or CM, with totally real subfield F⁺, and n ≥ 1. Put d = [F:Q](n²+n)/2 if F is totally real, and d = [F⁺:Q]n² if F is CM.
  > - S is a finite set of finite places of F, stable under complex conjugation, containing the places above p and those ramified over F⁺.
  > - K = K_S K^S ⊂ GL_n(A_{F,f}) is compact open, with K^S = ∏_{v∉S} GL_n(O_{F_v}), and X_K is the locally symmetric space of GL_n/F.
  > - 𝕋_{F,S} = ⊗_{v∉S} Z_p[GL_n(F_v)//GL_n(O_{F_v})], and P_v(X) = 1 − q_v^{(n+1)/2}T_{1,v}X + ⋯ + (−1)^n q_v^{n(n+1)/2}T_{n,v}X^n.
  >
  > **Interior cohomology** (Theorem 5.3.1, p. 1046; arXiv v2 Theorem V.3.1). For K sufficiently small, let 𝕋_{F,S}(K, i, m) be the image of 𝕋_{F,S} in End(H^i_!(X_K, Z/p^m)). There is an ideal J with J^{4(d+1)} = 0 and a continuous n-dimensional determinant D of G_{F,S} with values in 𝕋_{F,S}(K, i, m)/J such that D(1 − X Frob_v) = P_v(X) for all v ∉ S. Assemble it from two inputs: Corollary 5.2.7, the (2n+1)- or 2n-dimensional determinant that TC.3 extracts from the symplectic or unitary boundary; and the factor separation of §5.3 (TC.3:factor-separation, as TC.3 instantiates it).
  >
  > **All of cohomology** (Theorem 5.4.1, p. 1058; arXiv v2 Theorem V.4.1). There is N = N([F:Q], n) with the following property, for every K = K_S K^S as above, every algebraic representation ξ and all integers i, m ≥ 0. Let 𝕋_{F,S}(K, ξ, i, m) be the image of 𝕋_{F,S} in End_{Z_p/p^m}(H^i(X_K, M_{ξ,K}/p^m)). Then there are an ideal I with I^N = 0 and a continuous n-dimensional determinant D of G_{F,S}, valued in 𝕋_{F,S}(K, ξ, i, m)/I, with D(1 − X Frob_v) = P_v(X) for all v ∉ S. Prove it as the source does (pp. 1058–1059):
  > - **Level descent.** Take a normal, sufficiently small K′ ⊂ K on which M_{ξ,K′}/p^m is trivial. The Hochschild–Serre spectral sequence H^a(K/K′, H^b(X_{K′}, M_{ξ,K′}/p^m)) ⇒ H^{a+b}(X_K, M_{ξ,K}/p^m) reduces the theorem to K sufficiently small and ξ trivial. Here M_{ξ,K} is the finite free Z_p-local system of ξ, extended over Z_p.
  > - **Boundary induction.** The Borel–Serre sequence H^i_c(X_K) → H^i(X_K) → H^i(X^BS_K ∖ X_K) comes from ArithmeticLocallySymmetricSpaces ALS.4. It expresses the boundary through the locally symmetric spaces of GL_{n′}/F with n′ < n. Induction on n gives determinants on the boundary image algebra, modulo a nilpotent ideal of exponent bounded by [F:Q] and n. This is the GL_n boundary induction, which TC.3's symplectic/unitary parabolics do not cover.
  > - **Interior part.** Apply the interior theorem above to the image algebra of H^i_c → H^i.
  > - **Gluing.** The kernel of 𝕋 → 𝕋_! × 𝕋_∂ has square zero. So the kernel I of 𝕋 → 𝕋_!/I_! × 𝕋_∂/I_∂ is nilpotent, of bounded exponent. The determinant descends to 𝕋/I (Chenevier, Corollary 1.14; IntegralHeckeAndGaloisDeterminants IHG.0–IHG.1 and IHG.5).
  >
  > N does not depend on K, ξ, i or m, and this uniformity is what allows the limit over m (footnote 29, p. 1060).
  >
  > **Corollaries:**
  > - Corollary 5.4.3 (p. 1060): every mod p Hecke eigensystem ψ in H^i(X_K, M_{ξ,K} ⊗ F̄_p) has a continuous semisimple σ_ψ with the stated Frobenius characteristic polynomials.
  > - Corollary 5.4.4 (p. 1060): if σ_ψ is irreducible, there are an ideal I with I^N = 0 and a unique σ_m: G_{F,S} → GL_n(𝕋_{F,S}(K, ξ, i)_m/I) (Chenevier, Theorem 2.22(i)).
  > - Remark 5.4.5 (p. 1061): the same holds for the image in ⊕_m, or ⊕_{i,m}, of End(H^i(X_K, M_{ξ,K}/p^m)). This proves the existence part of Calegari–Geraghty's Conjecture B modulo a nilpotent ideal, not the local properties conjectured there.
  >
  > Corollary 5.4.2 (characteristic zero) stays with AutomorphicGaloisRepresentationsPartII AG2.4; TC.5 does not reprove it.
  >
  > **Branches.** Everything above inherits the status of Corollary 5.2.7; see "Coefficients and conventions" and Remark 5.4.6 (p. 1061).
  > - It is unconditional when (i) F is CM and contains an imaginary-quadratic field, and (ii) S is the pullback of a finite set of places of Q that contains p and every place at which F/Q ramifies.
  > - Otherwise state it with Mok's classification (F CM) or Arthur's (F totally real) as an explicit hypothesis, imported from ModularityAndLanglandsExtensions ML.4.
  >
  > **Inputs.** TC.4; ArithmeticLocallySymmetricSpaces ALS.4; IntegralHeckeAndGaloisDeterminants IHG.4 and IHG.5; ModularityAndLanglandsExtensions ML.4 (for the conditional branches only).
  >
  > **Consumers.** IgusaVarietiesAndTorsionConcentration IG.6; PotentialAutomorphyInfrastructure PA.0, where ACC+ Theorems 2.3.5 and 2.3.7 are this theorem's Corollaries 5.4.3 and 5.4.4 under ACC+'s condition on S.
  >
  > **Acceptance:**
  > - n = 1 against class field theory, and n = 2 over Q against TC.4's modular-curve normalization;
  > - a genuinely torsion class, whose determinant exists although no characteristic-zero lift does;
  > - the independence of N from m.

- **"Implementation handoff".** Replace "**Stages:** TC.0, TC.1, TC.2, TC.3, TC.4." with "**Stages:** TC.0, TC.1, TC.2, TC.3:factor-separation, TC.3, TC.4, TC.5." (TC.3:factor-separation comes from /26 below.)

**2. `data/atlas.json`.**
- Add the stage record `TorsionCohomologyInfrastructure:TC.5`: owner `TorsionCohomologyInfrastructure`, key `TC.5`, title "Galois determinants for torsion in GL_n cohomology", `parentStageId` null.
  - Its `requires`: `TorsionCohomologyInfrastructure:TC.4`, `ArithmeticLocallySymmetricSpaces:ALS.4`, `IntegralHeckeAndGaloisDeterminants:IHG.4`, `IntegralHeckeAndGaloisDeterminants:IHG.5`, and optionally `ModularityAndLanglandsExtensions:ML.4`. Use ML.4:classical-arthur instead once the sub-stages proposed in `RT-AREA-langlands-3.fixes.md` are applied.
  - Its `consumers`: `IgusaVarietiesAndTorsionConcentration:IG.6` and `PotentialAutomorphyInfrastructure:PA.0`.
- Add TC.5 to the `requires` of IG.6 and PA.0, and to the `consumers` of its inputs. Add the matching `stageEdges` records.
- IG.6 keeps TC.4 → IG.6 for the four-route comparison.

**3. `content/campaign/IgusaVarietiesAndTorsionConcentration/README.md`.**
- **Scope.** Replace "TorsionCohomologyInfrastructure and IntegralHeckeAndGaloisDeterminants supply existing lower-rank torsion systems and determinant comparison for the boundary induction." with:
  > TorsionCohomologyInfrastructure TC.5 supplies the lower-rank torsion Galois determinants (Scholze, Theorem 5.4.1 and Corollaries 5.4.3–5.4.4). TC.4 and IntegralHeckeAndGaloisDeterminants supply the determinant comparison for the boundary induction.
- **IG.6.** Replace "Using lower-rank torsion Galois systems and actual Hecke polynomial factorization" with "Using the lower-rank torsion Galois determinants of TorsionCohomologyInfrastructure TC.5 and actual Hecke polynomial factorization".

**4. `content/campaign/PotentialAutomorphyInfrastructure/README.md`, source matrix.** Replace the row "| §2.3; §3 | AutomorphicGaloisRepresentationsPartII; PadicHodgeTheory; IntegralHeckeAndGaloisDeterminants | Characteristic-zero Galois systems, exact Weil–Deligne compatibility packages and integral interpolation |" with:

> | §2.3; §3 | AutomorphicGaloisRepresentationsPartII; PadicHodgeTheory; IntegralHeckeAndGaloisDeterminants; TorsionCohomologyInfrastructure TC.5 | Characteristic-zero Galois systems, exact Weil–Deligne compatibility packages and integral interpolation; the torsion Galois representations of §2.3.4 (Theorems 2.3.5 and 2.3.7, from Scholze's Corollaries 5.4.3–5.4.4 under ACC+'s condition on S) |

**5. `content/campaign/CompletedCohomologyPartII/README.md`, CC.8.** Replace "automorphic-section comparisons, torsion Galois determinants, vanishing, and Banach local–global compatibility remain respectively TC/IHG/IG/R31 theorems" with:

> the automorphic-section comparisons and the torsion Galois determinants are TorsionCohomologyInfrastructure theorems (TC.1–TC.2 and TC.5, the latter on the determinant algebra of IntegralHeckeAndGaloisDeterminants IHG.0–IHG.5); vanishing and Banach local–global compatibility remain IG and R31 theorems

**6. PAPER-SCHOLZE-15, at its review.** Once TC.5 exists, `planned` may name it (check_paper.py accepts only atlas layers).
- Items 3, 99, 109, 111, 112, 113 and 114 should name TC.5 as the owner of the statement.
- Item 109's note should drop the reading of TC.4 as the assembly.
- Route 5's reason should read "Theorem 5.4.1 with its corollaries (TC.5)" for "(TC.4)".

**Cycle test.** TC.5's consumers, IG.6 and PA.0, reach none of its inputs (TC.4, ALS.4, IHG.4, IHG.5 and ML.4). This holds jointly with the edges of /18, /20 and /26, so the new stage is acyclic.

**When:** now (edits 1–5); review (edit 6).

## /10 (medium, missing): Kottwitz's Tamagawa formula becomes an explicit ET.4 target

### What the verifier corrected
- **The omitted proof contract for the coefficients is confirmed.** AA.2 excludes computing every Tamagawa number, not every computation: it supplies the measure. ET.4 only names "Tamagawa/kernel coefficients".
- **Where Shin uses it** (Stable trace formula for Igusa varieties):
  - §1.2, display (1.2), PDF 4, invokes Kottwitz's formula;
  - §5.1 uses it to change the counting coefficient;
  - §7 defines ι(G, H) from Tamagawa numbers and the outer-automorphism factor.
- **Repair.** Make the source-qualified formula and its simply connected input explicit ET.4 obligations, for the groups, endoscopic groups and centralizers actually used, with ET.0's cohomology and AA.2's measure conventions.
  - Do not state it for arbitrary groups or all global fields, and do not drop hypotheses, component factors or the specific ker^1 convention.
  - ET.5 reuses the computation. No new owner, and no AA → ET → AA loop.
- The verification does not claim an extraction of Kottwitz's 1988 proof or of the simply connected theorem.

### What main says now
- **ET.4:** "Starting from AS.6, construct the stable elliptic distributions, Tamagawa/kernel coefficients and endoscopic regrouping of rational conjugacy classes."
- **ET.5:** "Sum the local calculations with the global product formula to prove the stable Igusa identity, including ker^1 and iota(G,H) factors."
- **AA.2:** "Computing every Tamagawa number is outside this scope."
- **Graph.** ET.0 → ET.1 → ET.3 → ET.4 and AA.2 → ET.1 already exist.
- **Shin, StableIgusa.pdf**, read 29 September 2026 (https://math.berkeley.edu/~swshin/StableIgusa.pdf, sha256 e74cbbe4…):
  - PDF 4, display (1.2): "τ(G) = |π_0(Z(Ĝ)^{Gal(Q̄/Q)})|/|ker^1(Q, G)|", citing [Kot88, p. 629];
  - PDF 26 (§7): ι(G, H) := τ(G)τ(H)^{-1}|Out_Q(H, s, η)|^{-1}.

### Fix
**1. ET.4.** After "Starting from AS.6, construct the stable elliptic distributions, Tamagawa/kernel coefficients and endoscopic regrouping of rational conjugacy classes." add:

> The coefficients use Kottwitz's formula for Tamagawa numbers (Ann. of Math. 127 (1988)) in the form Shin uses (Stable trace formula for Igusa varieties, display (1.2)): τ(G) = |π_0(Z(Ĝ)^Γ)| / |ker^1(Q, G)|. The formula is also written with ker^1(F, Z(Ĝ)), which has the same order as ker^1(F, G) by Kottwitz's duality of these finite groups (Kottwitz 1984, §4.2); ET.0's ker^1 machinery supplies that duality. Prove the formula for the groups actually used:
> - the unitary similitude groups;
> - their elliptic endoscopic groups H;
> - the inner forms I_0 of centralizers.
>
> The inputs are:
> - Weil's conjecture τ(G_sc) = 1 for the simply connected groups that occur, which are special unitary groups and their inner forms, all of type A. Kottwitz 1988 proves it for groups without E_8 factors.
> - ET.0's Tate–Nakayama and ker^1 computations.
> - AA.2's Tamagawa measures, with their convergence-factor convention.
>
> Define ι(G, H) = τ(G)τ(H)^{-1}|Out(H, s, η)|^{-1} as in Shin §7. The formula is not stated here for other groups or other global fields.

**2. ET.5.** The old text "including ker^1 and iota(G,H) factors." becomes "including the ker^1 and ι(G, H) factors, with the Tamagawa numbers computed in ET.4 (not again here)."

No edge changes.

**When:** now.

## /12 (medium, duplicate): ET.2b imports Bun_G and the affine Grassmannian; ET.3 imports the adeles

### What the verifier corrected
- **The open ownership handoff left by accepted RS-22 is confirmed.** It concerns GlobalShtukasAndFunctionFieldLanglands:GS.0 and GS.1, not the Fargues–Fontaine geometry of GeometricSatakeAndFusion.
  - GS.0 constructs global Bun_G and its adelic description, qualified by torsor class.
  - GS.1 constructs the classical Beilinson–Drinfeld Grassmannian.
- **Repair.** ET.2b imports those objects and keeps its Higgs, Hitchin, regular-centralizer/Picard and affine-Springer constructions. Add:
  - GS.0 and the geometric prefix of GS.1, with model, characteristic and coefficient comparisons;
  - FA.2's adelic input to ET.3. GS.0 already imports FA.6 for the group quotient.
- **Prefer a prefix.** The full GS.1 → ET.2b edge is acyclic but imports GS.1's later Satake theorem needlessly. Use a prefix and a precise request, not an unlinked prose remark that the Grassmannian is a fibre.
- No change to upstream objects is warranted, and no duplicate Bun_G construction.

### What main says now
- **ET.2b** (`content/campaign/EndoscopicTransferAndUnitaryTraceComparison/README.md`) says "Construct the stack of G-bundles, Higgs fields twisted by a chosen sufficiently positive divisor, …" and "Construct equal-characteristic affine Grassmannians and affine Springer fibers, …". Its assembled prerequisites are R09.4, ET.2a:pure-decomposition and EDC.7.
- **GS.0** (`content/campaign/GlobalShtukasAndFunctionFieldLanglands/README.md`) constructs Bun_G, levels and the "adelic description of rational points in the appropriate torsor classes", and requires FA.6. **GS.1** constructs "the Beilinson--Drinfeld Grassmannian over powers of C, bounded Hecke stacks, convolution and collision/factorization maps" and then proves classical geometric Satake. Its inputs are GS.0 and EDC.5.
- **RS-22.md** (line 61) records: "ET.2b also requests ordinary global G-bundle and affine-Grassmannian geometry. It should reuse the matching GS.0/GS.1 geometric constructions … identify the precise geometry prefix in the cross-family blueprint before requiring the whole GS.1 Satake stage."
- **ET.3** has no FunctionFieldArithmetic or GlobalShtukas ancestor.

### Fix
**1. New sub-stage** `GlobalShtukasAndFunctionFieldLanglands:GS.1:grassmannian`, "Beilinson–Drinfeld Grassmannians and bounded Hecke stacks".
- A component sub-stage: `parentStageId` `GlobalShtukasAndFunctionFieldLanglands:GS.1`, which requires it.
- Requires: `GS.0`. Consumed by: `GS.1` and `EndoscopicTransferAndUnitaryTraceComparison:ET.2b`.
- Description:

  > Construct the Beilinson–Drinfeld Grassmannian over powers of C, and its fibres at closed points, which are the equal-characteristic affine Grassmannians with their loop-group description. Construct bounded Hecke stacks, convolution and collision/factorization maps. Prove representability, ind-properness and finite type of the bounded pieces. Record the model and characteristic hypotheses: the split constant group, and smooth models with nonsplit descent data. No perverse sheaf and no Satake statement enters; GS.1 keeps geometric Satake and its normalizations.
- GS.1's text "Construct the Beilinson--Drinfeld Grassmannian over powers of C, bounded Hecke stacks, convolution and collision/factorization maps." becomes "Import the Beilinson--Drinfeld Grassmannian, bounded Hecke stacks, convolution and collision/factorization maps from GS.1:grassmannian."
- GS.1's **Inputs** line gains `GlobalShtukasAndFunctionFieldLanglands:GS.1:grassmannian`.

**2. ET.2b.**
- The old text "Construct the stack of G-bundles, Higgs fields twisted by a chosen sufficiently positive divisor, the Hitchin base/map, cameral/spectral covers and the Picard stack acting on Hitchin fibers." becomes:

  > Import the stack of G-bundles, with its bounded finite-type opens, from GlobalShtukasAndFunctionFieldLanglands:GS.0, for the group scheme of ET.2b's good-characteristic range. Construct Higgs fields twisted by a chosen sufficiently positive divisor, the Hitchin base/map, cameral/spectral covers and the Picard stack acting on Hitchin fibers.
- The old text "Construct equal-characteristic affine Grassmannians and affine Springer fibers, their Picard actions, component lattices and finite-type quotients." becomes:

  > Import the equal-characteristic affine Grassmannian as the fibre of GS.1:grassmannian at a closed point, with its loop-group description. Construct affine Springer fibers, their Picard actions, component lattices and finite-type quotients.

**3. ET.3.** After its first paragraph add:

> Function-field adeles, the product formula and the idele class group come from FunctionFieldArithmetic:FA.2, and the adelic description of Bun_G's points from GS.0 (which imports FA.6). The globalization of prescribed local data uses them; ET.3 does not rebuild them.

**4. Stage edges** `GlobalShtukasAndFunctionFieldLanglands:GS.0 → ET.2b`, `GS.1:grassmannian → ET.2b`, `GS.0 → GS.1:grassmannian`, `GS.1:grassmannian → GS.1` and `FunctionFieldArithmetic:FA.2 → ET.3`.
- **Cycle test.** ET.2b reaches neither GS.0 nor FA.2, and ET.3 does not reach FA.2. The joint test with /1 and /15 finds no cycle.

**5. For the next restructuring pass** (a note, not an edit): record the owner pair GS.0 / ET.2b for Bun_G and GS.1:grassmannian / ET.2b for the affine Grassmannian. RS-22 left these as an external integration boundary.

**When:** now.

## /13 (medium, error): ET.5 stops calling the twisted fundamental lemma unproved; ET.3 keeps the nonstandard lemma

### What the verifier corrected
- **The wording is confirmed misleading, with a narrower repair.** Ngô (PMIHES 111, §1.12.7, p. 25) records Waldspurger's implication from the ordinary and nonstandard fundamental lemmas to the twisted lemma. Lemaire–Mœglin–Waldspurger (arXiv:1506.03383) state the unit-element theorem and extend it to all of the spherical Hecke algebra.
- **So ET.5 should say its route avoids that theorem,** not that the spherical twisted theorem is unproved. No unrestricted weighted or twisted theorem follows.
- **ET.3's caution against smuggling a general twisted or weighted theorem is sound.** Keep its explicit nonstandard target.
- If a consumer needs the twisted spherical result, add the source-qualified reduction and its coefficient and normalization contract. Do not drop the nonstandard theorem merely because no present edge names its consumer.

### What main says now
- **ET.5:** "The ordinary Igusa stabilization route explicitly avoids an unproved general twisted fundamental lemma."
- **ET.3:** "Prove both the ordinary and the nonstandard variant actually needed in Waldspurger's reduction, with their root-data isogeny conditions." Later: "a general twisted or weighted fundamental lemma is not smuggled into the ordinary theorem."
- **Lemaire–Mœglin–Waldspurger** (arXiv:1506.03383v1), abstract read 29 September 2026: the twisted fundamental lemma, "now proved for the unit elements in the spherical Hecke algebras, implies the fundamental lemma for all elements of these Hecke algebras".

### Fix
**1. ET.5.** The old text "The ordinary Igusa stabilization route explicitly avoids an unproved general twisted fundamental lemma." becomes:

> The ordinary Igusa stabilization route does not invoke the twisted fundamental lemma. For unit elements that lemma follows from the ordinary and nonstandard lemmas by Waldspurger's reduction (Ngô, PMIHES 111, §1.12.7), and Lemaire–Mœglin–Waldspurger (Ann. Sci. ENS 51 (2018)) extend it to the whole spherical Hecke algebra. Neither is imported here, and no weighted twisted lemma, or version with other coefficients, is asserted.

**2. ET.3.** The old text "Prove both the ordinary and the nonstandard variant actually needed in Waldspurger's reduction, with their root-data isogeny conditions." becomes:

> Prove both the ordinary and the nonstandard variant, with their root-data isogeny conditions. The nonstandard lemma is the input that Waldspurger's reduction combines with the ordinary one to give the twisted fundamental lemma for unit elements (Ngô, PMIHES 111, §1.12.7). No ET stage consumes the twisted lemma now. A consumer that needs it adds that reduction, and Lemaire–Mœglin–Waldspurger for the whole spherical Hecke algebra, with their coefficient, characteristic and normalization hypotheses.

The later caution ("a general twisted or weighted fundamental lemma is not smuggled into the ordinary theorem") stays.

**When:** now.

## /14 (medium, error): ET.1 adds Kottwitz–Shelstad's 2012 correction of twisted transfer factors

### What the verifier corrected
- **The missing correction and normalization comparison is confirmed.** This does not prove that an implemented factor already carries the error. Kottwitz–Shelstad (arXiv:1201.5658v1):
  - §2.2 defines the twisted splitting invariant;
  - §3.5 (pp. 9–10) compares the new Δ_I;
  - §§4–5 (pp. 10–13) explain the inconsistent Langlands pairing and χ-data normalization of the old construction.
- **Repair.** Cite the correction in ET.1, expose the corrected factors, and carry the chosen reciprocity and Whittaker conventions into ET.4 and ET.6/ET.7a.
- **The suggested test is wrong.** Δ′ and Δ_D do not in general differ by a universal sign: the source uses inverse χ-data, inverse pairings and the corresponding contragredient normalization. For the nonreduced restricted-root modification, test Proposition 3.5.2's product of quadratic characters evaluated at 2, in its characteristic-zero scope, on an odd-dimensional GL with transpose-inverse. Cyclic base change does not exhibit that modification.
- **Tests must check the actual identities,** including independence of χ-data. §§5.4–5.5 (pp. 14–15) carry the inverse-pairing corrections into stabilization and keep ε_L(V, ψ), not its inverse, in both Whittaker-normalized variants.

### What main says now
- **ET.1** builds the factors "from a-data, chi-data, splittings and the cohomological pairings" and asks to "Record which Frobenius/reciprocity normalization and Whittaker normalization is used". Its sources are Langlands–Shelstad §§3–6 and "Kottwitz–Shelstad transfer-factor chapters" (the 1999 Astérisque). The 2012 correction is not cited.
- **ET.0 and ET.4** build twisted matching and a twisted comparison.
- **Kottwitz–Shelstad 1201.5658v1**, read 29 September 2026 (https://arxiv.org/pdf/1201.5658v1, sha256 eaa0a8ab…):
  - §1 says the modification is needed for transpose-inverse on GL(2n + 1) and "never arises in the context of cyclic base change";
  - (1.0.3)–(1.0.4) define Δ_D := Δ_I^new Δ_II^{-1} Δ_III Δ_IV and Δ′ := (Δ_I^new Δ_III)^{-1} Δ_II Δ_IV;
  - Proposition 3.5.2 (PDF 9) gives Δ_I^new/Δ_I = Π_β sgn_{F_β/F_{±β}}(2).

### Fix
**1. ET.1.** After its first paragraph add:

> For twisted endoscopy use Kottwitz–Shelstad's correction, *On splitting invariants and sign conventions in endoscopic transfer* (arXiv:1201.5658), not the 1999 twisted factors as they stand.
> - Construct the twisted splitting invariant λ(T, θ) (§2) and the term Δ_I^new (§3).
> - Prove Proposition 3.5.2: Δ_I^new/Δ_I = Π_β sgn_{F_β/F_{±β}}(2), over representatives of the symmetric Γ-orbits of restricted roots of type R3 coming from H. Replacing Δ_I in this way has the effect of Waldspurger's modification of Δ_II.
> - Construct both corrected factors, Δ_D := Δ_I^new Δ_II^{-1} Δ_III Δ_IV and Δ′ := (Δ_I^new Δ_III)^{-1} Δ_II Δ_IV, and prove that each is independent of the χ-data. Δ′ is compatible with the classical Langlands correspondence, and Δ_D with the renormalized one of §4.
> - Carry the inverse χ-data and inverse pairings through the stabilization as in §§5.4–5.5. Keep ε_L(V, ψ), not its inverse, in both Whittaker-normalized variants.

Add "Kottwitz–Shelstad, On splitting invariants and sign conventions in endoscopic transfer (2012)" to ET.1's sources.

**2. ET.1 acceptance.** Add:

> Test the factor identities themselves:
> - independence of χ-data for Δ′ and for Δ_D;
> - for the nonreduced restricted-root modification, Proposition 3.5.2's product of quadratic characters evaluated at 2, in characteristic zero, for GL(2n + 1) with transpose-inverse θ.
>
> Cyclic base change does not exhibit that modification, and Δ′ and Δ_D are not related by a universal sign.

**3. ET.4.** After "Construct the cyclic-restriction-of-scalars twisted space and its invariant twisted trace identity from the same kernel/truncation machinery;" add:

> the twisted comparison states which corrected factor of ET.1 it uses (Δ′ or Δ_D) and the matching Langlands and Whittaker normalizations; ET.6 and ET.7a use the same choice.

**When:** now.

## /15 (medium, missing): a new early character stage SR.3b feeds ET.4, ET.4b and ET.6

### What the verifier corrected
- **The absent early p-adic character supplier is confirmed.** SR.3 covers admissibility and Bernstein theory, not the representability, local constancy and integrability of character distributions. ET.1's archimedean character theory is a different input.
- **Where Scholze uses it.** 1010.1540v1 p. 31 integrates the twisted character as a function, and ET.6's Jacquet–Langlands identity needs the regular-elliptic theory.
- **The proposed Part II is not a live supplier.** The HKW22 extraction's SmoothRepresentationsCharactersPartII is a routing candidate. Extend its early prefix to include the twisted theory and the Weyl integration statements.
- **Graph.** The route SR.3, ET.1 and RG2.0 → early character prefix → ET.4/ET.6 is acyclic.
- **Do not import the whole Part II upstream.** Its imports include SR.6, which is late excursion-dependent finiteness, so the early prefix must be separate from that late mathematics.
- The detailed Harish-Chandra and Clozel proof extraction remains the supplier's work.

### What main says now
- **SR.3** (`content/campaign/SmoothRepresentationsOfLocalGroups/README.md`) covers "finite-dimensionality of compact-open invariants …, finite length of parabolic induction …, smooth contragredient duality, matrix-coefficient criteria …, Bernstein decomposition and Bernstein center". No stage of SR.0–SR.6 has characters.
- **ET.6** defines Jacquet–Langlands by a "regular-elliptic character identity".
- **PAPER-HANSEN-KALETHA-WEINSTEIN-22**, route 3 (roadmap SmoothRepresentationsCharactersPartII, kind part-ii; its review verdict is accept), lists as final theorem (1) "Harish-Chandra's theorem that the trace distribution … is given on G(F)_sr by a locally constant character Θ_π". Under (3) it lists the stable Weyl integration formula. Its imports are "SmoothRepresentationsOfLocalGroups SR.0–SR.3 and SR.6 (parent); … ET.0–ET.1; … RG2.0".
- **PAPER-HANSEN-26**'s accepted route joins the same Part II.
- **Keys.** SR.3a ("Early uniform admissibility") exists; SR.3b is free.

### Fix
**1. New stage** `SmoothRepresentationsOfLocalGroups:SR.3b`, "Early character theory: Harish-Chandra and twisted characters".
- Requires: `SR.3`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1` and `ReductiveGroupsPartII:RG2.0`.
- Consumed by: `EndoscopicTransferAndUnitaryTraceComparison:ET.4`, `ET.4b` (/1) and `ET.6`.
- README section, after SR.3:

  > ### SR.3b. Early character theory: Harish-Chandra and twisted characters
  >
  > G is a connected reductive group over a p-adic field F of characteristic zero, and π a finite-length admissible representation.
  > - **Harish-Chandra's theorem.** The trace distribution f ↦ tr π(f) is given by a locally integrable function Θ_π, locally constant on the regular semisimple set G(F)_sr, and |D|^{1/2}Θ_π is locally bounded.
  > - **Clozel's twisted version.** For a finite-order automorphism θ and a θ-stable π with a chosen intertwiner, prove the same for the twisted character Θ_{π,θ} on the θ-regular set of G(F)⋊θ.
  > - **Weyl integration.** Prove the Weyl integration formula and its stable form, with the compatible measures on inner forms and tori (ET.1's quotient measures).
  > - **Elliptic relations.** Prove the elliptic character relations that state the Jacquet–Langlands identity used in ET.6.
  >
  > **Limits.** No trace Paley–Wiener theorem, no ℓ-adic lattice theory, and nothing from SR.6. Those stay in the proposed SmoothRepresentationsCharactersPartII.
  >
  > **Sources to register:** Harish-Chandra, *Admissible invariant distributions on reductive p-adic groups*; Clozel, *Characters of non-connected, reductive p-adic groups* (Canad. J. Math. 39 (1987)); HKW22 §3.4 for the stable Weyl integration formula.
  >
  > **Acceptance:** GL_2 (principal series, Steinberg, a supercuspidal); the units of a quaternion division algebra; the twisted character of a θ-stable principal series for a cyclic extension of degree 2.
- Stage edges: `SR.3 → SR.3b`, `ET.1 → SR.3b`, `RG2.0 → SR.3b`, `SR.3b → ET.4`, `SR.3b → ET.4b` and `SR.3b → ET.6`.
- **Cycle test.** None of ET.4, ET.4b or ET.6 reaches SR.3, ET.1 or RG2.0. The joint test with /1 and /12 finds no cycle.

**2. PAPER-HANSEN-KALETHA-WEINSTEIN-22.result.json, route 3, field `brief`.**
- Old: "Final theorems: (1) Harish-Chandra's theorem that the trace distribution of a finite-length admissible representation is given on G(F)_sr by a locally constant character Θ_π;"
- New: "Final theorems: (1) import SmoothRepresentationsOfLocalGroups:SR.3b's characters (Harish-Chandra's local constancy and integrability, Clozel's twisted characters, the stable Weyl integration formula) and build on them;"
- Old: "Imports: SmoothRepresentationsOfLocalGroups SR.0–SR.3 and SR.6 (parent);"
- New: "Imports: SmoothRepresentationsOfLocalGroups SR.0–SR.3, SR.3b and SR.6 (parent);"
- The route's kind and roadmap are unchanged, so the existing accept verdict still describes it; the maintainer may record a fresh verdict.

**3. ET.6.** In its Jacquet–Langlands paragraph, "including its regular-elliptic character identity and sign" becomes "including its regular-elliptic character identity and sign, stated with SR.3b's characters".

**When:** now. The brief edit is a route correction for the maintainer.

## /16 (medium, error): register the July 2026 preprint and plan its theorem as a terminal successor AG2.8

### What the verifier corrected
- **A new source was omitted.** HLTT itself is not misdescribed. arXiv:2607.11763v1 Theorem 1.2.1 and Corollary 1.2.2 (pp. 5–6) give, for cuspidal regular algebraic π of GL_n over a CM field:
  - de Rham at every v | p with the stated labelled Hodge–Tate weights;
  - WD^ss = rec^T(π_v)^ss;
  - the Frobenius-semisimplified bound ≺.

  They do not give full equality of monodromy or crystalline behaviour at every place.
- **AG2.6's sentence is right for the old construction,** but no target takes the new theorem.
- **The repair.** Route the v1 preprint for extraction and to a source-qualified successor to AG2, keeping its preprint status and proof obligations. Update AG2.7's package only for the actual new conclusions.
- **The proof** (overview, p. 6) replaces generic torsion vanishing by quantitative Hecke annihilation and uses Koshikawa's local-Shimura/Mantovan route. Its pseudodeformation and degree-shifting proofs still need full decomposition.
- **Do not overstate.** This is not evidence that the old partial packet had read the paper, and not an unrestricted local–global equality.

### What main says now
- **AG2.6** (`content/campaign/AutomorphicGaloisRepresentationsPartII/README.md`): "In particular, the basic nonselfdual HLTT construction does not by itself supply de Rham/crystalline or full local–global compatibility at every coefficient-prime place; the later Fontaine–Laffaille/ordinary arithmetic comparisons in PotentialAutomorphyInfrastructure remain separate consumers with their hypotheses."
- **AG2.7**: "Export separate typed packages: good-prime characteristic-zero GL_n systems; polarized systems with Hodge and Weil–Deligne comparison; unitary discrete-parameter sums; and lattice/residual polynomial comparison."
- **Decomposition and packet.**
  - The integrated decomposition `data/decompositions/AutomorphicGaloisRepresentationsPartII.json` has the node AG2.6/coefficient-prime-branch-and-what-it-does-not-give ("Nothing in the sources read supplies de Rham, crystalline or full local-global compatibility at places above p in the non-self-dual branch").
  - It also has the gap "The partial order on Weil-Deligne representations is used but not defined in any source read"; its Varma source is arXiv:1411.2520v1 (2014).
  - The unreviewed packet `research/blueprint/packets/AutomorphicGaloisRepresentationsPartII--AG2.6.json` carries the same node.
- **The paper is not registered.** No file outside the red-team and review records mentions arXiv:2607.11763, and research/blueprint/papers/papers.json has no entry for it.
- **Why a successor, not an input to AG2.6 or AG2.7.** AG2.7 → PotentialAutomorphyInfrastructure:PA.0 exists, and AG2.7 reaches PA.1, PA.2 and PA.3 (checked). The preprint's degree shifting builds on ACC+'s (PA.1–PA.2). So any stage that imports it must not feed AG2.6 or AG2.7.

  The same constraint already applies to the AG2.6 packet's request of PA.1 (node very-weak-compatibility-under-dgi): AG2.6 reaches PA.1, so that request cannot become an edge into AG2.6.
- **Sources read for this fix** (29 September 2026): A'Campo, Hevesi, Thorne, Whitmore, "Local-global compatibility of automorphic Galois representations over CM fields at p", arXiv:2607.11763v1 (13 July 2026), 117 pages, SHA-256 a5a56b7917c387b24f717e31714675d2de183505250bbd3a3fae21bd1fa424bb.
  - Theorem 1.2.1, p. 5, and Corollary 1.2.2, p. 6; the proof sketch §§1.2.3–1.2.5, pp. 6–7.
  - §2.4, "Mantovan's product formula", p. 18: for "the quasisplit unitary similitude group G attached to an integer n ≥ 2", in "the version proved in [HL25]" (Hamann–Lee, "Torsion vanishing for some Shimura varieties", 2025), following [Kos21].
  - §3, potentially semistable pseudodeformation rings ([WE15], [WWE19], [Che14]).
  - §5.4, the degree-shifting argument.
  - p. 6: the relation ≺ is "defined in [Var24, §8]", Varma, Forum Math. Sigma 12 (2024), e21 (doi:10.1017/fms.2024.7; its section list, read the same day, has §8 "Bounding the monodromy"). ACHTW recalls the definition in its §6 (p. 111).

### Fix
**1. Paper registry.** Maintainer's entry in `research/blueprint/papers/papers.json`, `papers` (the batch number is the maintainer's):
```json
{"id": "PAPER-ACAMPO-HEVESI-THORNE-ETAL-26", "short": "A'Campo–Hevesi–Thorne–Whitmore (2026): Local-global compatibility of automorphic Galois representations over CM fields at p", "citation": "L. A'Campo, B. Hevesi, J. A. Thorne, D. Whitmore, \"Local-global compatibility of automorphic Galois representations over CM fields at p\", arXiv:2607.11763v1 (13 July 2026), preprint", "link": "https://arxiv.org/abs/2607.11763", "note": "Semisimplified local-global compatibility at p for cuspidal regular algebraic GL_n over CM fields; v1, unrefereed. Routes to AutomorphicGaloisRepresentationsPartII AG2.8."}
```

**2. New terminal stage AG2.8**, in the AG2 README after AG2.7 and before "## Source and acceptance register":

> <a id="ag2-8"></a>
> ## AG2.8. Coefficient-prime comparison for the non-self-dual branch over CM fields (preprint)
>
> **Construct and export.** For F a CM field, n ≥ 1 and π cuspidal regular algebraic of weight λ on GL_n(A_F), and every v | p:
> - r_{π,ι}|G_{F_v} is de Rham with HT_τ = {λ_{ιτ,1} + (n−1), …, λ_{ιτ,n}};
> - WD(r_{π,ι}|G_{F_v})^ss ≅ ι^{−1} rec^T_{F_v}(π_v)^ss (Theorem 1.2.1);
> - WD(r_{π,ι}|G_{F_v})^{F-ss} ≺ ι^{−1} rec^T_{F_v}(π_v), for Varma's relation (Varma, Forum Math. Sigma 12 (2024), §8) (Corollary 1.2.2).
>
> Source: A'Campo–Hevesi–Thorne–Whitmore, arXiv:2607.11763v1 (13 July 2026). Status: preprint v1, unrefereed; record the version read.
>
> **Not claimed.** Neither full equality of monodromy nor crystallinity at any place is claimed. Only the semisimplified comparison and the monodromy bound are exported.
>
> **Proof obligations, named by roadmap until the extraction fixes the exact stages.**
> - Quantitative Hecke annihilation of the cohomology below the middle degree for U(n, n) (their Theorem 2.5.7). It goes through Mantovan's product formula in Hamann–Lee's form for the quasi-split unitary similitude datum, with Fargues–Scholze local Shimura varieties following Koshikawa (their §2.4). The owners are IgusaVarietiesAndTorsionConcentration IG.0–IG.2 (perfect Igusa varieties and partial minimal compactifications), HeckeStacksAndLocalShtukas and ExcursionOperatorsAndSpectralAction. This product formula is not Shin's compact-datum formula AG2.1b:mantovan; do not merge them.
> - Potentially semistable pseudodeformation spaces with p-adic Hodge conditions, without residual hypotheses (§3). The owners are IntegralHeckeAndGaloisDeterminants and LocalGaloisDeformationRings.
> - The degree-shifting induction on n without the non-Eisenstein hypothesis (§5), with type theory for GL_n(F_v) (§4). The owners are PotentialAutomorphyInfrastructure PA.1–PA.2, ArithmeticLocallySymmetricSpaces and SmoothRepresentationsOfLocalGroups.
>
> **Inputs.** AG2.4, AG2.5, AG2.6 and the owners above. **Consumers.** None yet. AG2.8 does not feed AG2.6 or AG2.7: its degree-shifting input comes from PotentialAutomorphyInfrastructure, which AG2.7 reaches.

- **Stage record:** key `AG2.8`, title "Coefficient-prime comparison for the non-self-dual branch over CM fields (preprint)".
- **Edges:** AG2.4 → AG2.8, AG2.5 → AG2.8, AG2.6 → AG2.8. The further input edges are fixed when the extraction's routes are reviewed. AG2.8 has no consumer, so no input edge can close a cycle.

**3. AG2.6.** Replace "In particular, the basic nonselfdual HLTT construction does not by itself supply de Rham/crystalline or full local–global compatibility at every coefficient-prime place;" with:
> In particular, the basic nonselfdual HLTT construction does not by itself supply de Rham/crystalline or full local–global compatibility at every coefficient-prime place. The later preprint arXiv:2607.11763v1 proves de Rham at every v | p with the expected Hodge–Tate weights, the semisimplified comparison with rec^T and Varma's monodromy bound; it is planned as the successor AG2.8, not as an input here;

**4. AG2.7.** After "Export separate typed packages: good-prime characteristic-zero GL_n systems; polarized systems with Hodge and Weil–Deligne comparison; unitary discrete-parameter sums; and lattice/residual polynomial comparison.", add:
> The nonselfdual coefficient-prime clause — de Rham at v | p with the expected Hodge–Tate weights, WD^ss = rec^T(π_v)^ss and the bound ≺ — is exported by AG2.8, not by this package. Consumers that need it import AG2.8 directly.

**5. Decomposition and packet** (the next blueprint job for AG2.6, or the maintainer in the integrated decomposition).
- **The node** AG2.6/coefficient-prime-branch-and-what-it-does-not-give: keep its statement, which is about the sources it read, and add the hypothesis "A later source, arXiv:2607.11763v1 (preprint), supplies the semisimplified comparison and the monodromy bound at v | p; it is routed to AG2.8."
- **The gap** "The partial order on Weil-Deligne representations is used but not defined in any source read": add to its detail "Varma's published version (Forum Math. Sigma 12 (2024), e21, §8 'Bounding the monodromy') defines the relation, as arXiv:2607.11763v1 p. 6 records; that version supersedes the 2014 arXiv v1 read here."

**6. The paper route.** The extraction job decides its items' routes. A route to AG2.8 needs its own review verdict before the queue applies it.

**When:** now (registry entry, AG2.8 record, README sentences); verdict for the extraction's routes; blueprint for the decomposition and packet notes.

## /17 (medium, missing): IHG.1 exports Brauer–Nesbitt, and R01.1 imports it

### What the verifier corrected
- **The missing supplier.** R01.1 has no prerequisites, yet it uses characteristic-p Brauer–Nesbitt. IHG.1 already owns determinant reconstruction.
- **Library.** The accepted AUDIT-31 separates characteristic-zero character recognition from this result. Fresh searches of both pinned trees found no Brauer–Nesbitt declaration.
- **The algebraically closed case.** Chenevier v2 Theorem 2.12 (p. 28) gives uniqueness of a semisimple representation from its determinant over an algebraically closed field.
- **The fix.** Add IHG.1 → R01.1, which has no reverse path. Export the finite-residue-field version explicitly:
  - base extension from a perfect finite field preserves semisimplicity;
  - compare characteristic polynomials over the algebraic closure;
  - then descend the isomorphism (Noether–Deuring).
- **A separate statement.** Deligne–Serre Lemme 6.13 (printed p. 523, PDF p. 18) is the finite-field realizability argument, with its trivial-Brauer-group input.
- **Scope.** Neither result licenses trace-only recognition in small characteristic, or descent over arbitrary infinite fields.
- **Nodes still needed.** The finite-field descent and continuity proofs need nodes; an edge alone proves nothing.

### What main says now
- **R01.1** (`content/campaign/ArithmeticGaloisRepresentations/README.md`, line 28) says: "Define reduction followed by semisimplification and prove independence of lattice by characteristic polynomials and the characteristic-p Brauer–Nesbitt theorem."
  - Its dependencies line (line 30) is "the existing mathematical suppliers identified in the ownership section".
  - In the assembled graph R01.1 has no prerequisites and nineteen consumers.
- **IHG.1** (`content/campaign/IntegralHeckeAndGaloisDeterminants/README.md`, line 17) says "Prove reconstruction over algebraically closed fields up to semisimplification …". It exports no Brauer–Nesbitt statement.
  - Its only ancestors are IHG.0 and `UPSTREAM:Mathlib:CommutativeAlgebra`.
- **The accepted RepresentationTheory link map** (`research/blueprint/links/tauceti_TauCetiRoadmap_RepresentationTheory.json`) asks to "identify an actual characteristic-p Brauer–Nesbitt supplier for R01.1/R01.5; the family explicitly excludes modular representation theory proper."
- **The decomposition gap** "Brauer-Nesbitt in characteristic p is used but unread" (`data/decompositions/ArithmeticGaloisRepresentations.json`) says the sources cite Curtis–Reiner Theorem 30.16, "that book is not in the supplied library".
- **AUDIT-31** on R01.1 says: "no text or declaration mentions Brauer-Nesbitt and there is no semisimplification of a reduction."
- **The pinned trees.**
  - The declaration index has no "Nesbitt" and no "Deuring".
  - Mathlib's `Representation.char_iso` and `FDRep.char_iso` (Mathlib/RepresentationTheory/Character.lean:74, 181) state only that isomorphic representations have equal characters. AUDIT-31 records recognition by characters only for finite groups in characteristic zero.
- **A caution on the source.** Chenevier's own proof of the uniqueness clause of Theorem 2.12 (arXiv:0809.0415v2, p. 31) cites Brauer–Nesbitt: "As a semisimple representation is well known to be uniquely determined by its characteristic polynomials (Brauer-Nesbitt's theorem), this representation is unique up to isomorphism." So Theorem 2.12 cannot serve as the proof of Brauer–Nesbitt.

### Fix
1. **IHG.1 prose** (`content/campaign/IntegralHeckeAndGaloisDeterminants/README.md`, line 17). After "Develop reducibility ideals, extension modules and the lattice constructions used by congruence arguments.", add:

   > Export Brauer–Nesbitt for a group G:
   > - **Statement.** Two finite-dimensional semisimple representations of G over a field k that have the same characteristic polynomial for every g ∈ G are isomorphic. Export it for k algebraically closed and for k finite.
   > - **Group elements suffice.** The characteristic polynomials of group elements determine the determinant on k[G]: Amitsur's formula (Chenevier, arXiv:0809.0415v2, Lemma 1.12(ii) and (1.5), pp. 12–14) and Corollary 1.14 (p. 14).
   > - **Algebraically closed k.** For a semisimple ρ with det ∘ ρ = D, prove that ker ρ = ker D, because the image of ρ is a semisimple algebra and has no nonzero nil ideal. Then ρ is a module over R/ker D, and is determined by the multiplicities of Theorem 2.16 and Lemma 2.17 (pp. 31–32). The uniqueness clause of Theorem 2.12 (p. 28) is proved on p. 31 by citing Brauer–Nesbitt, so it is not a proof here.
   > - **Finite k.** Base change to an algebraic closure preserves semisimplicity because k is perfect. Compare there, and descend the isomorphism by the Noether–Deuring theorem.
   > - **Excluded.** Do not state trace-only recognition when char k ≤ dim. Do not claim that representations, as opposed to isomorphisms, descend over an infinite field.
   > - **Not this node.** Finite-field realizability of a representation over the field of its characteristic polynomials (Deligne–Serre, Lemme 6.13, printed p. 523) is R01.5's coefficient-descent theorem (RS-06), not this node.
2. **R01.1 prose** (line 28).
   - Old: "Define reduction followed by semisimplification and prove independence of lattice by characteristic polynomials and the characteristic-p Brauer–Nesbitt theorem."
   - New: "Define reduction followed by semisimplification and prove independence of lattice. For stable lattices L, L′ in a continuous representation over a finite extension of Q_ℓ, the characteristic polynomial of each g on L/ϖL and on L′/ϖL′ is the reduction of its characteristic polynomial on V, which has integral coefficients. So the two semisimplifications have the same characteristic polynomials, and they are isomorphic by the finite-field Brauer–Nesbitt theorem imported from IntegralHeckeAndGaloisDeterminants IHG.1. Compare characteristic polynomials, not traces."
3. **R01.1 dependencies** (line 30).
   - Old: "**Dependencies:** the existing mathematical suppliers identified in the ownership section."
   - New: "**Dependencies:** the existing mathematical suppliers identified in the ownership section; [IntegralHeckeAndGaloisDeterminants IHG.1](../IntegralHeckeAndGaloisDeterminants/README.md) for Brauer–Nesbitt over finite fields."
4. **Stage edge.** Add IHG.1 → R01.1 (`requires` of R01.1 and `stageEdges`).
   - The cycle test for IHG.1 → R01.1 finds no path R01.1 → … → IHG.1: acyclic.
   - IHG.1's only ancestors are IHG.0 and the Mathlib sentinel.
5. **Nodes** (blueprint jobs of the two roadmaps).
   - IHG.1: "Brauer–Nesbitt over algebraically closed and finite fields", with the proof route above.
   - R01.1: "Lattice independence of the semisimplified reduction". This node proves integrality of the characteristic polynomials from compactness, and reduction to a finite quotient for a continuous action on a finite module. It then applies the IHG.1 node.
6. **Decomposition gap** (maintainer's edit). In "Brauer-Nesbitt in characteristic p is used but unread", append: "Supplier identified: IntegralHeckeAndGaloisDeterminants IHG.1 exports the finite-field theorem (edge IHG.1 → R01.1). Its proof route uses Chenevier v2, Amitsur's formula and Corollary 1.14, Theorem 2.16 and Lemma 2.17, plus Noether–Deuring descent; Curtis–Reiner 30.16 is not needed."

**When:** now for the prose, the edge and the gap note; blueprint for the two nodes.

**Sources.**
- G. Chenevier, *The p-adic analytic space of pseudocharacters of a profinite group and pseudorepresentations over arbitrary rings*, arXiv:0809.0415v2, pp. 12–14, 28–34. Read 29 September 2026; SHA-256 f3c0e0d86e803301c617d3023d425752e30da46673ed5af932647eb284286953.
- P. Deligne and J.-P. Serre, *Formes modulaires de poids 1*, Ann. Sci. ENS 7 (1974), Lemme 6.13, printed p. 523. Numdam PDF (doi 10.24033/asens.1277), page 18, read 29 September 2026.

## /18 (medium, error): TC's unitary input is AG2.3's arbitrary regular polarized package

### What the verifier corrected
- **Why AG2.2 is not enough.** AG2.2 keeps the Shin-regularity restriction, and AG2.3 removes it. Scholze needs representations that are regular, not Shin-regular and not of finite slope at p: arXiv v2 Theorem V.1.4, footnote 2, p. 81 (published footnote 21, p. 1033).
- **What the edges supply.** The RS-24 edge AG2.2 → TC.4 does not supply that scope, and TC.3 has no AG2 input despite its arithmetic clause.
- **The fix.** Add the AG2.3 polarized package to TC.3 and use it in TC.4, which is then connected transitively.
- **Limits:**
  - Do not import the whole AG2.7 export: it includes AG2.4's nonselfdual construction, whose factor-separation algebra must stay independent of TC geometry (/26).
  - Clarify AG2.7's consumer sentence to name the polarized subpackage actually used.
  - Keep the source's conjugate-dual, twist and Frobenius conventions.
- **Graph.** The AG2.3 edges pass a joint acyclicity test with the /26 split.

### What main says now
- **AG2.2:** "retain the parity and Shin-regularity restrictions of the geometric construction".
- **AG2.3:** "Its output is the arbitrary regular polarized branch".
- **TC.4 and RS-24.** TC.4 requires AG2.2 and TC.3 in `data/atlas.json`. The accepted RS-24 also records the link AG2.2 → TC.4, with the reason "Preserve the independently constructed characteristic-zero unitary systems; no symplectic classification is inferred" (`data/restructure/RS-24.result.json`).
- **TC.3.** It reads "only the matching CM/unitary instance consumes AG2's constructed characteristic-zero package". Its assembled inputs are IHG.0, IHG.1, IHG.3, IHG.4, IHG.5, ALS.4 and TC.2, with no AG2 stage. The TC source table's §5.1 row names AutomorphicGaloisRepresentationsPartII without a stage.
- **AG2.7:** "PotentialAutomorphyInfrastructure and TorsionCohomologyInfrastructure consume these packages, and IntegralHeckeAndGaloisDeterminants owns their interpolation over nonreduced Hecke algebras." Its only consumer is PA.0.
- **Graph.** AG2.2 → AG2.3 exists; nothing reaches TC.3 from AG2.3.

### Fix

**1. `data/atlas.json`.** Add AG2.3 → TC.3: TC.3's `requires`, AG2.3's `consumers`, and a `stageEdges` record.

**2. The maintainer's decision: AG2.2 → TC.4.**
- After edit 1, AG2.2 → AG2.3 → TC.3 → TC.4 makes this edge redundant, and its RS-24 reason does not describe what TC uses.
- **To remove it,** drop it from TC.4's `requires`, AG2.2's `consumers` and `stageEdges` in `data/atlas.json`. Also drop the RS-24 link in `data/restructure/RS-24.result.json` and `research/blueprint/restructure/RS-24.result.json`; otherwise the build restores it.
- **To keep it** (harmless for the graph), correct its reason to: "Forwarded through AG2.3 → TC.3: TC uses AG2.3's arbitrary regular polarized package, not AG2.2's Shin-regular one."

**3. `content/campaign/TorsionCohomologyInfrastructure/README.md`, source table, §5.1 row.**
- In the supplier column, replace "AutomorphicGaloisRepresentationsPartII" with "AutomorphicGaloisRepresentationsPartII AG2.3".
- Replace "Independently constructed CM/unitary characteristic-zero systems and Frobenius/Hecke normalization" with:
  > The arbitrary regular polarized CM/unitary systems of AG2.3 — Theorem 5.1.4 needs representations that are regular but neither Shin-regular nor of finite slope at p (footnote 21, published p. 1033) — and Frobenius/Hecke normalization

**4. TC.3, second paragraph.** The replacement text is given under /24 below; it names AG2.3.

**5. `content/campaign/AutomorphicGaloisRepresentationsPartII/README.md`, AG2.7.** Replace "PotentialAutomorphyInfrastructure and TorsionCohomologyInfrastructure consume these packages, and IntegralHeckeAndGaloisDeterminants owns their interpolation over nonreduced Hecke algebras." with:

> PotentialAutomorphyInfrastructure consumes these packages through PA.0. TorsionCohomologyInfrastructure takes only the arbitrary regular polarized package, directly from AG2.3 through TC.3; it does not use AG2.4's nonselfdual package. IntegralHeckeAndGaloisDeterminants owns their interpolation over nonreduced Hecke algebras.

**Cycle test.** The cycle test for AG2.3 → TC.3 finds no path TC.3 → … → AG2.3, alone or jointly with /9, /20 and /26: acyclic.

**When:** now (edits 1, 3–5); maintainer (edit 2).

## /19 (medium, duplicate): the GSp_4 items of Calegari–Geraghty and Pilloni join the GSp_4 Part II

### What the verifier corrected
- **What the duplicate is.** It is a conflict between accepted paper routes, not two implementations.
- **The accepted routes:**
  - Calegari–Geraghty 2020 source route 11 and Pilloni 2020 source route 15 both tell AG2 to add a GSp_4 branch.
  - BCGP21's accepted Part II route 4 assigns the same items to GSp4LocalLanglandsAndGaloisRepresentations: existence, symplectic-valuedness, the local and p-adic comparisons, and normalization. The scope and Layer 8 of its brief name the Calegari–Geraghty, Pilloni and Sorensen statements to be re-pointed.
- **The fix.**
  - Reconcile the routing around that single proposed owner, and carry the multiplier, weight and reciprocity dictionaries with the items.
  - The Part II imports the GL_4 construction, crystalline comparison and purity from AG2, and Gan–Takeda and the transfer from ML.4. It does not construct them again.
- **What to preserve:**
  - the generic Bellaïche–Chenevier sign result, with its general-representation owner;
  - BCGP21 source route 16's generic Weil–Deligne purity at AG2.5.
- **Limits:**
  - Do not move AG2.0/AG2.2/AG2.5/AG2.6 items just because their consumer is GSp_4.
  - Do not describe the accepted design route as a live stage.
  - The verdict checks the routing only; it does not re-certify the extractions.

### What main says now
- **PAPER-CALEGARI-GERAGHTY-20, route 11** (`routes[10]`):
  - A source route to AG2.2, AG2.5 and AG2.6 with 10 items.
  - Its reason opens: "AG2 builds Galois representations for GL_n over CM or totally real fields. It must add a GSp4 branch over Q obtained through the transfer to GL4".
  - Review: `{"route": 11, "verdict": "accept"}`.
  - The paper has 27 routes.
- **PAPER-PILLONI-20, route 15** (`routes[14]`):
  - A source route to AG2.0, AG2.2, AG2.5 and AG2.6 with 5 items.
  - Its reason opens: "AG2 already receives from PAPER-CALEGARI-GERAGHTY-20 a GSp4 branch over Q".
  - Review: `{"route": 15, "verdict": "accept"}`.
  - The paper has 25 routes.
- **PAPER-BOXER-CALEGARI-GEE-PILLONI-21, route 4** (`routes[3]`):
  - Part II, parent ModularityAndLanglandsExtensions, roadmap GSp4LocalLanglandsAndGaloisRepresentations, with the title "Modularity, automorphy and Langlands endpoint extensions, Part II: GSp_4, its local Langlands correspondence and Galois representations".
  - Its Layer 8 reads: "The re-pointed statements need more than Theorems 2.7.1–2.7.2, so this layer also plans it. They are Pilloni's Theorem 5.1.7.1(2)–(5) with Remark 5.1.7.1, Calegari–Geraghty's Proposition 6.8 with the conjugation of R_p into GSp_4 for simple generic π, and Sorensen's Corollaries 1 and 3 and §4.5 (Doc. Math. 15 (2010))."
  - Its Layer 1 converts the spinor polynomial "to the Hecke polynomials of the re-pointed items", naming Calegari–Geraghty's Q_x(X) and Pilloni's Q_ℓ(X).
  - Review: `{"route": 4, "verdict": "accept"}`.
- **The join pattern.** PAPER-BOXER-CALEGARI-GEE-PILLONI-25 route 35, accepted, already joins the same Part II; it is the pattern for a join.
- **No live stage yet.** AG2's README and integrated decomposition mention no GSp_4, and no atlas roadmap or design job GSp4LocalLanglandsAndGaloisRepresentations exists yet.
- **The rules the edits must satisfy:**
  - `scripts/check_paper.py` requires every route to name at least one item. A Part II route also needs a title containing "Part II", a known parent, an area and a brief of at least 60 words.
  - `make_queue` applies route n (1-based) only if the review carries `{"route": n, "verdict": "accept"}`, so deleting a route would renumber the verdicts after it.
  - All 14 moved items have status `missing`, as a Part II route requires.

### Fix

**1. `research/blueprint/papers/PAPER-CALEGARI-GERAGHTY-20.result.json`.**
- **Route 11 (`routes[10]`), narrowed.** It keeps its kind and roadmap.
  - `items`: from the 10 ids to `["PAPER-CALEGARI-GERAGHTY-20/ext-bellaiche-chenevier-sign-theorem"]`.
  - `stages`: from AG2.2, AG2.5 and AG2.6 to `["AutomorphicGaloisRepresentationsPartII:AG2.2"]`.
  - `reason`, new value:
    > AG2.2 ('recover the specified polarization') gets Bellaïche–Chenevier's sign theorem (used in Lemma 6.9, p. 840): for a regular algebraic, conjugate self-dual cuspidal representation descended to a unitary group whose ℓ-adic Galois representation is absolutely irreducible, the polarization has sign +1. This GL_n statement stays with AG2. Its GSp_4 application, with this paper's other GSp_4 items (Proposition 6.8, the conjugation of Mok's R_p into GSp_4 and Sorensen's results), goes to GSp4LocalLanglandsAndGaloisRepresentations on route 28, as the accepted Part II route 4 of PAPER-BOXER-CALEGARI-GEE-PILLONI-21 already plans (its Layer 8). Source to add: Bellaïche–Chenevier (Compositio 147, 2011). RT-AREA-langlands-1/19.
- **Item `ext-bellaiche-chenevier-sign-theorem`.**
  - `statement`: keep its first two sentences, which are the GL_n theorem.
  - Move its last sentence ("In the GSp4 application, the 4-dimensional representation is therefore symplectic rather than orthogonal.") to `note`, as the use made on route 28.
- **New route 28, appended so that no verdict is renumbered.**
  - `route`: "part-ii"; `parent`: "ModularityAndLanglandsExtensions"; `roadmap`: "GSp4LocalLanglandsAndGaloisRepresentations"; `title`: the BCGP21 title quoted above; `area`: "langlands".
  - `items`: the nine moved ids.
    - `ext-mok-galois-reps-for-GSp4`
    - `ext-sorensen-cor-3`
    - `ext-sorensen-monodromy-from-parahoric-level`
    - `ext-sorensen-paraspherical-paramodular`
    - `ext-symplectic-conjugation-simple-generic`
    - `galois-rep-crystalline-at-p`
    - `galois-rep-local-global-compatibility`
    - `galois-rep-of-regular-weight-cuspidal-eigenform`
    - `galois-rep-ordinary-shape-at-p`

    Each is prefixed `PAPER-CALEGARI-GERAGHTY-20/`.
  - `brief`:
    > Coalesce with the pending roadmap proposed by PAPER-BOXER-CALEGARI-GEE-PILLONI-21 (route 4); do not create another GSp_4 interface. Its Layer 8 already plans these re-pointed statements: Calegari–Geraghty's Proposition 6.8 (pp. 838–839) for a cuspidal eigenform f of weight (a, b), a ≥ b ≥ 3 — r_f: G_Q → GSp_4(K′) with ν∘r_f = λ_f∘χ_μ·ε^{−3} and det(X − r_f(Frob_x)) = λ_f(Q_x(X)) (Definition 6.7); crystalline at p with Hodge–Tate weights 𝐰, a−1, b−2, 0 (𝐰 = a+b−3) and crystalline Frobenius polynomial λ_f(Q_p(X)) (sourceIssues E54); for ordinary f, distinct roots and the upper-triangular shape (E55); local–global compatibility for absolutely irreducible r_f — together with Mok's GL_4-valued R_p (Compositio 150 (2014), Theorem 3.5) and its conjugation into GSp_4 for simple generic π (read [7, Theorem 1.2]; E56), and Sorensen's Corollaries 1 and 3 and §4.5 (Doc. Math. 15 (2010); Corollary 3 as corrected in E129). Carry this paper's normalizations (weights (a, b), the multiplier λ_f∘χ_μ·ε^{−3}, geometric Frobenius and Q_x(X)) into the dictionaries of Layers 1 and 8(d). Import the GL_4 construction, crystalline comparison and purity from AutomorphicGaloisRepresentationsPartII (AG2.2, AG2.5, AG2.6), and Gan–Takeda and the transfer to GL_4 from ModularityAndLanglandsExtensions ML.4; do not construct them again. Bellaïche–Chenevier's sign theorem stays at AG2.2 (route 11); its application here makes R_p symplectic. Consumer: GSp4NonregularModularityLifting (Theorems 6.13, 6.17 and 9.1).
  - `reason`:
    > The GSp_4-valued Galois representations and Sorensen's parahoric-level results are specific to GSp_4, and AutomorphicGaloisRepresentationsPartII constructs representations for GL_n only. The accepted Part II route 4 of PAPER-BOXER-CALEGARI-GEE-PILLONI-21 is their single proposed owner and names these items as re-pointed statements. RT-AREA-langlands-1/19 (verified) moves them here from route 11.

**2. `research/blueprint/papers/PAPER-PILLONI-20.result.json`, route 15 (`routes[14]`), re-pointed in place.**

All five of its items move, and emptying the route would fail check_paper.py. So the route becomes the join itself.
- `route`: from "source" to "part-ii". Remove `stages`. Add `parent` "ModularityAndLanglandsExtensions", `roadmap` "GSp4LocalLanglandsAndGaloisRepresentations", `title` (the BCGP21 title) and `area` "langlands".
- `items`: unchanged (the five `galois-rep-gsp4-*` and `galois-representation-normalizations` ids).
- `brief`:
  > Coalesce with the pending roadmap proposed by PAPER-BOXER-CALEGARI-GEE-PILLONI-21 (route 4), whose Layer 8 plans Pilloni's Theorem 5.1.7.1(2)–(5) with Remark 5.1.7.1 as re-pointed statements; do not create another GSp_4 interface. For cuspidal π with π_∞ = π(λ, C) in the discrete series, λ = (λ_1, λ_2; −λ_1−λ_2+3), Theorem 5.1.7.1 (pp. 22–23) gives: (2) ρ_{π,λ}: G_Q → GSp_4(Ē_λ), unramified outside Np, with det(1 − Xρ_{π,λ}(Frob_ℓ)) = Θ_π(Q_ℓ(X)) for geometric Frobenius; (3) de Rham at p with Hodge–Tate weights (0, −λ_2, −λ_1, −λ_1−λ_2); (4) crystalline for p ∤ N with det(1 − Xφ | D_crys) = Θ_π(Q_p(X)); (5) ρ_{π,λ} ≅ ρ_{π,λ}^∨ ⊗ χ_p^{λ_1+λ_2}ω_{π,λ} with ω_{π,λ} of finite order (printed χ_p^{−λ_1−λ_2}; sourceIssues E27). Carry Remark 5.1.7.1's normalizations (geometric Frobenius, HT(χ_p) = −1, ρ_{π,λ} attached to π ⊗ |ν|^{−3/2}) into the dictionaries of Layers 1 and 8(d). Import the GL_4 construction, crystalline comparison and purity from AutomorphicGaloisRepresentationsPartII and the transfer from ModularityAndLanglandsExtensions ML.4; do not construct them again. Sources to add: Taylor (Invent. Math. 114, 1993; E175) and Buzzard–Gee (LMS Lecture Note Ser. 414, 2014; E166). Consumers: GSp4NonregularModularityLifting and IntegralCoherentHeckeComplexes.
- `reason`:
  > Theorem 5.1.7.1 states the Galois representations of cuspidal GSp_4 representations in this paper's normalization. AutomorphicGaloisRepresentationsPartII constructs representations for GL_n only, and the accepted Part II route 4 of PAPER-BOXER-CALEGARI-GEE-PILLONI-21 is their single proposed owner and names these statements as re-pointed. RT-AREA-langlands-1/19 (verified) replaces this route's former source route to AG2.0, AG2.2, AG2.5 and AG2.6.

**3. Verdicts to record (the maintainer's; this report writes none).**
- **`PAPER-CALEGARI-GERAGHTY-20.review.json`:**
  - Keep route 11's `accept`, since the route keeps its kind and roadmap, but note that it is narrowed to AG2.2's sign theorem.
  - Add `{"route": 28, "verdict": "accept", "reason": "Join of the GSp4LocalLanglandsAndGaloisRepresentations Part II proposed by PAPER-BOXER-CALEGARI-GEE-PILLONI-21 route 4, whose Layer 8 plans these re-pointed statements (RT-AREA-langlands-1/19)."}`.
- **`PAPER-PILLONI-20.review.json`:** route 15's kind changes, so replace its verdict entry with `{"route": 15, "verdict": "accept", "reason": "Re-pointed by RT-AREA-langlands-1/19 from a source route to AutomorphicGaloisRepresentationsPartII to a join of the GSp4 Part II proposed by PAPER-BOXER-CALEGARI-GEE-PILLONI-21 route 4."}`.
- **The review notes' counts change:** Calegari–Geraghty has 28 routes; Pilloni has 18 source and 6 Part II routes.
- **Nothing else changes.** Not BCGP21 route 4, whose brief already plans these items; not BCGP21 route 16 (purity at AG2.5); and not AG2's README.

**When:** verdict.

## /20 (medium, duplicate): AG2.6 instantiates the compatible-system carrier of R24.5:operations

### What the verifier corrected
- **The overlap.** AG2.6 and R24.5:operations both build actual representations at coefficient places with common Frobenius polynomials and separate local predicates. R24.5:operations is explicitly the generic system interface before the two-dimensional existence theorem.
- **No live repair yet.** AUDIT-31 records the same overlap, and RS-12 remains needs_changes, so its proposal is not a live repair.
- **The fix.** Add R24.5:operations → AG2.6 (it has no reverse path), and have AG2.6 instantiate that carrier with its constructed automorphic representations.
- **What AG2.6 keeps:** the embedding-independence proof, and the source-qualified Hodge, purity and local-monodromy properties; a common carrier proves none of them.
- **Limits:** do not import R24.5's late two-dimensional existence theorem, and do not collapse the weak, almost-strict and strict predicates.

### What main says now
- **AG2.6** (`content/campaign/AutomorphicGaloisRepresentationsPartII/README.md`): "Build a weakly compatible-system object from one coefficient number field, a common finite ramification set, characteristic polynomials at all good places and the constructed representations at each coefficient prime. Prove independence of coefficient embeddings and semisimple uniqueness."
- **R24.5:operations** (sub-stage of R24.5):
  - It reads: "Build compatible systems as actual representations at coefficient places with common Frobenius polynomials, not only a table of traces; support weak, almost strict and strict local predicates separately … This construction takes a system as input and does not assume R24.5's two-dimensional existence theorem".
  - It requires G7, R01.5, R06.2 and R06.3; its consumer is PA.5.
- **AUDIT-31.** `data/library-coverage.json` lists R24.5:operations as AG2.6's duplicate ("the same carrier").
- **RS-12** (needs_changes, REV-RS-12~2) proposes the owner entry "Generic compatible-system carrier … R24.5:operations" (formerly AG2.2, AG2.6 and R19.3) and this link among thirty. It is not in force.
- **The node-level plan already imports.**
  - The packet `research/blueprint/packets/PotentialModularityAndCompatibleSystems--R24.3.json` (partial) plans R24.5/weakly-compatible-system-rank-n and R24.5/compatible-system-predicates under the parent R24.5:operations.
  - The AG2.6 packet (`research/blueprint/packets/AutomorphicGaloisRepresentationsPartII--AG2.6.json`, partial) defines ACC+ §7.1's very and extremely weakly compatible systems as weakenings of R24.5/weakly-compatible-system-rank-n, and builds R_π on them. It has no `requests` entry to R24.5:operations.
  - So only the stage edge and the README are wrong.
- **Graph:** the edge is absent, and nothing reaches R24.5:operations from AG2.6.

### Fix

**1. `data/atlas.json`.** Add R24.5:operations → AG2.6: AG2.6's `requires`, R24.5:operations' `consumers`, and `stageEdges`.

**2. AG2.6 README, second paragraph.** Replace "Build a weakly compatible-system object from one coefficient number field, a common finite ramification set, characteristic polynomials at all good places and the constructed representations at each coefficient prime. Prove independence of coefficient embeddings and semisimple uniqueness." with:

> Import the compatible-system carrier from PotentialModularityAndCompatibleSystems R24.5:operations: actual representations at every coefficient place with common Frobenius polynomials, with its weak, almost strict and strict local predicates kept separate. Do not import R24.5's later two-dimensional existence theorem. Instantiate the carrier with the representations constructed here: one coefficient number field, a common finite ramification set, the characteristic polynomials at all good places and the constructed representation at each coefficient prime. Prove independence of coefficient embeddings and semisimple uniqueness for these instances.

The rest of the paragraph (purity, polarization, coefficient-prime admissibility and the nonselfdual caveat) is unchanged.

**3. The AG2.6 packet, next checkpoint.** Add this `requests` entry:

> `{"supplier": "PotentialModularityAndCompatibleSystems:R24.5:operations", "need": "The rank-n weakly compatible-system carrier and its separate weak, almost strict and strict predicates (R24.5/weakly-compatible-system-rank-n, R24.5/compatible-system-predicates), before any existence theorem.", "neededBy": ["AutomorphicGaloisRepresentationsPartII:AG2.6/extremely-weakly-compatible-system", "AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-system-of-pi"]}`

The very and extremely weak variants of ACC+ §7.1 stay AG2.6 definitions on that carrier. If RS-12 is later accepted, the edge it proposes will already be present; there is no conflict.

**Cycle test.** The cycle test for R24.5:operations → AG2.6 finds no path AG2.6 → … → R24.5:operations, alone or jointly with /9, /18 and /26: acyclic.

**When:** now (edits 1–2); blueprint (edit 3).

## /21 (medium, duplicate): PA.4 imports the Taylor–Wiles data from G7

### What the verifier corrected
- **Accepted RS-08 decides the owners.**
  - The shared Chebotarev prime-selection machinery stays in R04.5, and G7 imports it.
  - G7 keeps ACC+ Proposition 6.2.33 and its diamond-group and presentation count for G8's variable-determinant problem.
- **The two sources' variants are different theorems.**
  - ACC+ p. 151 (printed 1047) assumes enormous image, F = F⁺F₀ and ζ_p ∉ F. It uses distinct eigenvalues and g = qn − n²[F⁺:Q].
  - CG Proposition 8.5, p. 114, uses big image, a selected one-dimensional generalized eigenspace and a different fixed-determinant variable count.
  - They are not one theorem with interchangeable hypotheses.
- **PA.4 imports what it uses through G7/R04.5.** It supplies any missing source-qualified variant to that owner. It keeps its finite-level arithmetic complexes, uniform bounds and specialization checks.
- **Graph.** G7 → PA.4 is absent and acyclic, also jointly with the PA.3 imports of /22.
- **Do not** re-prove prime selection in PA, or substitute adequacy for the source's actual image condition.

### What main says now
- **PA.4:** "Construct Taylor–Wiles auxiliary sets using the existing Chebotarev and arithmetic duality roadmaps with the required residual image hypothesis. Track the size of the sets, congruences on residue cardinalities, selected eigenvalues and framed local deformation data." The rest, from "Fix a nonprincipal ultrafilter as in ACC+ §6.4.1." to "not merely that an ultrafilter exists.", is the ultrapatching verification.
- **PA.4's edges.** It requires PA.3 and Chebotarev Layer 10, and it has no consumers. The Layer 10 edge is link CH-L15 of `research/blueprint/links/tauceti_TauCetiRoadmap_Chebotarev.json` (reviewed, accepted). Its PA.4 evidence quote is the first PA.4 sentence above, so `scripts/check_links.py` fails if that sentence goes without an edit to CH-L15.
- **G7** (`content/campaign/GlobalGaloisDeformations/README.md`) states Proposition 6.2.33 with F = F⁺F₀, ζ_p ∉ F, enormous image, T = S, exactly q primes and g = qn − n²[F⁺:Q]. It says: "Export the auxiliary diamond group and its exact rank/bounds to complex patching."
  - The promoted GlobalGaloisDeformations blueprint has the node GlobalGaloisDeformations:G7/enormous-taylor-wiles-presentation. It states the proposition, with Δ_{Q_N} "a product of qn cyclic p-groups, each of order at least p^N; this is what complex patching receives".
  - It also has G7/enormous-taylor-wiles-primes. Its Chebotarev input is the packet's request to Chebotarev Layer 10.
  - G7 has no consumers.
- **RS-08's owner list** gives "Actual Taylor–Wiles auxiliary-prime selection with prescribed congruences and eigenlines" to R04.5, formerly also G7, R22.2 and R21.4. PA.4 was not a member.
- **Items that PA.4's present text is recorded as planning.** In PAPER-ALLEN-ETAL-23 these are /265 (Proposition 6.5.11, Galois representations over the Taylor–Wiles Hecke algebras) and /283 (Proposition 6.6.7). Route 2 also gives PA.4 "the auxiliary places v_0, v′_0" (/273), used in §6.5.12 (printed pp. 1073–1074) and §6.6.10 (p. 1084).
  - Chebotarev gives infinitely many degree-one v₀ with ρ̄(Frob_{v₀}) scalar and q_{v₀} ≢ 1 mod p, from the scalar element of hypothesis (4). So H²(E_{v₀}, ad ρ̄) = H⁰(E_{v₀}, ad ρ̄(1))^∨ = 0.
  - Two such places of distinct residue characteristics make the level neat (Lemma 6.5.2).
  - These are not Taylor–Wiles primes.

### Fix

**1. `content/campaign/PotentialAutomorphyInfrastructure/README.md`, PA.4.** Replace its first two sentences, from "Construct Taylor–Wiles auxiliary sets" to "and framed local deformation data.", with:

> Import the Taylor–Wiles data from GlobalGaloisDeformations G7: ACC+ Proposition 6.2.33 (node G7/enormous-taylor-wiles-presentation), for F = F⁺F₀ with F₀ imaginary quadratic, ζ_p ∉ F and ρ̄(G_{F(ζ_p)}) enormous. It gives T = S, #Q_N = q, q_v ≡ 1 mod p^N, the rational primes below Q_N split in F₀, g = qn − n²[F⁺:Q] variables, the auxiliary groups Δ_{Q_N} and the Taylor–Wiles local deformation problems at Q_N.
>
> G7 takes the prime selection from R04.5, as RS-08 decides; do not select Taylor–Wiles primes here. Calegari–Geraghty's Proposition 8.5 is a different theorem, with big image, a one-dimensional generalized eigenspace and a fixed-determinant variable count, and is not interchangeable with Proposition 6.2.33. A variant that a consumer needs is supplied to G7 or R04.5 first.
>
> Construct the auxiliary level subgroups K_1(Q_N) ⊂ K_0(Q_N) ⊂ K, the finite-level complexes with their Hecke and O[Δ_{Q_N}] actions, and their Galois representations (ACC+ Propositions 6.5.11 and 6.6.7). Choose by the Chebotarev density theorem the two places v₀, v₀′ of degree one over Q with ρ̄(Frob_{v₀}) scalar, q_{v₀} ≢ 1 mod p and distinct odd residue characteristics, so that H²(F_{v₀}, ad ρ̄) = 0 and the level is neat (ACC+ Lemma 6.5.2 and §6.5.12).

Keep the rest of PA.4 verbatim, from "Fix a nonprincipal ultrafilter as in ACC+ §6.4.1." The title stays.

**2. The same README, "Implementation handoff".** Replace "PA.4 verifies enormous-image auxiliary primes and uniform amplitude/bounds before ultraproduct patching." with "PA.4 imports G7's enormous-image Taylor–Wiles data and verifies uniform amplitude/bounds before ultraproduct patching."

**3. Stage edge G7 → PA.4.** Add it to PA.4's requires list and to stageEdges.
- The cycle test for G7 → PA.4: PA.4 has no path to G7, and it has no consumers on main. Jointly with /7 and /22 it is acyclic.
- After the edge, R04.5 and Chebotarev Layer 10 reach PA.4 through G7.

**4. Link CH-L15** (maintainer's edit; the link is reviewed). The sentence it quotes is removed, so re-scope it to the step PA.4 keeps.
- **Evidence for PotentialAutomorphyInfrastructure:PA.4.** Replace the quote with "Choose by the Chebotarev density theorem the two places v₀, v₀′ of degree one over Q with ρ̄(Frob_{v₀}) scalar, q_{v₀} ≢ 1 mod p and distinct odd residue characteristics".
- **Reason.** Replace it with:
  > Supply the places v₀, v₀′ that PA.4 chooses (ACC+ §6.5.12 and §6.6.10): Frobenius elements in the extension cut out by ρ̄ and ζ_p, with ρ̄(Frob_v) scalar and q_v ≢ 1 mod p. PA.4's Taylor–Wiles primes come from R04.5 through G7, not through this link.
- **Alternative.** If the maintainer prefers, retire CH-L15. Layer 10 then reaches PA.4 through R04.5 → G7 → PA.4. The v₀ choice would be documented only in the stage text.

**When:** now.

## /22 (medium, missing): PA.3 imports its local and global deformation problems

### What the verifier corrected
- **What the suppliers do.**
  - L7 and L8 distinguish ordinary flags from determinant-ordinary conditions.
  - R08.2 keeps the away-from-p monodromy.
  - G7 and G8 construct the actual global deformation problems.
  - P9 is a general algebraic support and patching theorem, and cannot construct those arithmetic data.
- **The source.** ACC+ pp. 166–167 (printed 1062–1063) define S_χ and its local conditions and prove the map from R_{S_χ} to the geometric Hecke algebra modulo a bounded nilpotent ideal. Pp. 164–165 (printed 1060–1061) compare the two patched systems and their residual ring actions.
- **The repair.** Add the matching local and global supplier contracts to PA.3, separately for each branch: the determinant or polarized problem, and the ordinary or Fontaine–Laffaille condition.
  - The five proposed PA.3 imports are absent and jointly acyclic.
  - Some become transitive through G7/G8, and they are not five independent new constructions.
- **Do not add L7 → P9.** P9 says arithmetic verification belongs to PA, and its theorem is parametrized by local ring and component data. Correct L7's exporter prose to route that application through PA.3, keeping P9's general algebraic owner boundary. A separate arithmetic P9 example would need its own dependency; none exists.

### What main says now
- **PA.3** begins: "Use the general patching owner to compare patched complexes for two systems of local conditions which agree modulo a chosen coefficient ideal." It requires P9, P9/support-transport-avoiding-ihara and PA.0. That node's hypotheses say "The dimension, component and generic-concentration assumptions of ACC+ Assumption 6.3.6 are numerical hypotheses to be verified by the arithmetic consumer (PotentialAutomorphyInfrastructure PA.3)."
- **P9:** "The arithmetic verification is PotentialAutomorphyInfrastructure."
- **L7** (`content/campaign/LocalGaloisDeformationRings/README.md`): "Export the precise local comparisons and component support input used in ACC+ §6.2 to GlobalGaloisDeformations G7 and DeformationAndDerivedPatchingAlgebra P9." Its consumers are G7, L8, R08.4 and R08.5. There is no L7 → P9 edge, and no P9 node or example uses L7.
- **Reachability.** No path runs to PA.3 from L7, L8, R08.2, G7 or G8. L7, L8 (through G8), R08.2 and G8 all reach G7.
- **The source's local and global data** (published numbering, printed pages):
  - Proposition 6.2.14 (Fontaine–Laffaille, p. 1038);
  - Proposition 6.2.10 (the flag image ring R^Δ_v, p. 1035) and Proposition 6.2.12 (its comparison with R^{det,ord}_v, p. 1036);
  - Propositions 6.2.16–6.2.17 (Taylor's R^1_v and R^χ_v at v ∈ R, p. 1038);
  - Proposition 6.2.21 (the unrestricted ring at H² = 0 places, p. 1039);
  - Lemmas 6.2.26 and 6.2.27 (the component properties of R^{T,loc} in the two branches, pp. 1042–1043, from those propositions and [BLGHT11, Lem. 3.3]);
  - the problems S_χ (p. 1062) and their ordinary analogues (§6.6.1);
  - Proposition 6.4.17 (the comparison of the two patched systems modulo ϖ, pp. 1060–1061).
- **The partial LocalGaloisDeformationRings packet** already plans the relevant local nodes:
  - L7/fontaine-laffaille-deformation-condition, L7/ordinary-flag-scheme and L7/trivial-residual-flag-ring;
  - L8/determinant-ordinary-ring and L8/determinant-flag-comparison;
  - R08.2/ihara-avoidance-components.

### Fix

**1. `content/campaign/PotentialAutomorphyInfrastructure/README.md`, PA.3.** After its first sentence, insert:

> The two systems are the global deformation problems S_1 and S_χ of ACC+ §6.5.1 (p. 1062): D_v^{FL} at v | p, D_v^χ or D_v^1 at v ∈ R, and D_v elsewhere. In the ordinary branch they are their analogues with D_v^{det,ord} at v | p (§6.6.1). Import them branch by branch:
> - the global problems, their representability and T-framed presentations (Definition 6.2.2, Theorem 6.2.3, Lemma 6.2.4, Proposition 6.2.25) from GlobalGaloisDeformations G8, with the Taylor–Wiles augmentation from G7;
> - the Fontaine–Laffaille condition (Proposition 6.2.14) and the flag image ring R^Δ_v (Proposition 6.2.10) from LocalGaloisDeformationRings L7;
> - the determinant-ordinary condition and its comparison with the flag condition (Proposition 6.2.12) from L8; it is not the ordinary flag scheme;
> - Taylor's conditions at v ∈ R (Propositions 6.2.16 and 6.2.17) from R08.2, with the unrestricted rings at the places where H²(F_v, ad ρ̄) = 0 (Proposition 6.2.21) from R08.1 through R08.2.
>
> Prove the component properties of R^{T,loc} in each branch (Lemma 6.2.26 for Fontaine–Laffaille, Lemma 6.2.27 for ordinary), and verify from them the numerical hypotheses of DeformationAndDerivedPatchingAlgebra P9/support-transport-avoiding-ihara (ACC+ Assumption 6.3.6). The comparison of the two patched systems modulo ϖ is ACC+ Proposition 6.4.17. Proposition 6.5.3's map R_{S_χ} → T/J with J^δ = 0 comes through PA.0–PA.2. The determinant-ordinary branch has no analogue of the full-support theorem (ACC+ p. 1075).

The rest of PA.3 stays.

**2. `content/campaign/LocalGaloisDeformationRings/README.md`.**
- **L7.** Replace "Export the precise local comparisons and component support input used in ACC+ §6.2 to GlobalGaloisDeformations G7 and DeformationAndDerivedPatchingAlgebra P9." with:
  > Export the precise local comparisons and component support input used in ACC+ §6.2 (the Fontaine–Laffaille ring of Proposition 6.2.14 and the flag image ring of Proposition 6.2.10) to GlobalGaloisDeformations G7 and to PotentialAutomorphyInfrastructure PA.3. PA.3 verifies them in the arithmetic setting before it applies DeformationAndDerivedPatchingAlgebra P9's general support theorem; P9 takes local component data as hypotheses and does not import this layer.
- **L8.** After "Prove the precise comparison only under the published hypotheses and at the indicated integral/reduced/characteristic-zero level.", insert:
  > Export Proposition 6.2.12 and the determinant-ordinary ring to GlobalGaloisDeformations G8 and PotentialAutomorphyInfrastructure PA.3.

**3. Stage edges.** Add L7 → PA.3, L8 → PA.3, R08.2 → PA.3, G7 → PA.3 and G8 → PA.3 to PA.3's requires list and to stageEdges.
- The cycle test for each: PA.3's descendants are PA.4, and PA.6 → ML.2 → ML.3, ML.5 after /7. None reaches L7, L8, R08.2, G7 or G8.
- The five edges are jointly acyclic with G7 → PA.4 and the PA.6 edges.
- Only G7 → PA.3 is new reachability. The other four become transitive through G7 once it is added. They are recorded as PA.3's named contracts, one for each local and global problem it uses, not as new constructions.
- **No L7 → P9 edge.**

**When:** now.

## /24 (medium, error): TC states the three branches of Remark 5.4.6

### What the verifier corrected
- **The unconditional range.** Remark V.4.6 (arXiv v2 p. 104; published Remark 5.4.6, p. 1061) makes all of §V.4 unconditional by this route when:
  - F is CM and contains an imaginary-quadratic field; and
  - S is pulled back from a set of rational primes containing p and every prime ramified in F/Q.

  A generic CM label is not these hypotheses. Write them into TC.3, TC.4 and the new terminal theorem, with the exact unitary-similitude transfer supplier.
- **The remark's last paragraph** extends only Corollary V.4.2, the characteristic-zero result, to general totally real or CM fields, by patching under the rational-set condition. Do not present it as the integral torsion theorem, nor as a residual-only theorem.
- **The current literature.** AGIKMS (arXiv:2410.13504v3, 24 July 2026, pp. 5 and 15) remove the local-intertwining and classification gaps but retain the twisted weighted fundamental lemma, as distinct from the proved unweighted versions.
  - Expose that exact remaining hypothesis.
  - Do not claim that the old local results remain unproved.
  - Do not infer that every CM torsion case is unconditional.

### What main says now
- **The conventions paragraph** (`content/campaign/TorsionCohomologyInfrastructure/README.md`, "Coefficients and conventions", second paragraph) reads:
  > "The CM/unitary realization uses the stated ET/AG2/Shin hypotheses. The totally-real symplectic realization additionally requires Arthur's endoscopic transfer/classification input, **conditional until the exact classification theorem and all its source assumptions are verified**; ModularityAndLanglandsExtensions ML.4 owns that later source-qualified classification programme. Sp and its similitude group are not interchangeable: track the precise group, central character and passage used by the Shimura realization. The algebraic boundary and determinant-factor constructions below are unconditional constructions on their stated inputs; their symplectic arithmetic application inherits this extra hypothesis. Scholze's published Theorem 1.0.3 already distinguishes the branches. For the present source status, Atobe–Gan–Ichino–Kaletha–Mínguez–Shin, arXiv:2410.13504v3 (2026), §§0.3–0.4 distinguish existing stabilization work from the remaining twisted weighted fundamental-lemma assumption. The selected simple unitary trace comparison does not prove that assumption."
- **TC.3, second paragraph:** "At the arithmetic point of use, the symplectic instance of TC.3 retains the explicitly conditional Arthur input above; only the matching CM/unitary instance consumes AG2's constructed characteristic-zero package. Neither a polynomial factor identity nor an abstract determinant removes that distinction."
- **Implementation handoff:** "The CM/unitary branch uses only the matching ET/AG2 theorems."
- **Missing hypotheses.** No TC text mentions an imaginary-quadratic subfield or a set S pulled back from Q (checked by search).
- **The source:**
  - Theorem 1.0.3 (p. 948): "Conjecture 1.0.2 holds true if F is CM and contains an imaginary-quadratic field. Assuming the work of Arthur, [3], it holds true if F is totally real or CM."
  - Footnote 3 (p. 949) credits Shin with "unconditional results … which make our results unconditional for a CM field containing an imaginary-quadratic field; cf. Remark 5.4.6".
  - Remark 5.4.6 also cites "the book of Morel, [48, Cor. 8.5.3]", and notes that "Shin's result is stated in terms of unitary similitude groups", to which Theorem 4.1.1 and §4 apply verbatim.
- **Shin's input.** It is Scholze's reference [57]: "S. W. Shin, On the cohomological base change for unitary similitude groups, 2012, appendix to W. Goldring, Galois representations associated to holomorphic limits of discrete series I: Unitary groups". No atlas stage names it: no stage mentions Goldring, and the EndoscopicTransferAndUnitaryTraceComparison README never mentions similitude groups. ET.7a constructs unitary-to-GL_m base change.
- **No packet to hold a request.** No blueprint packet exists for TorsionCohomologyInfrastructure or EndoscopicTransferAndUnitaryTraceComparison.
- **ML.4** registers Arthur's and Mok's classifications as conditional inputs. `RT-AREA-langlands-3.fixes.md` proposes the sub-stage ML.4:classical-arthur for both; it is not yet applied.

### Fix

**1. "Coefficients and conventions", second paragraph.** Replace the paragraph quoted above with:

> The arithmetic realizations have three branches (Scholze, Remark 5.4.6, published p. 1061; footnote 3, p. 949):
> - **Unconditional unitary branch.** F is CM and contains an imaginary-quadratic field, and S is the pullback of a finite set S_Q of finite places of Q that contains p and every place at which F/Q ramifies. The Galois input is Shin's cohomological base change for unitary similitude groups (Scholze's reference [57], an appendix to Goldring's paper on holomorphic limits of discrete series; compare Morel, Ann. of Math. Stud. 173, Corollary 8.5.3). It is used on the Shimura varieties of unitary similitude groups; Theorem 4.1.1 and §4 hold verbatim for these Hodge-type varieties.
> - **Conditional unitary branch.** Every other CM field F, or a set S not of that form, uses Mok's classification for quasi-split unitary groups.
> - **Conditional symplectic branch.** F totally real uses Arthur's classification for symplectic groups.
>
> Both conditional branches rest on the stabilization of the twisted trace formula. Atobe–Gan–Ichino–Kaletha–Mínguez–Shin, arXiv:2410.13504v3 (2026), pp. 5 and 15 (§§0.3–0.4), prove the other unproven assertions on which Arthur's and Mok's books rely, but not the twisted weighted fundamental lemma. That lemma is the exact remaining hypothesis. ModularityAndLanglandsExtensions ML.4 registers both classifications with it, and every theorem here that uses a conditional branch states it. The selected simple unitary trace comparison does not prove it.
>
> Theorem 1.0.3 (p. 948) does not split the branches by group type: it is unconditional for F CM containing an imaginary-quadratic field, and assumes Arthur's work for F totally real or CM. The last paragraph of Remark 5.4.6 extends only the characteristic-zero Corollary 5.4.2 to general totally real or CM F, by patching (Harris–Taylor, Theorem VII.1.9), and still with S pulled back from S_Q; it does not extend the integral torsion results of §5.4.
>
> Sp and its similitude group are not interchangeable: track the precise group, central character and passage used by the Shimura realization. The algebraic boundary and determinant-factor constructions below are unconditional constructions on their stated inputs; their arithmetic applications inherit the hypothesis of their branch.

**2. TC.3, second paragraph** (this also carries /18). Replace the paragraph quoted above with:

> At the arithmetic point of use, each instance of TC.3 carries the hypothesis of its branch (see "Coefficients and conventions"). The unitary instance is unconditional only when F contains an imaginary-quadratic field and S is pulled back from Q (Remark 5.4.6(i)–(ii)), realized on unitary similitude Shimura varieties. The other CM instances assume Mok's classification, and the symplectic instance Arthur's. The unitary instances consume AutomorphicGaloisRepresentationsPartII AG2.3's arbitrary regular polarized package: Theorem 5.1.4 needs regular representations that are neither Shin-regular nor of finite slope at p (footnote 21, p. 1033). Neither a polynomial factor identity nor an abstract determinant removes these distinctions.

**3. TC.4.** Append:

> State the four-route comparison for each arithmetic instance with the hypothesis of its branch; only the unitary instance under Remark 5.4.6(i)–(ii) is unconditional.

**4. Implementation handoff.** Replace "The CM/unitary branch uses only the matching ET/AG2 theorems." with:

> The unitary branch uses AG2.3's polarized package. It is unconditional under Remark 5.4.6(i)–(ii), and otherwise assumes Mok's classification (ML.4).

**5. TC.5.** Its "Branches" paragraph (/9) states the same three branches, and its conditional branches import ML.4 (the optional edge of /9).

**6. Shin's similitude base change, as a request.**
- These entries are for the first TorsionCohomologyInfrastructure packet, since none exists yet:
  - `{"supplier": "EndoscopicTransferAndUnitaryTraceComparison:ET.7a", "need": "Shin's cohomological base change for unitary similitude groups (Scholze's reference [57], appendix to Goldring; cf. Morel, Ann. of Math. Stud. 173, Corollary 8.5.3), on the unitary similitude Shimura varieties of Scholze §5, for the unconditional branch of Remark 5.4.6.", "neededBy": ["TorsionCohomologyInfrastructure:TC.3", "TorsionCohomologyInfrastructure:TC.5"]}`
  - `{"supplier": "AutomorphicGaloisRepresentationsPartII:AG2.2", "need": "The Galois representations of the cohomological systems of those unitary similitude groups, from ET.7a's similitude base change.", "neededBy": ["TorsionCohomologyInfrastructure:TC.3", "TorsionCohomologyInfrastructure:TC.5"]}`
- Until that packet exists, edit 1 names the supplier in the README.

**7. PAPER-SCHOLZE-15, at its review.** Item 114's note quotes the replaced sentence ("TC's README records that 'Scholze's published Theorem 1.0.3 already distinguishes the branches'"); update it to the three branches above.

**Cycle test.** No edge is added except the optional ML.4 → TC.5 of /9, which is acyclic.

**When:** now (edits 1–5); blueprint (edit 6); review (edit 7).

## /25 (medium, duplicate): R19.6 applies IHG.4 and IHG.1 instead of re-proving them

### What the verifier corrected
- **The duplication.** R19.6 repeats the generic interpolation and reconstruction wording, and the IHG.4 interface is missing.
- **The input overstates the IHG.1 gap.** IHG.1 already reaches R19.6 in the assembled graph, through R01.5 → R19.1 → R19.2 → R19.3 → R19.4 → R19.5 → R19.6. No path runs from IHG.4.
- **Ownership.** R19.6's contract still says to construct the law and prove representability. The accepted RS-24 gives the generic steps to IHG.4 and IHG.1. RS-12 is not accepted.
- **The fix.** Add IHG.4 → R19.6 and reuse IHG.1 explicitly; a direct IHG.1 edge is optional documentation. Keep the geometric Hecke instance, the congruence/integrality bounds, continuity, specialization and the deformation-map conditions.
- **Chenevier v2 Theorem 2.22(i)** (p. 34) needs a henselian base, the Cayley–Hamilton quotient, and a residual determinant that is split and absolutely irreducible. The raw group algebra is not asserted to be a matrix algebra. Preserve those hypotheses, and the finite-field splitness bridge of findings /33 and /35.

### What main says now
- **R19.6** (`content/campaign/AutomorphicGaloisRepresentations/README.md`, line 78) begins: "Construct the determinant law from Hecke operators and Frobenius polynomials, then prove representability by a continuous representation over the localised completed Hecke algebra under absolute residual irreducibility."
  - Its dependencies line (line 80) is "R19.5 (preceding layer)."
  - Assembled prerequisites: R19.5, ModularCurvesPartII R14.5, JacobianChallenge Layer F, and ModularForms Layers 4, 8 and 8G.
  - Consumers: R31.3, R29.1, R29.4, R29.5, R29.6, KU-modularparam, R22.1, R21.3, R24.1 and R20.1.
- **IHG.4** (`content/campaign/IntegralHeckeAndGaloisDeterminants/README.md`, line 33) begins: "Construct compatible determinants over finite coefficient quotients from a dense family of classical Hecke systems where the coefficients admit the necessary uniform congruence bounds."
- **RS-24 (accepted)** owner records:
  - "Generic continuous determinant interpolation and coefficient/limit compatibility" → IHG.4;
  - "Cayley-Hamilton descent and hypothesis-qualified reconstruction" → IHG.1.
- **RS-12**'s review status is `needs_changes`.
- **AUDIT-31** lists, among R19.6's duplicates, IHG.4, IHG.1, CompletedCohomology R31.3 and OrdinaryAutomorphicForms R21.3.
- **R21.3** (`content/campaign/OrdinaryAutomorphicFormsAndModularityLifting/README.md`, line 48) says "Construct the Galois representation or determinant law over the ordinary Hecke algebra and prove its ordinary local structure." It requires R19.6.

### Fix
1. **R19.6 prose** (line 78). Replace the first sentence.
   - Old: "Construct the determinant law from Hecke operators and Frobenius polynomials, then prove representability by a continuous representation over the localised completed Hecke algebra under absolute residual irreducibility."
   - New: "Build the geometric Hecke-determinant instance. From the Hecke operators and Frobenius polynomials of the actual modular-curve cohomology, verify the uniform congruence, integrality and continuity bounds that IntegralHeckeAndGaloisDeterminants IHG.4 requires of the dense family of classical eigensystems. Apply IHG.4's finite-quotient interpolation to obtain the determinant over the localised completed Hecke algebra; do not re-prove the generic interpolation. Under absolute residual irreducibility, apply IHG.1's representability theorem (Chenevier, arXiv:0809.0415v2, Theorem 2.22(i)) to the Cayley–Hamilton quotient of the completed group algebra, not to the group algebra itself. It needs a henselian base, a Cayley–Hamilton determinant, and a residual determinant that is split as well as absolutely irreducible. Over the finite residue field, splitness comes from the triviality of the Brauer group (Chenevier, Definition-Proposition 2.18); import that bridge from IHG.1 rather than re-prove it."

   The rest of the paragraph is unchanged: specialization, local type, ramification and deformation-map compatibility, nilpotent structure, and the weight-two V_ℓ(A_f) comparison.
2. **R19.6 dependencies** (line 80).
   - Old: "**Dependencies:** R19.5 (preceding layer)."
   - New: "**Dependencies:** R19.5 (preceding layer); [IntegralHeckeAndGaloisDeterminants IHG.4](../IntegralHeckeAndGaloisDeterminants/README.md) and IHG.1."
3. **Stage edges.**
   - Add IHG.4 → R19.6. The cycle test finds no path R19.6 → … → IHG.4: acyclic.
   - Optionally add IHG.1 → R19.6 as documentation. Reachability already exists (the path above), and the cycle test finds no reverse path. Jointly the two edges are acyclic.
4. **R21.3** inherits the repair through R19.6 → R21.3, and no edge is needed. For consistency, its first sentence may read: "Obtain the Galois representation or determinant law over the ordinary Hecke algebra by the same route as R19.6 (IHG.4's interpolation and, under absolute residual irreducibility, IHG.1's representability), and prove its ordinary local structure." The residually reducible clause is unchanged.
5. **Not part of this job.** The finite-field splitness bridge itself is findings /33 and /35 (low, outside this job). They ask IHG.1 to export it; R19.6's new text imports it from there.
6. **Library records.** None change. AUDIT-31 already records IHG.4 and IHG.1 as R19.6's duplicates.

**When:** now.

## /26 (medium, duplicate): the input-free factor-separation algebra becomes TC.3:factor-separation, imported by TC.3 and AG2.4

### What the verifier corrected
- **IHG.4 owns the interpolation.** IHG.4, confirmed by the accepted RS-24, owns generic continuous finite-quotient interpolation and coefficient/limit compatibility. AG2.4 should establish its HLTT congruence data and apply that theorem, not reconstruct it.
- **Lemma V.3.8 is geometric-input-free.** Scholze credits the twisting idea to HLTT (arXiv v2 p. 92; published p. 1046: "roughly following an idea used in [34]"). Lemma V.3.8 and its proof (pp. 97–100) give a factor theorem over a commutative ring. Its input is a determinant on R[G][V^{±1}] with specified Laurent-variable factorizations for every g and every integer k; pointwise factorization does not meet these hypotheses.
- **The fix.** Separate that algebra from TC.3's TC.2-dependent arithmetic realization, under the common IHG algebra or an independent TC sub-stage, and feed both TC.3 and AG2.4.
- **What AG2.4 must prove and keep.**
  - Prove how HLTT's character family, congruence limits and coefficient conventions instantiate it; this is not automatic from the shared idea.
  - Keep auxiliary-CM descent, the geometry and the comparison data in AG2.4.
- **Graph.** IHG.4 → AG2.4, and IHG.0/1/4/5 → the independent factor prefix → AG2.4 and TC.3, pass a joint test with /18. Importing the whole of TC.3 would destroy the separation.

### What main says now
- **AG2.4, third paragraph:** "Attach degree-2n Galois determinants to those classical forms through AG2.3, prove compatibility of the congruences and take the justified p-adic limit. Prove the algebraic separation argument extracting the two degree-n constituents while varying the twist, including uniqueness by Frobenius polynomials and descent from auxiliary CM extensions."
- **AG2.4's inputs.** Its `requires` are F1, B3 (two ids), AG2.3, L4 and C5, with no IHG stage. The AG2 scope fence reads: "None consumes the torsion concentration theorem IG.7, Scholze torsion interpolation, or the final potential-automorphy output."
- **TC.3, first paragraph:** "Build the abstract factor-separation lemma using actual auxiliary characters with the source's separation property, the coefficient-ring endomorphisms and determinant identities. Prove uniqueness, change-of-ring and compatibility when two choices of auxiliary data yield the same factor. Include the case of nilpotent coefficient quotients." TC.3 requires TC.2.
- **The TC source table:** "| §5.3 | TC.3 below | Algebra of extracting factors from determinant-valued Hecke data |".
- **RS-24 (accepted):**
  - It keeps in TC.3 "the abstract factor-separation theorem with actual auxiliary characters, choice independence, change of coefficients and nilpotent quotients".
  - It owns "Generic continuous determinant interpolation and coefficient/limit compatibility" at IHG.4 (formerly TC.3 and TC.4).
- **PAPER-SCHOLZE-15** (unreviewed) plans Lemmas 5.3.6–5.3.13 at TC.3 (items 103–107), with Lemma 5.3.8 also at IHG.0.
- **Graph:** no path IHG.4 → AG2.4.
- **The source** (published §5.3):
  - Lemma 5.3.6 (pp. 1050–1051) gives an h-dimensional determinant A[G][V^{±1}] → A[T^{±1}]/I with I^{4(d+1)} = 0. It glues the determinants of the twists by characters χ, using the injectivity of A[T^{±1}] → ∏_χ A and Chenevier's Corollary 1.14.
  - Lemma 5.3.7 (pp. 1051–1052) passes to (A/J)[T^{±1}] with J^{4(d+1)} = 0, using T ↦ T^a.
  - Lemma 5.3.8 (pp. 1052–1053) is the factor theorem, with Remark 5.3.9.
  - Lemmas 5.3.10–5.3.13 (pp. 1053–1057) prove it.

### Fix

**1. New sub-stage `TorsionCohomologyInfrastructure:TC.3:factor-separation`.** In `content/campaign/TorsionCohomologyInfrastructure/README.md`, insert at the start of the TC.3 section, as ALS.5:finite-level-duality is laid out:

> <a id="stage-TC.3:factor-separation"></a>
>
> **TC.3:factor-separation (early, input-free).** Prove Scholze's Lemma 5.3.8 (published pp. 1052–1053; arXiv v2 Lemma V.3.8).
> - **Data.** G is a group and R a commutative ring. For m ∈ Z, g ↦ P_g^{(m)}(X): G → R[X] takes values in polynomials of degree n_m with constant term 1, where n_m = 0 for all but finitely many m. Put n = Σ_m n_m.
> - **Hypothesis.** There is an n-dimensional determinant D̃: R[G][V^{±1}] → R[T^{±1}] with D̃(1 − V^k X g) = ∏_m P_g^{(m)}(T^{km} X) in R[T^{±1}][X], for all g ∈ G and all k ∈ Z.
> - **Conclusion.** For each m there is an n_m-dimensional determinant D^{(m)}: R[G] → R with D^{(m)}(1 − Xg) = P_g^{(m)}(X).
>
> Include its proof:
> - the uniqueness of the decomposition by T-weight (Lemma 5.3.10);
> - the multiplicative maps D_0^{(m)} (Lemmas 5.3.11–5.3.12);
> - the splitting of a multiplicative polynomial law into homogeneous pieces (Lemma 5.3.13).
>
> Also prove the algebraic steps of Lemmas 5.3.6–5.3.7 (pp. 1050–1052), taking their arithmetic inputs as hypotheses:
> - gluing determinants given along a family of characters that separates A[T^{±1}] into one determinant valued in A[T^{±1}]/I;
> - the reparametrizations T ↦ T^a;
> - the bound J^{4(d+1)} = 0 on the coefficient ideal, from I^{4(d+1)} = 0.
>
> Pointwise factorization of each characteristic polynomial does not meet these hypotheses: the Laurent-variable identity must hold for every g and every k. Import determinants, polynomial laws and descent to the subring of coefficients (Chenevier, Corollary 1.14) from IntegralHeckeAndGaloisDeterminants IHG.0–IHG.1. Use no TC.0–TC.2 geometry and no torsion cohomology. The consumers are TC.3 and AutomorphicGaloisRepresentationsPartII AG2.4.

**2. TC.3, first paragraph.** Replace "Build the abstract factor-separation lemma using actual auxiliary characters with the source's separation property, the coefficient-ring endomorphisms and determinant identities. Prove uniqueness, change-of-ring and compatibility when two choices of auxiliary data yield the same factor. Include the case of nilpotent coefficient quotients." with:

> Apply TC.3:factor-separation to the actual auxiliary characters of §5.3: the auxiliary extension and the twisted determinants (Lemmas 5.3.2–5.3.3), the continuous interpolation g ↦ P_g (Lemma 5.3.4, Corollary 5.3.5), and twists with the source's separation property. Prove uniqueness, change-of-ring and compatibility when two choices of auxiliary data yield the same factor, including nilpotent coefficient quotients.

The next sentence ("The ability to factor a polynomial pointwise is insufficient …") is unchanged.

**3. TC source table.** Replace the row "| §5.3 | TC.3 below | Algebra of extracting factors from determinant-valued Hecke data |" with:

> | §5.3 | TC.3:factor-separation; TC.3 below | The input-free factor-separation algebra (Lemma 5.3.8 with Lemmas 5.3.10–5.3.13, and the algebraic steps of Lemmas 5.3.6–5.3.7); its instantiation with the auxiliary characters (Lemmas 5.3.2–5.3.5) |

**4. `data/atlas.json`.**
- Add the stage record `TorsionCohomologyInfrastructure:TC.3:factor-separation`:
  - owner `TorsionCohomologyInfrastructure`, key `TC.3:factor-separation`, title "Boundary induction and determinant factor extraction — factor separation", `parentStageId` `TorsionCohomologyInfrastructure:TC.3`;
  - `requires`: `IntegralHeckeAndGaloisDeterminants:IHG.0` and `IntegralHeckeAndGaloisDeterminants:IHG.1`;
  - `consumers`: `TorsionCohomologyInfrastructure:TC.3` and `AutomorphicGaloisRepresentationsPartII:AG2.4`.
- Add it to the `requires` of TC.3 (its parent) and of AG2.4.
- Add IHG.4 to AG2.4's `requires`, and AG2.4 to IHG.4's `consumers`.
- Add the matching `stageEdges` records.
- The verifier's larger candidate, with IHG.4 and IHG.5 also as inputs, passes the cycle test too. They are not needed for this algebra.

**5. `content/campaign/AutomorphicGaloisRepresentationsPartII/README.md`, AG2.4, third paragraph.** Replace "Attach degree-2n Galois determinants to those classical forms through AG2.3, prove compatibility of the congruences and take the justified p-adic limit. Prove the algebraic separation argument extracting the two degree-n constituents while varying the twist, including uniqueness by Frobenius polynomials and descent from auxiliary CM extensions." with:

> Attach degree-2n Galois determinants to those classical forms through AG2.3, and prove compatibility of the congruences. Take the p-adic limit by applying IntegralHeckeAndGaloisDeterminants IHG.4's finite-quotient interpolation to these congruence data, checking its uniform congruence bounds, continuity and finite ramification set here; do not reconstruct the interpolation. Extract the two degree-n constituents by applying TorsionCohomologyInfrastructure TC.3:factor-separation (Scholze's Lemma 5.3.8). First prove that HLTT's family of twists, with its congruence limits and coefficient conventions, gives a determinant on R[G][V^{±1}] with the Laurent-variable factorizations that theorem requires, for every g and every integer k; pointwise factorization is not enough. Keep here uniqueness by Frobenius polynomials and descent from auxiliary CM extensions.

The last sentence of the paragraph ("Deliver the characteristic-zero semisimple system of HLTT …") is unchanged.

**6. AG2 README, scope.** After "None consumes the torsion concentration theorem IG.7, Scholze torsion interpolation, or the final potential-automorphy output.", add:

> AG2.4 imports only TorsionCohomologyInfrastructure TC.3:factor-separation, the input-free determinant algebra of Scholze's §5.3, which uses no torsion cohomology.

AG2.4's sentence "This coefficient theorem precedes and does not use Scholze's torsion Hecke interpolation" stays true.

**7. Ownership.** The abstract theorem stays in TorsionCohomologyInfrastructure, as RS-24 decided; the sub-stage only separates it from TC.2. The verifier also allows the IHG placement. If the maintainer prefers it, that belongs in the next restructuring pass, because RS-24's keep-list puts the theorem in TC.3.

**8. PAPER-SCHOLZE-15, at its review.**
- Items 104–107 (Lemmas 5.3.8–5.3.13): `planned` should name TC.3:factor-separation. Items 104, 106 and 107 keep IHG.0 as well.
- Item 103 (Lemmas 5.3.6–5.3.7): `planned` should name TC.3:factor-separation and TC.3.

**Cycle test.**
- For the new sub-stage: neither of its consumers, TC.3 and AG2.4, reaches IHG.0 or IHG.1.
- The cycle test for IHG.4 → AG2.4 finds no path AG2.4 → … → IHG.4.
- Both hold jointly with /9, /18 and /20: acyclic.

**When:** now (edits 1–7); review (edit 8).

## /27 (medium, missing): IHG.1 owns the codimension-zero congruence module and ideal

### What the verifier corrected
- **The gap.** AutomorphicCongruences L0 imports congruence modules from IHG, but IHG.1 plans only reducibility and extension modules. R20.1, PadicFamilies:L1 and I.5 need concrete congruence modules.
- **Two different settings.** IKM (arXiv:2206.08212v3, pp. 2–4) separates the classical finite-flat setting from the higher-codimension Ext-cokernel definition.
- **IKM Proposition 2.10** (pp. 16–17) makes the codimension-zero comparison a surjection in general and an isomorphism under depth ≥ 1. An arbitrary torsion module cannot be given the direct-sum formula without these hypotheses.
- **The congruence ideal.** For a finite flat augmented algebra, also state the congruence ideal λ(Ann_A ker λ) and its comparison with the module, under the appropriate generic-point condition.
- **One owner.** Choose one foundational owner and expose the codimension-zero API to all four consumers. The minimal repair is to extend IHG.1, with a coordinated later handoff.
- **No duplicate.** PAPER-IYENGAR-KHARE-MANNING-24's CongruenceModulesHigherCodimension route is rejected (overall verdict: revise). If it is revised, reconcile the common c = 0 construction rather than keep parallel definitions.
- **The graph.** IHG.1 already reaches L0 directly and R20.1 transitively. Only the PadicFamilies:L1 and I.5 edges are new for reachability, and the whole set is acyclic.
- **The consumers keep** arithmetic localization, saturation, periods and the Selmer-class proofs.

### What main says now
- **L0** (`content/campaign/AutomorphicCongruences/README.md`, line 22): "Import congruence ideals/modules, generalized matrix algebras, pseudorepresentations, reducibility ideals and the general extension-class construction from IntegralHeckeAndGaloisDeterminants." The edge IHG.1 → L0 exists (RS-24).
- **R20.1** (`content/campaign/SerreWeightAndLevelOptimisation/README.md`, line 28): "Construct the old/new exact sequences and congruence modules from the actual integral Hecke modules." IHG.1 reaches it only through R01.5.
- **PadicFamilies L1** (`content/campaign/PadicFamilies/README.md`, line 36): "Define the associated period modules and congruence modules." It has no IHG ancestor.
- **IntegralIwasawaTheory I.5** (`content/campaign/IntegralIwasawaTheory/README.md`, line 48): "The proof programme includes Hecke algebras at the needed levels and weights, Eisenstein ideals, congruence modules, Galois representations and stable lattices, …". It has no IHG ancestor.
- **IHG.1** (line 17) mentions only "reducibility ideals, extension modules and the lattice constructions used by congruence arguments".
- **IKM route 1** (Part II "CongruenceModulesHigherCodimension" under DeformationAndDerivedPatchingAlgebra) has verdict `reject`: "generic local duality/Tate ownership and cited-source closure remain unresolved (G1–G3) … Do not activate a consumer-owned duplicate foundation." The paper's overall verdict is `revise`.
- **Library.**
  - AUDIT-23 on L0: "grep finds no congruence ideal or module".
  - AUDIT-15 on L1: "No period or congruence modules of a Hecke algebra exist in either library".
  - AUDIT-25 on I.5 records no congruence modules.
  - The pinned declaration index has no `congruenceModule` or `congruenceIdeal`.

### Fix
1. **IHG.1 prose** (line 17). After the sentence added for /17, add:

   > Own the congruence ideal and the codimension-zero congruence module of an augmentation. Let A be a complete Noetherian local O-algebra, λ: A → O a surjective O-algebra map and p = ker λ.
   > - **The congruence ideal.** η_λ := λ(Ann_A p) (Darmon–Diamond–Taylor, *Fermat's Last Theorem*, §5.1, printed p. 138). Prove η_A ⊂ η_B for a surjection A → B of augmented rings (DDT (5.2.2), p. 141).
   > - **The module.** For a finitely generated A-module M, Ψ_λ(M) := M/(M[p] + M[Ann_A p]). This is Diamond's module. IKM print it with ⊕ on p. 3; the sum is direct when M is O-torsion-free and A is finite flat and regular at p, since M[p] ∩ M[Ann_A p] is then killed by a power of ϖ.
   > - **The finite-flat comparison.** For A finite flat over O and regular at p, prove Ψ_λ(A) ≅ O/η_λ. Regularity at p means A ⊗ K = K × B′ with λ the first projection. Then Ann_A p = A ∩ (K × 0), and Ann_A(Ann_A p) = p, so A/(p + Ann_A p) ≅ O/λ(Ann_A p).
   > - **IKM's comparison, only under its hypotheses.** For A regular at p of codimension zero, the natural map M/(M[p] + M[Ann_A p]) → coker(M[p]^tf → (M/pM)^tf) is surjective with torsion kernel. It is an isomorphism when depth_A M ≥ 1 (IKM Proposition 2.10, pp. 16–17). It fails without depth (Example 2.11, p. 17: A = O[[t]]/(ϖ²t), M = A/(ϖ³)).
   > - **Out of scope.** The higher-codimension theory (c ≥ 1) is not owned here.
   > - **Acceptance.** DDT Examples 1, 3 and 7 (p. 139–140): η = (λⁿ), η = 0 for A = O[[X]]/(X²), which is not regular at p, and η = (λ) for the non-flat O[[T]]/(λT). Also IKM Example 2.11.
   >
   > The consumers instantiate this on their Hecke modules and keep their localization, saturation, period and Selmer-class arguments.
2. **Consumer prose.**
   - **R20.1** (line 28). Old: "Construct the old/new exact sequences and congruence modules from the actual integral Hecke modules." New: "Construct the old/new exact sequences from the actual integral Hecke modules, and instantiate on them the congruence module and congruence ideal of IntegralHeckeAndGaloisDeterminants IHG.1."
   - **PadicFamilies L1** (line 36). Old: "Define the associated period modules and congruence modules." New: "Define the associated period modules, and instantiate IntegralHeckeAndGaloisDeterminants IHG.1's congruence module and ideal on the ordinary Hecke module."
   - **I.5** (line 48). Old: "…Eisenstein ideals, congruence modules, Galois representations…". New: "…Eisenstein ideals, the congruence modules of these Hecke algebras (instances of IntegralHeckeAndGaloisDeterminants IHG.1's construction), Galois representations…".
   - **L0** already says it imports them, and is unchanged.
3. **Stage edges.**
   - Add IHG.1 → PadicFamilies:L1 and IHG.1 → IntegralIwasawaTheory:I.5. These are the only new reachabilities.
   - Optionally add IHG.1 → SerreWeightAndLevelOptimisation:R20.1 as documentation, since R20.1 is reached today only through R01.5's reconstruction path.
   - The joint cycle test for the three edges is acyclic. IHG.1's only ancestors are IHG.0 and the Mathlib sentinel.
4. **IKM coordination note** (for the paper's next revision; nothing is activated now). If route 1 (CongruenceModulesHigherCodimension) is revised, its items `congruence-module`, `prop-2-10` and `ex-2-11` must import IHG.1's codimension-zero API and extend it to c ≥ 1. They must not define a second codimension-zero module.

**When:** now for the prose and the edges; revision for the IKM note.

**Sources.**
- S. B. Iyengar, C. B. Khare and J. Manning, arXiv:2206.08212v3, pp. 2–4 and 12–17. Read 29 September 2026; SHA-256 8f061724a1800af6319492108835f4db0fd640b93750c213fd1bb313bb8c9d7b.
- H. Darmon, F. Diamond and R. Taylor, *Fermat's Last Theorem*, author PDF https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf, §§5.1–5.2, printed pp. 138–142. Read 29 September 2026; SHA-256 254f6e29957f95219eff046c29478f5ee584615bee12c8aa8357f499c8cbe8b3.

## Findings not applied

- **Rejected findings.** /11 (medium): the accepted ClassFieldTheory links CFT-L85, CFT-L86 and CFT-L87 already feed ET.0. /23 (medium): IG.3 already has the minimal/open period-map route and the toroidal-to-minimal comparison. /28 (low): the accepted Chebotarev link already gives Layer 10 → ET.3. No change.
- **Confirmed low findings, outside this job** (PROTOCOL.md section 17). They are recorded here only so that a later job can pick them up:
  - /29, R01.6's elliptic Tate-module wording;
  - /30, AG2.0's rationality instruction, against AF.4;
  - /31, ArithmeticGaloisRepresentations:G7's citation of the Tau Ceti exterior, symmetric and tensor power constructors;
  - /32, the elementary proof that closes the gap of node R01.4/bad-dihedral-representations-and-the-oddness-criterion (Serre 1987 §3.3);
  - /33 and /35, one shared repair at IHG.1 for node R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent: Chenevier's Theorem 2.22(i) with the finite-field splitness bridge;
  - /34, IG.5's reuse of Tau Ceti's Hecke anti-involution with SR.1.
