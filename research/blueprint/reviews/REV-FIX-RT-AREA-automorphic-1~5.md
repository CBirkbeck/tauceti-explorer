# Independent review of automorphic red-team fixes, round 5

Completed review, 8 October 2026. Refs #7449. Reviewer: Codex, session `codex-zcs4LH`. This session wrote none of FIX-RT-AREA-automorphic-1~5 (Codex `codex-vvlCYM`, issue #7448, PR #7713, commit `0414c24f5`), its earlier rounds, or the blueprints under review. The bot confirmed the claim before work began. Input repository commit: `dd3879cfd`.

## Result and scope

All round-5 corrections are right. The four previously live packets held back only for reader synchronization can now be accepted, together with the unchanged IHG producer and four packets whose broader revisions have since been independently accepted. AF, AS, GZ.0 and QM retain `needs_changes` because their broader blueprint reviews remain unresolved. This is a completed review, not a checkpoint or a request for another reader-synchronization round.

| Packet | Verdict | Reason |
| --- | --- | --- |
| GL2AutomorphicRepresentationsAndTransfer--R17.3 | accepted | All 57 reader contracts match; restored targets and boundaries; omitted local factors now have exact AL.3 suppliers. |
| GL2AutomorphicRepresentationsAndTransfer--R16.1 | accepted | All 55 reader contracts match; ordinary multiplicity and real transfer have the correct suppliers. |
| ArithmeticLocallySymmetricSpaces | accepted | All 66 reader contracts match, including rational Nomizu, splitting-field Kostant and unnormalized induction. |
| HilbertModularVarietiesAndShimuraCurves--R18.2 | accepted | All 58 reader contracts match; residual degeneracy, integral control and algebraic-closure comparison retain their scope. |
| IntegralHeckeAndGaloisDeterminants | accepted | Finite-level producer retained; corrected source-issue paraphrases reach the reader. |
| AutomorphicLFunctionsAndLocalFactors | accepted | Its accepted round-2 revision preserves the fixes and supplies the new closed-boundary local contracts. |
| AdelicAlgebraicGroups | accepted | Its accepted round-2 revision preserves local/global approximation and early neatness boundaries. |
| MetaplecticAutomorphicForms--MP.0 | accepted | Its accepted round-2 revision preserves the qualified theta, Jacobi, symbol and category imports. |
| MetaplecticAutomorphicForms--MP.8 | accepted | Its accepted round-2 revision retains generic MP.6 ownership and the BFH specialization. |
| AutomorphicFormsOnReductiveGroups | needs_changes | Fix regions are right; broader supplier/proof and signature/test correspondence still require the packet's own revision and review. |
| AutomorphicSpectralTheory | needs_changes | Fix regions are right; broader continuation signatures and object-level tests still require repair. |
| GrossZagierAndArithmeticHeights--GZ.0 | needs_changes | /19 is right; broader source-version, supplier and carrier/API/test correspondence remains unresolved. |
| QSeriesPartitionsAndMockModularForms | needs_changes | /20 is right; broader native-form, fifth-order, proof/supplier and topology obligations remain unresolved. |

Each packet receives this review's top-level verdict. Its previous review is retained in `reviewHistory`, including the accepted broader reviews of AL, AA, MP.0 and MP.8. No node, source ledger, coverage status, implementation status, suggested declaration or reader is changed by this review. No promotion is performed here.

The review follows `REV-FIX-RT-AREA-automorphic-1~4.md`: its packet-side corrections and suggested-signature repairs were already accepted as sound, while it identified specific reader contradictions. Round 5 repairs those contradictions and makes one packet change, adding AL.3/rs-local-convergence and AL.3/rs-local-factor to R17.4/gl3-recognition. I checked that change, the corrected reader passages, and the persistence of the verified hypotheses and owner boundaries in the four intervening accepted revisions. This is a passage-level review of the fixes, not a new full-source audit of all 2,206 packet nodes.

## Findings /1–/31

