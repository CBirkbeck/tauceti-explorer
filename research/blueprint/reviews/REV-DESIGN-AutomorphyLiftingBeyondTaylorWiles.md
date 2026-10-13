# Independent review: AutomorphyLiftingBeyondTaylorWiles

**Verdict: accepted, with corrections made in place.** Reviewer: Claude (Opus 5.5), session
`claude-uhRYhp`, 13 October 2026. Job: `REV-DESIGN-AutomorphyLiftingBeyondTaylorWiles`
([#7104](https://github.com/CBirkbeck/tauceti-explorer/issues/7104)). The design was written by a
different session, `claude-xCYI6r`, in [#9347](https://github.com/CBirkbeck/tauceti-explorer/pull/9347).

The packet has 42 target-level nodes: 13 definitions, 4 constructions, 21 theorems, 1 lemma and
3 applications. The review records 19 nodes as verified and 23 as corrected; none was added and
none is unverifiable. After the review there are 93 API items, 71 unit tests (68 before), 18
planets, 9 requests, 1 gap and 4 source issues. The packet cites no Mathlib or Tau Ceti
declaration directly; its 90 distinct cross-roadmap prerequisites were each opened in the
supplier's packet and read. All six stages remain **planned**; none is closed. `complete` means a
finished target-level planning pass, not finished proofs.

## What was read

- Calegari–Geraghty, *Modularity lifting beyond the Taylor–Wiles method*: the author-hosted copy
  in the published layout (SHA-256 `c0ba8de0…`, the same file as the design) for Theorem 5.16,
  §§6–9 and the opening of §10, pp. 383–429; the arXiv v2 TeX source to restore the overbars that
  the PDF text loses (Theorem 5.16(6), §8.5) and to confirm the numbering.
- The Calegari–Geraghty–Harris appendix, arXiv:1907.08694v1, PDF and TeX source: §§1, 3, 4.
- Khare–Thorne, *Potential automorphy and the Leopoldt conjecture*, arXiv:1409.7007v2, §6.6
  (Lemma 6.25, Proposition 6.26), to check the citation in CGH20 Theorem 3.2.
- The extraction `PAPER-CALEGARI-GERAGHTY-18` (source issues E12–E229 for these pages) and
  `PAPER-CALEGARI-GERAGHTY-20` (its route to this roadmap and E140–E142).
- Every supplier node the packet cites (ArithmeticLocallySymmetricSpaces, IntegralHeckeAndGaloisDeterminants,
  LocalGaloisDeformationRings, GlobalGaloisDeformations, ArithmeticGaloisDuality,
  ArithmeticGaloisRepresentations, AutomorphicFormsOnReductiveGroups, AutomorphicSpectralTheory,
  DeformationAndDerivedPatchingAlgebra P7–P9, R03.1, R03.5, R03.6, PadicHodgeTheory,
  AdelicAlgebraicGroups, ReductiveGroupsPartII, ModularCurvesPartII, SmoothRepresentationsOfLocalGroups,
  KTheoryLowDegrees), and the stage descriptions of the nine requested stages.
- TauCetiRoadmap main (IntegralHeckeAndGaloisDeterminants, SmoothRepresentationsOfLocalGroups,
  ReductiveGroupsPartII, AdelicAlgebraicGroups and the other upstream roadmaps): nothing there plans
  Conjecture B, the Taylor–Wiles-level Hecke algebras of Res PGL_n or the patching argument; the
  factorial idempotent, the distinct-eigenvalue block and Ihara's amalgam that the packet imports
  are there, under the atlas packet nodes the packet cites.

## Corrections made

1. **Wrong layer references.** Seven references in BT.0 named a node under the wrong layer
   (`BT.3/ihara-avoidance-data`, `BT.3/numerical-coincidence`, `BT.1/conj-b-galois-type` twice,
   `BT.1/conj-b-local-global`, `BT.1/conj-b-tw-comparison`, `BT.2/distinct-eigenvalue-comparison`).
   All are fixed. The two BT.0 definitions that leaned on later layers now take their input as data:
   the Taylor–Wiles projector takes the factorization P_x = (X − α_x)Q_x as given, and Serre
   modularity of minimal level uses the Galois-type notion of IHG.3 directly.
2. **The range of the Taylor–Wiles projector.** e_Q = lim ∏ Q_x(V_x)^{k!} keeps every local factor
   at which no V_x is a root of Q_x; it is the m_Q-part only when the residual eigenvalues of V_x are
   roots of P_x. For n = 2 a factor with V_x ≡ ±1 would survive (the situation of E229). The
   statement, a proof step and the API item `twProjector_range` are corrected, a non-example test
   is added, and B^tw and Lemma 9.6 now follow e_Q by the projection onto the m_Q-part, which is
   what the source's target H^*(Y_0(Q))_{m_Q} means.
3. **The standing datum (BT.1/ihara-avoidance-data).**
   - The characters χ_{v,i} are characters of k_v^× evaluated through Art_v^{-1}, as E168 of the
     extraction requires. Characters of I_v with values in 1 + 𝔪_O need not have finite order.
   - Oddness of r̄ is the balanced-eigenspace condition, as E164 requires. The trace criterion in
     characteristic p accepts r̄(c_v) = 1 for n = 2, p = 3. A test now catches this.
   - The congruence N(v) ≡ 1 mod p is now imposed only on R_triv. On R_reg there are no
     characters χ_v, and the minimally ramified ring is smooth without the congruence: the suppliers
     R08.2/regular-unipotent-minimally-ramified and minimally-ramified-ring carry no such
     hypothesis. As designed, the packet could not cover CGH20 Theorem 1.2, which
     BT.5/minimal-r-equals-t claims to supply, because CGH20 imposes no congruence at its
     single-block places.
   - Consequently Theorem 5.16's hypothesis (6′) keeps the printed proviso: N(x) ≡ 1 mod p only
     where r̄ is unramified, and then r̄|G_x must be trivial; where r̄ is ramified, r̄(σ_x) must be
     a single Jordan block. E203's deletion of the proviso was needed only for CG18's single set R.
4. **Ihara's amalgam (BT.3/global-ihara-amalgam).** The node took the second vertex stabilizer to
   be gΓ^1g^{-1} with g = diag(π_x, π_x^{-1}). That stabilizer belongs to a vertex at distance two,
   and Γ^1 ∩ gΓ^1g^{-1} is not Γ^1_0(x). The amalgam is glued by h = diag(1, π_x), as in the
   supplier RG2.2/ihara-amalgam. g still lies in G, by the ray-class assumption. The API item,
   the test and the proof step are corrected.
5. **U_{x²} on H^*(G) (BT.3/u-x-squared, BT.3/lyndon-hecke-equivariance).** The nodes repeated
   the printed claim that U_{x²} acts on H^*(G) by the degree N(x)², hence by 1. The double coset
   GgG = G acts as the identity, and the compatible tree endomorphism has augmentation 1 (E189,
   confirmed in the extraction). So U_{x²} acts by N(x)^{-2}, a unit ≡ 1 mod p, which is all the
   argument needs. The statement, proof steps and API are corrected; the test `Ux2_on_G_trivial`
   becomes `Ux2_on_G_scalar`, with the instance N(x) = 7, p = 3, where 7^{-2} ≡ 7 mod 9.
6. **The congruence-subgroup gap is closed (BT.2/conj-b-small-rank).** The design recorded the
   congruence subgroup property as planned nowhere and assumed it. KTheoryLowDegrees U.4 was
   accepted on 9 October 2026, before the design. It plans the congruence kernels of SL_3(ℤ)
   (Bass–Milnor–Serre) and of SL_2(O_F) for CM quartic F (Serre 1970). It also plans the consumer
   U.4/cg-localized-h1-vanishing: H^0_m = H^1_m = 0 for PGL_3/ℚ and for PGL_2 over CM quartic
   fields, at every level, for p > n unramified. Its remaining list assigns the degree d − 1 half
   of Remark 9.3 to this roadmap.

   Part (2) now imports that node at m and at m^∨. It finishes with ALS.5 duality (G(ℝ) is
   connected, so no orientation twist is needed) and boundary vanishing. The unused prerequisite
   U.4/bass-milnor-serre (stable SK_1) is replaced, the gap is removed, and the BT.2 description
   in the roadmap and the reader is updated.
7. **The distinct-eigenvalue comparison (BT.3/distinct-eigenvalue-comparison).** The node asserted
   the Res PGL_n version through the torus fibrations of E194. The source only announces that
   version as easy to deduce. Khare–Thorne Lemma 6.25(4), which CGH20 Theorem 3.2 cites, is a GL_n
   statement at Iwahori level for ordinary completed cohomology.

   The node now states the GL_n comparison only, which is what stage BT.3 describes. The PGL_n
   version, routed here by PAPER-CALEGARI-GERAGHTY-20 (item ext-level-raising-distinct-eigenvalues),
   is a precisely stated **gap**, with two possible routes. The roadmap's end theorems do not use
   it, because B^tw is a hypothesis of Theorem 9.19. A new source issue **E4** records the missing
   step against CGH20.
8. **Numerical checks.**
   - For F imaginary quadratic and n = 2, g = q + |T| − 4, not q + |T| − 3
     (BT.1/numerical-coincidence acceptance; the suggested file already computed g = 0 for
     q = 3, |T| = 1).
   - For ℚ(√−1), |T| = |S_p| + |R| with |S_p| ∈ {1, 2} according to p mod 4.
   - For F real quadratic and n = 2, q_0 = 2, not 1.
   - For n = 1, ad⁰ = 0, so the rank-one count belongs to ad r̄ = k.
9. **Smaller fixes.**
   - The p-torsion test of R^1_v is replaced by E165's explicit point.
   - Serre modularity of minimal level assumes at worst unipotent ramification, without which
     Iwahori level is not minimal.
   - The inertial characteristic polynomial in R^{χ_v}_v is evaluated through Art_v^{-1}.
   - BT.5/minimal-r-equals-t records that CGH20 normalizes det r = ε^{n(1−n)/2}, so it applies to
     r^∨.
   - The CGH20 Lemma 3.1 match in BT.5/cuspidal-recognition is reworded.
   - The attribution of the explicit isomorphism K_0(x)/K_1(x) ≅ k_x^× to E181 is made precise.
10. **Planets.** "Patching hypotheses verified" is a verification step, so its planet moves to
    BT.5/patched-complexes ("Patched complexes P_∞"). The planet "Conjecture B" moves from the
    first clause B^gal to the bundle BT.2/conjecture-b. The count stays at 18, at most 5 per layer.
11. **Source versions.** The packet now lists what was read in `sourceVersions` (PROTOCOL §18),
    because E2 affects a stated result. Khare–Thorne is added to the sources of the packet and of
    the roadmap definition.

No baseline citation was removed or replaced (there were none). No node was added. The requests
were checked against the supplier stages' scopes and are left unchanged; they are precise.

## Source issues

- **E1** (Definition 9.1 vs the intermediate covers in §9.5): confirmed. An operator killing
  H^*(Y_1(Q), O/ϖ^m) acts on H^*(Y_Δ(Q), O/ϖ^m) only through the Hochschild–Serre filtration for
  the p-part of ker(Δ̃ → Δ), so the surjection R_{S_Q} ↠ T^an_{Q,ψ,m} gives no action on the
  subcovers. The extraction's E211 concerns only the index Q_N/Q_M.
- **E2** (Theorem 5.16(8a) through r_p(π_0) over an arbitrary F): confirmed.
- **E3** (the deduction of Theorem 5.16 is not written, and residual eigensystems are not excluded
  by boundary vanishing): confirmed; the bigness argument of BT.5/cuspidal-recognition was checked.
- **E4** (new, against CGH20 §3.1 / A.3.1): the comparison H^i(Y_0(Q), k)_{m_α} ≅ H^i(Y, k)_m for
  the PGL_n quotients is justified only by GL_n statements. Recorded with this review's verdict
  (confirmed); as the review's own finding it may deserve a second reading.

## Suggested file

`lean-check` elaborates the file against Mathlib 082e2d37e8 and Tau Ceti f790474. The only
warnings are the five admitted proofs, the same five as before. Every sorry'd statement was
re-derived by hand (2q_0 + l_0 = dim Y, the totally real defect, the balanced count, the
archimedean count, and α² ≠ 1 when αβ = 1 and α ≠ β); all are true.

The closing list of untyped targets now carries the renamed and added test names, and every API
and test name of the packet occurs in the file. One example was added: g = 1 for ℚ(√−1) with p
split.

## Questions for the orchestrator

1. **Exports to a tiered roadmap.** BT.5/theorem-5-16 is exported to ModularityAndLanglandsExtensions
   ML.2, which is among the Caraiani–Newton roadmaps, while this roadmap is not. If ML.2's package
   cites it, that is an upward citation. Either ML.2 keeps CG18 Theorem 1.1 as a conditional
   endpoint outside its package, or this roadmap joins ML's tier.
2. **The new gap.** The Res PGL_n distinct-eigenvalue comparison is now a gap here. Its consumer
   is AdjointSelmerGroupsFromModularityLifting (CGH20 Theorem A.4). Its natural owner may be
   SmoothRepresentationsOfLocalGroups SR.5, if that roadmap's block theory is extended to PGL_n(F_x).
3. **Citations of upstream roadmaps.** IHG, SR, RG2 and AA are TauCetiRoadmap roadmaps, but
   `data/atlas.json` still has no `tauceti:` stage ids for them, so the packet cites their atlas
   packet nodes. A future package should cite them as Tau Ceti roadmaps.
4. E4 and the relaxation of the congruence on R_reg are this review's own mathematical findings,
   not corrections taken from the extraction. A red team should read them first.
