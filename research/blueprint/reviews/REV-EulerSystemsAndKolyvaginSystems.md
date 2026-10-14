# Independent review: Euler systems and Kolyvagin systems

**Verdict: needs_changes. This review is complete, not a checkpoint.** Three targets retain two substantive mathematical obligations: selected ring-class descent with its coefficient-compatible local relations, and higher-weight integral specialization at the coefficient prime. Clear repairs have been applied to the whole packet, reader and suggested Lean file. The roadmap remains `partial`; a proof outline is not a formalization.

Reviewer: Codex, session `codex-mIgt4O`, job `REV-EulerSystemsAndKolyvaginSystems`, issue #9383, 2026-10-14. The original whole blueprint was written by Claude in session `claude-Tq5V20` (PR #9578, issue #9412). This session wrote neither that blueprint nor either imported part. This is a blueprint review, not the time-limited package-review job.

## Material reviewed and result

The logical roadmap has **146 targets: 124 imported and 22 local**, including the newly added maximal-order evaluation theorem. There are 41 definition nodes, 19 construction nodes, 66 theorem nodes, 10 lemma nodes, seven applications and three comparisons. All 60 definitions/constructions retain APIs and at least three discriminating tests: **424 API entries, 218 tests and 45 planets** in total. Node verdicts are **108 verified, 34 corrected, three unverifiable and one added**. “Verified” here means the exact target-level statement, hypotheses, source match and proof route were checked; it does not assert a Lean proof.

Every original target's statement, hypotheses, proof steps and direct prerequisites were read. Every API and test was checked, including the imported records. All 49 baseline entries were checked by reading their Lean statements; there are 44 distinct declarations after removing repeats. The node register below and the packet's `review.checked` cover the exact logical node set. Direct supplier statements were read, including the compact-coefficient comparisons used to replace overly broad discrete-cohomology claims.

The whole Lean file was rewritten in the current statement-only shape. Its eight light definitions have real bodies, and all their carriers exist at the pins. Ten examples include the reversed Euler-polynomial sign, the quotient-polynomial sign, the difference between order and exponent, the beginning of the derivative/norm sums, and the full-module/socle negative control. Heavy arithmetic carriers and every remaining API/test live in the reader. The final file has263 lines and elaborates with eight `sorry` warnings and no errors. The file has one outer roadmap namespace and no admitted data, development chains or packet-ID catalogue. The reader is organized as roadmap prose with exact hypotheses, nearby locators, named APIs, **Checks**, examples, supplier contracts and dependencies. Nothing mathematical was discarded to shorten either document.

## Assembly and import provenance

The whole packet uses exact-hash imports; the part files were not edited:

| Import | Targets | SHA-256 | Current part review |
| --- | ---: | --- | --- |
| `EulerSystemsAndKolyvaginSystems--ES.0.json` | 89 | `7ce915210b8a29761cd15199968017928c6a1b6c2322daff12fc6b2f8789dcf2` | `REV-EulerSystemsAndKolyvaginSystems--ES.0~3`, needs_changes, 2026-10-14 |
| `EulerSystemsAndKolyvaginSystems--ES.8.json` | 35 | `eab9fb0a60fcbf40dee7bf007491b13612ac1719ea27d9125d4fa7c5ee25c395` | `REV-EulerSystemsAndKolyvaginSystems--ES.8`, accepted, 2026-10-06 |

The latest ES.0 review stopped at its 5,497-line/admitted-data shape gate and expressly did not certify the mathematics. This review independently read those 89 target records; the part's latest verdict was not treated as mathematical certification. The whole suggested file has its own compact shape. This does not change the part review or make the part ready for separate packaging.

Apply `assembly.importedNodeCorrections` to string leaves first, then `importedFieldAdditions`, then the explicit prerequisite removals/additions, then apply `importedStageAssignments` by setting each named record’s `parentStageId` and `realises` to the assigned stage, and finally add the local nodes. Stable imported IDs are preserved. Seven placements put the MR records, their implications and arithmetic examples in Layer1 and Rubin’s derivative-prime selection in Layer4. The reader sorts each layer topologically; every internal prerequisite is in the same or an earlier layer. Prerequisite lists are corrected by their dedicated fields, never by pairing positions in reordered lists. The whole `requests` array is the complete corrected contract union, now 24 contracts; it replaces the uncorrected part union. A separate read-only reconstruction checked that every replacement matches, every imported hash agrees, the resulting 146 records equal those used to render the reader, all internal references resolve and the internal graph is acyclic and has no forward layer dependency. The standard blueprint checker validates the 22 local records; this reconstruction covers the 124 imports as well.

## Genuine remaining obligations

1. **`ES.3/ring-class-derivative-classes`.** Bounded restriction does not produce a unique inverse image. If restriction has kernel/cokernel annihilated by p^ν, choose a preimage of p^ν times the invariant derivative and multiply the selected preimage by p^(2ν); its restriction is p^(3ν) times that derivative, and the selected result is independent of the initial choice. The plan still must establish the bound for the relative extension K_c→K_cn and prove that this selected class agrees with the canonical local classes used in (K1)–(K3). Castella–Hsieh §7.2, pp.29–30, supplies neither that identification nor a unique lift. The scalar (K2) formula is retained only for χ²=1. A nonquadratic formula needs explicit transport between the conjugate coefficient twists.
2. **`ES.4/rational-anticyclotomic-descent`.** The nonquadratic application depends on the preceding unresolved construction and local operator transport. Reading Nekovář's MPIM1990-78 preprint resolves retrieval, but its untwisted Proposition10.2 is not the missing character-compatible theorem. A citation to that proof does not discharge this target. The 1992 version of record was not compared.
3. **`ES.8/augmentation-prime-divisibility`.** The rational higher-weight conclusion and the augmentation-prime argument have a sound route. The integral higher-weight conclusion at (π) does not yet have one in this plan. Along Q_m=π+T^m the specialization ring has O-rank m. An error allowed to depend on that rank can grow with m, so division by m does not remove it. Supply a uniform or o(m) bound, or a proved µ(M)=0 comparison with the actual ordinary Selmer structures. Keller–Yin Theorem3.0.5, pp.36–37, asserts the integral conclusion; this finding concerns the missing argument here and does not declare that theorem false.

Other recorded limitations do not independently reject this target-level partial plan. The original Kolyvagin 1990 article was not read: Rubin's public ChapterIV gives the method used here. The classical square-index constant independent of K remains an explicit external application request; an annihilator exponent is not a substitute. Generic maximal-order theory, compact/discrete Selmer interfaces and arithmetic CM constructions are exact supplier contracts. Lemma-level refinements listed by the earlier parts remain refinements, rather than new target-level nodes inserted merely to enumerate a proof.

## Corrections and ownership

The following changes include the API and test consequences, and apply through whole-packet overlays when a node is imported. Nodes with an unresolved part are listed above even when their false assertion was repaired.

