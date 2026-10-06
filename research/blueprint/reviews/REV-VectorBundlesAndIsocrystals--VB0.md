# Independent review: finite isocrystals and geometric vector bundles

Job: `REV-VectorBundlesAndIsocrystals--VB0`, issue #500. Reviewer: Codex, session `codex-RIpxIm`, 6 October 2026. The blueprint author was session `codex-gUN1xW`; this review is independent.

**Verdict: needs_changes.** This is a completed review, not a checkpoint. The packet and suggested file have been corrected in place. The reader still contains mathematical statements and proof steps that contradict those corrections, and its path is not among this review issue’s deliverables. A revision must synchronize the reader before an accepted review can promote it. The seven explicitly recorded proof/supplier gaps are legitimate target-level refinements and are not the reason for this verdict.

## Scope, counts and validation

| Item | Result |
| --- | --- |
| Nodes | 51: 31 verified, 20 corrected, 0 added, 0 unverifiable |
| Kinds | 6 definitions, 12 constructions, 24 theorems, 7 comparisons, 2 lemmas |
| Definition/construction API | All 98 entries checked; names preserved |
| Discriminating tests | All 72 checked; nonempty-curve and coefficient/base-field hypotheses clarified |
| Planets | 17: 4 in VB0, 6 in VB1, 4 in ampleness, 3 in classification |
| Pinned baseline | All 16 declarations independently confirmed; none removed or replaced |
| Source records | All 67 node citations checked against the nine public, hash-matching PDFs |
| Source issues | All 15 independently confirmed; 0 rejected, 0 added |
| Coverage | Five stages planned, none closed; one complete target-level pass |
| Open refinements | Seven named gaps and fourteen precise owner requests retained |
| Packet checker | `python3 scripts/check_blueprint.py research/blueprint/packets/VectorBundlesAndIsocrystals--VB0.json`: 0 errors, 0 warnings |
| Submission file intake | All four authorized files: 0 problems |
| Lean | `lean-check research/blueprint/suggested/VectorBundlesAndIsocrystals--VB0.lean`: exit 0, 77 warnings, all `declaration uses sorry`, no errors |

The suggested file was elaborated in the existing shared build at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, after confirming sufficient available memory. No library build, update, cache download or language server was started. The three commented Tau Ceti imports were source-checked at `f790474821cf4256814db967cb154e7af3d0c369`; their compiled modules are absent from that shared build. Successful elaboration certifies the Mathlib prototypes’ types with admitted proofs, not a compiled Tau Ceti integration or a formalization of the geometric theorems.

The file now contains 36/98 typed API specializations, 30/72 example specializations, 3/33 named theorem/comparison signatures, and 8/18 definition/construction interfaces. Its index names all 62 omitted API signatures, 42 omitted examples and 30 omitted theorem signatures. The unramified-degree-two iteration identity was removed: it only unfolded composition of an arbitrary automorphism and did not test the coefficient field or residue degree. That test is now an honest supplier-dependent omission. The genuine higher-rank Witt `D(2,2)` decomposition remains typed. PROTOCOL §13 allows unavailable-carrier statements to be omitted and indexed; none are replaced by arbitrary propositions.

## Corrections and required reader revision

1. **Coefficient scope and proof order.** The general finite-isocrystal functor needs a chosen `k=bar F_q` structure on S, because its scalar extension needs an embedding of the fixed completed coefficient field into the analytic coefficient sheaf. Standard cyclic matrix bundles can be defined over F_q separately. Geometric degree is proved later. The open-ball presentation is scoped over the fixed algebraically closed k. The early division-endomorphism theorem no longer invokes its later Brauer comparison, which would create a reverse dependency. Galois descent now uses the explicit conjugation compatibility with lifted Frobenius.
2. **Continuity, Ext and coherent sheaves.** The invariant-continuity criterion now directly imports global generation, as KL6.3.18 does, and coefficient actions are E-algebra automorphisms fixing π. The suggested interface uses that actual algebra-automorphism type. Ext is computed in the abelian module-sheaf/QCoh category with direct GAGA and schematic cohomological-dimension inputs. General-E coherent classification no longer imports the absolute KL Prüfer theorem.
3. **Classification and the key extension.** Trivializing a slope-zero torsor before proving local triviality was circular. The corrected proof first establishes triviality after an allowed extension by induction; only then does the Isom torsor descend it. The key-extension argument uses perfected analytic affine lines in equal characteristic, permitting fractional p-power exponents before π-linearity eliminates them. The source excerpt is the actual lemma on p. 71, rather than the preceding page’s footnote.
4. **Ownership, tests and citations.** Stable projective presentations belong to KTheoryLowDegrees Z.1, not its rank stage Z.2. The infinite-free-sheaf non-example needs a nonempty curve. The Ked05 tensor excerpt now includes its printed multiplicity, which plain text extraction dropped. FF degree/saturation and KL continuity/ampleness locators were corrected, an embedded PDF footer was removed, and SW printed/PDF pagination is now explicit. The regular-curve duplicated phrase and CN extraction-item reference were corrected.

