# Red team: PAPER-GAN-ICHINO-18 (Gan–Ichino, *The Shimura–Waldspurger correspondence for Mp_2n*)

Job `RT-PAPER-GAN-ICHINO-18` (issue #4108), by Claude Code, session `cc-f805bf`, 30 September 2026. The findings are in `RT-PAPER-GAN-ICHINO-18.result.json`, in the format of PROTOCOL section 17.

**Result:** 12 findings: 6 medium and 6 low.

- **The extraction.** It is careful: 104 items (1 library, 21 planned, 82 missing), 6 routes and 7 source issues.
  - The statements match the published text.
  - The one library claim holds at the pins.
  - The review's source issues check out, including E7, the counterexample to Jiang–Soudry Th. 2.2(2).
- **What breaks.**
  - Route 2 makes MP.3 depend on its own Part II.
  - Root numbers and the ε-compatibility of the local Langlands correspondence, which Lemma 4.3 rests on, have no item.
  - Two statuses stay "planned" against the review's own evidence.
  - The unitarity input of Corollary 4.2 has no item.
  - Two pieces of harmonic analysis, and the p-adic Langlands quotient theorem, each have three owners.

## Independence

- **Who did the work.**
  - The extraction is by Claude Code `cc-d67081` (issue #1149, PR #1942, 22 September).
  - The review, REV-PAPER-GAN-ICHINO-18, is by Claude Code `cc-39fac3` (issue #1150, PR #2527, 23 September).
  - These are the only session ids in the result, the report, the review JSON and the review report. `cc-f805bf` appears in none of them.
  - There is no `research/blueprint/errata/` file for this paper, and the register has no duplicate record.
- **Disclosure.** This session did earlier work that touches this paper's area:
  - it red-teamed PAPER-DOR-23 (PR #4815), whose finding /5 is about the Weil representation and a MetaplecticAutomorphicForms extension;
  - it red-teamed PAPER-NELSON-VENKATESH-21 (PR #4740), whose finding /5 is about owners of the real Langlands classification;
  - it wrote FIX-RT-AREA-automorphic-1, which proposes MP.6 Siegel–Weil instances (/19), MP.6:jacobi and AF.1b.

  How that bears on this report:
  - Finding 2 mentions AF.1b only for the archimedean ε-factors, and does not rely on it.
  - Finding 6 is about the p-adic classification, not the real one.
  - Finding 7 agrees with FIX /19 but rests on the paper alone.
  - Route 5 (AF.1 → AF.1b) is not raised again here.

## What was read

- **The published paper.** Ann. of Math. 188 (2018) 965–1016, from the Annals site, read in full through pdftotext.
  - Its SHA-256 `be54266f…87d68c0` reproduces the extraction's hash.
  - Printed pp. 975 and 1003 were rendered as images. They confirm the complex conjugates that the review added.
- **arXiv 1705.10106v3.** Its hash `5d1408c5…b291d` reproduces the extraction's.
  - It was compared at every passage used, including reference [44] (E4).
  - v3 is the latest arXiv version, and Crossref records no correction.
- **Ishimoto, arXiv:2301.12143v2.** Read at the introduction, Theorems 3.11–3.14 and §5.1.
- **The repository.**
  - All 104 items, the six routes and the route-1 brief, the seven source issues, the report and the review.
  - The stages cited: MP.0–MP.8, ML.4–ML.5, AL.2–AL.4, ET.6, GZ.4–GZ.5, R17.1, R17.3 and AS.4, and the Tau Ceti quadratic-form layers.
  - The MP, ML and AL packets, and the queue.
  - Twelve other extractions: Gan–Savin 23 and 23-B, Ichino–Prasanna 23, Chenevier–Taïbi 20, Dor 23, Nelson–Venkatesh 21, Beuzart-Plessis–Chaudouard–Zydor 22, Jiang–Zhang 20, Cai–Friedberg–Kaplan 24, Eischen–Harris–Li–Skinner 20, Li–Liu 21 and Disegni–Liu 24.
- **The libraries.** Mathlib `082e2d3` and Tau Ceti `f790474`. Every cited declaration was opened, and the index was searched for what is marked missing.

## What holds up

- **Statements.** Every theorem item matches its locator. The corrected items are right: automorphic-theta and whittaker-mp with their conjugates, local-shimura, kudla-filtration, llc-so-inner and prop-a-2.
- **Re-derived.** The following were checked independently:
  - the pole argument of Proposition 3.1, with E5;
  - Lemma 4.3's sign, including the orthogonality of Sym² Std_i and Std_i ⊠ Std_j;
  - the ψ_a-twist of Remark 1.3;
  - Lemmas 6.8, 6.10, 6.11 (including the real case) and 6.12;
  - Corollary 6.7;
  - the Hasse-sign counterexample (−1, −1)^{r(r−1)/2} on H^r ⊕ ⟨1⟩ over Q₂;
  - the Krasner construction in rev-number-fields-with-prescribed-completions.
- **Source issues.**
  - The rejections of E1–E3 are right.
  - E4 is right: the published [44] is the Märchen.
  - E5 and E6 are right.
  - E7 is right. By the conservation relation, the extension σ′^{−ε} of a generic supercuspidal of SO_{2n−1} first occurs at Mp_2n. It gives a ψ-generic supercuspidal whose lift to SO_{2n+1} is not supercuspidal.
- **Libraries.**
  - Mathlib: `Matrix.symplecticGroup` (SymplecticGroup.lean:101) and `IsKrasner` (Krasner.lean:56).
  - Tau Ceti: `orthogonalGroup` (:133), `specialOrthogonalGroup` (:290), `hyperbolicPlane` (Hyperbolic.lean:68), `signedDiscr` (Discriminant.lean:157) and `CliffordAlgebra.spinorNorm` (SpinorNorm/Basic.lean:213).
  - Neither library has metaplectic, Weil-representation, Hasse or local-Langlands declarations.
- **Owners.**
  - No route lands in a finished blueprint: MP.3–MP.7, ML.4–ML.5 and AL.2–AL.4 are all not_read.
  - The Part II design job (DESIGN-MetaplecticAutomorphicFormsPartII) is pending.
  - The Ginzburg–Rallis–Soudry descent at ML.5, Howe duality and the conservation relation at MP.3, and the unramified theta relation at MP.3 all agree with the other extractions.

## Findings

### Medium

1. **Route 2 makes MP.3 depend on its own Part II** (route 2 against route 1).
   - **The items affected.** Five MP.3 items are stated with Part II constructions:
     - induction-principle, mvw-involution and unramified-theta use Ind_{P̃}(τ̃_ψ ⊗ π_0), the preimages P̃ and χ_ψ, which are item metaplectic-induction (route 1);
     - unramified-theta and rev-unramified-theta-correspondence-from-mp use the ψ-relative parameter of rmk-5-3;
     - rev-dependence-of-theta-lifts-on invokes the Π_{φ,ψ} labelling and Proposition 6.1, and adds a global choice of Ψ.
   - **An inconsistency.** kudla-filtration is marked planned at MP.3 although it needs the same preimages P̃(X_r).
   - **Why it matters.** PROTOCOL §15 says a Part II "starts where the existing roadmap stops".
   - **Fix.**
     - Move the local part of metaplectic-induction to MP.3, with χ_ψ taken from MP.2's Weil index.
     - State the two unramified items with Satake data only.
     - Split rev-dependence-of-theta-lifts-on between the two routes.
2. **Root numbers and ε-compatibility have no item.**
   - **Where they are used.** Lemma 4.3 needs ε(s, φ, Std_i) = ∏_v ε(s, Std_i ∘ φ_v, ψ_v) = ε(s, φ_i), and "L(1/2, φ_i) ≠ 0 ⇒ ε(1/2, φ_i) = 1". The first is local Langlands for GL_m preserving ε-factors at every place. The second is the functional equation of L(s, φ_i).
   - **What depends on it.** Lemmas 6.8, 6.11 and 6.12, and rev-epsilon-dichotomy-and-coherence.
   - **Undefined L-functions.** The complete L(1/2, Φ) and L_ψ(s, Π) are never defined; partial-l-function gives only L^S_ψ.
   - **Fix.**
     - Add a planned item citing AL.2 for the functional equation.
     - Add L/ε preservation to llc-gln-padic (ET.6) and llc-gln-arch.
     - Add a route-1 item for L_ψ(s, Π).
3. **Two statuses stay "planned" against the review's own evidence.**
   - **selfdual-types.** It is planned at ML.4, but no stage plans ∧² or Sym² L-functions or Shahidi's non-vanishing. An atlas search finds none.
   - **partial-l-function.** It is planned at AL.4, which proves convergence only "where a supplied eigenvalue bound ensures it", and E5 needs exactly that bound.
   - **What the review did.** It recommended "missing" for both, but changed no status, so no job receives them.
   - **Fix.** Make selfdual-types missing and route it to ML.4. Split off the exponent bound as a missing route-1 item.
4. **The unitarity of π_{φ_v} has no item** (Corollary 4.2).
   - **What the paper says.** p. 980: "Note that such π_{φ_v} is unitary (see [86] and Remark 5.3 below)". [86] is Tadić.
   - **Why rmk-5-3 is not enough.** Its criterion misses the exponents x ± iy that occur, as the review noted in passing. Unitarity then follows from GL₂ complementary series and unitary induction on the cover.
   - **Fix.** Add a route-1 item. It imports the generic unitary dual of GL_n, which PAPER-JIANG-ZHANG-20 routes to ET.6, and rmk-5-3.
5. **Weak containment and Poincaré series have three owners.**
   - **Weak containment and isolation.** GI's rev-whittaker-plancherel-support-and-weak (iii) says weak containment plus isolation gives isomorphism. Gan–Savin 23-B's route 3, SmoothRepresentationsPartIIUnitaryDual, plans the same statements: Proposition 11.6 and Corollary 11.7, "stated also for finite products".
   - **The Poincaré-series theorem.** Sakellaridis–Venkatesh's theorem is GI's rev-whittaker-poincare-series-on-mp and (ii). Gan–Savin 23-B item 91 routes it to LocalLanglandsCorrespondenceForG2, and that item already covers the Whittaker case "[GI, proof of Prop. A.2]".
   - **Fix.**
     - Make SmoothRepresentationsPartIIUnitaryDual the owner of weak containment, for second-countable locally compact groups so that Mp_2n(F_S) is included.
     - Give the Poincaré-series theorem one owner, for the Whittaker and the H-period cases.
6. **The p-adic Langlands quotient theorem has three owners.**
   - **The three.**
     - SR.3, through Gan–Savin 23 route 3, accepted 24 September;
     - the doubling Part II, through Cai–Friedberg–Kaplan 24, "planned nowhere and are built here";
     - GI's langlands-quotient-covers, for finite central covers, in route 1.
   - **Why it matters.** PROTOCOL §15 asks for one owner, in the most general form the uses need.
   - **Fix.** Plan the theorem once at SR.3 in Ban–Jantzen's generality, and keep only Mp_2n's standard modules in route 1.

### Low

7. **The Rallis inner product formula is named but never stated.**
   - **What is missing.** Its normalization with L^S_Ψ(1/2, Π) and the local doubling integrals, the local non-vanishing criterion, and its regularized Siegel–Weil input. [43] and [23] are both titled "A regularized Siegel-Weil formula …".
   - **Fix.** State them in the item and in brief layer (4).
8. **Strong multiplicity one has further owners.**
   - **The conflict.** GI route 6 (AL.3) agrees with four other extractions. The doubling Part II brief ("built here") and Gan–Savin 23-B item 56 (the G₂ roadmap) conflict with them.
   - **Fix.** Make AL.3 the single owner.
9. **Two local theta facts each have a second owner.**
   - **MVW.** The MVW involution is at MP.3 here, and at the doubling Part II through Eischen–Harris–Li–Skinner 20's mvw-143.
   - **Li.** Li's stable-range non-vanishing is at MP.3/MP.4 through Ichino–Prasanna 23's item 085, and in this extraction's Part II through stable-range-local.
   - **Fix.** Give each one owner at MP.3.
10. **Ishimoto settles the review's open question.**
    - **What he proves.** Th. 3.14(2): "Let F be global. Then Theorem 3.12 holds", which is the near-equivalence decomposition for every non-quasi-split odd SO. It also gives Th. 3.13 for generic parameters.
    - **Consequence.** Both parts of (6.1) are theorems, once his packet labelling is matched with (5.3).
    - **Fix.** Update amf-nonsplit's note and the brief's fourth correction.
11. **An unrecorded gap on p. 1004.**
    - **What the paper does.** It normalizes ⟨f_v, f_v⟩ = 1 for all v ∉ S_∞ ∪ S "by [70, Lemma 4.4]".
    - **Why that is not enough.** Prasad–Schulze-Pillot's lemma needs a supercuspidal representation. At v ∈ S_0 the non-vanishing of P_v f̃_v comes from genericity of the principal-series component instead.
    - **Fix.** Record it as E8 (gap, affects the proof).
12. **No `sourceVersions`**, although E5 and E7 quote stated results.

## Checks

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-GAN-ICHINO-18.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on both files: 0 problems.