| Target or contract | Repair and mathematical reason |
| --- | --- |
| MR hypothesis records, implications and arithmetic examples; Rubin prime selection | Move the six MR-related targets to Layer1, after conductor ideals and prime sets; move the derivative-dependent Rubin selection to Layer4. These are explicit whole-assembly stage assignments, preserving imported IDs and source hashes. |
| MR04Hypotheses.invariants_eq_bot and residual non-example | Remove the surviving arbitrary-subquotient API/proof claims. Under (H.1) and (H.3), use coefficient ideal quotients T/IT and dual ideal torsion T*[I]. Core rank is defined independently of the false arbitrary-subquotient assertion. The Rubin comparison is a later application. |
| ES.8/generic-core-rank | Scope the displayed MR cyclotomic rank_{Z_p} formula to O=Z_p. Over larger O use coefficient-linear rank_O from the Selmer contract; an unramified quadratic O gives ranks2 and1 for the same free O-line. |
| ES.8/self-dual-lambda-adic-kolyvagin-bound; lambda-adic-ind | In the abstract O-version use the prime (ϖ), perturbations g+ϖ^m and T^m+ϖ, and O-length; (p) need not be prime when O is ramified. State finite generation and Λ-torsion-freeness explicitly for the coordinate-gcd construction. |
| ES.1/twist-error-constants | For odd p, Γ≅Z_p has no nontrivial quadratic continuous character. Use C_α=0 for the trivial character and the valuation formula for a nontrivial one. The close-to-one formula requires m≥1. Image constants are invariant under integral lattice conjugacy; arbitrary isogeny can change them. |
| ES.1/residual-two-class-detection | Restore the perfect equivariant alternating pairing with cyclotomic determinant. A GL₂(k₀)-surjective image with that determinant forces k₀=F_p. Use the stated Selmer condition at bad places, and the actual coefficient field K(V). Dependence of two nonzero classes is not automatically a counterexample. |
| ES.1/reducibility-depth, selmer-field-saturation, abundant-tuples, ES.4/abundant-localization | Cite the cleared published LTXZZ text and its printed pages, rather than claiming to have read the historical arXiv copy. Keep the shortened coefficient quotient, prime-field/Frobenius-twist Hom condition, realised Frobenius-span restriction and scaled inverse. The false diagonalizing-basis assertion is not restored. |
| ES.1/abundant-tuple-existence | Make the induced Shapiro/evaluation/prime-to-p averaging argument explicit. Its compact comparison is a direct `ArithmeticGaloisDuality:D7/compact-shapiro-projection` contract. In the base-change case the coefficient-line sign must match the Selmer eigenspace. |
| ES.2/ring-class-anticyclotomic-euler-system | Restore p∤2(2r−1)!Nφ(N), the splitting of every prime of N, the discriminant/unit convention, locally algebraic χ of type (j,−j), the chosen ideal of norm N and its Artin action, and ramification support pNco_n. The abstract ring-class construction is not given a p-splitting hypothesis from a later Iwasawa application. |
| ES.3/congruence | Use [K(q):K(1)] in the polynomial denominator, including the multiplicative-group example. This is the relative ramified degree dividing N(q)−1. |
| ES.3/derivative-local-properties; ES.4/variant-bounds | Add the actual local-lift/key-relation and unramified-derivative inputs. Separate finite-depth loss from the clean Euler-system argument and retain exponent rather than length conclusions. |
| ES.3/congruence-units-example | Full H¹(K_q,Z_p(1)) contains the uniformizer valuation summand. Residue units identify the finite/unramified subgroup, not full H¹. Add that local-condition distinction and its uniformizer negative control. |
| ES.3/local-lifts | Discrete cd_p(Ẑ)=1 does not assert H²=0 for arbitrary compact coefficients. For finite free X=T^I, finite H¹ of X/p^aX gives Mittag–Leffler; the Milnor sequence and continuous-section exact sequence then provide compact H² vanishing and the required reduction surjection. |
| ES.4/rubin-hypotheses | Rubin V.3.2 and AppendixC require irreducibility of V for the analytic-group finiteness assertion. Restore it. |
| ES.4/howard-descent-with-errors | Keep the exact finite-level CGLS3.2 hypotheses. The Heegner/split-p standing assumptions belong to the cited Iwasawa arithmetic instance and were not retroactively imposed on that finite-level theorem. |
| ES.4/uniform-near-trivial-bound | Read the complete CGS6.4 induction (a)–(g), give its constants and remove the old claim that this induction remained unaudited. The Keller–Yin instance has a trivial-nebentype weight2r form, stable self-dual lattice, ordinary Eisenstein prime, residual H⁰=0 and the stated CM/splitting hypotheses. Odd r concerns the distinguished class construction, not the abstract system bound. |
| ES.4/maximal-order-evaluation-bound (added) | Give finite X and W, separated equivariant pairings, central conductor elements c,d and the uniform cd-annihilator of the evaluation cokernel. A maximal order by itself is not the pairing theorem. Morita reduction retains multiplicities and uses hereditary/projective lattice facts. |
| ES.4/nekovar-all-prime-descent | Use that generic evaluation theorem directly. Move the arithmetic CM dictionary to HE.1/HE.2, rather than depending on the later HE.7 finiteness application. Check the two explicit constants as annihilator exponents. The exact conditional CM theorem remains in prose; no weaker Lean geometric substitute is asserted. |
| ES.5/self-dual-eigenspace-localisation | Use nonzero residual classes and sufficiently deep auxiliary primes outside the conductor, with cartesian/socle propagation. Full artinian nonzero localization can vanish on the socle. |
| ES.5/self-dual-core-vertex-rigidity | Use residual nonvanishing in the core-vertex criterion. Multiplication by p on Z/p² gives the negative control. |
| ES.5/self-dual-divisibility-profile | Finite-level indices lie in [0,k] with index(0)=k. Define the minimum over all conductors, take the stable supremum/limit, and truncate d_k=min(d,k). Residual-surjective elliptic monotonicity is not promoted to generic Howard data. |
| ES.5/structure-theorem | The artinian zero-leading-term lower bound requires a primitive system, as does its source MR04 Theorem4.5.6. Scalar multiplication of a primitive system gives a nonprimitive zero-leading-term counterexample to the unrestricted module assertion. |
| ES.6/exterior-bidual | The torsion-to-zero dual example is over a DVR, for instance R=Z_p and a=p. Over a self-injective artinian ring finite torsion modules can be reflexive. |
| ES.8/error-tolerant-self-dual-lambda-adic-bound | Retain the functional equation for D. Replace only the control/error factor; include (p) in the exceptional set for the bounded-error branch. Specify the actual split-N/split-p elliptic Iwasawa instance. |
| ES.8/self-dual-lambda-primitivity-equality | Separate P≠(p), where Q=g+p^m has fixed finite coefficient rank, from P=(p), where Q=p+T^m has rank m and normal-order index1. Convert coefficient-order length to Z_p-length using residue degree. Use primitive finite-level bounds/control, rather than claiming constant normal-order rank in the p branch. |
| SelmerIwasawaCohomology L4 Hensel/primitive control contract | Over general O use Q=T^m+π, not T^m+p. The latter is Eisenstein in the stated manner only for O=Z_p. Retain the residue-degree factor in lengths. |
| HE.0 ring-class contract | Use the exact conductor kernel (ℓ+1)/[O_c×:O_cℓ×], and retain the stable-unit convention. The rank-two inert comparison is not the MR rank-one-coinvariant comparison. |
| PadicMeasuresIwasawaAlgebras L6 / IntegralIwasawaTheory I.7 | Generic Fitting ideals already exist in Tau Ceti. Request Gorenstein bidual/transfer and functional-lift comparisons, with the normalized transfer, from L6. Request ordered archimedean Rubin–Stark regulators and integrality from I.7 PartII; the finite-place CM minus ord_G map does not provide them. |

## Adversarial pass

Every target was checked at its actual generality; the complete statements and unit tests remain in the reader. The table records the principal witnesses and changes. Tests that are hypotheses-verification obligations are distinguished from computed examples; algebraic controls are not claimed to be arithmetic realizations.

| Family checked | Instance or calculation | Result |
| --- | --- | --- |
| Coefficient category and support | Empty prime set; finite F_p coefficient; trivial dual μ_p at p; Q with discrete topology | Support contains p and infinity, finite modules belong to both coefficient categories, and infinite-residue-field Q is excluded. |
| Squarefree conductors | Empty product1, two primes, a prime square | Divisor closure and four two-prime conductors; no prime square. |
| Euler polynomial | Rank zero; rank one identity; invertible f vs general endomorphism | Constant coefficient1, polynomial1−X, and inverse Cayley–Hamilton requires an automorphism. |
| Derivative and norm | m=0,1,2; a lift whose m-th power is not1 | D₁=0, D₂=σ, N₁=σ; lifted relation uses mσ^m−N, with order hypothesis only for m−N. |
| Finite–singular polynomial | P=1−X; P(1) nonzero | Quotient−1; subtract P(1) before division. |
| Unit congruence | Residue unit vs local uniformizer | Only the finite/unramified subgroup is residue units; full Kummer H¹ has valuation. |
| Twist constants | α=1; odd-p Γ; α(γ)=1+p^m u | No nontrivial quadratic character; m≥1 gives C_α=m. |
| Selected restriction | Nonzero kernel killed by p^ν | Preimages are not unique; the scaled selected class and its p^(3ν) restriction are independent of a choice. |
| Conjugation | χ²=1 vs χ²≠1 | Scalar K2 retained in the first case; paired coefficient operator needed in the second. |
| LTXZZ scalar restriction | k=F_p vs F_{p²} with Frobenius-twisted characters | Prime-field Hom vanishing differs from k-linear Hom vanishing. |
| Abundant Frobenius | Quadratic CM extension, a real fundamental unit and complex conjugation | Every conjugation lift squares to1; fixed coefficient line need not be realised. |
| Abundant matrices | Rows(1,0),(1,π) over O/π^n | Image contains πA²; diagonalizing basis impossible. Scaled inverse survives. |
| Artinian structure | Primitive stalk with bottom class p over Z/p², then scalar p | Nonprimitive zero leading term does not force the primitive lower bound. |
| Core vertex | Nonzero p in Z/p² and multiplication by p | Full-group nonzero differs from residual/socle nonzero; Lean control uses ZMod25. |
| Stable profile | Bottom class π² at k=1,2,3 | Indices1,2,2, rather than one constant index at all levels. |
| Stark family | Nonzero bottom coordinate, zero next coordinate | Fails the transition relation. The existing negative test was retained. |
| Exterior bidual | Z_p/p vs self-injective finite coefficients | DVR torsion dual vanishes; artinian reflexivity has different hypotheses. |
| Height-one p branch | Q=p+T^m over Z_p[[T]] | Degree/rank m, maximal order already normal, conductor index1; length of quotient by p^a is ma. |
| General coefficient order | Ramified O and π, residue degree f | T^m+π is the correct Eisenstein perturbation; Z_p-length includes f. |
| Bounded-error specialization | Fixed-degree g+p^m vs growing-degree π+T^m | The clean primitive bound controls the first rank-one equality argument; a rank-dependent higher-weight error cannot be discarded in the second. |
| Maximal-order pairing | Finite cyclic W; infinite ⊕F_p with coordinate pairing | Finite hypotheses are essential: direct sum→product evaluation is not surjective even for maximal orders. |
| Characteristic index | Zero class; rank-one map multiplication by p | Ind(0)=0; a zero kernel alone does not make a map a pseudo-isomorphism for the value-ideal computation. |
| All-prime descent | p=2; quadratic vs nonquadratic χ | Retain the two constants, including ord_p(2) terms; do not replace exponent bounds by square-index lengths. |

The parity, dual-polynomial and finite–singular signs were checked against two-term examples. Nonzero bottom classes and primitivity were never interchanged. No conclusion was installed as a hypothesis, and no `True` or admitted-data carrier was used to make Lean elaborate.

## Supplier, duplication and routing audit

The pinned baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The shared build's Mathlib revision agrees with the pin. The ten distinct cited Tau Ceti module files were compared byte-for-byte with `git show` at f790474 in the current library checkout. The source declarations below were read, not inferred from name searches. Discrete additive H¹ does not supply an R-linear compact Selmer carrier; current Fitting-ideal definitions do not supply system-level Fitting bounds.

Current TauCetiRoadmap and current Tau Ceti were inspected by mathematical object, including the nine roadmaps newer than the atlas snapshot: AlgebraicVectorBundles, DifferentialGeometry, IntegralLattices, LocalGaloisGroups, OperatorTheory, OrthogonalSpinGroups, PeripheralActions, ProfiniteArithmetic and RealAlgebraicGeometry, and Completed ContourIntegration, EffectiveBounds, OrthogonalL2Bases and RestrictedProducts. No Euler-system, Kolyvagin-system, Stark-system or arithmetic Selmer-bidual target was found already supplied there. Generic Fitting-ideal ownership was corrected; no existing generic exterior power, module length, torsion decomposition or discrete Shapiro theorem is newly planned. The read-only current checkouts were not built or modified.

Direct contracts checked include Chebotarev Layer10 (finite Galois extensions and Dirichlet density), ClassFieldTheory Layers5/7/13 (finite local duality, arithmetic Artin normalization and class fields), ProfiniteCohomology Layer11 (discrete cohomological dimension), ArithmeticGaloisDuality R02.1 and D7 (actual inverse-limit/Milnor/continuous-section and compact Shapiro interfaces), SelmerIwasawaCohomology Layers2/3/4 (coefficient category, duality, control and primitive specialization), PadicMeasuresIwasawaAlgebras Layers4/6 (Iwasawa and Gorenstein/transfer inputs), HE.0/HE.1/HE.2 and ClassicalArithmeticCompletion CA.7. PartII requests identify what the current supplier does not yet state: they are not assertions that a general layer title provides the missing theorem. IntegralIwasawaTheory I.7's finite-place minus construction was read and separated from the requested archimedean regulator.