The revision should copy the corrected packet contracts into these reader sections; it must not redo the valid plan or discard the existing identifiers:

| Reader location | Required update |
| --- | --- |
| VB0 §5 | Remove the early invariant assertion; retain center, dimension and cyclic presentation, with the invariant comparison in §7 |
| VB0 §9 | State `Φ′ρ_g=ρ_{σ′gσ′^{-1}}Φ′`; ordinary commutation is the centralizing special case |
| VB1 §1 | Make the infinite-free non-example conditional on a nonempty curve |
| VB1 §8 | Restrict the general functor to S/k, define cyclic standard bundles over F_q separately, and identify geometric degree as a later comparison |
| VB1 §9 | State the open-ball identification over the fixed algebraically closed k |
| VB1 §§12,15,16 | Remove the repeated complement phrase; correct FF rank/degree and saturation pages |
| VB2:ampleness §1 and supplier KTheory heading | Replace Z.2 by Z.1 for stable presentations; keep the KL proof route and G-GG |
| VB2:ampleness §§7–11 | Add GG and E-fixed coefficient actions to continuity; correct KL6.3.18 to p. 143, 8.7.7 to Theorem, 8.8.2/8.8.3 to p. 180, and 8.8.4 to pp. 180–181 |
| VB2:classification §4, A1 supplier and G-KEY | Use perfected analytic A¹ and possible fractional powers in equal characteristic |
| VB2:classification §5 | Correct the conditional extension/descent argument and retain the chosen k-embedding for the isocrystal comparison |
| VB2:classification §6 | Specify the Ext category and the added GAGA/two-affine cohomology prerequisites; cite FF5.6.23(4)–(5) |
| VB2:classification §8 | Remove the Prüfer prerequisite; replace “CN item 311” by Theorem 3.9(iii) |
| Source corrections/bibliography | Mark E15 independently confirmed by this review; use current FF erratum locators and SW’s PDF offset +10; include p. 487 for Ked05 tensor calculus |
| Suggested-signature limits | Update 31 typed tests / 41 omissions to 30 / 42 |

## Closure, supplier contracts and assigned findings

Every stated target of the five scoped stages is realized by a node. The 13 inherited node identifiers remain intact; no new node was necessary at target granularity. The proposed local declaration graph is acyclic after removing the raw-isocrystal annulus edge and the early invariant assertion and adding the missing GG/GAGA/cohomology edges. Every definition/construction still has at least three discriminating tests and a usable API. Existing generic carriers are reused; no audited library layer is replanned. `data/library-coverage.json` has no VectorBundlesAndIsocrystals entry, which is absence of an audit entry rather than a zero-coverage audit verdict.

The supplier statements read include LocalFieldsRamification Layer 2; ClassFieldTheory Layers 5–9; AdicSpacesPartII’s R3 finite locally free, Kiehl gluing and trace-pairing contracts; D0 Čech comparison, D2 v-descent and D3 locally profinite torsors; RF0 Witt/annuli, RF1 quotient, RF2 local period DVR and RF3’s current packet; SF.0/SF.1 specifications and available packet statements; Q4; KTheory Z.1/Z.2; AdicEtaleGeometry A1; and the VB3 basic examples and VS1 consumers. Where the present supplier does not yet state the required result, the packet requests its exact extension rather than claiming it exists. In particular SF requests must cover non-finite-type geometric curves and nonnoetherian relative Proj, Q4 needs its complete strongly Zariski closed statement, and A1 lacks the exact affine-line comparison.