Identifiers below have prefix `RT-AREA-automorphic-1/`. The binding verifier's qualifications, rather than the broader wording of the original allegation, determine the required correction. “Right handoff” means the obligation belongs to the named outside-file owner; it does not certify that owner's implementation.

| Finding | Verdict | Reason and evidence |
| --- | --- | --- |
| 1 | right | R17.4 imports the reduced-rank converse, unitary cuspidal Rankin–Selberg pole criterion and omitted-factor inputs. Cogdell PSCT Theorem 3.3, p.9, has the n−2 twist family; nonempty S loses cuspidality and matching at S. Fields Propositions 6.2–6.3, pp.47–48, and 8.2, p.63, together with no common zero, support finiteness of local factors at s=1. The tetrahedral reader compares Rankin–Selberg factors: Langlands §3, pp.17–19, initially gives only cubes at inert places. No GL3 isobaric multiplicity theorem is inferred. Gelbart–Jacquet §9.2, p.532, uses the highly ramified T variant; its proof and native carriers remain explicit obligations. |
| 2 | right | AF.1 owns archimedean classification; Knapp Theorems 2 and 5, pp.403 and 406, classify real/complex GLn using the respective Weil parameters. The scanned pages were inspected. R16's real-quaternionic comparison uses AF.1 SU(2)/GL2(R) characters; ET.6 remains finite-place. Planned classification contracts do not imply that their native signatures or original proofs already exist. |
| 3 | right handoff | General compact p-adic analytic/Iwasawa noetherianity and grade theory remain with BP-CompletedCohomologyPartII--CC.0. A powerful-group cohomology calculation is not credited as general Lazard noetherianity, and no arbitrary profinite/coefficient-ring theorem is asserted here. |
| 4 | right | AS's local real Paley–Wiener carrier is AF.1/sf-representation with a precise local real-induction request. Clozel–Delorme II Theorem 1, pp.194–195, uses real basic induced representations and their trace relations; Arthur III §4, pp.85–86, supplies operator Fourier/multiplier targets. No global adelic induced-family carrier is substituted. BDK and original proof interiors remain gaps. |
| 5 | right | Pseudo-Eisenstein construction precedes continuation and wave-packet identities. Arthur Lemma 7.1, p.34, requires Lambda−rho in the open positive chamber. Lemmas 12.2–12.4 and pp.65–66 distinguish full-height L2 and the G(A)^1 variant. The reader preserves the fixed-central-character variant separately; exp(z^4)v is an excluded example only when v is nonzero. No uniform differentiated Whittaker estimate follows merely from local convergence. |
| 6 | right | ALS states rational E-linear Nomizu for an arithmetic lattice and finite algebraic coefficients. The Levi action needs a P-extension; a fixed lattice has only normalizer equivariance, while commensurators transport lattices. Harder–Raghuram §§4.2.1–4.2.3, pp.25–28, retains unnormalized induction, a splitting field, dominant integral weight and component action. No integral/mod-p or arbitrary nonsplit Kostant formula is inferred. |
| 7 | right | AA's accepted revision preserves the local RG2.4 Kneser–Tits request and global proof. Rapinchuk Theorem 2.3 and Remark 1, p.12, require absolute almost simplicity, simple connectedness and noncompact S. The Q/one-prime discussion, pp.16–17, is not treated as a proof for every number field. |
| 8 | right | AL derives genericity from the last-column Fourier expansion before importing Flath. Its equal-rank local-factor realization allows finite sums and its archimedean integrals retain the vertical-strip class. Fields Lectures 4–5, especially Theorem 4.2 and Proposition 5.4, distinguish those global arguments from local SR.5 uniqueness and retain character-dependent mirabolic poles. |
| 9 | right | AL.3/global-multiplicity-one and continuous archimedean Whittaker uniqueness are explicit R16.4 suppliers. Fields Theorem 4.2, pp.33–34, proves ordinary multiplicity through Fourier expansion and uniqueness; strong multiplicity is a further theorem. The reader no longer relies on p-adic SR.5 alone. |
| 10 | right | AL's exact AF/AA/SR prerequisites resolve. AF supplies cusp/growth/factorization and AA supplies adelic measures; AL retains responsibility for Fourier genericity and multiplicity arguments. |
| 11 | right | R17 reaches the precise R16.4 and R16.6 contracts. Its request for GL2 isobaric strong multiplicity is still pending where the current cuspidal node does not supply it. The reader advertises no additional generic GL3 multiplicity theorem; finite matching does not supply the weight-one infinity dictionary. |
| 12 | right | R18 imports the exact global R17.3 transfer nodes. Their domain is discrete spectrum with global reduced-norm characters excluded; local characters are allowed. Characteristic-zero spectral equality is not integral lattice equality or freeness. |
| 13 | right; general-field handoff retained | AL's ModularSymbols L1 interface is GL2/Q. General GL2/F belongs to BP-AutomorphicPadicLFunctions. The period/Gauss twisting work stays in AL, and no backward AL.5-to-L1 import is introduced. |
| 14 | right; maintainer boundary | AL.0 is the Schwartz–Bruhat/Fourier owner in R16; AA supplies adelic points/measures and SR supplies convolution. The older atlas/RS-21 ownership prose is outside this review's files and remains a maintainer action. |
| 15 | right handoff | CC.8 retains the fixed-exponent compact-support tower convention; BP-TorsionCohomologyInfrastructure owns Scholze's almost comparison with its Hodge-type, perfectoid and trace hypotheses. No CC/TC packet was edited or certified. |
| 16 | right handoff | CC.8's comparison transport is conditional on a supplied geometric theorem. R31 and the Hodge-type consumer supply their modular/Shimura instances; generic transport does not construct canonical models. |
| 17 | right handoff | CC.0 owns the general admissible Banach/continuous-dual supplier. BP-PadicLocalLanglandsForGL2Qp specializes it, with no second general category asserted here. |
| 18 | right | IHG.2 remains a finite-level image-algebra producer over a complete noetherian local ring. CC.8/CC.0 and R31 retain inverse-limit semilocality, perfect-complex and completed localization obligations. The reader paraphrases E7's filtration attribution and E17's split-determinant claim correctly; Chenevier Definition 2.19, p.33, was checked. |
| 19 | right | GZ imports MP's binary quadratic-field and trace-zero ternary inputs. Binary field norms remain anisotropic even for split B. GQT Theorem 7.3(ii), p.34, handles the exceptional split binary coefficient, while Theorem 8.1, p.35, is qualified modulo Im A−1. Neither proves the exact split Shimizu contraction without an additional comparison. That input and the unverified exact 2013 YZZ pagination remain visible; no MP-to-GZ backward prerequisite survives. |
| 20 | right; unitary handoff retained | MP.6 owns generic Jacobi theory, MP.8 specializes BFH, and QM imports the scalar interface. Skoruppa Theorem 5, p.13, requires finite-image coefficients, balancing over C[Mp2(Z)] and the dual Weil factor. The reader keeps the refined finite-Weil request separate from scalar multiplier/theta/plus-space contracts. BP-AutomorphicCongruences--L0 carries the unitary consumer; no L2 edge is inferred from an embedded L2s paragraph. |
| 21 | right | MP retains SR.0/2/3 and AF.1 linear-category inputs. Splittings and cover-specific admissibility, finite length and Howe duality retain their source and residual-characteristic conditions; linear representation theory is not credited as automatic full theta duality. |
| 22 | right | QFI 6C supplies nonarchimedean symbols/Hasse laws, including dyadic input. GlobalQuadraticForms 4.4 supplies the real symbol; its global layers supply quadratic realization. Hermitian global existence is separately sourced. These upstream scope sections were read, and no immutable upstream carrier is rebuilt. |
| 23 | right | MP.5 imports AA.3 height/reduction and exact AF.2/3 growth/cusp nodes. Cover transport and theta convergence/regularization remain MP obligations, rather than consequences of generic cusp decay alone. |
| 24 | right; ET handoff retained | ET.1 supplies ordinary centralizer quotient measures and orbital integrals. AS owns the nonconstant weight and its estimates, splitting and descent, as Arthur §18, p.102, distinguishes. The rank-one acceptance condition includes r≥0; singular convergence is not inferred from regular convergence. BP-EndoscopicTransferAndUnitaryTraceComparison--ET.0 carries its assigned consumer foundation. |
| 25 | right | AF's Wigner input balances central characters; the tempered range uses the split-centre quotient and coefficient hypotheses, as Harder–Raghuram §§3.1.4–3.1.5, pp.17–19. Vogan–Zuckerman's Hermitian specialization retains equal rank, as Ichino–Prasanna §7.1, p.40. Neither becomes a statement about every cohomological module. Original proofs remain obligations of the broader AF revision. |
| 26 | right | Almost-everywhere hyperspecial subgroups require the RG2.3 smooth reductive model. A bare integral Hopf model is insufficient. SR.4 supplies spherical commutativity/Satake; the invariant-line consequence retains hyperspecial and irreducibility hypotheses. |
| 27 | right | ALS's boundary formula imports SR.2/4 and RG2.4. Integral induction/Satake is unnormalized with its coefficient conditions, consistent with Harder–Raghuram Proposition 4.3, pp.25–26. No square root of q or complex admissibility theorem is silently imposed on integral coefficients. |
| 28 | right; frozen-stage handoff | AA's early neatness prefix precedes ALS and level maps. Milne §3, p.34, defines rational neatness and Proposition 3.5 gives finite-index congruence subgroups; AA separately plans the compact-open/rational-intersection bridge. Normal cores, faithful representation and effective-action/central-unit qualifications remain. Frozen D5/V0 integration is a maintainer action. |
| 29 | right | AF.1a has the single compatible pair/module/cochain owner before globalization and van Est. Local finiteness of orbit spans is distinct from countability. The compact GSp4 pair is formed only after central balancing; the Hodge stabilizer itself is not asserted compact. |
| 30 | right | The local AF.4 prefix has no ALS/AS suffix dependency. Rationality and torsion-Hecke conclusions import the ALS local-system/Hecke and ALS.5/AS.5 comparisons with their source hypotheses. Neither universal rationality nor coefficient descent is inferred. |
| 31 | right | Generic AF algebraic forms precede quaternionic specialization. Continuous p-adic coefficients need not have open kernel; base change is tested using the C2 sign obstruction rather than a universal failure at stabilizer primes. Class number, compactness modulo centre and definite-quaternion cuspidal constants are correctly distinguished. R18 degeneracy is the finite residual k-module/non-Eisenstein theorem of KW II Lemma 7.1, p.60; §7, pp.57–58, fixes the finite idele-class central character. Corollary 7.5, pp.65–66, supports the integral Taylor–Wiles route, not automatic residual base change. |

