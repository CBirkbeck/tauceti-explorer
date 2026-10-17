# Independent review of FIX-RT-AREA-ktheory-2~2

Completed review, 2026-10-17. Codex, session `codex-gM56zj`,
[issue #5159](https://github.com/CBirkbeck/tauceti-explorer/issues/5159).
The reviewed implementation is Codex `codex-rtOQ9t`'s
[PR #5265](https://github.com/CBirkbeck/tauceti-explorer/pull/5265),
commit `56aafefeb`; this reviewer did none of that implementation.

Seven packets receive **accepted**, as bounded reviews of the assigned fixes.
**SchemeAndStackFoundations receives needs_changes** for finding /38: its
separate SF.2 supplier remains unapproved, and the general spectrum-valued
descent criterion is not established. This is the completed review outcome,
not a checkpoint. No stage is declared closed or implementation formalised.

The inputs were the complete finding and verification registers, the round-two
fix report, the affected node statements/APIs/tests and their current suppliers.
Findings /1–46, except rejected /34, were the implementation issue's scope.
Rows /47–52 below explicitly distinguish later findings from those fixes.
The report does not recertify the unrelated exhaustive reviews now preserved
unchanged in each packet's `reviewHistory`.

## Packet decisions and corrections

| Packet | Verdict | Nodes / gaps / requests | Correction in this review |
| --- | --- | --- | --- |
| EllipticKTheory | accepted | 53 / 1 / 33 | Harder proof step now imports the existing T.2 positive-characteristic global-Milnor theorem; its helper already had the correct dependency. |
| HabiroNumberFields | accepted | 67 / 7 / 15 | Replace the obsolete whole-M.8 request with `M.8/finite-etale-chern`; add six exact consumer prerequisites. Retain explicit product, coefficient-tower and source-sign requests. |
| EllipticRegulators | accepted | 75 / 14 / 40 | Use `M.8/deligne-regulator` at the two proper elliptic targets. Distinguish its smooth projective scope from logarithmic open-curve realization and the Schneider/Nekovář comparison. |
| Polylogarithms | accepted | 75 / 19 / 21 | Use the same exact Deligne export at three targets. Retain the independent current-complex and regulator-sign comparison gaps. |
| K3BlochGroups | accepted | 101 / 24 / 27 | Retain corrected finite-field, transfer and regulator contracts; no further node payload change. |
| K2SymbolsBrauer--T.1 | accepted | 66 / 18 / 6 | Retain the unique T.2 global-Milnor owner; no duplicate proof or node payload change. |
| ArithmeticKTheory--N.1 | accepted | 56 / 7 / 25 | Retain the function-field branch, twisted Picard coinvariants and S.3 localization imports; original source/proof gaps remain. |
| SchemeAndStackFoundations | needs_changes | 303 / 17 / 7 | Record seven existing SF.2 supplier contracts, their pending approval, and the broader spectral gap. Add five verified native baseline references and three public source records; retain every existing node. |

All eight top-level review objects name this review and identify their
predecessor. No packet node was added or deleted. In particular, the aggregate
SF packet does not duplicate the Nisnevich targets already in
`SchemeAndStackFoundations--SF.2.json`.

The accepted `MotivicEtaleKTheory--M.5d` review of 8 October supplies both exact
M.8 nodes. Finite Chern classes retain invertibility of the coefficient,
positive higher degree, the diagonal factorial/sign and the odd-or-divisible-by-8
product restriction. Its proof sketch mentions a universal product rule, but
the HB-specific raw Soulé specialization and coefficient-tower compatibility
are not named API exports; those requests are retained. The Deligne producer
has smooth projective complex varieties, the degree-zero Tate lattice and
normalized rational character. Its Hodge/MC.2 realization and unread Huber
proof remain supplier gaps. These are usable accepted plans, not built
carriers. Replacing their obsolete split requests does not certify the entire
dependency graph or the later whole of M.8.

## Finding-by-finding verdicts

Here **retained** means the applicable permitted correction is right;
**corrected** identifies an additional edit; **external** means an appropriate
owner handoff whose implementation is outside this issue. External rows do not
assert that the excluded file or integrated graph has been fixed. The numerical
prefix is `RT-AREA-ktheory-2/` throughout.

| Finding | Verdict and reason |
| --- | --- |
| 1 | **Corrected/retained.** N.3 separates the affine function-field Steinberg input from the number-field arithmetic-group theorem, applies the all-projective-module finiteness criterion, and passes to proper curves by localization. E.5 distinguishes the two low degrees from higher unique p-divisibility plus finite generation. Corrected its surviving prose pointer from T.5 to `T.2:symbols/milnor-global-positive-characteristic`. Geometric connectedness and the full constant field are explicit; original GQ82 remains a gap. |
| 2 | **Retained, external assembly required.** HB.2's refinement is conditional on compatible η evaluations and CRT; ε=c² remains early in every order. CGZ Theorem 7.4 uses later Nahm/Andrews–Gordon analysis, already owned by HB.4. Importing HB.4 into HB.2 would reverse the build. HB.9 must supply the premises or use the later HB.5 assembly; its present import alone does not prove unconditional equality. |
| 3 | **External; source contract confirmed.** Devalapurkar's Theorems 6.1.4 and 6.4.1, pp.220 and 232, require the actual image-of-J and relative THH constructions. Notation 6.2.8, p.225, supplies j_(p,0); the ramified spherical base, twist and equivariance cannot be dropped. The p>2 input and Wagner's separate p=2 treatment must remain distinct. No RT packet is approved here. |
| 4 | **Retained.** E.3's rational injectivity uses number-field closed residues and N.2/S.3 localization. A direct sum of torsion groups is torsion elementwise; no common annihilator is needed. The finite-field integral route separately uses K₂ of a finite field being zero. |
| 5 | **Retained.** ER.5 consumes CM.1/CM.4 and AL.1 rather than rebuilding CM theory. Bloch's selected E/Q maximal-order, class-number-one specialization, bad Euler factors and finite-character data remain restrictions of the application, not claims about arbitrary CM curves. |
| 6 | **Retained.** ER.7 imports early Kato L0 units and requests the L1 K₂-symbol export with norm/descent compatibility. The character boundary, regulator, modular curve pushforward and integral-image application remain ER work; the entire later Euler-system stage is not made an early input. |
| 7 | **Corrected.** P.5 owns the analytic η-form and symbol regulator; ER.2 imports them. The now-existing exact M.8 Deligne export replaces an obsolete whole-stage request. Its proper complex alone does not justify the open-symbol cup formula or the Schneider/Nekovář normalization; these remain explicit requests. |
| 8 | **Retained.** ER.1 requests current `ComplexComparisonPartII:C5` and `C6` for analytic/de Rham and conjugation compatibility, retaining orientation and period choices. The superseded AlgebraicCurvesC spelling is not restored. |
| 9 | **Retained.** For the stated completion Λ(s)=N^(s/2)(2π)^(-ds)Γ(s)^dL(s), the conditional functional equation gives L*(0)=wN(2π)^(-2d)L(2). R29.6 supplies E/Q, not a general number-field functional equation; the latter remains a hypothesis, with the CM Hecke route separate. |
| 10 | **Retained.** ER.8 consumes ER.5's CM class U and L-value theorem, then E.6's regular model and vertical certificates before claiming arithmetic integrality. A generic-fibre class alone is insufficient. |
| 11 | **Retained.** ER.8 keeps Coleman L1, D.5 and modular-symbol L1/L2 as suppliers; period normalization, exceptional factors and ordinary/supersingular scope remain acceptance conditions. It does not construct another p-adic L-function. |
| 12 | **Retained.** E.7 and E.8 explicitly require E.6's regular model and vertical residues. ER.6's potential-good-reduction argument is an application, not a duplicate generic model theorem. Horizontal unramifiedness does not eliminate vertical obstructions. |
| 13 | **Retained.** V.5 and HB.2 use the characteristic-inverted unstable H₃ comparison and actual stabilization/bar maps, not cyclic-order coincidences. Hutchinson's finite-field corollaries supply q≥4; small fields and characteristic-primary homology remain separate. CGZ's Cartan calculation has its odd-prime, prime-power and q≡−1 restrictions. |
| 14 | **Retained with proof gap.** The N.6 supplier is the twisted coinvariant Pic/p^m injection used by CGZ Lemma 3.5, not the Kummer Pic[p^m] invariant term. HB.1 preserves p-unit versus ordinary-unit descent and the ramification/valuation argument. The original Keune proof and precise module translation are still unresolved, as recorded. |
| 15 | **Retained/external.** HB.7 imports D.1 and requests the exact Coleman D_p=Li₂+(1/2)log(z)log(1−z) convention in its stated local scope. D.1→D.2 and V.4→D.2 remain excluded-owner integrations; a five-term relation alone is not the regulator comparison. |
| 16 | **Retained/external.** HB.6 already has HR.1 and HC.3/HC.4, and no M.1 packet prerequisite. Effective substitutions, completion and Frobenius gluing remain HB work. Removing the stale coarse M.1/KU edges and forwarding RS-08 dependencies to HB.1 remains maintainer work; RS-10 is already accepted. |
| 17 | **Retained/external.** HB.1 imports V.3's CGZ/Suslin comparison, including its small-primary qualifications. It does not rebuild the convention comparison. Updating the external HABIRO plan pointer remains outstanding. |
| 18 | **Corrected.** The accepted finite-Chern producer now exists, so six HB consumers cite it directly. Its raw Soulé-product specialization, coefficient reductions/tower and fixed-sign comparison remain precise requests. The late whole M.8 and all of M.7 are not silently treated as early foundations. |
| 19 | **Retained; E prose corrected under /1.** The current T.2:symbols packet already owns both global-Milnor statements. V.2 uses the number-field node and E.5 the positive-characteristic node; T.4 must not acquire a second proof. The original Bass–Tate proof gap is preserved. |
| 20 | **Retained.** T.2:graded-map remains owner of the graded Milnor-to-Quillen product. V.2 specializes degree three, takes its decomposable image and then its cokernel; a general product map is not constructed again. |
| 21 | **Retained/external.** V.5's finite-field transfer requests L.1's all-degree theorem with injectivity, fixed-image characterization and both composites. The supplier direction is L.1→V.5, correcting the verifier's reversed arrow. The common theorem's implementation is outside this issue. |
| 22 | **Retained/external.** V.5 requests the N.5/N.8 arithmetic computations and keeps the free-generator choice noncanonical. N.8 is not covered by the permitted N.1 packet; coarse/forwarded integration is not claimed complete. |
| 23 | **Retained.** V.6 uses P.2's nonzero rational proportionality and reserves exact scalar/sign for R.7; D.2 supplies the p-adic comparison. Early algebraic quotients/certificates remain separate from late formula targets, avoiding opposing whole-stage imports. |
| 24 | **Corrected.** Three P.5 targets now import `M.8/deligne-regulator`. Goncharov's current complex and its comparison are independent targets, and the Burgos Gil–Feliu–Takeda sign/proof gap remains. The old assertion that an M.8 split still needs to be created is superseded by the accepted producer. |
| 25 | **Retained/external.** P.2 imports Tau GeometricTopology's geometry and owns the oriented tetrahedron/Bloch–Wigner formula. QT.5 should consume that formula and retain manifold gluing/volume assembly. Existing ideal-boundary geometry requests remain gaps, not a second Tau geometry plan. |
| 26 | **Retained/external.** P.6 requests I.2's early completed-unit map and retains its own regulator matrix and equivalence. Weak cyclotomic Leopoldt, strong Leopoldt and the abelian theorem remain distinct. The uncompleted diagonal is injective; prime-to-p torsion disappears only on pro-p completion. Other Iwasawa/L-function owner integrations remain external. |
| 27 | **Retained/external.** P owns analytic Bloch–Wigner functions; V.3 retains torsion-sensitive convention comparisons. Reserved-ID aliases must be migrated with incoming references by the maintainer. The Rogers argument cannot be replaced by Bloch–Wigner on real points, where the latter vanishes. |
| 28 | **External.** RT.5 needs both RT.4:q-Hodge and RT.4:Habiro-comparison, with HQ.3 through them. Meyer–Wagner Theorem 3.14 is downstream of those comparison inputs; no excluded RT file or stage graph was edited. |
| 29 | **External; hypothesis check confirmed.** H.6 must export compatible multiplicative Moore towers. Meyer–Wagner §2.5, Proposition 2.27 and Example 2.31 distinguish E₁/E₂ hypotheses and powers of admissible moduli. Underlying cofibre spectra do not supply these structures, and there is no assertion that every S/m is E∞. |
| 30 | **External.** RT's even-filtration argument needs solid spectra and the actual even-filtration/étale-lift input, not just a solid-module category. The VS.2 extension and Pstrągowski/Hahn–Raksit–Wilson foundations remain named excluded-owner work. |
| 31 | **External.** HR.6→RT.4:Habiro-comparison remains required; the original handoff correctly distinguishes Wagner's Corollary 3.13 from 3.12. The q-Hodge/relative-Habiro identification is not inferred merely from earlier HR layers. |
| 32 | **External, updated owner retained.** Accepted RS-33 places the concrete realization/pairing foundation in early H.5:spectra, reexported by H.5:S-delooping; K.7 owns the actual K-product. An older fallback must not move the foundation to a later stage again. |
| 33 | **External.** RT.2 owns the generic genuine-equivariant/cyclotomic comparison; L.4 imports it and retains the field/DVR arithmetic specialization. No duplicate comparison is justified by a later application. |
| 34 | **Rejected finding retained as rejected.** The evidence does not justify deleting L.5's Bökstedt-periodicity input. Generic THH construction and this specific finite-field computation are different targets; no corrective edit is made. |
| 35 | **External.** Early RT.3's nilpotent DGM theorem and the later CMM henselian-rigidity theorem need separate hypotheses and owners. Henselian conclusions cannot be exported merely by broadening a nilpotent statement, nor by adding a reverse late-to-early edge. |
| 36 | **External.** PR.4 supplies the syntomic complex used by RT.6. The comparison still needs its actual base/completeness/range hypotheses; matching names is not an identification. |
| 37 | **External.** DD.0 exterior and DD.2 de Rham objects are imported by RT.1. RT retains the HKR equivalence, smoothness hypotheses and its comparison of Connes B with the de Rham differential. |
| 38 | **Needs changes, partly corrected.** Existing SF.2 already owns seven Nisnevich contracts; the historical absence claim is now stale. The aggregate records those exact requests and pending approval without duplicating them. The bounded noetherian set/simplicial route is source-supported; arbitrary-qcqs spectrum-valued sheaf/hyperdescent still needs a source, hypotheses and realization adapter. S.4 must additionally prove K-excision. |
| 39 | **External handoff corrected.** The original fix report sends blow-ups to S.7 incorrectly. Current `S.5/regular-blowup-geometry` and `S.5/blowup-formula` import R09.7a; `S.5/projective-bundle-cohomology` imports R09.1. The actual complete-flag target is `S.6/complete-flag-bundle`, also importing R09.1. Keep these exact routes; do not reconstruct geometry in the K-theory owner. |
| 40 | **External, scope sharpened.** StableReduction layer 2 reuses JacobianChallenge C's proper finitely presented, locally noetherian coherent-pushforward/base-change package. The flat-coefficient base-change conclusions, curve vanishing and Gorenstein relative duality have different hypotheses. These cannot close arbitrary-base/perfect-complex S.2 pushforward merely by a curve citation. |
| 41 | **External.** The false early dependencies remain removal requests: S.6→M.4 is replaced by its genuine later M.6b use; Z.5 uses Z.3/S.2 rather than S.6, and Z.6 uses S.2/S.5 rather than S.7. Forwarded copies need the same correction. |
| 42 | **Retained/external.** N.2 imports S.3 localization and owns arithmetic support/residue identifications, extension compatibility, three classical rows and even-degree injectivity. S.3 must supply the common interface; this review does not approve its excluded packet. |
| 43 | **External; obstruction retained.** In integral periodic KU, β is invertible, so a unital ring map cannot take it to nonunit kβ. Distinguish unstable integral BU/K₀ operations from stable multiplicative operations after inverting k, or at ℓ-completion with k a unit. |
| 44 | **External; current upstream checked.** DGAInfinity layers 8/9 supply Hochschild chains/Morita invariance and the Chern character. RT still owns cyclic operators, faces/degeneracies, Connes B, mixed complexes, the totalizations and SBI comparisons; importing Hochschild chains does not delete those constructions. |
| 45 | **External; current upstream checked.** DGAInfinity layer 5 supplies Perf(A) with its actual compact/thick/retract hypotheses. S.1 retains scheme-local perfection and the affine comparison, including the P7 overlap. No second generic perfect-module category is needed. |
| 46 | **External.** K.2:plus, K.5 and K.7 supply RT.3's actual K-functor, relative fibres and products. A multiplicative trace needs compatibility with those functors; an E∞ refinement is requested only where its supplier provides it. |
| 47 | **Outside the implementation scope.** The T.4→E.2 coarse-edge relocation is a later finding. The actual tame-symbol consumers E.4/E.5/E.7 and ER.4 remain the appropriate integration targets; no coarse graph edit or claim of completion is made. |
| 48 | **Outside the implementation scope.** The Schappacher–Scholl 1991 integrality paper and erratum need an ER source job, checking their relationship to the 1988 argument. This review does not claim to have inspected either 1991 proof. |
| 49 | **Outside the implementation scope; permitted signatures are correct.** The current V packet and the retained Lean predicate use x≠0,1, with distinct entries for the five-term relation. The historical reader/audit phrase about nonunits of a field still needs correction in its own files. |
| 50 | **Outside the implementation scope; permitted contract is correct.** HB already distinguishes ordinary/S-unit power quotients from cyclotomic units. CGZ's target and the χ^(-1) convention support that distinction. The stale AUDIT-28/reader wording remains an external synchronization task. |
| 51 | **Outside the implementation scope.** This verdict does not approve the unresolved P.4 weight-four proof/ownership boundary or reinterpret it as a conjecture. A separate job must give the proved weight-four theorem a definite owner and proof plan. |
| 52 | **Outside the implementation scope.** Parent RT.4/substage titles and sibling descriptions need metadata repair outside the permitted paths; no mathematical packet edit here claims to implement it. |

## Fresh source checks and limits

All mathematics written here is in the reviewer's own words. The following are
selected passages read directly, not certifications of complete books or papers.
Page numbers for the separately hosted K-book chapters are PDF page numbers;
Brunault and Morel–Voevodsky use printed pagination.

| Public version | Independently checked locators and use |
| --- | --- |
| [Weibel, chapter III](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf) | III.7.2, pp.61–62: global Milnor groups and the positive-characteristic vanishing input. |
| [Weibel, chapter IV](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.IV.pdf) | IV.6.8–6.9, p.59: finiteness criterion over all projective modules and the distinct affine-curve input. |
| [Weibel, chapter VI](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.VI.pdf) | VI.4.7, p.20; VI.6.1 and 6.4–6.8, pp.37–39: characteristic-p comparisons, Harder and Frobenius descent. |
| [Calegari–Garoufalidis–Zagier v3](https://arxiv.org/pdf/1712.04887v3) | Lemma 3.5 and proof, p.20; §4.2, pp.23–24; Theorem 7.4, pp.37–39: Picard obstruction, norm-one Cartan and the later Nahm input. |
| [Hutchinson, refined Bloch group v2](https://arxiv.org/pdf/1107.0264v2) | Corollaries 3.6–3.9, pp.14–15; §7, pp.33–36, including Corollary 7.5: actual finite-field maps, characteristic localization and enhanced Tor. |
| [Hutchinson, Chern classes v4](https://arxiv.org/pdf/2104.14413v4) | Theorem 2.12, Corollary 2.13, Theorem 3.1 and Lemma 4.1, pp.5–8: raw product sign, Bott and η normalization. The published sign-comparison gap is retained. |
| [Garoufalidis–Scholze–Wheeler–Zagier v2](https://arxiv.org/pdf/2412.04241v2) | pp.3–6, 9 and 37–38: target rings and the local Coleman dilogarithm normalization, with p>3 scope. |
| [Brunault thesis v1](https://arxiv.org/pdf/math/0602186v1) | §2.5, Lemmas 61–62 and Propositions 66–67, pp.64–69; Theorem 68 and its normalization computation: real structure, integral formula and open logarithmic complex. |
| [Dokchitser–de Jeu–Zagier v2](https://arxiv.org/pdf/math/0405040v2) | Remark 3.12, p.6, and its functional-equation context: the conditional L* versus L(2) conversion. |
| [Morel–Voevodsky, 1999](https://www.numdam.org/article/PMIHES_1999__90__45_0.pdf) | §3.1, pp.95–102, especially Definitions 1.2–1.3, Proposition 1.4, Lemmas 1.5–1.6 and 1.17–1.18: Nisnevich geometry and bounded Brown–Gersten route. |
| [Voevodsky, cd topologies v1](https://arxiv.org/pdf/0805.4578v1) | Definition 2.1, p.4; Corollaries 2.16–2.17, p.9; Definition 3.3, p.14; Lemma 3.5, pp.16–17; Theorem 3.10, pp.19–20: empty object, complete/regular/bounded assumptions and simplicial localization. Selected proofs were read. |
| [Voevodsky, Nisnevich/cdh v1](https://arxiv.org/pdf/0805.4576v1) | §2, pp.2–10: upper squares; Lemma 2.2, Proposition 2.9, Lemmas 2.13/2.15 and Proposition 2.16. The standing noetherian convention and finite-dimensional boundedness restriction remain explicit. Selected proofs were read. |
| [Devalapurkar thesis](https://sanathdevalapurkar.github.io/files/thesis.pdf) | Theorem 6.1.4, p.220; Notation 6.2.8, p.225; Theorem 6.4.1, p.232: checked the external contract's statement, not its full proof. |
| [Wagner v1](https://arxiv.org/pdf/2510.06057v1) | §1.5/Theorem 1.6, p.4: checked the relative-THH input and separate characteristic-two issue. |
| [Meyer–Wagner v4](https://arxiv.org/pdf/2410.23115v4) | §2.5, Proposition 2.27/Example 2.31, pp.23–26, and Theorem 3.14, pp.36–37: checked multiplicative-tower hypotheses and the downstream computation's statement. |

The original GQ82, Keune and full Bass–Tate proofs were not acquired as new
proof-closure evidence. Reading Weibel/CGZ's use of them does not close their
explicit packet gaps. Nor was Hutchinson's complete refined Bloch–Wigner proof,
the Huber realization proof, or the Burgos Gil–Feliu–Takeda comparison fully
decomposed. Earlier private-source receipts remain attributed to their authors;
this review used public sources and copied no private text or source passage.

For reproducibility, SHA-256 hashes of the downloaded public versions above,
in the same order through the two Voevodsky preprints, are:

```text
Kbook.III  ba1bc2d25680ab25c4baadc5ab28e39d1077dc66bb12ca4e2174b6cb55f81307
Kbook.IV   9f1c1b8cccfe19d547c27dd04c61f198fd7a0cddd0018a0b84442b00fa575248
Kbook.VI   efca16d77ed598735aa4e819be48d10d35bec0cf1b4138548f94f67922d40cd1
CGZ-v3     024317c20a1d8b66234e608af46941093a675b6399ef480dfedd52a31dcd7bf5
Hutch-B-v2 057ce8a6ae5548fd9f6279514adfa3afa5a6554ad1e58f9ca34bb4c62df52e94
Hutch-C-v4 e7a358154bf29701afcb1feb2308287f90e0fe405813d9548879dd5b2f2f30bf
GSWZ-v2    308d1dd1c42bd979e5d5c31d9d95215a1808f604031b49c0ce2a1eb767273de9
Brunault   8fd73faba5db08328c2884d9f35b79bc528145428766444f3eb8097f3b494fb7
DJZ-v2     a9d5c2cce63f2351991789add5ac9cd213b9783b9cbb0e648313e314eadb3ccf
MV-1999    170d4a97b4ac3d0b11319b7bdbc04060e6c6daf93fbd1662534d47ecd2d63216
Voev-CD-v1 9520671b475feb55fc03cce16239a0ae0f71261ecf2f3980a10f9c5982231825
Voev-N-v1  ed2d2e3e44dc73eab9a9c71307612204912923c8f002f9333592f25d3043b9f1
```

## Native interfaces and upstream reuse

The baseline remains Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Fresh statement checks included
the native scheme residue-field maps, étale predicate, quotient maps,
Mayer–Vietoris square constructors and ordinary sheaf condition, finite-field
Frobenius/Weierstrass point map, group/module/Finsupp interfaces and S-integer
class-group theorem used in the retained Lean. The declaration index checks
all recorded baseline names; it does not independently prove their applicability.
Unchanged exhaustive baseline certifications remain the earlier reviewers'.

In particular, `Scheme.Hom.residueFieldMap` goes from κ(f(y)) to κ(y).
`MayerVietorisSquare.mk'` can use the open mono and a set-sheaf pullback
criterion. `mk_of_isPullback` requires both covering legs mono and therefore
cannot handle a general distinguished square's étale leg. Neither constructor
is a homotopy-pullback or spectrum-valued descent theorem.

Current upstream main `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were searched/read without building
or editing them, including the roadmaps newer than the atlas snapshot. Relevant
supplier sections were read in DGAInfinity (5/8/9), LocalGaloisGroups,
StableReduction (base convention, layer 2 and exact Jacobian contracts), and
JacobianChallenge C. Existing foundations are cited as suppliers. No new
Nisnevich construction is added over the existing atlas SF.2 part.

## Suggested Lean and adversarial checks

The current binding shape rule applies to these reviews: keep only light
real-bodied definitions over pinned carriers and statable end signatures.
The inherited files developed substantial provisional theories; several
introduced admitted data carriers or maps, and K3BlochGroups exceeded 5,000
lines. Merely adding a disclaimer would leave those declarations in force.
All eight were rewritten to the required representative form. No mathematical
packet target, API, prose test or source record was removed to shorten Lean.
The closing comments identify the target families requiring genuine supplier
carriers. Synchronizing the out-of-scope readers is an explicit handoff.

| File | Old → new lines | Retained native signatures; full targets remain in the packet/reader |
| --- | --- | --- |
| EllipticKTheory | 1291 → 86 | Rank-degree-point multiplication, twisted Frobenius point predicate and finite-order theorem. Abstract K-functor/pushforward developments and supplier constructions are omitted. |
| HabiroNumberFields | 2260 → 91 | Eigenclass predicate, cyclic quantum dilogarithm polynomial and finite q-Pochhammer product. Genuine finite K/Chern, Habiro descent and Coleman carriers remain prose targets. |
| EllipticRegulators | 2998 → 67 | Diamond convolution and augmentation over native finite divisors. Analytic elliptic functions, regulator integrals, CM classes and integral/p-adic comparisons remain targets. |
| Polylogarithms | 3505 → 78 | Formal series coefficients and real regulator covector in a complex chart. Analytic continuation, current complexes and motivic comparisons remain targets. |
| K3BlochGroups | 5105 → 63 | Admissible pairs and actual integral five-term words in Finsupp. K₃, enhanced Tor, quotient constructions and comparison chains remain targets. |
| K2SymbolsBrauer--T.1 | 876 → 58 | Centrality/universality on actual group maps and perfect-source rigidity. Steinberg presentations and K₂ comparisons remain targets. |
| ArithmeticKTheory--N.1 | 1911 → 53 | Native infinite-place rank convention and pinned class-group check. Genuine higher K, rank filtration, twist and Keune carriers remain targets. |
| SchemeAndStackFoundations | 3173 → 80 | Canonical affine quotient map, residue-preserving étale neighbourhood and native Nisnevich family predicate. Site, henselization, stack and derived constructions remain targets. |

Every retained definition/theorem/example was checked mathematically as well as
elaborated. Representative discriminating instances and the resulting decisions:

| Statement/convention | Instances and outcome |
| --- | --- |
| Rank-degree-point multiplication | Two rank-zero classes multiply to zero; (1,0,0) is the unit. Coordinatewise multiplication would fail. |
| Twisted Frobenius subgroup order | Prime-to-p annihilator and positivity i≥1 are explicit; the origin qualifies and a p-torsion twisted point must be zero. Direct enumeration gives 8 points on y²=x³−x over F₅, including infinity. The five-point curve y²+y=x³+x over F₂ gives orders 13 and 41 at i=1,2. |
| HB eigenclass conventions | Zero is an eigenclass; weight −1 uses the inverse character. No averaging by the group order or eigenvector lift in a power quotient is assumed. |
| Cyclic polynomial and finite product | n=1 gives 1, n=2 and ζ=−1 gives 1+X; empty q-Pochhammer is 1. Exact integer polynomial reduction modulo Φ_n verifies both the cleared shift identity and D_ζ(1)^24=n^(12n), n=1,…,12. The exponent is 24, not 24n. |
| Conditional cyclic comparison | Exhaustive residue enumeration for 216 coprime pairs 2≤m,n≤20 checks the CRT uniqueness step. It does not establish the missing η evaluations or the K-theoretic maps. |
| Diamond convolution | [1]⋄[3]=[2] in Z[C₅]; input reversal reflects support. Reflection gives coefficient +1 at 3, whereas additive negation gives coefficient −1 at 2. Zero input and degree-zero divisors test augmentation. |
| Formal series and η | Constant coefficient is zero and degree-two coefficient at weight two is 1/4. Constant functions and equal inputs give zero η; swap negates it, conjugation pulls it back with a minus sign. The product formula requires differentiability and nonvanishing of its multiplied factors. |
| Five-term relation | x=2,y=3 gives arguments 2,3,3/2,3/4,1/2 with signs +,−,+,−,+. Every argument avoids 0,1. Equal inputs fail admissibility; injective field maps preserve the word. |
| Universal central extension | Identity maps are central; the trivial map PUnit→Multiplicative Z is central but not onto. The identity of Multiplicative Z is not universal. Perfectness supplies uniqueness of lifts; centrality alone does not. |
| Arithmetic rank | Q in degrees 3,5,7 gives 0,1,0; even degrees vanish. The periodic formula gives 1 at degree 1, so it is explicitly not asserted to be the unit rank there. |
| Nisnevich/neighbourhood scope | Identity covers and quotient maps pass; inverting 2 preserves the fibre mod 5, inverting 5 does not, and a two-sheeted product does not preserve it. Empty-index covers force an empty target. Spec C→Spec R distinguishes étale surjectivity from residue-rational lifting. |
| Empty object and descent | A constant two-point presheaf sends distinguished squares to pullbacks but fails the empty-object condition. Set pullbacks do not certify spectral homotopy pullbacks; finite-dimensional Brown–Gersten does not establish arbitrary-qcqs hyperdescent. These remain explicit limitations. |
| Functional equation and KU | Expanding Γ(s)^d and L(s) at zero gives the scalar in /9 without choosing it to fit an L-value. Invertibility of β gives the nonunit obstruction in /43. Both statements retain their stated conditional/coefficient scope. |

All eight final files elaborate successfully with `lean-check`, run sequentially
in the existing pinned build after memory checks. The only warnings are uses of
`sorry` in theorems/examples. No Lean server, Lake build, update or cache fetch
was started. Elaboration checks types, not the truth of admitted statements;
the preceding mathematical checks are separate evidence.

Final SHA-256 receipts for those compiled files:

```text
EllipticKTheory             e893e6cfc6dad8f0f1dbfbb4b1ad682c893774ac583d9d54394c5be13894504a
HabiroNumberFields          8cceb77d1ae67e0be2dae73354c703fa40908553bf8565bda555e08d58836aca
EllipticRegulators          e61ccd33f0db414ce3340fb92efe871e5109e99aad116c80c8bc22b302040a6f
Polylogarithms              691259ee5bcadd05fcc8d6fd284205e8c6dde8abb9c496d18c5f14d13af4f3f2
K3BlochGroups               9e1711520fe8824d6a864ccca0174f1a2ad0c9b6f27322820ce58936b2c92917
K2SymbolsBrauer--T.1        d79f5f5bcd676463e8c69a37bcb77c2da0612d3c09214707f280cf8653e5a622
ArithmeticKTheory--N.1      0d605ead4a90ba3b6c7cb6e39a054dcdc4f1f0cbf1306e2cc6c8858fdaa2b9f4
SchemeAndStackFoundations   91cc65b52ae5a020351821d97e08fe1814cda05887ab647a76de3b5bc7e28dfe
```

## Validation and remaining work

All eight `scripts/check_blueprint.py` runs with the pinned declaration index
report **zero errors and zero warnings**. All stages remain non-closed.
`scripts/check_sorry_data.py` accepts all eight Lean files; each is below the
line limit. File rules and whitespace checks pass. No link map or restructure
proposal is under review, so their checkers are not applicable.

The handoff records reader synchronization, supplier approval/proof gaps and
every excluded-owner integration. The general Nisnevich spectral criterion is
the substantive uncompleted correction in a permitted packet; acceptance of
the other seven packets must not be read as acceptance of that theorem, the
excluded RT/Scheme-K packets, later findings /47–52, or a global graph replay.