**RT-AREA-padic-1/21:** the RF3 full-functor/global-map narrowing agrees with accepted RS-20. Homogeneous charts alone give a map on their union; global coverage follows after GG. The separate geometric-point chart-cover prefix before Picard/HN is correctly planned but remains G-GEOM, and its HN boundedness proof remains G-HN. The current RF3 and VB3 aggregate prerequisites still require the packet’s atomic G-INTEGRATION retargeting. The reader states these gaps honestly; the corrected coefficient functor scope must now be synchronized there.

**RT-AREA-geomlanglands/31:** the finite étale constant-algebra theorem exports precisely the simple-connectivity input needed by VS1’s divisor/Weil construction. It allows coefficient-field covers over E and splits them only after algebraic closure of E. Drinfeld’s lemma, the divisor map and reciprocity are not duplicated in this packet. VS1’s existing milestone/packet does not yet close that exact construction, so its named request remains an integration task. A maintainer note records that the current Tau Ceti Layer 9 reciprocity isomorphism is mixed-characteristic only; equal-characteristic use needs another supplier. No upstream Tau Ceti roadmap or link was edited.

The remaining G-DM, G-GEOM, G-HN, G-KEY, G-GG, G-INTEGRATION and G-LEAN work is precisely identified. These gaps prevent any claim of proof closure or formalization. They are compatible with the five `planned` stages and packet `complete` finished-pass status under PROTOCOL §0.

## Baseline confirmation

All entries were opened in their cited modules at the exact pinned commits. Their statement scopes are sufficient for the cited uses, with the following limitations already explicit in the packet:

| Declaration | Confirmed contract |
| --- | --- |
| `mathlib:WittVector.FractionRing.frobenius` | Ring automorphism of Frac(W(k)) for perfect characteristic-p domain k; q-Frobenius is its appropriate iterate. |
| `mathlib:WittVector.Isocrystal` | Module over Frac(W(k)) with a bijective p-Frobenius-semilinear equivalence; no finite-dimensionality field. |
| `mathlib:WittVector.IsocrystalHom` | Linear maps commuting with Frobenius. |
| `mathlib:WittVector.IsocrystalEquiv` | Intertwining linear equivalences. |
| `mathlib:WittVector.StandardOneDimIsocrystal` | Rank-one block with Frobenius p^m times coefficient Frobenius. |
| `mathlib:WittVector.isocrystal_classification` | Only the finrank=1 classification over algebraically closed k. Does not supply higher-rank Dieudonné–Manin. |
| `mathlib:AlgebraicGeometry.Scheme.Modules` | Sheaves of modules over a scheme structure sheaf; underlying carrier of schematic bundles. |
| `mathlib:SheafOfModules.LocalGeneratorsData.IsLocallyFreeData` | A local generator family whose free-to-module maps are isomorphisms; does not impose finite ranks. |
| `mathlib:SheafOfModules.LocalGeneratorsData.IsFiniteType` | Each local generator family is finite. Combine with locally free data on the SAME family for bundles. |
| `tauceti:SheafOfModules.LocalGeneratorsData.IsLocallyFreeData.isFinitePresentation` | Finite locally free local generator data implies finite presentation. |
| `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf` | Full subcategory of invertible structure-sheaf modules on a scheme. |
| `tauceti:TauCeti.AlgebraicGeometry.LineBundleClass` | Isomorphism classes of invertible sheaves; tensor-product commutative monoid at this pin, with equality iff underlying sheaves are isomorphic. |
| `mathlib:CommRing.Pic` | Picard group of a commutative ring, defined from invertible modules; does not compute Pic of the curve. |
| `tauceti:TauCeti.CSA.of` | Bundles an already central simple finite-dimensional algebra; does not construct cyclic algebras or arithmetic invariants. |
| `tauceti:TauCeti.BrauerGroup.mk_end` | The Brauer class of End_K(V) is split for nonzero finite-dimensional V. |
| `tauceti:TauCeti.BrauerGroup.baseChange_mk` | Algebraic Brauer class commutes with scalar extension. |

## Public source collation

The PDF bytes independently downloaded for this review match all nine full SHA-256 values recorded in the packet. Locators use printed pages; the FF main text has PDF offset +60, SW offset +10, CS offset −648, and Ked05 offset −446. Mathematical formulas were checked in their page layout when text extraction lost an exponent or reversed the visual order of a fraction. This prevented false errata for Ked05’s tensor multiplicity and CN’s d/h convention.