## Low-severity findings /32–/41

These are not the /1–/31 high/medium correction set assigned to FIX round 5. They were still read with their verification, so they are not silently lost. No additional job is claimed and no outside-file change is made.

| Finding | Disposition |
| --- | --- |
| 32 | Confirmed analytic/Weil–Deligne comparison suffix obligation; keep the Satake polynomial independent and require the actual arithmetic/analytic compatibility suppliers. AL's accepted revision owns this interface; round 5 changes none of it. |
| 33 | Confirmed baseline-reuse clarification. Pinned real Mellin holomorphy/inversion and dominated differentiation have power-bound, vertical-integrability, continuity and common-bound hypotheses. They do not replace local multiplicative/idele-class transforms or general Frechet-valued estimates. No new generic Mellin producer is added. |
| 34 | Rejected by the verifier: CC already imports the module/complex derived-limit owner; a spectrum Milnor theorem is a distinct object. No deletion is justified. |
| 35 | Confirmed CC baseline-citation refinement, outside these files. Generic exact colimits do not themselves supply every enhanced-derived tower comparison. |
| 36 | Rejected: ALS.6 is a CC re-export with its own finite-cover applications. No second tower carrier is established by the wording. |
| 37 | Confirmed AS baseline-citation refinement. Pinned Bochner Fubini/interchange/differentiation are conditional tools; automorphic integrability, direct-integral and unbounded-operator work remains. This is retained with the broader AS revision boundary. |
| 38 | Confirmed for the unreviewed RS-04 proposal, outside these files. Bernstein–Krotz §§2.1.2/2.3.1, pp.5/8, measures local real growth without adelic reduction; the shared global-height rationale does not justify that proposed edge. |
| 39 | Rejected as an asserted error: cup-product compatibility can mean projection formulas and adjointness. The degree counterexample excludes multiplicativity of the full Hecke operator; pinned Tau Ceti's GL2 degree theorem gives p+1. |
| 40 | Confirmed milestone refinement, retained in AF.1/harish-chandra-admissibility. Bernstein–Krotz Theorems 4.2–4.3, pp.21–22, distinguish finite multiplicities, finite infinitesimal-character fibres and finite-generation equivalences; finite length needs its additional proof input. This does not resolve AF's broader review. |
| 41 | Confirmed atlas extraction/title issue, outside these deliverables. The parent characteristic-zero comparison and early finite-level duality prefix remain distinct; no stage is deleted. |

