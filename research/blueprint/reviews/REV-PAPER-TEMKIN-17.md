# REV-PAPER-TEMKIN-17: review of the extraction of Temkin, *Tame distillation and desingularization by p-alterations*

**Verdict: accept.** All three routes are accepted. The three recorded mistakes are confirmed, and one new misprint is added and confirmed. No status, statement or route changes; two notes were added.

Reviewer: Claude Code, session `cc-fb70e5`, 29 September 2026. Extraction under review: Claude Code, session `cc-39fac3`, issue #1155 (PR #4290). It has 64 items (4 library, 5 planned, 55 missing), 3 routes and 3 `sourceIssues`, with status `complete`. `cc-fb70e5` appears nowhere in its files.

Source: Ann. of Math. **186** (2017), 97–126, [doi:10.4007/annals.2017.186.1.3](https://doi.org/10.4007/annals.2017.186.1.3). I read the free Annals PDF (SHA-256 `1f4ac06f…`) and [arXiv:1508.06255v2](https://arxiv.org/abs/1508.06255) (`24f67ac3…`, 21 February 2017, the last version); both match the record. The Annals page, the Crossref record and the arXiv listing record no correction (checked 29 September 2026).

## 1. Items: complete and accurate

I read all 30 pages. Every numbered theorem, lemma and corollary from Theorem 1.2.5 to Theorem 4.3.1 appears in an item locator. So do the remarks that carry mathematics: 1.2.3, 2.3.6 (inside §2.3.5–2.3.7), 2.4.7, 3.2.6 and 4.3.4. Remarks 1.2.6, 3.1.4 and 4.1.3 are commentary with no statement of their own.

I checked the arguments of §§2–3 line by line. They hold, and the extraction's notes already record their subtle points:

- **§2.4.6.** The reformulations cycle (0) ⇒ (4) ⇒ (3) ⇒ (2) ⇒ (1). For (4) ⇒ (3), the fixed field of a section of G_{k^s/k} → G_{k^t/k} is linearly disjoint from k^t. It is therefore purely wild, so it is trivial when k = k_w.
- **Theorem 2.6.6.**
  - The height induction uses that k_i and k̃_i stay p-closed.
  - It uses that |k_i^×| is p-divisible, since otherwise k(a^{1/p}) would be a degree-p extension.
  - The general case descends to a subfield of finite transcendence degree. Its algebraic closure in k stays p-closed: a separable p-extension of it stays a field over k because the minimal polynomial keeps its coefficients, and k is perfect.
- **Lemma 3.3.4.** The non-tame locus is ⋃ Y^H ∩ Y(p) over pairs (H, p) with p dividing |H|. Here Y^H is the scheme-theoretic fixed locus, so a point lies in it exactly when H fixes the point and acts trivially on its residue field.
- **Theorem 3.3.6.** It needs L′/K′ separable before Lemma 3.3.7 applies. Separability follows from tameness at the trivial valuation, which has a center on X; the item's note says so.

## 2. Statuses: all hold

The four library citations resolve at Mathlib 082e2d3 and provide their items:

- `Valuation`, `ValuationRing` and `ValuationSubring`;
- `Field.exists_primitive_element`;
- `AlgebraicGeometry.IsProper.eq_valuativeCriterion`;
- `Algebra.IsEtaleAt.exists_isStandardEtale`, Chevalley's local structure of étale algebras.

The five planned items hold against the full stage text:

- **AdicCoefficientsAndComparisons L5** plans de Jong's Theorems 4.1 and 6.5, "flattening by blowup, strict transforms", "normalization under the applicable excellence hypotheses", and the curve-fibration and semistable reduction steps.
- **CrystallineCohomology:CR.5:log-algebra** plans "the chart criteria with torsion-order invertibility conditions", which is Temkin's §1.2.7 criterion.

I searched both libraries for the 55 missing items. Mathlib has `HenselianLocalRing` and `IsKrasner`, but `IsKrasner` covers only complete normed fields; both are already noted on their items. It has no Prüfer domains, henselization of valued fields, Riemann–Zariski spaces or alterations. Tau Ceti has only local-field henselianity.

One note was added. §4.3.2 derives Theorem 1.2.5 from Theorem 4.3.1(i), but universal P-resolvability (§4.1.4) does not include projectivity. The projective b in Theorem 1.2.5 comes from 4.3.1(ii), and the note on `theorem-1-2-5` says so.

## 3. Routes: all three accepted

**Route 1: joins `PrimeToDegreeAlterations`** (Part II of AdicCoefficientsAndComparisons). PAPER-DITTMANN-POP-23 proposed it, and its review accepted it. PAPER-JANNSEN-16's route 7 joins it too and was accepted by that review. Id, title, parent and area agree, and the title reproduces "Adic coefficients and comparison with schemes".

L5 plans only alterations without degree control. Nothing in the atlas owns Riemann–Zariski spaces of pointed schemes: DiamondEtaleCohomology:C5's Zariski–Riemann models are for strictly totally disconnected spaces. Nor does anything own tame loci, tame distillation or char(X)-altered desingularization. The brief lists the final theorems, uses Cossart–Piltant as the base, and carries E1's repair.

**Route 2: `LocalFieldsPartIIGeneralValuedFields`** (Part II of Tau Ceti's LocalFieldsRamification). The title reproduces "Local fields and ramification". Tau Ceti roadmaps take Part IIs, and the pending DESIGN-LocalFieldsRamificationPartII folds this one with the FiniteLengthModules and KatoSwanConductors proposals.

Ramification theory of arbitrary Krull-valued fields has no atlas owner. ClassicalAdicEtaleCohomology:H1:henselian constructs affinoid henselian pairs, not henselizations of valued fields. The brief states Temkin's Theorem 2.6.6 as its final theorem and names the Mathlib inputs that exist.

**Route 3: source → CR.5:log-algebra.** The stage resolves. The log structure of a divisor and Kato's log regularity sit naturally beside its prelog rings, charts and log-smooth morphisms.

## 4. Mistakes in the paper: 3 of 3 confirmed, 1 added

- **E1** (gap, affects the proof; pp. 121–122): confirmed. Theorem 4.2.1 assumes only char(X) ⊆ P. But Step 4 distills all of S̄ → S through Theorem 3.3.6, which yields a P^w_{S̄/S}-alteration, and P^w_{S̄/S} ⊆ char(S) need not lie in P.

  Gabber's ℓ′ case, [IT14b, Th. 3.4], needed tameness of the Sylow action only over X, so char(X) ⊆ {ℓ}′ sufficed there; distillation has no such locality. The theorem is used only in Theorem 4.3.1, where char(S) ⊆ P, so no main result is affected. The recorded repair over S₀ is plausible but is a sketch. The blueprint should prove it, or state the theorem with char(S) ⊆ P.
- **E2** (misprint; p. 120): confirmed. The proof of Lemma 3.3.7 calls the nontrivial direction "the inverse one", proves it, and writes L, S′ where L′, S are meant.
- **E3** (misprint; p. 112): confirmed. The proof cites "Corollary 2.5.6(ii)", but Corollary 2.5.6 has no parts.
- **E4** (new, misprint, affects nothing; p. 112, proof of Lemma 2.6.3(ii)). The proof reads "p = char(K̃_i) divides [L̃_i : K̃_i]". But p_i = exp.char(k̃_i) is 1 for i < n, and that branch is reachable: L_i/K_i is then tame and defectless, and p can divide f without dividing e. There char(K̃_i) = 0.

  The argument survives with the right prime, the residue characteristic p of K̃_i's valuation: K̃_i = (K̃_i)^u has separably closed residue field of characteristic p, so an extension of degree divisible by p is not tame. The same sentence is in arXiv v2, p. 13.

The proof of Lemma 3.2.10 also refers to "the first part of the theorem" where it means the lemma. That is not registered.

## 5. Checks

`scripts/check_paper.py` passes on the corrected extraction. The review's changes are the four `review` verdicts, E4, and the notes on `lemma-2-6-3-ii` and `theorem-1-2-5`. The report's section "Corrections by the independent review" lists them.