| Source | Public version checked | Relevant passages |
| --- | --- | --- |
| FS-geometrization | [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf) | II.1.11–II.1.22, pp. 53–57; II.2, pp. 57–72 |
| FF18-courbes | [Courbes et fibrés vectoriels en théorie de Hodge p-adique](https://webusers.imj-prg.fr/~laurent.fargues/Courbe_fichier_principal.pdf) | 5.5.1–5.5.6, pp. 162–164; 5.6.22–23, pp. 181–182; 8.2.3–10, pp. 236–238; 8.6.1, pp. 248–249; auxiliary E13 pp. 229,234–235 |
| KL15 | [Relative p-adic Hodge theory: Foundations](https://arxiv.org/pdf/1301.0792) | 6.2.1–6.3.19, pp. 135–143; 7.3.4–5, pp. 148–149; 8.7.6–7, p. 178; 8.8.1–9, pp. 180–182 |
| CS17 | [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf) | 3.2.10–13 and 3.3.4, printed pp. 681–683 |
| CN25 | [On the cohomology of p-adic analytic spaces, II: the C_st-conjecture](https://arxiv.org/pdf/2108.12785) | 3.2.1–4, Theorem 3.9, pp. 14–15 |
| SW20 | [Berkeley Lectures on p-adic Geometry](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf) | 13.5.7, printed p. 114 (PDF p. 124) |
| Ked05 | [Slope filtrations revisited](https://ems.press/content/serial-article-files/25974) | 2.0.1–2.1.4, pp. 451–452; 3.1, pp. 477–478; 4.1.2, p. 487; 4.5, pp. 497–499 |
| Lurie26 | [Lecture 26: Isocrystals](https://www.math.ias.edu/~lurie/205notes/Lecture26-Isocrystals.pdf) | Definition 1, standard blocks, Theorem 6 and Warning 17, all three pages |
| GLX26 | [The connected components of affine Deligne–Lusztig varieties](https://arxiv.org/pdf/2208.07195) | §5.1, pp. 31–32, finite tensor isocrystals only; filtered/G-structures remain out of scope |

## Independent source-issue decisions

Each entry now has its own `review` by this job. The inherited `originalFinding`, `originalReview` and searches remain historical provenance, not this review’s evidence. E11–E14 retain `originalLocator` while current locators point into the hashed 404-page FF copy. No claim is made that unread restricted publisher editions still contain these errors.

| Issue | Verdict and independent check |
| --- | --- |
| E1 | confirmed — At KL p. 181 the proof extends generators only from U1. U2 is required to cover V_+(f1). Definition 8.8.1 chooses degree-one f_i, so the undefined d must be 1. |
| E2 | confirmed — KL p. 181 cites generation Lemma 8.8.4 for H¹ vanishing while proving the implication from generation to vanishing. The explicitly cited Proposition 6.2.2 proves the required positive-twist vanishing independently. |
| E3 | confirmed — In KL pp. 181–182 the chosen n depends on e. Fix n0 from e=0, choose each later n divisible by n0, and express every sufficiently large multiple of n0 as jn+kn0 with j,k large. This gives the required single tensor-power criterion. |
| E4 | confirmed — CN p. 14 prints the one-sided hypotheses. The split extension O(5)⊕O satisfies them for [0,1] and has slope 5. Both terms must have slopes in the interval. |
| E5 | confirmed — FS p. 63: comparing π^i coefficients of φ(f)=π^n f gives φ(r_i)=r_{i−n}. The n=1 recurrence in II.2.2 agrees; the number of free coefficients is unchanged. |
| E6 | confirmed — FS p. 63 uses λ=r/s but prints φ^r=p^s. The denominator s is the unramified extension degree, so the equation is φ^s=p^r. λ=1/2 distinguishes the equations. |
| E7 | confirmed — FS p. 64 inducts at n<−1, where H¹(O(n)) and H¹(O(n+1)) are the negative-twist terms. Printed O(−n) has positive slope and zero H¹, so it cannot perform that induction. |
| E8 | confirmed — FS pp. 65–66 normalize |[ϖ]|=q^−1 and rad=log|[ϖ]|/log|π|; hence |π|=q^−1/ρ. For A=π^N and w=π^M the constant particular solution has size q^−M/q at radius q. A homogeneous eigenvector cannot cancel its unit coefficient without violating convergence along its negative-index recurrence. This contradicts (II.2.1); the KL replacement and G-GG are necessary. |
| E9 | confirmed — FS p. 66 writes w2 with π^{M−N}, then drops π^−N after applying φ(A^−1). On |[ϖ]|=|π| the actual exponent is M+(q−1)N−N′. The proposed cutoff K has lower bound (N′+1)/(q−1) and upper bound 1+(N−1)q/(q−1), so the corrected two inequalities work also at q=2 after twisting. |
| E10 | confirmed — FS p. 67 claims the chart construction has no hypotheses. With a negative line bundle on P¹, every positive-degree section vanishes and the chart union is empty. Generation is required to cover X, precisely the RF3/global-Proj separation in RS-20. |
| E11 | confirmed — Current FF printed p. 163 defines segment slopes as degree/rank and horizontal lengths as ranks, then reverses the coordinates in Theorem 5.5.3. The point must be (rank,degree), as used by this polygon node. |
| E12 | confirmed — Current FF printed p. 164 excludes only the zero strict subobject in Definition 5.5.5; identity is also strict. Testing X′=X forces μ(X)<μ(X). Add X′≠X to agree with the following simple-object characterization. |
| E13 | confirmed — Current FF pp. 229,234–236 write Witt rings where fields and a division algebra are required. Invert π: in particular L must be a field for Definition 8.2.5, and E_n[Π] is the algebra whereas O_{E_n}[Π] is its order. |
| E14 | confirmed — Current FF printed p. 238 uses Fix in the coefficient-adjunction diagram; Fib is the defined bundle category used in Proposition 8.2.6. This is a category-name misprint. |
| E15 | confirmed — KL Definition 6.2.1 on p. 135 defines φ_{M(n)}=p^−n φ_M. Fixed vectors therefore satisfy φ_M(v)=p^n v, whereas Lemma 6.3.17 p. 142 prints p^−n. Reindex by −n; fixed-n norm equivalence survives. The packet’s rank-one π-eigenvalue test separates the two kernels. |

## Node-by-node decisions

The same exhaustive decisions are in the packet’s `review.checked` array. “Verified” is a source-faithful target plan with any stated supplier/proof refinement retained, not a claim that its theorem has been proved.

| Node | Verdict | Check/correction |
| --- | --- | --- |
| `VectorBundlesAndIsocrystals:VB0/isocrystal-category-and-standard-block` | corrected | Removed the irrelevant annulus prerequisite. The raw finite semilinear category uses RF0 coefficients and local-field Frobenius; the pinned class lacks finiteness. |
| `VectorBundlesAndIsocrystals:VB0/rational-standard-block` | verified | Positive denominator, nonzero uniformizer and cyclic wrap coefficient are explicit. Simplicity requires coprimality only in later results; the rank-one Witt comparison is scoped correctly. |
| `VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals` | verified | The general finite classification exceeds the pinned finrank-one theorem. Ked05 supplies the mixed-characteristic route; G-DM explicitly retains the eigenvector calculation and equal-characteristic proof. |
| `VectorBundlesAndIsocrystals:VB0/tensor-and-dual-slopes` | corrected | Corrected the Ked05 excerpt to include its displayed tensor multiplicity dd′/d″, lost in text extraction. Ranks, dual sign and bundle-consumer convention agree with both sources. |
| `VectorBundlesAndIsocrystals:VB0/endomorphism-division-algebra` | corrected | Removed the premature Brauer invariant assertion and its implicit reverse dependency. The early result now proves only division, center, dimension and cyclic presentation; the existing invariant node supplies the later arithmetic comparison. |
| `VectorBundlesAndIsocrystals:VB0/slope-division-algebra` | verified | The slope-labelled cyclic algebra specializes the CFT owner contract and existing CSA carrier. Arithmetic σ, π^d and dimension h² are explicit; no local generic cyclic-algebra development is duplicated. |
| `VectorBundlesAndIsocrystals:VB0/brauer-invariant-sign` | verified | The opposite/sign convention is correct: isocrystal slope a gives invariant −a; bundle slope d/h gives +d/h. The algebraic/cohomological Brauer comparison remains a precise supplier request. |
| `VectorBundlesAndIsocrystals:VB0/scalar-extension-adjunction` | verified | Coefficient pullback/restriction adjunction retains Frobenius and total-degree slope normalization. Ordinary field/module descent is imported from SF.1, not replanned. |
| `VectorBundlesAndIsocrystals:VB0/finite-galois-descent` | corrected | Made Frobenius/Galois compatibility explicit as Φ′ρ_g=ρ_{σ′gσ′^{-1}}Φ′. Explained why both Φ′ and its inverse restrict to invariants, and why ordinary commutation requires centralization. |
| `VectorBundlesAndIsocrystals:VB1/finite-locally-free-bundles` | corrected | The same generator witness must be finite and free. Added nonemptiness and a residue-field stalk to the infinite-free non-example, excluding the empty-scheme exception. |
| `VectorBundlesAndIsocrystals:VB1/annular-frobenius-descent` | verified | Annular equivariant descent uses the quotient and Stein/Kiehl gluing inputs. It does not require classification, degree, HN or general-S ampleness. |
| `VectorBundlesAndIsocrystals:VB1/tilted-robba-ring` | verified | The relative Robba construction retains the affinoid pair, directed annular system, completion and Frobenius. CS17 §§3.2–3.3 and RF0 coefficient comparisons support its stated scope. |
| `VectorBundlesAndIsocrystals:VB1/robba-frobenius-modules` | verified | Finite projective Frobenius modules and global integral étale models are distinct from pointwise purity. KL7.3.4–7.3.5 explicitly distinguish these hypotheses. |
| `VectorBundlesAndIsocrystals:VB1/robba-bundle-equivalence` | verified | CS17 Theorem 3.3.4 is the finite-projective exact tensor comparison; full faithfulness and essential surjectivity use finite annular descent, not an arbitrary module-sheaf identification. |
| `VectorBundlesAndIsocrystals:VB1/frobenius-two-term-cohomology` | verified | FS p. 57 gives the derived two-term φ−1 complex. E-linearity is used; the semilinear map is not declared linear over the larger period ring. |
| `VectorBundlesAndIsocrystals:VB1/v-descent-for-bundles-and-cohomology` | verified | FS II.2.1 gives v-descent of the derived cohomology complex. D2 higher v-acyclicity and function descent, with SF.1 module descent, are the stated inputs. |
| `VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor` | corrected | Restricted the general functor to S over the chosen k=bar F_q. Standard cyclic matrix objects remain defined over F_q; geometric degree and the tensor test are explicitly later/geometric comparisons. |
| `VectorBundlesAndIsocrystals:VB1/cohomology-of-twists` | corrected | Kept the cohomology/representability assertions over Perf_Fq and scoped the stated open-ball identification after base change to the fixed algebraically closed k, as in FS II.2.2. Affinoid and slope restrictions remain explicit. |
| `VectorBundlesAndIsocrystals:VB2:classification/classical-points-and-principal-ideal-domains` | verified | FS II.1.11–II.1.22 distinguishes classical maximal ideals from arbitrary adic points. The annular PID argument is separate from the later curve-chart PID argument; the Q4 geometric extension is requested explicitly. |
| `VectorBundlesAndIsocrystals:VB1/geometric-point-chart-cover` | verified | The early geometric chart-cover/equivalence argument is independent of general-S GAGA in the proposed order. G-GEOM honestly records the source-proof transplantation and overlap verification still required. |
| `VectorBundlesAndIsocrystals:VB2:ampleness/schematic-curve-at-a-geometric-point` | corrected | Corrected a duplicated phrase. FS II.2.9 proves regular noetherian dimension one and PID complements without asserting a finite-type E-curve; the early chart-cover gap is retained. |
| `VectorBundlesAndIsocrystals:VB1/completed-local-ring-comparison` | verified | CN §3.2.1 and RF2 give the completed local period DVR for each untilt. A chosen uniformizer and a point-dependent residue field are retained; Q_p is only the BdR specialization. |
| `VectorBundlesAndIsocrystals:VB1/picard-degree` | verified | Picard degree is a new curve computation, distinct from the pinned line-class monoid and affine ring Picard group. The PID complement/DVR transition proof precedes classification. |
| `VectorBundlesAndIsocrystals:VB1/degree-rank-slope-and-HN-formalism` | corrected | Corrected the FF locator: rank/degree axioms begin p. 162, Definition 5.5.1 is p. 163. Determinant degree and nonzero rank normalize slope; arbitrary relative global degree is excluded. |
| `VectorBundlesAndIsocrystals:VB1/saturation-and-torsion-degree` | corrected | Corrected the FF vector-bundle saturation example to p. 164. Local DVR lengths, finite support and generic-isomorphism degree defect are the precise SF.0 extension inputs. |
| `VectorBundlesAndIsocrystals:VB1/geometric-semistability` | verified | Proper nonzero saturated subbundles distinguish stability from semistability and avoid the source’s identity-subobject misprint. The zero object has no slope and is not stable. |
| `VectorBundlesAndIsocrystals:VB1/harder-narasimhan-filtration` | verified | Existence/uniqueness and threshold functoriality agree with FS II.2.12 and FF5.5.2. G-HN explicitly retains bounded subbundle degrees and meromorphic trivialization without using classification/ampleness. |
| `VectorBundlesAndIsocrystals:VB1/harder-narasimhan-polygon` | verified | The horizontal coordinate is rank and the vertical coordinate degree. Ranked segment lengths, concavity, the zero polygon and the O(1/2) test detect the confirmed FF coordinate error. |
| `VectorBundlesAndIsocrystals:VB2:ampleness/quantitative-global-generation` | corrected | Replaced KTheory Z.2 by Z.1, whose statement actually supplies stable finite-projective presentations. The main KL two-half-annulus contraction route and the general-E comparison gap G-GG remain explicit. |
| `VectorBundlesAndIsocrystals:VB2:ampleness/global-proj-map-and-twists` | verified | Coverage is proved after generation, before a global Proj map is named. Compatible sufficiently large shifts define the invertible degree-one twist; naive arbitrary graded shifts are not assumed invertible. |
| `VectorBundlesAndIsocrystals:VB2:ampleness/gaga-equivalence` | verified | FS II.2.7 supports the exact tensor bundle equivalence and all cohomology comparisons in its generation/vanishing hypotheses. No general relative coherent-sheaf equivalence is inferred. |
| `VectorBundlesAndIsocrystals:VB2:ampleness/independence-of-positive-twist` | verified | Independence is restricted to ample choices satisfying the hypotheses. Affine nonvanishing charts give the intrinsic reconstruction and cocycle law; the direct affineness prerequisite is present. |
| `VectorBundlesAndIsocrystals:VB2:ampleness/prufer-and-coherent-correspondence` | verified | KL6.3.5–6.3.14 is scoped to the absolute analytic field for Prüfer/Bézout charts and coherent correspondence. It is not imposed on arbitrary relative perfectoid bases. |
| `VectorBundlesAndIsocrystals:VB2:ampleness/norms-on-twisted-invariants` | verified | Fixed-n topology, equivalence rather than equality of norms, and the KL6.3.17 twist-sign correction are explicit. The rank-one sign example separates the two eigenspaces. |
| `VectorBundlesAndIsocrystals:VB2:ampleness/continuous-frobenius-group-actions` | corrected | Added the global-generation prerequisite used by KL6.3.18 and corrected its locator to p. 143. Required E-algebra coefficient actions fixing π; synchronized the typed Lean action with that contract. |
| `VectorBundlesAndIsocrystals:VB2:ampleness/two-affine-cover-cohomological-dimension` | corrected | Corrected Proposition to Theorem 8.7.7. KL Remark 8.7.6 supplies two degree-one sections; affine intersection and QCoh acyclicity justify dimension one. |
| `VectorBundlesAndIsocrystals:VB2:ampleness/tensor-global-ampleness` | corrected | Corrected Definition 8.8.2 to p. 180. The finite-type QCoh quantifier, dependence of thresholds on the test sheaf, strong rational locality and vacuously ample zero bundle match KL’s tensor-power convention. |
| `VectorBundlesAndIsocrystals:VB2:ampleness/ampleness-power-criterion` | corrected | Corrected Lemma 8.8.3 to p. 180. Positive m is required; testing finitely many residue classes of exponents proves the reverse implication. |
| `VectorBundlesAndIsocrystals:VB2:ampleness/positive-lines-and-finite-type-presentations` | corrected | Corrected the statement/proof page range and removed a PDF footer from the excerpt. The proof uses both affine charts and a common denominator-clearing exponent, repairing E1. |
| `VectorBundlesAndIsocrystals:VB2:ampleness/cohomological-ampleness-criterion` | verified | The corrected proof uses positive-line vanishing independently of ampleness and fixes one n0 before all twists e. The all-sufficiently-large quantifier and divisor generation argument repair E2–E3. |
| `VectorBundlesAndIsocrystals:VB2:ampleness/globally-etale-positive-ampleness` | verified | KL8.8.7 requires a global étale model and positive twist. The pointwise-purity and untwisted-unit non-examples preserve its real hypotheses; general-E normalization remains G-GG. |
| `VectorBundlesAndIsocrystals:VB2:ampleness/ample-section-affineness` | verified | KL8.8.8–8.8.9 gives affine nonvanishing opens, including the empty case, using the cohomological criterion and generic QCoh affineness input. Homogeneous localization identifies the coordinate ring. |
| `VectorBundlesAndIsocrystals:VB2:classification/standard-bundle-stability` | verified | Coprimality and wedge/negative-H⁰ inequalities prove stability before bundle classification. Equality would force the reduced denominator to divide a smaller positive rank. |
| `VectorBundlesAndIsocrystals:VB2:classification/fixed-slope-abelian-category` | verified | FF5.5.4–5.5.6 gives the fixed-slope abelian finite-length category with the zero object. Saturation removes torsion from kernels/cokernels; this does not identify all simple objects yet. |
| `VectorBundlesAndIsocrystals:VB2:classification/HN-filtration-base-change` | verified | FS II.2.13 distinguishes extension of C from coefficient extension E′/E. HN thresholds scale by total coefficient degree only; uniqueness and descent preserve the filtration. |
| `VectorBundlesAndIsocrystals:VB2:classification/key-extension-lemma` | corrected | Replaced the page-70 footnote excerpt by the actual page-71 lemma passage. Distinguished ordinary analytic A¹ in mixed characteristic from perfected analytic A¹ with possible fractional exponents in equal characteristic; G-KEY and the A1 request now state that exact comparison. |
| `VectorBundlesAndIsocrystals:VB2:classification/dieudonne-manin-classification-of-bundles` | corrected | Corrected the circular torsor step: triviality after an extension implies a pro-étale Isom torsor that descends; the rank/key-extension induction first proves such triviality. The functor/classification comparison retains the chosen k-embedding. |
| `VectorBundlesAndIsocrystals:VB2:classification/hom-and-ext-calculus` | corrected | Specified Ext in the abelian structure-sheaf/QCoh category, added GAGA and the two-affine cohomology dependencies, and corrected the FF locator to parts (4)–(5). The whole bundle category is not silently treated as abelian. |
| `VectorBundlesAndIsocrystals:VB2:classification/bundle-endomorphism-comparison` | verified | The simple-block endomorphism comparison agrees with FF8.2.8 and the cyclic dimension calculation. It is separate from the failure of full faithfulness between different slopes. |
| `VectorBundlesAndIsocrystals:VB2:classification/coherent-sheaf-classification` | corrected | Removed the absolute Q_p/KL Prüfer dependency from the general-E geometric coherent theorem. Regular DVR charts and finite-support cohomology suffice; replaced extraction item 311 by CN Theorem 3.9(iii). |
| `VectorBundlesAndIsocrystals:VB2:classification/finite-etale-constant-algebras` | verified | FF8.6.1 and SW13.5.7 give coefficient-field covers, not absence of all covers over E. Trace self-duality and nilpotence rule out nonzero slopes. Corrected SW edition pagination in the bibliography; the VS1 export is appropriately separate. |

## Questions and next actions for the orchestrator

- Include the reader path in the revision round and synchronize the listed sections with this corrected packet. The corrected declarations need no additional splitting at target granularity.
- Apply the already-requested RF3/VB3 atomic supplier retargeting before treating the aggregate stage graph as executable. Preserve G-GEOM and G-HN until their reordered proofs are actually written.
- Ensure the VS1 divisor/Weil construction consumes the constant-algebra export and has a reciprocity supplier in its intended characteristic scope. The upstream note is for the maintainer; this review does not change Tau Ceti’s roadmap.

No independent-review work remains for this run. The next job is the scoped revision, not a continuation of an unfinished review.