## Remaining broader work

The following four `needs_changes` verdicts concern their own blueprint revisions, not missing round-5 packet/reader fixes:

- **BP-AutomorphicFormsOnReductiveGroups~2 and its review:** resolve the broad review's unverifiable supplier/proof boundaries and suggested main/API/test correspondence. Preserve this round's central-balancing, cochain, hyperspecial and algebraic-form corrections.
- **BP-AutomorphicSpectralTheory~2 and its review:** resolve REV-AutomorphicSpectralTheory B1–B4 (Schwartz continuation, LF-dual continuation, Fourier transfer and object-level tests), and the other false signatures listed by REV-FIX round 4, including dit_113, gm_splitting, gz_217, coarse_trace_identity, automorphic_kernel.operator and yu_169. The missing prebuilt import prevents a fresh full elaboration here; it is not the reason those mathematical signatures need repair.
- **BP-GrossZagierAndArithmeticHeights--GZ.0~2 and its review:** reconcile source versions/locators, exact split Shimizu supply and native carrier/API/test correspondence. Earlier requests for literal excerpts are superseded by the standing no-quotation rule; only source checking and accurate own-word statements remain requirements.
- **BP-QSeriesPartitionsAndMockModularForms~2 and its review:** retain the native form-preservation and physical-Lie hypotheses, reconcile fifth-order coordinates/Eulerian identities and supplier/proof comparisons, and resolve the recorded topology round-4 obligations. Elaboration with admitted proofs does not establish these correspondences.

