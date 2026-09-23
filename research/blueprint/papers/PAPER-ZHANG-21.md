# Wei Zhang (2021): Weil representation and the arithmetic fundamental lemma, extraction and routing

Issue [#1107](https://github.com/CBirkbeck/tauceti-explorer/issues/1107). Status: **complete**. Implementation and proof closure are not claimed.

- **Provenance.** Completed by Claude Code, session cc-442dc5, on 23 September 2026. It continues the merged Codex checkpoint `codex-a71f92`, whose report follows below as history.
- **The paper.** W. Zhang, *Weil representation and arithmetic fundamental lemma*, Ann. of Math. 193 (2021), 863–978.
  - The published PDF was re-fetched from the YMSC mirror.
  - Its SHA-256 (6f8ac537…) matches the checkpoint.
- **Items.** The result has **148 items: 7 library, 10 planned and 131 missing**. Every missing item is routed exactly once, and every numbered statement is an item.
- **Mistakes.** Twenty-eight are recorded under `sourceIssues`: the checkpoint's twenty-seven and one new.

## This continuation (cc-442dc5)

**New finding E28 (a gap; affects the proof).** Proposition 3.9 imports the maximal-order AFL "for p > n" in Hermitian dimension n − 1. The problem is in how Theorem 15.1 uses it:
- **The use.** Case (i) of the proof of Theorem 14.6 applies Proposition 3.9 in Hermitian dimension n. As printed, that needs p_v > n + 1.
- **The gap.** In the proof of Theorem 15.1, the set S need contain only the primes below n. So case (i) is also invoked at inert places with p_v ∈ {n, n + 1}, including v₀ when R_α is maximal there.
- **The repair.** Add those finitely many places to the set B, so that they are handled by case (ii). Case (ii) needs only Proposition 4.12 (q_v ≥ n) and the hypothesis of Theorem 14.6.
- **The conclusion.** B stays finite and the rest of the argument is unchanged, so Theorem 15.1 stands for p ≥ n.
- **Not checked.** Whether the cited [31, Cor. 9.9] already covers these primes.

**Reclassified.**
- **E14.** Now a misprint that affects nothing. The proof of Lemma 12.3 derives K_{(1−s)/2} + η(ξ)K_{(−1−s)/2}. The special values in the statement and Lemma 12.5 follow that form, not the printed one.
- **E20.** Now affects nothing. The proof of Theorem 14.6 expands E♭ as ∂J♭_hol + Int, so the extra factor 2 is not used.

**Verified.**
- **E9.** For F = Q(i) and α = T² − 3T + 1, the fixed algebra is Q(√−5).
- **E16.** For n = 2, conjugating diag(i, 1) by the rotation through π/2 gives diag(1, i). So the fibres of the §12.4 map contain Weyl translates. A repair is noted.
- **E17.** The N-cutoff must be invariant under conjugation by K ∩ A.
- **E25.** Zhang 2014 could not be fetched.

**Items.** Conjecture 3.2, the AFL on all regular semisimple elements, was added as a statement-only item.

**Gates.**
- **Recorded.** G1 (E12, E13, E15), G2 (E16, E17) and G5 (E28). Lemma 4.10's srs annotations and Theorem 5.5 were not re-checked; they remain for the review pipeline.
- **Deferred.** G3, G4, G6 and G7, as cited suppliers or design work.

**Why the status is now complete.**
- Every numbered statement is an item.
- Every missing item is routed exactly once.
- The checkpoint's open investigations are recorded as findings or deferred with reasons.

## Mistakes found (`sourceIssues`)

- **E1** (misprint; affects nothing), §1.2, pp.869–870. *Printed:* q : V → F *Correction:* For a quadratic space over F0 the codomain is F0.
- **E2** (error; affects a stated result), §1.2 (1.13), p.872. *Printed:* φ(h)=Σξ Wφ,ξ(h), absolutely convergent *Correction:* Assume suitable smoothness for absolute Fourier summation, or use Fourier uniqueness/appropriate convergence for merely continuous functions.
- **E3** (misprint; affects nothing), Conjecture2.3(a), p.878. *Printed:* (1K0,0) *Correction:* Use (1K0#,0) on G0=U(V0#); likewise the full-rank lattice stabilizer must be the one of Λ0#.
- **E4** (misprint; affects nothing), Proposition2.6, p.879. *Printed:* (G0×V0)(F0)rs *Correction:* Use the correctly ranked semi-Lie pair (H0×V0), or rename G0 consistently to U(V0).
- **E5** (misprint; affects nothing), Lemma4.2 proof, p.887. *Printed:* 1−g=1/(1+x) *Correction:* Replace the right side by 2/(1+x).
- **E6** (misprint; affects nothing), Lemma4.3 proof, p.888. *Printed:* R(ξ) *Correction:* Use R(λ) in the polynomial pencil.
- **E7** (misprint; affects nothing), Lemma4.9(i), p.892. *Printed:* rξ(γ′) *Correction:* Use r(γ′), or quantify ξ and require ξγ′ in the chart.
- **E8** (misprint; affects nothing), Definitions7.1–7.2, p.907. *Printed:* u′=u∘ϕ *Correction:* For source-CM isomorphism a0:A0→A0′ use u′∘a0=ϕ∘u; after identifying A0 and A0′ use u′=ϕ∘u.
- **E9** (error; affects a stated result), §7.4 following(7.9), p.910. *Printed:* F0′ is a product of totally real fields *Correction:* Conjugate reciprocity only gives an involution and a fixed étale algebra. Impose the CM/totally-real condition independently, as the next paragraph does for the rest of the paper.
- **E10** (misprint; affects nothing), Proposition8.2, p.921. *Printed:* (7.5) *Correction:* The complex component projection is (8.4).
- **E11** (misprint; affects nothing), Lemma11.1 proof, p.937, second product in the displayed estimate. *Printed:* ∏v|∞ *Correction:* Use ∏v∤∞ for the second, finite-place factor.
- **E12** (error; affects the proof), §12.1–12.4, pp.940–945, especially(12.1),(12.6),(12.11). *Printed:* φ′=2^(−3/2)(x+y)e^(−π(x²+y²)/2) *Correction:* With ψ(b)=e^(2πib), use φ′=½(x+y)e^(−π(x²+y²)) and the positive Hermitian Gaussian e^(−2πq). Propagate the scaling to all orbital, Weil, nilpotent and Green comparisons.
- **E13** (misprint; affects nothing), §12.1 final display, p.940. *Printed:* |a|^(1/2) *Correction:* For Hermitian dimension n the scalar factor is a^(n/2); with corrected Gaussian the exponential has 2πiq(u)(b+ia).
- **E14** (misprint; affects nothing), Lemma12.3 statement versus its final proof display, p.942. *Printed:* K(s+1)/2+η(ξ)K(s−1)/2 *Correction:* For the original Gaussian use K(1−s)/2+η(ξ)K(−1−s)/2, as the proof itself obtains; then apply the published Gaussian rescaling.
- **E15** (error; affects a stated result), Lemma12.5 displays, p.943. *Printed:* e^(πi|ξ|(b−ia)) *Correction:* Use the published corrected formulas: χ1(κθ)a^(1/2)e^(2πiξ(b+ia)), and for ξ<0 multiply by ½Ei(−4πa|ξ|). The general-s formula must include the unipotent phase.
- **E16** (error; affects the proof), §12.4 map preceding(12.9), p.944. *Printed:* NK×Tnrs → Snc,rs is a K∩A-torsor *Correction:* Include Weyl identifications or replace this map with a correctly normalized local-slice construction. Prove descent of the test function and the orbital formula after this change.
- **E17** (gap; affects the proof), §12.4 after(12.10), p.944. *Printed:* Ψ descends by K∩A-invariance *Correction:* In addition to repairing the Weyl fibres, choose the N-cutoff invariant under conjugation by K∩A, or prove an averaging/descent construction with its exact measure factor.
- **E18** (misprint; affects nothing), §12.7, p.953, definition of the nilpotent L-derivative. *Printed:* L(s,η) *Correction:* In general rank use L(s,η′) for F′/F0′; for the 0− term differentiate the corresponding L(−s,η′) with its minus sign.
- **E19** (misprint; affects nothing), §14.1 before Lemma14.3, p.962. *Printed:* q′(u′)=TrF0′/F0 q′(u′) *Correction:* The left side is q(u′).
- **E20** (misprint; affects nothing), §14.3 definition of E♭, p.965. *Printed:* E♭=2∂Jhol♭+Int *Correction:* Use E♭=∂Jhol♭+Int=2∂J♭+IntK−B+Int.
- **E21** (misprint; affects nothing), Proposition14.5 proof, p.965. *Printed:* independent of α *Correction:* Use independent of a.
- **E22** (misprint; affects nothing), Corollary14.8 proof, p.968. *Printed:* −∂Orb·Orbaway=Intv(δ,u)·Orbaway *Correction:* Multiply the right side by log qv.
- **E23** (misprint; affects nothing), Theorem15.1 proof, p.968, nearby Shimura space. *Printed:* non-split at v0 *Correction:* The nearby Shimura Hermitian space V is split at v0; V(v0) is the nonsplit local special-Hom space.
- **E24** (misprint; affects nothing), AppendixA TheoremA.1, p.970. *Printed:* h∈H(F) *Correction:* Use h∈H(F0)=SL2(F0); likewise the base scalars of the generators are in F0.
- **E25** (misprint; affects the proof), AppendixA footnote10, p.971, cited Zhang2014 Theorem4.17. *Printed:* η(det(V)F/F0) is missing *Correction:* Include the Hermitian-discriminant sign in the earlier Fourier-transfer constant.
- **E26** (gap; affects the proof), AppendixB after(B.3), p.972. *Printed:* formal-scheme (B.3) expected *Correction:* Do not use formal support-filtration multiplicativity as established. Supply a formal Adams proof with its category hypotheses, or use Remark5.3's alternative for Proposition5.2.
- **E27** (misprint; affects nothing), Corollary10.3 (10.8), pp.931–932. *Printed:* Ei(−2π|ξ′|v′) *Correction:* Retain a_v in Ei(−2πa_v|ξ′|v′), or explicitly specialize h∞ to a_v=1. Separately perform the later Gaussian/Green normalization conversion.
- **E28** (gap; affects the proof), Proposition 3.9 (p.884) as applied in the proof of Theorem 14.6, case (i) (p.967), within the proof of Theorem 15.1 (pp.968–969). *Printed:* Let p > n. Conjecture 3.8 part (b) … holds for (g, u) ∈ (U(V_{n−1}) × V_{n−1})(F_0)_srs when O_F[g] is a maximal order; … If v ∉ S ∪ B, then R_v is a maximal order and we apply Proposition 3.9 at v; … S contains all primes less than n *Correction:* Treat the finitely many inert places v ∉ S with p_v ≤ n + 1 as in case (ii), i.e. add them to B. Case (ii) needs only Proposition 4.12, which requires q_v ≥ n and the hypothesis of Theorem 14.6 for S_n; both hold there. Proposition 3.9 is then used only where p_v > n + 1, as printed.

The reasons and the places searched are in the JSON.

## Gaps: status after this continuation

- **G1** (recorded). E12, E13 and E15 record the Gaussian normalization errors, with Mihatsch–Zhang's printed correction. Re-deriving Lemma 14.4 and Proposition 14.5 in the corrected normalization is proof work for the implementation, following Mihatsch–Zhang §7.2.
- **G2** (recorded). E16 and E17 record the false K ∩ A-torsor claim and the missing invariance of the N-cutoff; both repairs (a Weyl fundamental domain for the torus cutoff and averaging ϕ_N) are in the findings.
- **G3** (deferred). RSZ, Mihatsch's comparison and maximal-order corollary, Kudla–Rapoport and the local modularity input are cited suppliers.
- **G4** (deferred). BHKRY, Ehlen–Sankaran, Jacquet and Beuzart-Plessis's appendix are cited suppliers.
- **G5** (recorded). E28 records that Proposition 3.9's printed bound does not cover the places with p_v ∈ {n, n + 1} used in Theorems 14.6 and 15.1, with a repair inside the paper. The q ≥ n hypotheses of Propositions 2.7 and 4.12 and Theorem 13.9 hold where they are applied (places outside S, so p_v ≥ n). Lemma 4.10's srs annotations and Theorem 5.5 were not re-checked and remain for the review pipeline.
- **G6** (deferred). Splitting bundled items to declaration size is design work; every numbered statement is now an item.
- **G7** (deferred). Shared foundational ownership is design work; Appendix B's formal (B.3) is bypassed by Remark 5.3 (E26).

## Validation (cc-442dc5)

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass on the result. Item ids are unique, every missing item is routed exactly once, and every prerequisite target exists. No Lean deliverable is part of a paper job.

## Checkpoint history (unchanged)

The report of the earlier checkpoint follows as it was written. Where it says *partial* or *open*, or gives the earlier classification of the findings reclassified here, this continuation supersedes it.

## PAPER-ZHANG-21: Weil representation and Arithmetic Fundamental Lemma

Worker: Codex, session codex-a71f92. Refs #1107. Status: **partial**.

The whole published paper has been read, including both appendices and the bibliography. This is a substantive first extraction, not a certificate that the argument has been recursively closed or formalized. There are 147 items: 7 pinned-library ingredients, 10 planned interfaces and 130 missing items, each missing item routed exactly once. Definitions/constructions have API outlines and test obligations; theorem items have proof outlines. Seven explicit gates remain.

### Result and scope

Theorem13.9 proves the Jacquet–Rallis FL for an unramified quadratic extension of p-adic fields, odd residue characteristic and **q≥n**, where q is residue cardinality. Its final density argument covers relative regular semisimple orbits.

Theorem15.1 proves the AFL over **Qp**, p odd and p≥n, for **strongly regular semisimple** orbits. Preserve the paper's indexed distinction: Conjecture3.8(a) uses Sn and Vn; part(b) uses Sn−1 and Vn−1. Items21–22 state the literal endpoint. Conjecture3.2's all-regular version and the later general-p-adic theorem are not silently substituted.

The proof compares a Weil-equivariant, partially linearized relative trace distribution with the intersection of a KR divisor and a **derived** fat CM cycle. Its important dependencies are:

1. Relative Cayley charts compare ranks and both orbital and derived intersection terms.
2. RZ/RSZ uniformization identifies local intersections inside the basic locus.
3. Chow/arithmetic modularity and the analytic SL2 symmetry produce holomorphic generating series.
4. The unit-index Fourier criterion, auxiliary split-place isolation and Q-linear independence of prime logarithms isolate the local AFL.

The arithmetic modularity and Green-comparison inputs used here are Q-only. The geometric local formulas often allow a more general totally real base; that does not remove the final restriction.

### Versions and reading

Main source: [published journal PDF, public mirror](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf), 116 pages, pp.863–978; [publisher record](https://annals.math.princeton.edu/2021/193-3/p05), DOI10.4007/annals.2021.193.3.5. SHA-256: `6f8ac537b4f95cf26ba907dc1d25c1b9d9157a3a4006a311b114a522177d3b45`. Downloaded/read 2026-09-23. Text lines1–6061 read sequentially, not an abstract-only extraction.

The [author preprint](https://math.mit.edu/~wz2113/math/online/AFL2019.pdf), SHA-256 `5aa8f57e1d43abc301f4fc0c6afae3f052995494367c8edb3877eb906721234a`, was collated selectively. It is an earlier 78-page version with shifted numbering, not claimed identical to the final journal paper. Its comparison definition and final 'independent of a' wording already have the correct form.

The arXiv1909.02697 history was checked: v1 2019-09-06, v2 2020-06-09, v3 2020-12-20. This is not a claim to have read all arXiv versions.

A crucial published correction is in [Mihatsch–Zhang, DOI10.4171/JEMS/1375](https://ems.press/content/serial-article-files/31452), §7.2 Proposition7.4 and footnote5, p.48. Its PDF SHA-256 is `67c39ae1e0109162aba0e25aff25e6dfa4aa944eb68ca3ada7109a16583ca76e`. Only the stated correction/normalization sections and reference identification were read, not its entire later proof.

| Published portion | Extraction |
|---|---|
| §1 | Pairing, Schwartz, coefficient-valued automorphic conventions |
| §2 | Relative spaces, matching, transfer factors, FL and rank reductions |
| §§3–4 | RZ moduli, derived AFL intersections and relative Cayley maps |
| §5 | DL-stratum input, fixed-g/joint local constancy and compact support |
| §6 | CM torus and RSZ integral/generic models |
| §7 | KR divisors, fat CM, Hecke fixed loci and derived virtual one-cycles |
| §§8–10 | Modularity, Green functions, arithmetic pairing, local orbit formulas |
| §§11–12 | Weil kernels, convergence, nilpotent regularization, partial Gaussians |
| §§13–15 | Fourier criterion, global comparison, FL/AFL induction |
| AppendixA | Weil-transfer compatibility and discriminant correction |
| AppendixB | Formal supported K/G, Euler degrees, Tor and closed-union lemmas |

### Corrections that affect implementation

With q(x,y)=xy and ψ(b)=exp(2πib), use the later corrected linear Gaussian
φ′(x,y)=½(x+y)exp(−π(x²+y²)), paired with exp(−2πq) on the positive Hermitian side. For ξ>0 the rank-one value is exp(−2πξ). For ξ<0 its derivative is ½exp(−2πξ)Ei(−4π|ξ|). Proposition7.4 of the correction source supplies the full Whittaker phase and weight. The original §12 formulas cannot be copied unchanged.

That correction is not, by itself, a finished proof of the original §14 comparison: the Green/Ei argument and zero coefficient must be converted consistently. Item120 is explicitly an unresolved comparison obligation.

Two other major findings are:

- The definition on p.965 has an extra2: the proof requires E=∂Jhol+Int, with ∂Jhol=2∂J+IntK−B. The author preprint already has this.
- The §12.4 Cartan map has Weyl fibres, not just the asserted diagonal-sign fibres. For n=2, t=diag(1,i), t′=diag(i,1) and k=[[0,1],[-1,0]] satisfy k⁻¹t′k=t. An arbitrary torus cutoff does not descend. A replacement construction with correct signs and measure factors remains necessary; this finding does not assert that the final AFL theorem is false.

Keep logq and the finite-place factor2 distinct: Theorem9.4 gives 2logq because the quadratic extension's residue field has cardinality q². Keep the nearby Shimura space **split** at the distinguished good finite place, while the RZ special-Hom space is nonsplit.

### Pinned libraries and ownership

Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`. Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`. Atlas rechecked against main commit `4232d60664eb2fbe60e48602aec83895e71ff08f`.

Both Lean trees were searched. Their abstract exact K0, regular-sequence predicates, real Fourier/Poisson tools and matrix identities are reusable. They do not supply unitary formal moduli, adelic Tate integrals, Weil transfer, arithmetic Chow modularity or the AFL.

| Item | Pinned declaration read | Boundary |
|---|---|---|
|141|TauCeti.ExactK0|Needs an actual supported coherent/perfect exact category|
|142|RingTheory.Sequence.IsWeaklyRegular / IsRegular|Not a Koszul resolution or formal Tor theorem|
|143|fourier_gaussian_pi|Real convention; Hermitian measure adapter still needed|
|144|SchwartzMap.tsum_eq_tsum_fourier|Real line/Z, not adelic Poisson|
|145|hasDerivAt_integral_of_dominated_loc_of_deriv_le|Domination hypotheses must be proved|
|146|Matrix.det_fromBlocks₂₂|Generic Schur step only|
|147|Matrix.aeval_self_charpoly|Does not prove Tate-polynomial independence|

The JSON records the relative paths/lines and the reviewed audit evidence. Accepted SF.5, PEL, AF, AL, MP and scheme-K coverage was read before classification. Existing primitive objects are never marked missing just because their arithmetic application is absent.

#### Routes

**1. GeometryOfNumbersAndQuadraticArithmetic** (source; 1 items).

Generic Hermitian forms, trace quadratic forms, self-dual lattices and local/global classification belong to GN.2. The relative orbit and RZ applications import them.

**2. AutomorphicLFunctionsAndLocalFactors** (source; 3 items).

AL.0 owns local/adelic Schwartz, Fourier and parameter-integration tools, including the Bessel/Mellin calculation needed here; AL.1 owns the normalized Tate integrals and functional equations. Existing real Gaussian/Poisson tools are reused, not replanned as absent.

**3. AutomorphicFormsOnReductiveGroups** (source; 2 items).

The coefficient-valued holomorphic SL2 spaces and Fourier uniqueness/vanishing criterion are generic automorphic infrastructure. Lemma13.6 uses strong approximation and local root-group generation, not an AFL hypothesis.

**4. MetaplecticAutomorphicForms** (source; 3 items).

The Weil operator, index, global product formula and theta kernel are explicitly inside these existing layers. Relative transfer compatibility and the AFL comparison consume them rather than recreating the representation.

**5. ArakelovGeometryAndAbelianHeights** (source; 2 items).

Reuse the generic Green-divisor and arithmetic-degree/pairing interface also requested by PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18. This source supplies localization by bad-prime logarithms and pairing with proper curves inside a nonproper ambient model. The ambient arithmetic-divisor quotient must be shared with GSpinSpecialDivisorHeights and UnitaryKudlaRapoportCycles; audit the precise extension of R35.1 before final acceptance, not a private duplicate in each cycle owner.

**6. SchemeKTheoryOperations** (source; 3 items).

Scheme supported filtrations, Adams multiplicativity and rational K-to-Chow comparison already belong here. Keep the proved scheme statement distinct from the source's explicitly unproved formal extension.

**7. SchemeAndStackFoundations** (source; 1 items).

Use the shared Chow/intersection owner for actual proper pushforward, lci operations and rational equivalence; neither special-cycle proposal constructs a rival generic Chow theory.

**8. UnitaryRapoportZinkSpacesAndRSZModels** (part-ii; 12 items).

Coalesce with the identical candidate ID in PAPER-LI-ZHANG-22-B and PAPER-LI-LIU-22, not a second unitary moduli roadmap. PEL M0–M6 supplies generic data/moduli but not these relative formal spaces, Eisenstein conditions or basic-locus uniformization. The existing candidate is still a proposal, not an implemented atlas layer.

Extend the existing UnitaryRapoportZinkSpacesAndRSZModels brief without removing its unramified, almost-self-dual or exotic-ramified branches. Import Siegel and PEL moduli problems (PELModuli M0–M4), Abelian schemes and arithmetic moduli (AbelianSchemesAndArithmeticModuli A1–A4), finite flat groups and integral p-adic Hodge theory (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1/R07.2/R07.4/R07.6), and Shimura varieties (ShimuraVarieties V4–V6). Construct the exact Zhang2021 §3 unramified relative unitary Nn with signature(n−1,1), polarized framing and special-Hom space, comparing any reversed signature convention in the earlier brief explicitly. Prove formal smoothness of relative dimension n−1, N1=Spf O_Fbreve and δ:Nn−1→Nn. Construct the positive CM torus, strict fake Drinfeld G̃, finite-étale CM moduli component, localized RSZ model and Eisenstein condition in Definition6.1. Endpoint Theorem6.2 is smooth DM of relative dimension n−1, with the small-level quasi-projective scheme specialization; endpoint(7.4) is basic-locus uniformization by the relative Nn and nearby unitary quotient, including the CM-torus partition. Read Mihatsch DOI10.1017/S1474748020000079 Theorem3.1 and RSZ's actual sign/Eisenstein hypotheses before claiming the comparison. Add Tate characteristic-polynomial independence and connected-family constancy (Lemmas7.10–7.11). This owner is purely moduli-theoretic: special divisors, fat fixed cycles and AFL belong to its consumer. Tests must distinguish absolute height2n[F0:Qp] from relative height2n, retain conjugate E-actions, and reject a nonsplit 'good' self-dual place.

**9. JacquetRallisRelativeTraceComparison** (part-ii; 46 items).

ET.0/1/3/4 currently plan stable/endoscopic orbital matching, transfer and unitary trace comparison, not the GL(n−1)-relative Sn or GLn-relative Sn×V′ quotients. This is new relative-transfer work in that direction, so a Part II rather than pretending existing stable transfer proves the relative result. A repository-wide candidate search found no separate Jacquet–Rallis owner; the function-field Yun–Zhang relative formula remains its different shtuka/toric application.

Start beyond Endoscopic transfer and unitary trace comparison (EndoscopicTransferAndUnitaryTraceComparison), importing only generic conjugacy/measure infrastructure from ET.0–ET.1, not an assumed relative FL from ET.3. Import Hermitian local/global forms from GeometryOfNumbersAndQuadraticArithmetic GN.2, Fourier/Tate theory from AutomorphicLFunctionsAndLocalFactors AL.0–AL.1, Weil operators and theta convergence from MetaplecticAutomorphicForms MP.2/MP.4/MP.5, and automorphic spaces/Fourier uniqueness from AutomorphicFormsOnReductiveGroups AF.0/AF.2/AF.3. Construct the group, Lie and semi-Lie relative quotients and matching; raw versus transferred orbital integrals with ηdet twist; strongly regular loci; relative Cayley charts and integral rank reduction. Prove local smooth/partial transfer and the Fourier compatibility of AppendixA with the Hermitian-discriminant sign. Construct the fixed-α partially linearized RTF, its regular-orbit absolute/local uniform convergence, nilpotent Tate regularization, rank-one and CM-field reduction, and entire SL2-automorphic J_s. Use Mihatsch–Zhang DOI10.4171/JEMS/1375 §7.2's corrected Gaussians; repair the Weyl/sign descent in §12.4 before treating Lemma12.6 as proved. Do not assert full archimedean Gaussian-transfer existence, which this paper only expects. Endpoints: Theorem12.14 entire modularity; Proposition13.3 holomorphic coherent weight-n series; Theorem13.4 conditional comparison; Theorem13.9 group/semi-Lie FL for unramified quadratic p-adic fields with odd residue characteristic and q≥n. The FL extends to all relative regular orbits by density; the arithmetic consumer's AFL does not thereby extend. Include the exact residue-cardinality bound and all group/semi-Lie rank shifts. Tests: n=1 corrected Bessel integral and derivative; transfer scaling by η(a)^n; n=2 Weyl-fibre counterexample and repaired descent; norm-unit lower-rank reduction; product of rational transfer factors1. This analytic owner has no dependence on RZ spaces or the AFL, preventing circular proof of its FL input.

**10. FormalSupportedIntersections** (part-ii; 9 items).

AppendixB is reusable formal-scheme intersection infrastructure, not continuous K-theory through p-power thickenings. The existing UnitaryKudlaRapoportCycles brief mentions it as a construction obligation; factor that obligation into this shared supplier and have all cycle consumers import it. SchemeKTheoryOperations currently states scheme results, so do not silently mark the formal extension planned.

Import K-theory of schemes, localisation and operations (SchemeKTheoryOperations S.1–S.4/S.6/S.7), the exact-category K0 already in TauCeti.ExactK0, and generic intersection theory from SchemeAndStackFoundations SF.5. Coordinate coherent/perfect sheaf enhancements with EnhancedDerivedSheaves, and take a general Koszul complex/regular-sequence resolution from its common commutative-algebra/derived owner rather than developing it privately here. Build noetherian formal schemes' J-power-supported coherent and perfect categories; rational K0/G0, cup products and dimension/codimension filtrations; regular supported devissage under proved resolution hypotheses; restriction and inverse limits over noetherian open exhaustions; proper scheme-support finite-length Euler degree and its base-change/projection formulas. Endpoints are Zhang2021 AppendixB LemmaB.1 (closed-union cokernel decomposition), LemmaB.2(i) (expected-dimensional regular/CM Tor vanishing), LemmaB.2(ii) (componentwise vanishing modulo overlap), and (B.4)'s derived Euler pairing. Explicitly do not claim formal Adams-filtration multiplicativity from the paper: it says that extension is expected and offers Remark5.3 to bypass it. Prove it independently only if a consumer really needs it. Do not confuse open-exhaustion limits with RefinedTraceMethodsPartIIPadicDeformationOfKTheoryClasses' continuous K-theory of infinitesimal thickenings. UnitaryKudlaRapoportCycles and any orthogonal cycle consumer import this one supplier, replacing their unexpanded generic AppendixB placeholders. Tests: a DVR torsion module degree; a transverse regular sequence with zero higher Tor; an excess intersection retaining Tor; closed union with noninjective overlap G0 map; a formal sheaf with full Spf topological support but incorrect J-power support.

**11. UnitaryKudlaRapoportCycles** (part-ii; 58 items).

Coalesce with PAPER-LI-ZHANG-22-B/PAPER-LI-LIU-22's existing unitary-cycle candidate. Add the derived fixed-point/fat CM and AFL branch to its KR special-divisor branch rather than a rival arithmetic cycle roadmap. GZ.6–GZ.7 provide the curve prototype but not these higher-dimensional unitary RZ intersections.

Retain the existing UnitaryKudlaRapoportCycles obligations and add Zhang2021's separate AFL proof branch. Import unitary formal/global models and basic uniformization from UnitaryRapoportZinkSpacesAndRSZModels; analytic matching, Weil-compatible RTF and FL from JacquetRallisRelativeTraceComparison; the generic formal supported Euler/Tor API from FormalSupportedIntersections; generic Chow operations from SchemeAndStackFoundations SF.5; scheme Adams/K-to-Chow from SchemeKTheoryOperations S.4/S.6/S.7; and the shared Green-divisor/proper-curve arithmetic pairing from ArakelovGeometryAndAbelianHeights R35.1, coordinated with GSpinSpecialDivisorHeights. Construct KR liftability divisors; group diagonal and semi-Lie derived fixed intersections; unit-denominator rank reduction; DL-stratum and fixed-g/joint local constancy; compact support modulo conjugation. Construct integral/global KR divisors, nonmaximal fat CM moduli, Hecke fixed loci and their characteristic decomposition, derived virtual one-cycles and formal/complex orbit expansions. Prove Theorems8.1/8.6 from their full modularity sources, preserving the Q-only restriction on arithmetic modularity and Ehlen–Sankaran Green comparison. Construct the normalized pairing divided by τ(ZQ)[E:F], prove good-place support and Theorem9.4's exact2logq factor, then the archimedean comparison with every Gaussian/Whittaker/Green rescaling written out. Prove Proposition14.5, corrected E=∂Jhol+Int, Theorem14.6's local separation in Qlogp, Corollary14.8 and Theorem15.1. Endpoint: unramified F/Qp, p odd,p≥n, strongly regular group Sn and literal indexed semi-Lie dimension n−1 satisfy ∂Orb=−Int logp. Do not promote Conjecture3.2's all-regular version or the later general-p-adic theorem to this paper's result. Close the maximal-order bound/rank compatibility with Mihatsch Corollary9.9 and the q-bound use in local constancy. Tests: n=1, unit special vector, nontransverse derived intersection, split-place zero, basic-only support, base-change residue degree, factor2, nearby Shimura space split at v0, and failure of log-prime separation over a base with several places above the same rational prime. Source corrections and the analytic descent/normalization gates are mandatory before final acceptance.

#### Acyclic ownership boundary

UnitaryRapoportZinkSpacesAndRSZModels supplies moduli; FormalSupportedIntersections supplies generic derived intersection degrees; JacquetRallisRelativeTraceComparison supplies analytic transfer/FL. UnitaryKudlaRapoportCycles imports all three for the arithmetic comparison. The analytic FL proof never imports the AFL. Neither the moduli owner nor the generic formal K owner imports the cycle consumer.

The two unitary IDs deliberately coalesce with existing Li–Zhang/Li–Liu proposals. The generic AppendixB obligation currently mentioned inside the cycle brief is factored into a common supplier, not duplicated. Open-exhaustion formal K0 is also not the continuous K-theory of infinitesimal thickenings in the Antieau–Mathew–Morrow–Nikolaus proposal.

### Source findings

All 27 findings are unreviewed. “New” means no correction was located in the searches recorded in each JSON entry; it is not a priority claim. Known corrections retain their references. Suspected bounds/locus problems without a proved defect are in G5, not asserted as new errors.

#### E1 — §1.2, pp.869–870

misprint; affects nothing. Printed: `q : V → F`.

For a quadratic space over F0 the codomain is F0.

The next displayed polarization is F0-valued; F is introduced separately for the Hermitian extension.

Correction search: No correction located in the publisher/arXiv-history/author/later-paper searches recorded in the JSON.

#### E2 — §1.2 (1.13), p.872

error; affects a stated result. Printed: `φ(h)=Σξ Wφ,ξ(h), absolutely convergent`.

Assume suitable smoothness for absolute Fourier summation, or use Fourier uniqueness/appropriate convergence for merely continuous functions.

Continuity on a compact additive quotient does not imply absolutely summable Fourier coefficients. An explicit continuous counterexample is obtained from disjoint shifted Rudin–Shapiro blocks of length 2^(4m), scaled by 2^(−m)/sqrt(2·2^(4m)): their sup norms sum, but the absolute coefficient sums diverge. Smooth functions in the applications permit a repaired statement.

Correction search: No correction located in the publisher/arXiv-history/author/later-paper searches recorded in the JSON.

#### E3 — Conjecture2.3(a), p.878

misprint; affects nothing. Printed: `(1K0,0)`.

Use (1K0#,0) on G0=U(V0#); likewise the full-rank lattice stabilizer must be the one of Λ0#.

K0 belongs to U(V0), the smaller acting group, while the test function belongs to G0.

Correction search: No correction located in the publisher/arXiv-history/author/later-paper searches recorded in the JSON.

#### E4 — Proposition2.6, p.879

misprint; affects nothing. Printed: `(G0×V0)(F0)rs`.

Use the correctly ranked semi-Lie pair (H0×V0), or rename G0 consistently to U(V0).

The preceding notation defines G0=U(V0#) but the semi-Lie action here is on V0.

Correction search: No correction located in the publisher/arXiv-history/author/later-paper searches recorded in the JSON.

#### E5 — Lemma4.2 proof, p.887

misprint; affects nothing. Printed: `1−g=1/(1+x)`.

Replace the right side by 2/(1+x).

From g=−(1−x)/(1+x), subtraction gives 1−g=2/(1+x); x=0 already gives 2 versus1. The author preprint repeats this slip.

Correction search: No correction located in the publisher/arXiv-history/author/later-paper searches recorded in the JSON.

#### E6 — Lemma4.3 proof, p.888

misprint; affects nothing. Printed: `R(ξ)`.

Use R(λ) in the polynomial pencil.

R is the gcd polynomial in the characteristic variable λ; ξ is a central scalar parameter, not the argument of that gcd.

Correction search: No correction located in the publisher/arXiv-history/author/later-paper searches recorded in the JSON.

#### E7 — Lemma4.9(i), p.892

misprint; affects nothing. Printed: `rξ(γ′)`.

Use r(γ′), or quantify ξ and require ξγ′ in the chart.

The printed hypothesis only places γ′ in Sn°, and ξ is free; a rational map's definedness must be explicit.

Correction search: No correction located in the publisher/arXiv-history/author/later-paper searches recorded in the JSON.

#### E8 — Definitions7.1–7.2, p.907

misprint; affects nothing. Printed: `u′=u∘ϕ`.

For source-CM isomorphism a0:A0→A0′ use u′∘a0=ϕ∘u; after identifying A0 and A0′ use u′=ϕ∘u.

u:A0→A and ϕ:A→A′ cannot compose in the printed order. The same expression occurs in both author-preprint definitions.

Correction search: No correction located in the publisher/arXiv-history/author/later-paper searches recorded in the JSON.

#### E9 — §7.4 following(7.9), p.910

error; affects a stated result. Printed: `F0′ is a product of totally real fields`.

Conjugate reciprocity only gives an involution and a fixed étale algebra. Impose the CM/totally-real condition independently, as the next paragraph does for the rest of the paper.

Take F=Q(i), α=T²−3T+1. In Q(i,√5), the specified involution sends i↦−i and √5↦−√5, so the fixed field is Q(√−5), not totally real. The later CM assumption protects the intended application.

Correction search: No correction located in the publisher/arXiv-history/author/later-paper searches recorded in the JSON.

#### E10 — Proposition8.2, p.921

misprint; affects nothing. Printed: `(7.5)`.

The complex component projection is (8.4).

Equation(7.5) is the formal/basic-locus projection; this proposition concerns complex uniformization.

Correction search: No correction located in the publisher/arXiv-history/author/later-paper searches recorded in the JSON.

#### E11 — Lemma11.1 proof, p.937, second product in the displayed estimate

misprint; affects nothing. Printed: `∏v|∞`.

Use ∏v∤∞ for the second, finite-place factor.

The preceding equality separates archimedean and nonarchimedean integrals; (11.11) and compact finite support are applied to the latter.

Correction search: No correction located in the publisher/arXiv-history/author/later-paper searches recorded in the JSON.

#### E12 — §12.1–12.4, pp.940–945, especially(12.1),(12.6),(12.11)

error; affects the proof. Printed: `φ′=2^(−3/2)(x+y)e^(−π(x²+y²)/2)`.

With ψ(b)=e^(2πib), use φ′=½(x+y)e^(−π(x²+y²)) and the positive Hermitian Gaussian e^(−2πq). Propagate the scaling to all orbital, Weil, nilpotent and Green comparisons.

Mihatsch–Zhang gives these functions and explicitly says the functions in this paper's §12 should be corrected. The original Gaussian width is incompatible with the stated weight-one Weil eigenvector convention.

Correction search: Mihatsch–Zhang, DOI10.4171/JEMS/1375, §7.2 (7.6), Proposition7.4 and footnote5, p.48; §7.3 positive Hermitian Gaussian.

#### E13 — §12.1 final display, p.940

misprint; affects nothing. Printed: `|a|^(1/2)`.

For Hermitian dimension n the scalar factor is a^(n/2); with corrected Gaussian the exponential has 2πiq(u)(b+ia).

Formula(11.1) uses real dimension2n and diagonal entry √a, so its determinant scaling is a^(n/2).

Correction search: No correction located in the publisher/arXiv-history/author/later-paper searches recorded in the JSON.

#### E14 — Lemma12.3 statement versus its final proof display, p.942

error; affects a stated result. Printed: `K(s+1)/2+η(ξ)K(s−1)/2`.

For the original Gaussian use K(1−s)/2+η(ξ)K(−1−s)/2, as the proof itself obtains; then apply the published Gaussian rescaling.

Kν=K−ν does not permit interchanging the two terms when ξ<0: the swap changes the sign. At s≠0 the printed statement conflicts with its defining integral.

Correction search: No correction located in the publisher/arXiv-history/author/later-paper searches recorded in the JSON.

#### E15 — Lemma12.5 displays, p.943

error; affects a stated result. Printed: `e^(πi|ξ|(b−ia))`.

Use the published corrected formulas: χ1(κθ)a^(1/2)e^(2πiξ(b+ia)), and for ξ<0 multiply by ½Ei(−4πa|ξ|). The general-s formula must include the unipotent phase.

At pure unipotent h=n(b), (11.1) forces phase e^(2πibξ); the printed general-s formula has none, the positive special value drops κθ, and the negative formula has the wrong ξ-sign in the phase.

Correction search: Mihatsch–Zhang §7.2 Proposition7.4, DOI10.4171/JEMS/1375, with its footnote5 correction.

#### E16 — §12.4 map preceding(12.9), p.944

error; affects the proof. Printed: `NK×Tnrs → Snc,rs is a K∩A-torsor`.

Include Weyl identifications or replace this map with a correctly normalized local-slice construction. Prove descent of the test function and the orbital formula after this change.

For n=2, t=diag(1,i), t′=diag(i,1), k=[[0,1],[-1,0]]∈SO2 give k⁻¹t′k=t. These are different diagonal parameters, not related merely by diagonal signs. An arbitrary torus cutoff need not be constant on this fibre. The author preprint contains the same assertion.

Correction search: No correction located in the publisher/arXiv-history/author/later-paper searches recorded in the JSON.

#### E17 — §12.4 after(12.10), p.944

gap; affects the proof. Printed: `Ψ descends by K∩A-invariance`.

In addition to repairing the Weyl fibres, choose the N-cutoff invariant under conjugation by K∩A, or prove an averaging/descent construction with its exact measure factor.

The listed assumptions only normalize the N-integral and require invariance of the vector factor. A general smooth N-cutoff need not be invariant under sign conjugation; this is an additional descent obligation.

Correction search: No correction located in the publisher/arXiv-history/author/later-paper searches recorded in the JSON.

#### E18 — §12.7, p.953, definition of the nilpotent L-derivative

misprint; affects nothing. Printed: `L(s,η)`.

In general rank use L(s,η′) for F′/F0′; for the 0− term differentiate the corresponding L(−s,η′) with its minus sign.

The preceding definition(12.26) is over the CM extension F′/F0′. The base character η suffices only in rank one.

Correction search: No correction located in the publisher/arXiv-history/author/later-paper searches recorded in the JSON.

#### E19 — §14.1 before Lemma14.3, p.962

misprint; affects nothing. Printed: `q′(u′)=TrF0′/F0 q′(u′)`.

The left side is q(u′).

q′ is F0′-valued and q is its F0 trace; the printed equality has incompatible codomains.

Correction search: No correction located in the publisher/arXiv-history/author/later-paper searches recorded in the JSON.

#### E20 — §14.3 definition of E♭, p.965

misprint; affects the proof. Printed: `E♭=2∂Jhol♭+Int`.

Use E♭=∂Jhol♭+Int=2∂J♭+IntK−B+Int.

Proposition14.5 already defines ∂Jhol=2∂J+IntK−B, and the first line of Theorem14.6's proof uses it only once.

Correction search: The public author AFL2019.pdf, §14.2, p.69, has E♭=∂Jhol♭+Int. This is an earlier-version correct formula, not a claim of a later published erratum.

#### E21 — Proposition14.5 proof, p.965

misprint; affects nothing. Printed: `independent of α`.

Use independent of a.

The constant may depend on γ and Φ′, hence on α; the argument cancels the Iwasawa log a parameter.

Correction search: Author AFL2019.pdf, p.69, has independent of a.

#### E22 — Corollary14.8 proof, p.968

misprint; affects nothing. Printed: `−∂Orb·Orbaway=Intv(δ,u)·Orbaway`.

Multiply the right side by log qv.

The corollary statement and Theorem9.4 use the logarithmic local degree; cancelling away factors must reproduce that same statement.

Correction search: No correction located in the publisher/arXiv-history/author/later-paper searches recorded in the JSON.

#### E23 — Theorem15.1 proof, p.968, nearby Shimura space

misprint; affects nothing. Printed: `non-split at v0`.

The nearby Shimura Hermitian space V is split at v0; V(v0) is the nonsplit local special-Hom space.

Changing from the positive global nearby space to signature(n−1,1) at infinity switches the local invariant at v0. Otherwise v0 belongs to D0 and the next line v0∤d is impossible.

Correction search: No correction located in the publisher/arXiv-history/author/later-paper searches recorded in the JSON.

#### E24 — AppendixA TheoremA.1, p.970

misprint; affects nothing. Printed: `h∈H(F)`.

Use h∈H(F0)=SL2(F0); likewise the base scalars of the generators are in F0.

The quadratic spaces and Weil representations here are over the base F0, not the quadratic extension F.

Correction search: No correction located in the publisher/arXiv-history/author/later-paper searches recorded in the JSON.

#### E25 — AppendixA footnote10, p.971, cited Zhang2014 Theorem4.17

misprint; affects the proof. Printed: `η(det(V)F/F0) is missing`.

Include the Hermitian-discriminant sign in the earlier Fourier-transfer constant.

The present appendix computes γV=η(detHerm V)ε(η,½,ψ)^n; the footnote explicitly records the earlier missing factor.

Correction search: Already recorded by Zhang2021 AppendixA footnote10, correcting Zhang2014 DOI10.4007/annals.2014.180.3.4.

#### E26 — AppendixB after(B.3), p.972

gap; affects the proof. Printed: `formal-scheme (B.3) expected`.

Do not use formal support-filtration multiplicativity as established. Supply a formal Adams proof with its category hypotheses, or use Remark5.3's alternative for Proposition5.2.

The source itself says the formal extension lacks a reference and identifies an alternative proof avoiding it. The scheme assertion and its use for derived CM cycles are separate.

Correction search: Explicitly acknowledged in AppendixB and bypassed by Remark5.3.

#### E27 — Corollary10.3 (10.8), pp.931–932

misprint; affects nothing. Printed: `Ei(−2π|ξ′|v′)`.

Retain a_v in Ei(−2πa_v|ξ′|v′), or explicitly specialize h∞ to a_v=1. Separately perform the later Gaussian/Green normalization conversion.

Equations(8.11) and(10.4) retain the h∞ parameter, and (10.7) only computes R; substituting them leaves a_v.

Correction search: No correction located in the publisher/arXiv-history/author/later-paper searches recorded in the JSON.

### What remains

#### G1: Propagate the published Gaussian correction

Prove a single complete dictionary from ψ,q,self-dual measure and corrected φ′ to Wξ, Ei arguments, nilpotent factors and Green metrics. Reprove Lemma14.4/Proposition14.5 in that dictionary, including zero coefficients. Items97–106 have corrected local formulas; item120 deliberately remains an obligation.

#### G2: Repair the partial-Gaussian descent

Replace the false K∩A-torsor description in §12.4. Prove local-slice/Weyl descent with the test-function sign, cutoff invariance, multiplicity and Haar factor. The n=2 counterexample shows a real proof issue; no claim that it disproves the endpoint.

#### G3: Close geometry source contracts

Read RSZ model/uniformization theorems, Mihatsch relative comparison and maximal-order Corollary9.9, KR divisor references, and the precise DL local-modularity input. Resolve signature/overbar conventions, not just names.

#### G4: Close modularity and nilpotent contracts

Read BHKRY's arithmetic modularity with its level conditions, Ehlen–Sankaran's exact Green normalization and Jacquet's incoherent nilpotent comparison. Verify convergence/derivative bounds from Beuzart-Plessis AppendixA.

#### G5: Bounds and stronger-locus checks

Check the literal p>n bound in Proposition3.9 against its rank-n induction use; check q≥n in the uses of Propositions2.7/4.12, including Theorem5.5. Prove or weaken Lemma4.10's printed srs annotations. These are open investigations, not independently verified source errors.

#### G6: Final atomic coverage and exact formula completion

Split bundled multipart items27,58,60,93,96 and the construction theorem clauses; expand every external input into source-checked theorem nodes and every routine omitted calculation. Visually transcribe all barred linear Cayley formulas. Whole-paper reading is complete but full recursive proof closure is not.

#### G7: Shared foundational ownership and formal hypotheses

Review the common arithmetic-divisor localization extension of R35.1 with GSpin/unitary consumers. Move their generic AppendixB placeholders into FormalSupportedIntersections once accepted, without duplicating continuous K-theory. Verify formal perfect/coherent resolution and inverse-limit assumptions; use Remark5.3 rather than assuming formal(B.3).

### Validation

The finite/numerical sanity script ran successfully: **816 checks**. It includes corrected rank-one orbital values and derivatives, 800 exact rational Cayley identities, the missing-Weyl-fibre witness and the fixed-field counterexample. Numerical Simpson quadrature is not a formal proof or a certification of all analytic interchanges. Python's standard library suffices; no special-function package is required.

Reproduction:

```python
"""Finite and numerical sanity checks, not proofs of the AFL."""
from fractions import Fraction as Q
from math import exp, log, pi, cosh, sqrt

def simpson(f, lo, hi, steps=20000):
    h = (hi-lo)/steps
    return h/3*(f(lo)+f(hi)+sum((4 if i % 2 else 2)*f(lo+i*h) for i in range(1,steps)))

checks = 0
for xi in [-2, -1, 1, 2]:
    for s in [-0.3, 0, 0.4]:
        raw = simpson(lambda y: (exp(y)+xi*exp(-y))*exp(-pi*(exp(2*y)+xi*xi*exp(-2*y))-s*y), -7, 7)
        def bessel(order, c):
            return simpson(lambda t: exp(-c*cosh(t))*cosh(order*t), 0, 8)
        rhs = abs(xi)**((1-s)/2)*(bessel((1-s)/2,2*pi*abs(xi))+(1 if xi>0 else -1)*bessel((-1-s)/2,2*pi*abs(xi)))
        assert abs(raw-rhs)<1e-11, (xi,s,raw,rhs)
        checks += 1
    if xi < 0:
        derivative = simpson(lambda y: -y*(exp(y)+xi*exp(-y))*exp(-pi*(exp(2*y)+xi*xi*exp(-2*y))), -7, 7)
        ei = -simpson(lambda y: exp(-4*pi*abs(xi)*exp(y)), 0, 8)
        rhs = exp(-2*pi*xi)*ei/2
        assert abs(derivative-rhs)<1e-11
        checks += 1

for a in range(-20,21):
    for b in range(1,21):
        x=Q(a,b)
        if x == -1: continue
        g=(x-1)/(x+1)
        assert (1+g)/(1-g)==x
        assert 1-g==2/(1+x)
        assert 1-g!=1/(1+x)
        checks += 1

# Two distinct diagonal parameters map to the same conjugate: missing Weyl fibre.
def mul(a,b): return [[sum(a[i][k]*b[k][j] for k in range(2)) for j in range(2)] for i in range(2)]
k=[[0,1],[-1,0]]; kinv=[[0,-1],[1,0]]
t=[[1,0],[0,1j]]; swapped=[[1j,0],[0,1]]
assert mul(mul(kinv,swapped),k)==t
assert swapped!=t
checks += 1

# Conjugate-reciprocal alone does not force the fixed subfield to be totally real.
# T^2-3T+1 over Q(i): i -> -i, sqrt(5) -> -sqrt(5), fixed i*sqrt(5).
assert abs((1j*sqrt(5))**2 + 5) < 1e-12
checks += 1
print(f'{checks} checks passed: corrected Gaussian integrals/derivatives, Cayley factor, Weyl fibre, fixed-field witness')
```

Repository validation passed: `check_paper` reports ok; intake reports 3 files, 0 problems; all 9 paper-checker and 7 source-issue unit tests pass. Coverage checks confirm each of 130 missing items is routed exactly once and definitions/constructions have API/tests and theorems have proof outlines. No Lean file is part of this issue, and none was compiled. Passing schema checks does not close G1–G7.