The routed-item coverage records were compared with their targets and arithmetic owners. Red-team findings RT-AREA-iwasawa-1/10, /35 and /36 were read and independently checked. The six existing routing proposals are retained: Beilinson–Flach arithmetic ownership; direct ES→cyclotomic/Kato inputs; the rank-one ES.8 dependency on ES.5 rather than ES.7; and the corresponding HE/GH/BSD handoffs. The added seventh proposal gives ES.4 ownership of generic maximal-order evaluation and HE.1/HE.2 ownership of the earlier geometry. No stage edge, label, accepted source packet, other job file or atlas data was changed. The maintainer/orchestrator must apply any accepted routing move.

## Source findings and versions

All inherited findings were independently revalidated at their locators. The whole packet now has **19 confirmed entries**, each attributed to this review. Four entries bring in relevant LTXZZ findings previously stored in `PAPER-LIU-ETAL-22`; they were re-derived against the cleared published text, not accepted from the earlier review's attribution. The register's `printed` field paraphrases the defect in our own words. There are no quotations or copied source passages in these deliverables.

The following table is a finding register, not a section-by-section summary of any source. Full corrections, witnesses, reach and the exact edition comparison are in `sourceIssues`.

| Finding | Locator and edition | Confirmed defect/repair |
| --- | --- | --- |
| E901 | Chapter IV §8, Example 8.2, p. 78 (author's 1999 draft) | The unit congruence denominator is the relative degree [K(q):K(1)]; the book-format copy corrects the draft. |
| E1 | Hypothesis 4.7(ii), p. 22 of arXiv:1805.08448v1 | BSS τ must not be required to fix the coefficient-trivializing field; this contradicts the rank-one quotient in higher rank. |
| E2 | 1999 course draft Chapter IX §1, p.133; also book-format author copy §9.1 p.175 (PDF p.181) | Rubin’s rigid-family example needs ramification away from N, rather than only at N; the published copy retains the incompatible wording. |
| E3 | Archived author copy, Proposition 3.4.4(ii), p.27 (PDF p.33) | MR cyclic global sections need not be a scalar ideal of a general coefficient ring; retain the free-hub/principal-artinian setting. |
| E4 | Lemma 2.1.4, p.15; repeated use in Lemma 3.5.2, p.28, archived author copy | Residual H⁰ vanishing does not pass to all subquotients. Restrict to ideal quotients and use the Gomez erratum and BSS refinements. |
| E5 | Proposition 3.4.4(iii), p.27, archived author copy | The non-hub edge ideal rule is not valid over arbitrary R; use a free starting hub or the principal-artinian case. |
| E801 | §5.3, Definition 5.3.8, p. 61, in the authors' version of 20 October 2003 (the published Memoir was not available) | At zero, the coordinate-gcd index is zero while the torsion quotient’s characteristic ideal is the unit ideal; keep the separate zero convention. |
| E802 | Ch. II §3, proof of Theorem 3.8, p. 29, in the 1999 draft | Draft Rubin II.3.8 uses an undefined φ; the intended map is ψ. The book-format copy has corrected notation. |
| E803 | Ch. VI §2, proof of Proposition 2.1(ii), p. 91, in the 1999 draft (published: Proposition 6.2.1, p. 122) | Draft Rubin VI.2.1 uses decomposition-group invariants where the finite local condition uses inertia; the published proof has a different, valid local argument. |
| E902 | IV.Example8.2 p.78 (1999 draft), also4.8.2 p.103 (book-format author copy) | Residue units describe finite/unramified Kummer H¹, not full H¹; the uniformizer valuation summand remains in both versions. |
| E903 | Theorem2.4.5 proof p.23, arXiv1908.09197v1 | Zanarella’s p-branch quotient is not of bounded finite Z_p-order. Use the actual degree-m coefficient ring and primitive specialization control. |
| E904 | §7.2 p.29, author version dated2July2022 | A restriction map with bounded kernel/cokernel does not have a unique inverse image; use selected scaled descent. |
| E906 | §7.2(K2) p.30, author version dated2July2022 | The displayed scalar conjugation rule needs quadratic χ or a coefficient-changing operator; general χ changes the twist. |
| E907 | Data6.4.2 and Proposition6.4.3 pp.38–40, archived51page author manuscript | Nekovář’s maximal-order evaluation assertion needs finite X and W; infinite direct-sum pairing gives direct sum→product. |
| E905 | Theorem2.3.8 proof, printed p.43 (book-format author copy hosted by W.Stein); compare draft II.3.8 p.29 | Published Rubin2.3.8’s value-ideal computation needs a pseudo-null cokernel as in the draft; a pseudo-null kernel alone is insufficient. |
| E908 | Proposition2.6.7, published p.135 | LTXZZ abundance does not produce a diagonalizing basis; retain a scaled inverse and its bounded-loss diagonal family. |
| E909 | Lemma2.3.5(b), published pp.127–128 | LTXZZ prime-field congruence quotients require vanishing for all Frobenius twists, rather than only coefficient-linear End. |
| E910 | Lemma2.6.4 and Proposition2.6.6, published pp.134–135; definitions pp.132–133 | LTXZZ associated Frobenius evaluations may have the wrong quadratic eigenspace sign; use a realised-span hypothesis. |
| E911 | Lemma2.3.4, published p.127 | LTXZZ saturation uses the shorter coefficient quotient m−m′; remove the stray p from its proof notation. |

Public source searches and the particular draft/published comparisons are recorded per finding. No claim is made that all historical errata were exhausted. The author-copy edition of MR04 was read; the publisher’s Memoir was not compared. LTXZZ and Zhang were read in the maintainer-cleared copies. Those files and their passages were never copied to the repository or scratch. Kolyvagin’s original article, the Inventiones1992 Nekovář version and the cited Curtis–Reiner book were not read; their absence is stated rather than silently replaced by an attribution. The maximal-order proof route uses Nekovář’s actual §6.4 argument and an explicit supplier contract for its general order theory.

Artifact identities below record the versions actually consulted. Reading covers the relevant targets and proofs listed, not every page of each work. Printed pages distinguish the edition from the PDF page count.

| Artifact | Sections/pages read for this review | SHA-256 |
| --- | --- | --- |
| [author copy](https://swc-math.github.io/notes/files/99RubinES.pdf) | Rubin1999 draft: I–III relevant definitions and examples; IV55–78; V79–88; VI89–94; VII97–122; IX133–141; AppendixA; AppendixC159–162. | `de47655dc35066fd01f2e76a37076ad03dee62e816130586c7674e520be73d50` |
| [published](https://www.wstein.org/people/rubin/book/hEulerSystems.pdf) | Rubin book-format copy: page images42–43,103,122,175; comparisons for the recorded findings. | `1b0229731e38bfaaa55b38a219c055019d1c7db1f0ecec3c083125da87b6e8e4` |
| [preprint](https://arxiv.org/abs/2008.02571v2) | CGLSv2: §3.2–§3.4, pp.16–27, including the finite-level induction and the Λ-adic arithmetic standing assumptions. | `7cd995e0d9ee1c931f728da8b39603c4205fa0a84c25df27d44b4451a81a2c59` |
| [preprint](https://arxiv.org/abs/2303.04373v2) | CGSv2: §6.1–§6.5, pp.21–28, including the complete (a)–(g) induction. | `5046d7571ed3a1b13baa56b2c94186d9c9488d76181062f4ba82b8ab5158af90` |
| [preprint](https://arxiv.org/abs/2312.09301v2) | BCGSv2: §2, in particular Theorem2.1 and the divisibility-profile argument; the relevant page image for the printed formula. | `e575367ab8dd9ffdb1850959dde93f205c4007b0e56af4ed30e120079660aee3` |
| [preprint](https://arxiv.org/abs/2402.12781v2) | Keller–Yinv2: introduction/standing hypotheses and §3, pp.34–37, especially Theorems3.0.5–3.0.6. | `bb64820b49aa1eb2574c912c0d03067f904e52b9bf71f441fda78bb6dba9c90a` |
| [author copy](https://www.math.ntu.edu.tw/~mlhsieh/research/HCES.pdf) | Castella–Hsieh author version2July2022: §4.1 pp.14–15, §6 pp.26–28, §7 pp.29–38. | `5c85ea3c0d53ce4825ade4213b930c6542bf628cba6d506bb8c3e46960f02bba` |
| [preprint](https://arxiv.org/abs/1908.09197v1) | Zanarella v1: statements on pp.4–5, §2.1–§2.4 pp.10–24; residual localization, profile and p-branch proofs. | `00d91f8d73880174f410ac4be2a43f89867421c0ab7bfafdba1b837111df312f` |
| W. Zhang, Cambridge Journal of Mathematics 2 (2014), 191–253 (copy cleared by the maintainer) | Zhang published: p.203 and §8.1 pp.234–237; residual hypotheses, two-class detection and core-vertex input. | `698eb8a6d2297684c683c4c3f43a195cac1d8752ef0c8362ab90c74f5b3792ec` |
| [published](https://par.nsf.gov/servlets/purl/10323568) | LTXZZ published: §§2.3–2.6 pp.126–135, with the shortened-coefficient, Frobenius-twist, sign and matrix corrections. | `dd821abd2b06233cb69cdc88de242b689686d5f2ce0c2072128abcd54ec89d97` |
| [author copy](https://web.archive.org/web/2020id_/https://www.math.uci.edu/~krubin/preprints/kolysys.pdf) | MR04 authors’ copy20October2003: relevant rank-one theory pp.7–68, examples pp.71–75, AppendixA and the cited auxiliary statements. | `4cc432d0d719a51c8dd1d2b27829014b9f090f7c53f179d6c628e6208c84e01f` |
| [preprint](https://arxiv.org/abs/1312.4052v1) | MR higher-rank v1: §§2–5 pp.6–10, Stark/Kolyvagin/regulator and ideal statements through p.25, AppendixA/Gomez erratum pp.28–32. | `15ec72e48fab1790e5b96e7172b4af88c974b0d487a515cdbd9dd0ced3ea4ee8` |
| [preprint](https://arxiv.org/abs/1805.08448v1) | BSSII v1: §§2–7, pp.7–50, including Gorenstein duality, hypotheses, contraction, regulator and derivative/transfer proofs. | `2f6da843d3dcedde65a2b04b80c711863306f9fd9ab20580d245d2c4d2f06429` |
| [published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1BF8414258216C1575963BBDA814CB2F/S0010437X04000569a.pdf/the-heegner-point-kolyvagin-system.pdf) | Howard published: relevant self-dual setup, structure and rigidity proofs pp.1441–1459. | `89082beb9117b111558f1c62356a0610602781ec2a2b3487ce561920cf4d78d7` |
| [preprint](https://arxiv.org/abs/2010.00657v3) | Dasgupta–Kakde v3: §1, pp.7–9, finite-place minus Rubin lattice and ord_G comparison. | `c1fe1cd8e1d218b4d44c58b1171c561b5955261340e345e51f9c82fa33b63099` |
| [author copy](https://web.archive.org/web/20240000000000id_/https://webusers.imj-prg.fr/~jan.nekovar/pu/euler.pdf) | Nekovář CM archived51-page manuscript: pp.18–19,33–43,44–51; §6.4 maximal-order evaluation and both descent constants. | `05c8debf4783f4604afe71a0b4367554ac62d52a6a462daa5e2e8c2ed6bfd26a` |
| [published](https://msp.org/ant/2018/12-10/ant-v12-n10-p.pdf) | Sakamoto published issue: pp.2313–2314, Fitting/regulator statements and their coefficient hypotheses. | `ea04b2b3cafe1b990ab32c461f8aea0563baf75fa11b0e93eaea06b1cb325ee0` |
| [preprint](https://arxiv.org/abs/1406.4623v1) | Sano2014 v1: pp.3–7, functional lifts and normalized integral transfer. | `83ca6e59cefdb60833f418aa57617a451101977de1b767ddf6138661758ccea4` |
| [published](https://www.numdam.org/article/JTNB_2016__28_1_145_0.pdf) | MR higher-rank published Numdam: the relevant statements/proofs pp.171–183, including the erratum. | `00725ad7afc9d7f3d69dac9eb8f872319974bf846be850dc3c0b56ba3b49d926` |
| [preprint](https://arxiv.org/pdf/1202.6340v1) | Howard arXiv2012 v1: pp.22–28, height-one specialization and self-dual Λ-adic theorem. | `d2d06e851d6aa1fdc33a932b69b5c06a8c56dc2d9e05fb10d97c0358d6d6ea9a` |
| [preprint](https://arxiv.org/pdf/0706.0377v2) | Büyükboduk v2: pp.27–29, Remark3.24 and its primitive/control comparison limits. | `645d299256ae61e1bfd63564c68510785a39e52684cbaa720d7d6017fe1f5bf2` |
| [author copy](https://archive.mpim-bonn.mpg.de/994/1/preprint_1990_78.pdf) | Nekovář MPIM1990-78: printed pp.12–13,18–23; restriction and local relations. The archive identifier is994, not3379. | `8f3aaf7c9085d2deb117fd860d2d7f2bd226fa6d63b37c3b2f4d379a77b8a529` |

## Baseline declaration register

Each entry below was read with its actual hypotheses at the pin. The module and the precise `provides` contract remain in the packet or imported part. The register removes repeated entries; it does not count a broad module name as a theorem supplying an arithmetic adapter.

| Declaration | Module | Usable input |
| --- | --- | --- |
| `tauceti:TauCeti.ContCohomology.H1` | `TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean` | First continuous cochain cohomology H¹(G, M): continuous 1-cocycles modulo coboundaries, as a bare additive group |
| `tauceti:TauCeti.coind` | `TauCeti/RepresentationTheory/Homological/ContCohomology/Coinduced.lean` | The coinduced module of a subgroup U ≤ G: locally constant maps f : G → A with f(u·g) = u·f(g), with the right-translation action; for U trivial this is Rubin's 𝕎_M = Maps_cont(G_K, W_M), for U = D it is Ind_D(W_M) |
| `tauceti:TauCeti.ContCohomology.explicitShapiro1` | `TauCeti/RepresentationTheory/Homological/ContCohomology/Shapiro.lean` | Shapiro's lemma in degree one: for profinite G and a closed subgroup U, H¹(G, Coind_U^G A) ≅ H¹(U, A) for discrete A |
| `mathlib:Module.equiv_directSum_of_isTorsion` | `Mathlib/Algebra/Module/PID.lean` | A finitely generated torsion module over a PID is a finite direct sum of cyclic modules R/(p_i^{e_i}) with p_i irreducible |
| `mathlib:Module.length` | `Mathlib/RingTheory/Length.lean` | Length of a module (ℕ∞-valued), for the length comparisons along the perturbations 𝔓_N. |
| `mathlib:IsDiscreteValuationRing` | `Mathlib/RingTheory/DiscreteValuationRing/Basic.lean` | A local PID that is not a field; S_𝔓 is one. |
| `mathlib:Polynomial.X_sub_C_dvd_sub_C_eval` | `Mathlib/Algebra/Polynomial/Div.lean` | X − C a divides p − C(p.eval a), giving the quotient Q with (x − 1)Q(x) = P(x) − P(1) |
| `mathlib:Polynomial.divByMonic` | `Mathlib/Algebra/Polynomial/Div.lean` | Division by a monic polynomial, used to write Q_q = (P − P(1)) /ₘ (X − 1) |
| `mathlib:Squarefree` | `Mathlib/Algebra/Squarefree/Basic.lean` | Squarefree elements of a monoid; used for the index set N(P) of squarefree products. |
| `mathlib:LinearMap.charpoly` | `Mathlib/LinearAlgebra/Charpoly/Basic.lean` | The characteristic polynomial of an endomorphism of a finite free module; the Euler polynomials are its reversals. |
| `mathlib:LinearMap.aeval_self_charpoly` | `Mathlib/LinearAlgebra/Charpoly/Basic.lean` | Cayley–Hamilton: aeval f f.charpoly = 0. |
| `mathlib:MonoidAlgebra` | `Mathlib/Algebra/MonoidAlgebra/Defs.lean` | The group ring k[G], in which N_Γ and D_σ live. |
| `mathlib:Representation.norm` | `Mathlib/RepresentationTheory/Basic.lean` | For a representation ρ of a finite group, norm ρ = Σ_g ρ g. |
| `mathlib:SimpleGraph` | `Mathlib/Combinatorics/SimpleGraph/Basic.lean` | Simple graphs; the graph X(P) is one. |
| `mathlib:exteriorPower.pairingDual` | `Mathlib/LinearAlgebra/ExteriorPower/Pairing.lean` | The linear map ⋀^n(Dual R M) → Dual R (⋀^n M), with pairingDual (ιMulti f) (ιMulti v) = det(f j (v i)). |
| `mathlib:exteriorPower.bijective_pairingDual` | `Mathlib/LinearAlgebra/ExteriorPower/Basis.lean` | pairingDual R M n is bijective for M finite free. |
| `mathlib:exteriorPower.map` | `Mathlib/LinearAlgebra/ExteriorPower/Basic.lean` | Functoriality of exterior powers. |
| `mathlib:Module.Dual` | `Mathlib/LinearAlgebra/Dual/Defs.lean` | Module.Dual R M = M →ₗ[R] R, the functionals φ in ind_Λ(x) = {φ(x)}. |
| `mathlib:Module.IsReflexive` | `Mathlib/LinearAlgebra/Dual/Defs.lean` | Reflexive modules: evaluation M → Dual (Dual M) is bijective. |
| `mathlib:Module.Injective` | `Mathlib/Algebra/Module/Injective.lean` | Injective modules; R self-injective is Module.Injective R R. |
| `tauceti:TauCeti.ContCohomology.explicitCor1` | `TauCeti/RepresentationTheory/Homological/ContCohomology/Corestriction.lean` | Corestriction H¹(U, M) → H¹(G, M) for a finite-index subgroup, on continuous cochains of discrete modules. |
| `tauceti:TauCeti.ContCohomology.explicitCor1_comp_res1` | `TauCeti/RepresentationTheory/Homological/ContCohomology/Corestriction.lean` | cor ∘ res = multiplication by the index on H¹. |
| `tauceti:TauCeti.ContCohomology.DiscreteShortExact.explicitCor_delta0` | `TauCeti/RepresentationTheory/Homological/ContCohomology/DeltaNaturality.lean` | Corestriction commutes with the connecting map δ⁰ of a short exact sequence of discrete modules (Rubin, Proposition IV.4.5(iii)). |
| `tauceti:NumberField.Chebotarev.frobeniusPrimeSet` | `TauCeti/NumberTheory/Chebotarev/FrobeniusPrimeSet.lean` | The set of primes of K unramified in L whose Artin symbol is a given conjugacy class. |
| `tauceti:NumberField.artinSymbol` | `TauCeti/NumberTheory/NumberField/ArtinSymbol.lean` | The Artin symbol (Frobenius conjugacy class) of an unramified prime in a finite Galois extension of number fields. |
| `tauceti:TauCeti.GlobalNumberFields.RayClassGroup` | `TauCeti/NumberTheory/NumberField/Global/RayClass/Basic.lean` | The ray class group of a modulus: ideals prime to the modulus modulo the ray. |
| `mathlib:IsAdic` | `Mathlib/Topology/Algebra/Nonarchimedean/AdicTopology.lean` | IsAdic J: the topology of the ring is the J-adic topology; used for the maximal-ideal topology of a coefficient ring. |
| `mathlib:IsAdicComplete` | `Mathlib/RingTheory/AdicCompletion/Basic.lean` | IsAdicComplete I M: M is I-adically Hausdorff and complete; used for completeness of a coefficient ring. |
| `mathlib:IsModuleTopology` | `Mathlib/Topology/Algebra/Module/ModuleTopology.lean` | IsModuleTopology R A: A carries the module topology induced from R; for a finitely generated module over a coefficient ring this is the m-adic topology. |
| `tauceti:TauCeti.IsSmoothDiscrete` | `TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean` | An object of TopRep R G whose module is discrete with open point stabilisers; the discrete G-modules with continuous action. |
| `mathlib:Submodule.torsion` | `Mathlib/Algebra/Module/Torsion/Basic.lean` | The torsion submodule (killed by some non-zero-divisor), H¹_∞(K, T)_{Λ-tors} and (H¹/Λc)_tors. |
| `mathlib:cyclotomicCharacter` | `Mathlib/NumberTheory/Cyclotomic/CyclotomicCharacter.lean` | The p-adic cyclotomic character (L ≃+* L) →* ℤ_pˣ; used to type the Tate twist ℤ_p(1) in the universal-norm unit test. |
| `mathlib:PontryaginDual` | `Mathlib/Topology/Algebra/PontryaginDual.lean` | The Pontryagin dual A →ₜ* Circle of a topological group; Hom(·, Q_p/Z_p) of a discrete p-primary module is its p-part, as SelmerIwasawaCohomology L2 records. |
| `mathlib:Ideal.span` | `Mathlib/RingTheory/Ideal/Span.lean` | The ideal generated by a set, used to define ind_Λ(x) as the span of {φ(x)}. |
| `mathlib:Module.IsTorsion` | `Mathlib/Algebra/Module/Torsion/Basic.lean` | A torsion module: every element is killed by a non-zero-divisor; for the domain Λ this is 'torsion Λ-module' in Rubin and Mazur–Rubin. |
| `mathlib:Ideal.height` | `Mathlib/RingTheory/Ideal/Height.lean` | The height of an ideal (infimum of the heights of its minimal primes), for 'height at least two' and 'height-one prime'. |
| `mathlib:IsIntegralClosure` | `Mathlib/RingTheory/IntegralClosure/IsIntegralClosure/Defs.lean` | The characteristic predicate of an integral closure, for S_𝔓 = integral closure of Λ/𝔓 in its fraction field. |
| `mathlib:Polynomial.IsDistinguishedAt` | `Mathlib/RingTheory/Polynomial/Eisenstein/Distinguished.lean` | Monic polynomials with non-leading coefficients in an ideal; the generators g and g + p^N of height-one primes and their perturbations. |
| `mathlib:UniqueFactorizationMonoid` | `Mathlib/RingTheory/UniqueFactorizationDomain/Defs.lean` | Unique factorization, used for gcds in Ind(c) and for principal characteristic ideals; Mathlib/RingTheory/PowerSeries/Ideal.lean gives the instance for R⟦X⟧ over a principal ideal domain (one variable only). |
| `mathlib:PowerSeries` | `Mathlib/RingTheory/PowerSeries/Basic.lean` | O⟦X⟧, the model of Λ for d = 1 (via PadicMeasuresIwasawaAlgebras L4), noetherian and factorial over a DVR. |
| `mathlib:MvPowerSeries` | `Mathlib/RingTheory/MvPowerSeries/Basic.lean` | O⟦X_1, …, X_d⟧, the model of Λ for Z_p^d; no factoriality instance at the pinned commit, which is why the multivariable structure theory is requested from PadicMeasuresIwasawaAlgebras L4. |
| `mathlib:IsRegularLocalRing` | `Mathlib/RingTheory/RegularLocalRing/Defs.lean` | Noetherian local rings whose maximal ideal is generated by dim R elements; O⟦Z_p^d⟧ is one of dimension d + 1 (not proved at the pinned commit). |
| `mathlib:Module.length_eq_add_of_exact` | `Mathlib/RingTheory/Length.lean` | Additivity of length in short exact sequences. |
| `mathlib:Module.Finite` | `Mathlib/RingTheory/Finiteness/Defs.lean` | Finitely generated modules (X∞, H¹_∞(K, T), H¹(Q, 𝐓)). |

## Per-target review register

The table covers every imported and local target. Sources are the resulting logical sources after the whole overlays. A target with a corrected supplier or edition remains explicitly distinguished from one accepted as stated. APIs, checks, proof steps and exact hypotheses are in the corresponding reader topic and packet record; the source list here is evidence for the review, not a replacement statement.

| Target (stable imported ID; roadmap prefix omitted) | Placement | Verdict | Checked locators |
| --- | --- | --- | --- |
| `ES.0/canonical-selmer-structure` | Layer0 | verified | mr-ks Definition 3.2.1, p. 23; mr-higher Definition 5.1, pp. 9–10; bss2 §6.2, p. 38; mr-higher Lemma 5.2 and Corollary 5.3, p. 10 |
| `ES.0/cartesian-condition` | Layer0 | verified | mr-ks Definition 1.1.4, p. 8; mr-higher Definition 3.1 and Remark 3.2, p. 7 |
| `ES.0/cartesian-length-linearity` | Layer0 | verified | mr-ks Lemma 1.1.5, p. 8 |
| `ES.0/core-rank` | Layer0 | verified | mr-higher Proposition 3.3(iii) and Definition 3.4, p. 8; mr-ks Theorem 4.1.5 and Definition 4.1.11, pp. 36–38 |
| `ES.0/core-rank-formula` | Layer0 | verified | mr-ks Theorem 5.2.15, p. 59; mr-higher Theorem 5.4, p. 10 |
| `ES.0/core-rank-independence-of-modulus` | Layer0 | verified | mr-ks Theorem 4.1.13 and Definition 5.2.4, pp. 38, 56; mr-ks Corollary 5.2.6, p. 56 |
| `ES.0/quotient-category` | Layer0 | verified | mr-ks Example 1.1.3, p. 8 |
| `ES.0/quotient-dual-propagation` | Layer0 | verified | mr-ks Example 1.3.3, p. 12 |
| `ES.0/selmer-length-difference` | Layer0 | verified | mr-ks Proposition 2.3.5, p. 17 |
| `ES.0/selmer-torsion-identification` | Layer0 | verified | mr-ks Lemma 3.5.3, p. 28; mr-ks Lemma 3.5.4, p. 29; mr-higher Proposition 3.3(i)–(ii), pp. 7–8; Gomez erratum to MR04 Lemma 2.1.4, p. 32 (arXiv v1); bss2 Proposition 3.5, Lemmas 3.6–3.7 and Corollary 3.8, arXiv v1 pp. 15–17 |
| `ES.0/selmer-triple` | Layer0 | verified | mr-ks Chapter 3, first paragraph, p. 19; mr-higher Definition 4.1, p. 8; mr-ks Chapter 1 opening and §1.1, p. 7; Chapter 2 opening, p. 13; mr-ks Definition 2.1.1, p. 13; Definition 2.3.1, pp. 16–17; mr-higher Definition 2.1, p. 6 |
| `ES.0/example-cyclotomic-twist` | Layer1 | corrected | mr-ks Lemma 6.1.5 and Proposition 6.1.6, pp. 71–72 |
| `ES.0/example-elliptic` | Layer1 | corrected | mr-ks Proposition 6.2.2 and Lemma 6.2.3, p. 74 |
| `ES.0/hypotheses-implications` | Layer1 | corrected | mr-ks Remark 3.5.1, p. 28; mr-higher Remark 4.3, p. 9 |
| `ES.0/hypotheses-mr2004` | Layer1 | corrected | mr-ks §3.5, pp. 27–28; mr-ks §3.5, p. 27 |
| `ES.0/hypotheses-mr2016` | Layer1 | corrected | mr-higher §4, hypotheses (H.1)–(H.7), p. 9; mr-higher Lemma 4.5, p. 9 |
| `ES.0/non-example-inadmissible` | Layer1 | corrected | mr-ks Lemma 6.1.5, proof, p. 71; rubin-es Chapter II, Remark 2.7, p. 25 |
| `ES.1/abundant-tuple-existence` | Layer1 | corrected | ltxzz-published §2.6, Proposition 2.6.6 and its proof, pp. 134–135; ltxzz-published §2.6, Lemma 2.6.4 and Definition 2.6.5, p. 134 |
| `ES.1/abundant-tuples` | Layer1 | corrected | ltxzz-published Definition 2.6.5, published p.134; ltxzz-published Lemma 2.6.4, published p.134; ltxzz-published Lemma 2.6.4 and Definition 2.6.5, published pp.133–135 |
| `ES.1/chebotarev-nonvanishing` | Layer1 | verified | mr-ks Proposition 3.6.1, p. 30; bss2 Lemma 3.9, p. 17 |
| `ES.1/chebotarev-prescribed-kernels` | Layer1 | verified | mr-ks Proposition 3.6.2, p. 30 |
| `ES.1/conductor-ideal` | Layer1 | verified | mr-ks Definition 2.2.1, p. 16; mr-higher Definition 2.2, p. 6; howard Definition 1.2.1, p. 1444 |
| `ES.1/error-tolerant-chebotarev` | Layer1 | verified | cgls §3.3.1, Proposition 3.3.6 and its proof, pp. 19–21 (arXiv v2); cgls §3.3.1, Corollary 3.3.7, p. 21 (arXiv v2); cgs §6.3, Proposition 6.3.1, its proof and Remark 6.3.2, pp. 22–23 (arXiv v2) |
| `ES.1/finite-singular-comparison` | Layer1 | verified | mr-ks Definition 1.2.2, p. 10; rubin-es Chapter IV, Definition 5.3, pp. 67–68 |
| `ES.1/finite-singular-decomposition` | Layer1 | verified | mr-ks Lemma 1.2.1, p. 10 |
| `ES.1/kolyvagin-primes` | Layer1 | verified | mr-ks Definition 3.1.6, p. 21; mr-higher Definition 4.2, p. 9; rubin-es Chapter IV, Definition 1.1, p. 57 |
| `ES.1/modified-selmer-structures` | Layer1 | verified | mr-ks Example 2.1.8, p. 15; mr-ks Example 2.3.2, p. 17 |
| `ES.1/ray-class-tower` | Layer1 | verified | rubin-es Chapter IV §1, p. 55 |
| `ES.1/reducibility-depth` | Layer1 | corrected | ltxzz-published Definition 2.3.2, published p.126; ltxzz-published Lemma 2.3.3, published p.126; ltxzz-published Definition 2.3.2, Lemmas 2.3.3–2.3.4, published pp.126–128 |
| `ES.1/residual-two-class-detection` | Layer1 | corrected | zhang §8.1, discussion before Lemma 8.1, pp. 234–235; zhang §8.1, Lemma 8.1, p. 235; zhang §8.1, Lemma 8.2, p. 235 |
| `ES.1/selmer-field-saturation` | Layer1 | corrected | ltxzz-published Lemma 2.3.4, published pp.127–128; ltxzz-published Lemma 2.3.5, published pp.127–128; ltxzz-published Lemma 2.3.5, published pp.127–128 |
| `ES.1/transverse-condition` | Layer1 | verified | mr-ks Definition 1.1.6(iv) and Lemma 1.2.4, pp. 9, 11 |
| `ES.1/transverse-duality` | Layer1 | verified | mr-ks Proposition 1.3.2, p. 12 |
| `ES.1/twist-error-constants` | Layer1 | corrected | cgls §3.2, (3.2)–(3.3) and Theorem 3.2.1, p. 17 (arXiv v2); cgls §3.3.1, Lemmas 3.3.3–3.3.4 and Remark 3.3.5, pp. 18–19 (arXiv v2); cgs §6.1 and §6.3, before Proposition 6.3.1, pp. 21–22 (arXiv v2); ky §3, Lemma 3.0.3 and the definition of C₁ after it, p. 36 (arXiv v2) |
| `ES.2/classes-unramified-outside-p` | Layer2 | verified | rubin-es Chapter II, before Theorem 2.10, p. 25; bss2 Lemma 6.6, p. 38 |
| `ES.2/conductor-presentation` | Layer2 | verified | rubin-es Chapter II, Remarks 1.3 and 1.4, pp. 22–23 |
| `ES.2/euler-factor-change` | Layer2 | verified | rubin-es Chapter IX, Lemma 6.1, p. 141; mr-ks Remark 3.2.3, p. 23 |
| `ES.2/euler-polynomial` | Layer2 | verified | rubin-es Chapter IV, Lemma 1.2 and its proof, p. 57; mr-ks Remark 3.2.3, p. 23; bss2 §6.1, pp. 36–37 |
| `ES.2/euler-system-module` | Layer2 | verified | rubin-es Chapter II, Definition 1.1, pp. 21–22; rubin-es Chapter II, Remark 2.8, p. 25 |
| `ES.2/rigidity-variants` | Layer2 | verified | rubin-es Chapter IX §1, p. 133; rubin-es Chapter IX, Definition 3.1, p. 136; rubin-es Chapter IX, Definition 4.1, p. 138; rubin-es Chapter IX, Definition 5.1, p. 140 |
| `ES.2/ring-class-anticyclotomic-euler-system` | Layer2 | corrected | ch §7.1 and §7.2, Definition 7.1, pp. 28–29 (author's version); ch §7.3, Proposition 7.4, p. 31 (author's version) |
| `ES.2/twisting` | Layer2 | verified | rubin-es Chapter II, Proposition 4.2, p. 30; rubin-es Chapter II, Lemma 4.3, p. 31 |
| `ES.2/universal-euler-system` | Layer2 | verified | rubin-es Chapter IV, Definitions 2.1–2.2, p. 58; rubin-es Chapter IV, Proposition 3.1, p. 59; rubin-es Chapter IV, Proposition 3.4, p. 61 |
| `ES.3/anticyclotomic-derivative` | Layer3 | verified | rubin-es Chapter IX, Remark 4.4, p. 139; rubin-es Chapter IX §4, p. 138 |
| `ES.3/congruence` | Layer3 | corrected | rubin-es Chapter IV, Corollary 8.1, p. 77 |
| `ES.3/congruence-units-example` | Layer3 | corrected | rubin-es Chapter IV §8, Example 8.2, p. 78 (1999 draft); rubin-es-2000 Chapter 4 §8, Example 4.8.2 and (4.13), p. 103 (published version); rubin-es Chapter II §1, Remark 1.5, p. 23 |
| `ES.3/derivative-class` | Layer3 | verified | rubin-es Chapter IV, Definition 4.10, p. 66; rubin-es Chapter IV, Lemma 4.13, p. 67 |
| `ES.3/derivative-classes-unramified` | Layer3 | verified | rubin-es Chapter IV §6, Proposition 6.1, Corollary 6.2 and Lemma 6.3, p. 69; rubin-es Chapter IV §6, Remark 6.4 and Corollary 6.5 with proof, pp. 69–70 |
| `ES.3/derivative-invariance` | Layer3 | verified | rubin-es Chapter IV, Lemma 4.2, p. 62 |
| `ES.3/derivative-local-properties` | Layer3 | corrected | rubin-es Chapter IV, Theorem 5.1, p. 67; rubin-es Chapter IV, Theorem 5.4, p. 68; rubin-es Chapter IX, Theorem 5.2, p. 140 |
| `ES.3/derivative-operators` | Layer3 | verified | rubin-es Chapter IV, Definition 4.1 and (4), p. 62 |
| `ES.3/euler-to-kolyvagin` | Layer3 | verified | mr-ks Theorem 3.2.4, pp. 23–24; mr-ks Appendix A, proof of Theorem 3.2.4, (33), p. 80; mr-ks Theorem 3.2.7, p. 24 |
| `ES.3/finite-part-formula` | Layer3 | verified | mr-ks Appendix A, Proposition A.2, p. 79; mr-ks Appendix A, Theorem A.4, p. 80 |
| `ES.3/key-relation` | Layer3 | verified | rubin-es Chapter IV §7, identity (9), Lemma 7.1 and Remark 7.2, p. 74; rubin-es Chapter IV §7, Lemma 7.3 and its proof, pp. 75–76; rubin-es Chapter IV §5, Lemma 5.2 and Definition 5.3, pp. 67–68; §7, proof of Theorem 5.4, p. 76 |
| `ES.3/kolyvagin-system-module` | Layer3 | verified | mr-ks Definition 3.1.3, p. 20; mr-ks Definition 3.1.6, p. 21; mr-ks Definition 3.1.8, p. 21 |
| `ES.3/lifting-to-induced-module` | Layer3 | verified | rubin-es Chapter IV, Proposition 4.5, pp. 63–64; rubin-es Chapter IV, Proposition 4.8, p. 65 |
| `ES.3/local-lifts` | Layer3 | corrected | rubin-es Chapter IV §6, Definition 6.6 and Lemma 6.7, pp. 70–71; rubin-es Chapter IV §6, Proposition 6.8 with proof and Remark 6.9, pp. 71–73; rubin-es Chapter IV §6, proof of Theorem 5.1, pp. 73–74 |
| `ES.3/rigidity-variant-derivative-classes` | Layer3 | verified | rubin-es Chapter IX §1, condition (ii)′ and the adaptation of Chapters IV–V, pp. 133–135; rubin-es Chapter IX §1, Example 1.1 and Theorem 1.2, pp. 135–136 |
| `ES.3/ring-class-derivative-classes` | Layer3 | unverifiable | ch §7.2, from the choice of ν through (K3), pp. 29–30 (author's version); ch §7.2, Definition 7.2, p. 30 (author's version); ch §7.3, Lemma 7.5 and Proposition 7.6, p. 31; §7.4, Proposition 7.8 with footnote 5, pp. 32–33 (author's version); nekovar-kuga-preprint §§6,9–10, Propositions6.3 and10.2, Corollary6.4 and Lemma10.1, printed pp.12–13,18–20 (MPIM1990-78) |
| `ES.3/two-prime-test` | Layer3 | verified | mr-ks Appendix A, Theorem A.4 and (33), p. 80 |
| `ES.1/rubin-prime-selection` | Layer4 | corrected | rubin-es Chapter V, Lemma 2.3, p. 81; rubin-es Chapter V, Lemma 3.1, p. 87 |
| `ES.4/abundant-localization` | Layer4 | corrected | ltxzz-published Proposition 2.4.6(2), published pp.130–131; ltxzz-published Proposition 2.6.7, published pp.134–135; ltxzz-published Proposition 2.4.6(2), published pp.130–131; Proposition 2.6.7, published pp.134–135 |
| `ES.4/core-vertices` | Layer4 | verified | mr-ks Definition 4.1.8 and Corollary 4.1.9, p. 38; mr-ks Theorem 4.1.10 and Definition 4.1.11, p. 38; mr-higher §11, p. 22 |
| `ES.4/howard-descent-with-errors` | Layer4 | corrected | cgls Theorem 3.2.1, arXiv v2 p. 17; cgls Proposition 3.3.6, arXiv v2 p. 19; cgls Lemma 3.3.9, arXiv v2 p. 22 |
| `ES.4/kolyvagin-bound` | Layer4 | verified | mr-ks Theorem 5.2.2, p. 56; mr-ks Corollary 4.4.5, p. 47 |
| `ES.4/leading-vertices` | Layer4 | verified | mr-ks Theorem 4.1.16, p. 39 |
| `ES.4/maximal-order-evaluation-bound` | Layer4 | added | nekovar §6.4, data6.4.1–6.4.2 and Proposition6.4.3 with proof, pp.38–40 (archived author manuscript) |
| `ES.4/nekovar-all-prime-descent` | Layer4 | corrected | nekovar Theorem 3.2, pp. 18–19; §3.5, p. 19; §5.19, pp. 33–34; Proposition 6.4.3, pp. 38–40; Theorem 7.3 and §§7.4–7.6, pp. 45–51 (author copy) |
| `ES.4/rank-one-from-nonzero-class` | Layer4 | verified | cgls §3.3.1, Theorem 3.3.8 and its proof, (3.8)–(3.10), pp. 21–22 (arXiv v2) |
| `ES.4/rational-anticyclotomic-descent` | Layer4 | unverifiable | ch §7.2, Theorem 7.3, p. 30 (author's version); ch §7.5, Lemmas 7.10–7.16 and the descent argument, pp. 33–37 (author's version); ch §7.4, Theorem 7.9 and its proof, p. 33 (author's version); §6, Hypothesis (H), p.26; §4.1, pp.14–15 |
| `ES.4/rubin-bound` | Layer4 | verified | rubin-es Chapter II, Theorem 2.2, p. 24; rubin-es Chapter II, Theorem 2.3, p. 24; rubin-es Chapter V, Lemma 2.5, p. 82; rubin-es Appendix A, Corollary 2.6, p. 148 |
| `ES.4/rubin-hypotheses` | Layer4 | corrected | rubin-es Chapter II §2, p. 24; rubin-es Chapter II, Definition 2.1, p. 24; rubin-es Chapter V, Lemma 3.2, p. 87 |
| `ES.4/self-dual-module-induction` | Layer4 | verified | cgls §3.3.2, Lemma 3.3.9 and its proof, p. 22 (arXiv v2); cgls §3.3.2, (3.11)–(3.13), Lemma 3.3.10 and Proposition 3.3.11, pp. 22–23 (arXiv v2) |
| `ES.4/selmer-sheaf` | Layer4 | verified | mr-ks Definition 3.1.2, pp. 19–20; mr-ks Definition 3.1.1, p. 19 |
| `ES.4/sheaf-monodromy` | Layer4 | verified | mr-ks Definition 3.4.2 and Proposition 3.4.4, pp. 26–27 |
| `ES.4/stub-sheaf` | Layer4 | verified | mr-ks Definition 4.3.1, p. 41; mr-ks Theorem 4.3.4, p. 41; mr-ks Theorem 4.4.1, p. 45; mr-ks Theorem 4.2.2, p. 40 |
| `ES.4/uniform-near-trivial-bound` | Layer4 | corrected | cgs §6.1, Theorem 6.1.1, p. 22, and §6.4, its proof, pp. 24–28 (arXiv v2); bcgs §1.3, Theorem 1.3.1 with proof and Remark 1.3.2, pp. 15–16 (arXiv v2); ky §3, Theorem 3.0.2 and Lemma 3.0.3, pp. 35–36 (arXiv v2) |
| `ES.4/variant-bounds` | Layer4 | corrected | rubin-es Chapter IX, Theorem 3.3, p. 137; rubin-es Chapter IX, Theorem 4.3, p. 139 |
| `ES.4/vertex-step` | Layer4 | verified | mr-ks Lemma 4.1.7, p. 37; mr-ks Corollary 2.3.6, p. 17 |
| `ES.4/weak-cassels-structure` | Layer4 | verified | cgls Proposition 3.3.2 and Lemma 3.3.1, arXiv v2 pp. 18–19; howard Theorem 1.4.2, pp. 1448–1450; Lemma 1.5.3 and Proposition 1.5.5, pp. 1450–1451 |
| `ES.5/cassels-structure` | Layer5 | verified | howard Proposition 1.4.1, p. 1448; howard Theorem 1.4.2 and its proof, pp. 1448–1450; howard Lemma 1.5.3, p. 1450 |
| `ES.5/divisibility-invariants` | Layer5 | verified | mr-ks Definition 5.2.11, pp. 57–58; mr-ks Definition 4.5.5, p. 49; mr-ks Definition 4.5.7, p. 49 |
| `ES.5/howard-dvr-theorem` | Layer5 | verified | howard Theorem 1.6.1, p. 1453 |
| `ES.5/howard-hypotheses` | Layer5 | verified | howard §1.3, hypotheses H.0–H.5, p. 1446; howard §1.3, hypothesis H.4, p. 1446; howard Definition 1.2.3, p. 1445 |
| `ES.5/howard-stub` | Layer5 | verified | howard Definition 1.5.4, p. 1451; howard Proposition 1.5.9, proof, p. 1452 |
| `ES.5/kolyvagin-dual-selmer` | Layer5 | verified | mr-ks Definition 3.3.1, p. 25; mr-ks Theorem 4.5.12, p. 51 |
| `ES.5/rank-one-module-theorem` | Layer5 | verified | mr-ks Corollary 4.5.2, p. 48; mr-ks Theorem 5.2.10, p. 57 |
| `ES.5/self-dual-core-vertex-rigidity` | Layer5 | corrected | zanarella §2.2, Proposition 2.2.8 and Corollary 2.2.9, pp. 14–15 (arXiv v1); zanarella §2.2, Theorem 2.2.12, Corollary 2.2.13 and Proposition 2.2.14, pp. 17–18 (arXiv v1) |
| `ES.5/self-dual-divisibility-profile` | Layer5 | corrected | zanarella §2.3, Lemma 2.3.1, Definition 2.3.2 and Propositions 2.3.3–2.3.4, pp. 18–20 (arXiv v1); bcgs §2.2.1, definitions of M(n), M_{r,N′} and M_∞, pp. 16–17; Lemma 2.2.4, p. 18 (arXiv v2); bcgs §2.2.2, Proposition 2.2.1, p. 17, and its proof, pp. 17–18 (arXiv v2) |
| `ES.5/self-dual-eigenspace-localisation` | Layer5 | corrected | zanarella §2.2, Lemma 2.2.10 and its proof, pp. 15–16 (arXiv v1); zanarella §2.2, Corollary 2.2.11, pp. 16–17 (arXiv v1) |
| `ES.5/self-dual-structure-theorem` | Layer5 | verified | zanarella §2.3, Theorem 2.3.6 and its proof, p. 20 (arXiv v1); bcgs §2.2.2, Theorem 2.2.2, p. 17, with Lemma 2.2.4 and the proof, pp. 18–20 (arXiv v2) |
| `ES.5/sharpness-examples` | Layer5 | verified | mr-ks Proposition 6.2.6, p. 75 |
| `ES.5/structure-theorem` | Layer5 | corrected | mr-ks Theorem 5.2.12, p. 58; mr-ks Corollary 5.2.13, p. 58; mr-ks Theorem 4.5.9, p. 50; mr-ks Theorem 4.5.6, p.49 (authors’ 2003 copy) |
| `ES.6/bidual-functoriality` | Layer6 | verified | bss2 Proposition 2.3, p. 8; bss2 Proposition 2.4, p. 8; bss2 Corollary 2.7, pp. 10–11 |
| `ES.6/bss-hypotheses` | Layer6 | verified | bss2 Hypothesis 3.2, p. 13; bss2 Hypothesis 4.2, p. 20; bss2 Hypothesis 4.7, p. 22 |
| `ES.6/exterior-bidual` | Layer6 | corrected | bss2 Definition 2.1, p. 7; dk §1.2, p. 8 |
| `ES.6/kolyvagin-systems-rank-r` | Layer6 | verified | mr-higher Definition 10.4, p. 21; bss2 §5.2, p. 25; mr-higher Proposition 12.3, p. 24 |
| `ES.6/regulator-isomorphism` | Layer6 | verified | mr-higher Theorem 12.4, p. 25; bss2 Theorem 5.2, pp. 25–26; bss2 Theorem 5.25, p. 36 |
| `ES.6/rubin-lattice` | Layer6 | verified | dk §1.2, (8)–(10), p. 8; dk §1.2, p. 8 |
| `ES.6/stark-comparison` | Layer6 | verified | sakamoto Lemma 4.13 and Proposition 4.14, pp. 2313–2314 |
| `ES.6/stark-structure` | Layer6 | verified | mr-higher Theorem 6.10, p. 15; mr-higher Theorem 8.9, p. 19; bss2 Theorem 4.6, p. 21 |
| `ES.6/stark-systems` | Layer6 | verified | mr-higher Definition 6.8, p. 14; bss2 §4.1, p. 19; bss2 Definition 4.1, p. 20 |
| `ES.7/fitting-bounds` | Layer7 | verified | bss2 Corollary 6.15, p. 42 |
| `ES.7/higher-kolyvagin-derivative` | Layer7 | verified | bss2 Theorem 6.12, p. 41; bss2 Corollary 6.13, p. 42; bss2 Proposition 6.10, p. 40 |
| `ES.7/higher-rank-euler-systems` | Layer7 | verified | bss2 Definition 6.4, p. 37; bss2 Hypothesis 6.1, p. 37 |
| `ES.7/rank-one-comparison` | Layer7 | verified | bss2 Remark 6.5, p. 37 |
| `ES.7/rubin-brumer-stark` | Layer7 | verified | dk §1.2, p. 8; dk Conjecture 1.5, p. 8 |
| `ES.7/rubin-stark-class-group` | Layer7 | verified | bss2 §7, equation (14) and Theorem 7.1(i)–(iii), pp. 47–50; Remarks 7.2–7.3, p. 50 |
| `ES.7/rubin-stark-minus-comparison` | Layer7 | verified | bss2 §7, pp. 48–50; dk §1.2, equations (8)–(10), Conjecture 1.5 and Theorem 1.6, pp. 7–9 |
| `ES.8/admissible-zp-d-extension` | Layer8 | verified | rubin-euler-systems-1999 Ch. II §1, Definition 1.1(ii), p. 21 (published: Definition 2.1.1(ii)); rubin-euler-systems-1999 Ch. II §1, Remark 1.2, p. 22; rubin-euler-systems-1999 Ch. II §3, opening paragraph and Notation, pp. 26–27 |
| `ES.8/augmentation-prime-divisibility` | Layer8 | unverifiable | cgs §6.5, Theorem 6.5.1 and its proof, p. 28 (arXiv v2); ky §3, Theorem 3.0.5 and its proof, pp. 36–37 (arXiv v2) |
| `ES.8/blind-spot-and-lambda-primitivity` | Layer8 | verified | mazur-rubin-kolyvagin-systems §5.3, Definition 5.3.9, p. 61; mazur-rubin-kolyvagin-systems §3.1, Definition 3.1.6, p. 21 |
| `ES.8/characteristic-ideal-bound-with-error` | Layer8 | verified | rubin-euler-systems-1999 Ch. VII §1, Theorem 1.9, p. 101; rubin-euler-systems-1999 Ch. VII §1, Lemma 1.8, p. 101 |
| `ES.8/error-tolerant-self-dual-lambda-adic-bound` | Layer8 | corrected | castella-grossi-lee-skinner-eisenstein §3.4, Theorem 3.4.1, p. 26; castella-grossi-lee-skinner-eisenstein §3.4, Corollary 3.4.2, p. 27; castella-grossi-lee-skinner-eisenstein §3.4, proof of Theorem 3.4.1, p. 27 |
| `ES.8/euler-to-lambda-adic-kolyvagin` | Layer8 | verified | mazur-rubin-kolyvagin-systems §5.3, Theorem 5.3.3, p. 61; mazur-rubin-kolyvagin-systems §5.3, Theorem 5.3.3, p. 61; mazur-rubin-kolyvagin-systems Appendix A, proof of Theorem 5.3.3, pp. 81–82 |
| `ES.8/exceptional-height-one-primes` | Layer8 | verified | mazur-rubin-kolyvagin-systems §5.3, Definition 5.3.12, p. 62 |
| `ES.8/generic-core-rank` | Layer8 | corrected | mazur-rubin-kolyvagin-systems §5.3, Lemma 5.3.16, p. 65; mazur-rubin-kolyvagin-systems §5.3, Definition 5.3.17, p. 65 |
| `ES.8/height-one-specialization` | Layer8 | verified | mazur-rubin-kolyvagin-systems §5.3, p. 62; mazur-rubin-kolyvagin-systems §5.3, Corollary 5.3.15, p. 64; mazur-rubin-kolyvagin-systems §5.3, proof of Theorem 5.3.10, p. 66 |
| `ES.8/iwasawa-class-of-an-euler-system` | Layer8 | verified | rubin-euler-systems-1999 Ch. II §1, discussion after Remark 1.2, p. 22; rubin-euler-systems-1999 Ch. II §3, Definition 3.1, p. 28; rubin-euler-systems-1999 Ch. VI §2, p. 91 |
| `ES.8/iwasawa-evaluation-maps` | Layer8 | verified | rubin-euler-systems-1999 Ch. VII §1, Definition 1.2, p. 98; rubin-euler-systems-1999 Ch. VII §1, Lemma 1.3, p. 98; rubin-euler-systems-1999 Ch. VII §1, Definition 1.1, p. 97 |
| `ES.8/iwasawa-large-image-hypotheses` | Layer8 | verified | rubin-euler-systems-1999 Ch. II §3, Hypotheses Hyp(K∞, T), p. 27 (published p. 41); rubin-euler-systems-1999 Ch. II §3, p. 27; rubin-euler-systems-1999 Ch. II §2, Remark 2.4, p. 24 |
| `ES.8/iwasawa-poitou-tate-sequence` | Layer8 | verified | rubin-euler-systems-2000 Ch. 2 §3, Proposition 2.3.7 and proof, pp. 42–43; rubin-euler-systems-1999 Ch. II §3, Proposition 3.7, p. 29 |
| `ES.8/kolyvagin-sequence-induction` | Layer8 | verified | rubin-euler-systems-1999 Ch. VII §1, Proposition 1.6, p. 100; rubin-euler-systems-1999 Ch. VII §1, Proposition 1.4, pp. 98–99; rubin-euler-systems-1999 Ch. VII §1, after Proposition 1.6, p. 100 |
| `ES.8/lambda-adic-ind` | Layer8 | corrected | mazur-rubin-kolyvagin-systems §5.3, Definition 5.3.8, p. 61; mazur-rubin-kolyvagin-systems §5.3, Definition 5.3.8, p. 61; mazur-rubin-kolyvagin-systems §5.3, proof of Theorem 5.3.10, p. 66 |
| `ES.8/lambda-adic-kolyvagin-systems` | Layer8 | verified | mazur-rubin-kolyvagin-systems §3.1, Definition 3.1.3, p. 20; mazur-rubin-kolyvagin-systems §3.1, Definition 3.1.6, p. 21; buyukboduk-lambda-adic-kolyvagin-systems §3.2, Remark 3.24, p. 27 |
| `ES.8/lambda-adic-selmer-structure` | Layer8 | verified | mazur-rubin-kolyvagin-systems §5.3, Definition 5.3.2, p. 60; mazur-rubin-kolyvagin-systems §5.3, after Definition 5.3.2, p. 60; howard-heegner-point-kolyvagin-system §2.2, Definition 2.2.6, p. 25 |
| `ES.8/lambda-index` | Layer8 | verified | rubin-euler-systems-1999 Ch. II §3, Definition 3.1, p. 28; rubin-euler-systems-2000 Ch. 2 §3, proof of Theorem 2.3.8, p. 43 |
| `ES.8/leopoldt-tower-hypothesis` | Layer8 | verified | rubin-euler-systems-1999 Ch. II §3, Hypothesis Hyp(K∞/K), p. 27 (published p. 41); rubin-euler-systems-1999 Ch. II §3, p. 27 |
| `ES.8/mazur-rubin-lambda-adic-main-theorem` | Layer8 | verified | mazur-rubin-kolyvagin-systems §5.3, Theorem 5.3.10, p. 62; mazur-rubin-kolyvagin-systems §5.3, Theorem 5.3.10(iii), p. 62; mazur-rubin-kolyvagin-systems §5.3, proof of Theorem 5.3.10, p. 67 |
| `ES.8/rank-one-leopoldt-case` | Layer8 | verified | rubin-euler-systems-1999 Ch. VII §3, Lemma 3.7, p. 109; rubin-euler-systems-1999 Ch. VII §3, proof of Lemma 3.7, p. 109 |
| `ES.8/residual-primitivity-implies-lambda-primitivity` | Layer8 | verified | buyukboduk-lambda-adic-kolyvagin-systems §4.1.1, proof of Proposition 4.1, pp. 28–29 |
| `ES.8/restricted-iwasawa-selmer-module` | Layer8 | verified | rubin-euler-systems-1999 Ch. II §3, Definition 3.1, p. 28 (published Definition 2.3.1); rubin-euler-systems-1999 Ch. VII §4, proof of Lemma 4.1, p. 110; rubin-euler-systems-1999 Ch. VII §2, proof of Lemma 2.4, p. 103 |
| `ES.8/restriction-control-over-the-tower` | Layer8 | verified | rubin-euler-systems-1999 Ch. VII §3, Proposition 3.4(iii), p. 107; rubin-euler-systems-1999 Ch. VII §3, Lemma 3.2, p. 106; rubin-euler-systems-1999 Ch. VII §3, opening, pp. 105–106 |
| `ES.8/rubin-iwasawa-divisibility` | Layer8 | verified | rubin-euler-systems-1999 Ch. II §3, Theorem 3.3, p. 28 (published Theorem 2.3.3, p. 42); rubin-euler-systems-1999 Ch. VII §1, end, pp. 101–102 |
| `ES.8/rubin-rational-iwasawa-divisibility` | Layer8 | verified | rubin-euler-systems-1999 Ch. II §3, Theorem 3.4, p. 28 (published Theorem 2.3.4, p. 42); rubin-euler-systems-1999 Ch. VII §1, end, p. 102 |
| `ES.8/self-dual-lambda-adic-kolyvagin-bound` | Layer8 | corrected | howard-heegner-point-kolyvagin-system §2.2, Theorem 2.2.10, p. 26; howard-heegner-point-kolyvagin-system §2.2, Theorem 2.2.10(b)–(c), p. 26; howard-heegner-point-kolyvagin-system §2.2, proof of Theorem 2.2.10, p. 27 |
| `ES.8/self-dual-lambda-primitivity-equality` | Layer8 | corrected | zanarella §2.4, Proposition 2.4.1, Definitions 2.4.2–2.4.3 and Proposition 2.4.4, pp. 21–22 (arXiv v1); zanarella §2.4, Theorem 2.4.5 and its proof, pp. 22–24 (arXiv v1) |
| `ES.8/specialization-control` | Layer8 | verified | mazur-rubin-kolyvagin-systems §5.3, Proposition 5.3.14, p. 64; mazur-rubin-kolyvagin-systems §5.3, Lemma 5.3.13, p. 62; howard-heegner-point-kolyvagin-system §2.2, Proposition 2.2.8, p. 26 |
| `ES.8/true-iwasawa-selmer-and-singular-quotient` | Layer8 | verified | rubin-euler-systems-1999 Ch. II §3, Remark 3.6, pp. 28–29 (published Remark 2.3.6, p. 42); rubin-euler-systems-1999 Ch. II §3, Remark 3.6, p. 29 |
| `ES.8/true-selmer-iwasawa-divisibility` | Layer8 | verified | rubin-euler-systems-2000 Ch. 2 §3, Theorem 2.3.8, p. 43; rubin-euler-systems-2000 Ch. 2 §3, proof of Theorem 2.3.8, p. 43 |
| `ES.8/twisting-by-characters-of-gamma` | Layer8 | verified | rubin-euler-systems-1999 Ch. VI, introduction, p. 89; rubin-euler-systems-1999 Ch. VI §3, Theorem 3.5, p. 93; rubin-euler-systems-1999 Ch. VI §2, Proposition 2.1, p. 91 |
| `ES.8/twisting-invariance-of-iwasawa-theorems` | Layer8 | verified | rubin-euler-systems-1999 Ch. VI §4, Theorem 4.1, p. 94; rubin-euler-systems-1999 Ch. VI §4, proof of Theorem 4.1, p. 94; rubin-euler-systems-1999 Ch. VI §1, Lemma 1.2, p. 89 |
| `ES.8/unramified-at-split-primes-condition` | Layer8 | verified | rubin-euler-systems-1999 Ch. IX §2, p. 136; rubin-euler-systems-1999 Ch. IX §2, p. 136 |
| `ES.8/weak-leopoldt-from-an-euler-system` | Layer8 | verified | rubin-euler-systems-1999 Ch. II §3, Theorem 3.2, p. 28 (published Theorem 2.3.2, p. 41); rubin-euler-systems-1999 Ch. VII §4, opening, p. 110; rubin-euler-systems-1999 Ch. II §3, Remark 3.5, p. 28 |
| `ES.8/weak-leopoldt-from-lambda-adic-kolyvagin` | Layer8 | verified | mazur-rubin-kolyvagin-systems §5.3, Theorem 5.3.6, p. 61; mazur-rubin-kolyvagin-systems §5.3, Corollary 5.3.19, p. 65; mazur-rubin-kolyvagin-systems §5.3, proof of Theorem 5.3.6, pp. 65–66 |
| `ES.8/x-infinity-finitely-generated` | Layer8 | verified | rubin-euler-systems-1999 Ch. VII §4, Lemma 4.1 and proof, p. 110 |

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/EulerSystemsAndKolyvaginSystems.json`: 0 errors, 0 warnings. Its local-node inventory is supplemented by the exact-import reconstruction described above.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/EulerSystemsAndKolyvaginSystems.lean`: exit0, no admitted data.
- `lean-check` on the suggested file: exit0; only declaration-uses-`sorry` warnings. The library pin checks print the two named existing declarations. Eight real-bodied definitions and ten examples remain; admitted theorem/example proofs are honest proposed milestones.
- `python3 research/blueprint/intake.py check-files` on the five deliverables: 0 problems.
- `git diff --check`: passes. Only the four issue deliverables and this review’s handoff change.
- Logical assembly/source/reference/DAG/API/test/planet checks: pass. All 146 node IDs occur exactly once in `review.checked`, every imported correction applies at the recorded hash, all source IDs resolve, and ES.8 has no direct ES.6/ES.7 prerequisite.
- No source passages, source files, private/local paths, repository copies or generated research excerpts are committed. Scratch retrieval files are disposable; the handoff preserves the proof obligations and import semantics needed by the next worker.