The outside-file routes for CC.0, CC.8, R31, TC, p-adic Langlands, general-field p-adic L-functions, ET.0 and the unitary Jacobi consumer remain as listed in the fix report. Maintainer integration of frozen neatness, Schwartz–Bruhat ownership and early real/Jacobi prefixes remains separate. This review neither marks those implementations closed nor creates duplicate owners.

## Baseline, reader and validation evidence

The reviewed coverage audit was read for the relevant roadmaps. The baseline remains Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Round 5 adds no baseline claim: its only new references are the two existing AL.3 nodes. Their complete statements, hypotheses, prerequisites and source contracts were checked. Pinned Gamma definitions/doubling, Mellin holomorphy/inversion, dominated differentiation, product integration, projective-representation lifting and GL2 Hecke degree statements were also read. Algebraic scalar lifting does not imply arithmetic obstruction vanishing or continuity.

Mechanical reader checks cover statements, every hypothesis, proof step, prerequisite, acceptance check, API/test statement and source locator, after removing only Markdown emphasis and whitespace differences. All **236 nodes** of R17.3, R16.1, R18.2 and ALS pass that comparison. Focused AF/AS/GZ/QM corrections were checked separately, including the generic-to-specialized Jacobi request. Differences in untouched broad-revision reader regions are not certified by this limited comparison.

- All thirteen `scripts/check_blueprint.py` runs: **zero errors and zero warnings** each.
- Exact prerequisite graph: **2,206 roots, 4,618 reachable nodes, zero cycles, zero unresolved node/stage references, zero conflicting duplicate node records**. Stage/request/upstream leaves retain their explicit source obligations; graph reachability is not a proof of mathematical closure.
- No literal excerpt/quote/quotation fields occur in the reviewed packets. This review introduces only own-word assessments and source locators.
- Sequential `lean-check` runs were attempted for every companion after checking memory. No build, update, cache download or language server was started; no check remains running.

| Suggested file | Fresh result |
| --- | --- |
| R17.3 | elaborates; 26 placeholder-proof warnings only |
| AF | elaborates; 496 placeholder-proof warnings only |
| AL | elaborates; 183 placeholder-proof warnings only |
| R16.1 | elaborates; 84 placeholder-proof warnings only |
| R18.2 | elaborates; 33 placeholder-proof warnings only |
| IHG | elaborates; 509 placeholder-proof warnings only |
| MP.8 | elaborates; 316 placeholder-proof warnings only |
| QM | elaborates; 1,469 placeholder-proof warnings only |
| AS | stops at missing `TauCeti.Analysis.Semigroups.Group.Stone.Unbounded` object |
| ALS | stops at missing `TauCeti.NumberTheory.HeckeRing.Associativity` object |
| AA | stops at missing `TauCeti.Algebra.AlgebraicGroup.PointsFunctor` object |
| GZ.0 | stops at missing `TauCeti.AlgebraicGeometry.EllipticCurve.CanonicalHeight` object |
| MP.0 | stops at missing `TauCeti.RepresentationTheory.ProjectiveRepresentation.Extension` object |

The eight successful files import only Mathlib, whose shared build is exactly at its pin. The shared Tau Ceti checkout is newer (`cf386627e9176a3827c1a5fe804989fd94a4d216`), and lacks the five required prebuilt entry modules. Those five files have no fresh full-elaboration certification in this run. No attempt was made to rebuild or copy/in-line the libraries. Packet acceptance is a qualified planning review, not implementation verification.

## Public source receipts

The following public versions were accessed on 8 October 2026. The passages listed support the interface assessments above; original proof interiors explicitly retained as gaps are not newly certified. The exact 2013 YZZ publication is not certified from a different version. No private library source was used.

| Source | Checked locators | SHA-256 |
| --- | --- | --- |
| [Cogdell, Fields lectures](https://people.math.osu.edu/cogdell.1/fields-www.pdf) | Lecture 4, pp.30–34; Proposition 5.4, pp.41–42; Propositions 6.2–6.3/Corollary 6.3.1, pp.47–48; Proposition 8.2, p.63; Theorems 9.2–9.3, pp.74–75. | `2c5ec050a6db216dcd2104b7fe266ddc03e4db7c7d300239e60d6ee9c40618a7` |
| [Cogdell, Piatetski-Shapiro converse survey](https://people.math.osu.edu/cogdell.1/PSCT-www.pdf) | Section 2, pp.5–6; Theorems 3.1/3.3, pp.6/9. | `0c922b6e6c26bc6d98ad7cf1162955d34e61491a1e73dc1f803b987cab2f2ffe` |
| [Harder–Raghuram, 1405.6513v2](https://arxiv.org/pdf/1405.6513v2) | Sections 3.1.4–3.1.5, pp.17–19; Sections 4.2.1–4.2.3, pp.25–28. | `1d3af2de1c1a370dc339e10c74cda84f5e6f5b25c09810bfdf8bbbbc8df6ca06` |
| [Khare–Wintenberger II, author copy](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf) | Section 7, pp.57–58; Lemma 7.1, p.60; Corollary 7.5, pp.65–66. | `53f45f8be3b3c7de19f42417920d34a809e908412826490ebed90f07c8e86ed4` |
| [Knapp, archimedean Langlands correspondence](https://www.math.stonybrook.edu/~aknapp/pdf-files/motives.pdf) | Theorems 2 and 5, printed pp.403/406, inspected as images. | `684de4bcfc50e448fe52fddc863392012581b43097f40f8bcc4c83dbc5a2dfbb` |
| [Gan–Qiu–Takeda, 1207.4709v3](https://arxiv.org/pdf/1207.4709v3) | Theorems 7.3(ii)/8.1, pp.34–35. | `cde6b7ad22b974d4159f8cedd1e14a00bf4b05ec977ab750b54fdceb067adac5` |
| [Skoruppa, 0707.0718v1](https://arxiv.org/pdf/0707.0718v1) | Section 4, Theorem 5 and proof, p.13. | `a4cc378e16a7dfb361e3914bbaa5e02b10567ced8802267c09fcfa4b368407a0` |
| [Arthur, Introduction to the trace formula](https://www.claymath.org/library/cw/arthur/pdf/62.pdf) | Lemma 7.1, p.34; Section 12, pp.65–66; Section 18, p.102; normalization context p.135. | `2b6623010ce5d854732458dfb5e61600a4e6cc7288629a72cb63d5f7530ac510` |
| [Rapinchuk, strong approximation survey](https://arxiv.org/pdf/1207.4425) | Theorem 2.3/Remark 1, p.12; the Q/one-prime sketch, pp.16–17. | `43f6a45ceb9e51e1ca959c0d0574474cb1c20ea5a4e13852eee1886aceadab97` |
| [Milne, Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf) | Section 3, p.34, rational neatness and Proposition 3.5. | `f637e61735ff9cf9730c43d978d8f05185685a37d5e1920fc3347061c83d7c7e` |
| [Bernstein–Krotz, smooth globalization](https://arxiv.org/pdf/0812.1684) | Sections 2.1.2/2.3.1, pp.5/8; Theorems 4.2–4.3 and terminology, pp.21–22. | `f5f2e79d87532c9ac46389d7eb1606e0301eac0ba7c7972ab628e278e091ca3e` |
| [Chenevier, 0809.0415v2](https://arxiv.org/pdf/0809.0415v2) | Definition 2.19, p.33. | `f3c0e0d86e803301c617d3023d425752e30da46673ed5af932647eb284286953` |
| [Langlands, Base change for GL(2)](https://sunsite.ubc.ca/DigitalMathArchive/Langlands/pdf/book-ps.pdf) | Section 3, pp.16–20, especially pp.17–19. | `6af3f53d0eb0e841548f43151f9cb79fd2e12ceac4ca909aefeb08d5462758ab` |
| [Gelbart–Jacquet, GL(2) and GL(3)](https://www.numdam.org/article/ASENS_1978_4_11_4_471_0.pdf) | Sections 9.2–9.4, printed pp.532–535; scope of the T-converse variant. | `319347503f91fe22bec22ce7519b9ebaf09921ec4de8756c51d155864b4fc16a` |
| [Clozel–Delorme II](https://www.numdam.org/article/ASENS_1990_4_23_2_193_0.pdf) | Basic real induced representations and Theorem 1, pp.194–195. | `dd70f4069fdeec6fc31e44557f239080f5c169743dc8aa2de5b69659da594432` |
| [Arthur, real Paley–Wiener theorem](https://www.claymath.org/library/cw/arthur/pdf/15.pdf) | III Section 4, Theorems 4.1–4.2, pp.85–86. | `a78240ce1095e2a17591bf829fa726675ca865e77e8c3d663823d3dcf4fb8034` |
| [Ichino–Prasanna, 1806.10563](https://arxiv.org/pdf/1806.10563) | Section 7.1, p.40, equal-rank Hermitian hypotheses and A_q(lambda). | `058fda94ad08d245dcdf01672e5915beacb8458e6b49498b7e15debbf828aad5` |

Final submission checks: all fifteen changed files are authorized packet/report/handoff paths; `intake.py check-files` and `git diff --check` pass. The thirteen packet validators were rerun after the review objects were replaced.
