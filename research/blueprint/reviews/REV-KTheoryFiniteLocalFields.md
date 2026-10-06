# REV-KTheoryFiniteLocalFields

**Needs changes before joint promotion: reconcile the accompanying reader.** Completed independent review for issue #440 by Codex, session `codex-7BFVsd`, on 6 October 2026. This is a completed review, not a checkpoint. The reviewed plan was written by session `codex-Pp6J8i`; this reviewer did not write it. The packet and suggested planning forms have received the clear corrections. The remaining blocker is a material contradiction between that packet and its accompanying reader, which this issue does not authorize the reviewer to edit. PROTOCOL §8 promotes them together, so accepting only the packet would publish known errors in the reader. This verdict does not reject a partial plan for its honest named gaps and does not certify implementation, complete supplier proofs, or successful Lean elaboration.

The packet's `review` object records `independent-review-REV-KTheoryFiniteLocalFields` and an individual, specific verdict for every node. All 280 nodes were checked: **215 verified, 65 corrected, zero added, zero unverifiable**. The two completion sketches initially lacked a sound passage to inverse limits. The final corrections supply their finite-level/pro-system arguments, so they are corrected rather than left unverifiable.

| Material checked | Final count |
| --- | ---: |
| Nodes | 280 |
| Definitions / constructions | 13 / 13 |
| Theorems / lemmas / comparisons / applications | 117 / 113 / 21 / 3 |
| Local API entries | 209 |
| Local definition/construction tests | 117 |
| Planets | 42, six per stage |
| Pinned baseline declarations | 102 |
| Public source entries / historical version records | 25 / 31 |
| Supplier requests / structural proposals | 34 / 26 |
| Named gaps | 39 |
| Local source findings independently reviewed | 48: 42 inherited, six added |
| Added / removed nodes | 0 / 0 |

Stage node counts remain L.1 61, L.2 17, L.3 21, L.4 35, L.5 85, L.6 50 and L.7 11. All seven stages remain `planned`, none `closed`; every implementation remains `unchecked`. `status: complete` means a completed target-level pass under PROTOCOL §0, with named gaps, rather than proof closure or formalization. The routed finite-rank, NS, hermitian and dyadic targets were included in the audit, rather than checking only the original campaign targets.

The review read every node's locator, excerpt, statement, hypotheses, prerequisites, proof outline and acceptance checks; all object APIs and tests; the supplier requests and migrated generic log-Witt specifications; coverage and remaining lists; all structural proposals and source findings; and the executable suggested forms. The source register contained 527 distinct locator/excerpt combinations. Text extraction and locator navigation assisted the reading, and did not constitute a semantic proof check by themselves. Critical scan/typographical passages were also inspected as page images. The 25 current source PDF hashes were independently confirmed. Historical version records and inherited reading scopes were retained without claiming that every paper was newly read in full.

The binding blueprint and expansion protocols, campaign description, reviewed library audit and two nearby upstream roadmap documents (AlgebraicTopology and RepresentationTheory/InductionRestriction) were read. Target-level granularity was retained: proof sketches were corrected without adding a parallel collection of implementation lemmas or duplicating another roadmap's definitions.

## Changes by node

The following lists every node changed, including the two records whose packet hypotheses already sufficed but whose suggested signatures did not. Changes to global metadata, requests, source findings and supplier specifications follow separately.

- `KTheoryFiniteLocalFields:L.1/mod-m-products`: Added the ring-spectrum hypothesis to Browder’s scholium and removed unsupported descent of products from a larger modulus.
- `KTheoryFiniteLocalFields:L.1/brauer-character`: Restricted embedding-change assertions to the finite eigenvalue roots or a true global profinite unit; checked additivity and tensor API.
- `KTheoryFiniteLocalFields:L.1/fpsi-lifting`: Replaced algebraic Mittag-Leffler by the compact inverse-sequence lim¹ argument; verified Atiyah–Segal’s pro/completion statements in the scan.
- `KTheoryFiniteLocalFields:L.1/quillen-map`: The finite-level integer Adams comparison is justified; arbitrary profinite embedding changes now terminate in a specific completed-operation gap.
- `KTheoryFiniteLocalFields:L.1/gl-mod-p-acyclic`: Confirmed E43: stable GL mod-p acyclicity must not be asserted for GL_n; GL₂(F₂) has nonzero H₁ over F₂.
- `KTheoryFiniteLocalFields:L.1/quillen-homology-iso`: Confirmed E44: field duality supplies the homology comparison, whereas the source’s integral Hom-only implication omits Tor.
- `KTheoryFiniteLocalFields:L.1/galois-tensor-splitting`: Corrected Exercise IV.6.13 to PDF p.335; the tensor splitting runs over Galois automorphisms and requires separability.
- `KTheoryFiniteLocalFields:L.1/galois-transfer-formula`: Corrected the source’s i^*i_* excerpt and p.335 locator; the two composites are degree multiplication and the Galois sum respectively.
- `KTheoryFiniteLocalFields:L.1/finite-field-transfer-formulas`: Corrected the source page; the formulas use compatible generators or intrinsic norm/restriction, not an arbitrary independent choice at each field.
- `KTheoryFiniteLocalFields:L.1/algebraic-closure-k-groups`: Replaced the zero ordinary tensor power of a divisible torsion group by the torsion Tate twist μ(i); Frobenius acts by p^i.
- `KTheoryFiniteLocalFields:L.1/completed-k-theory`: Completion is a homotopy inverse limit; κ is multiplicative, while reductions require chosen finite-coefficient products before being called ring maps.
- `KTheoryFiniteLocalFields:L.2/dvr-localisation`: Added the coefficient/integral boundary pairing needed by the section and requested its left-linear sign from K.7.
- `KTheoryFiniteLocalFields:L.2/henselian-dvr-mod-m-splitting`: The section needs mixed coefficient/integral left-linearity; its dependence on π and the m-invertibility hypothesis are preserved.
- `KTheoryFiniteLocalFields:L.2/e-invariant-local-field`: Removed the unsupported assertion that the p-primary e-invariant is false in general; this proof establishes only ℓ≠p.
- `KTheoryFiniteLocalFields:L.3/local-k2-localisation-sequence`: Harmonized localization with ∂{u,π}=ū; the K-book symbol is inverse, and the canonical section now has the correct target boundary.
- `KTheoryFiniteLocalFields:L.3/moore-kernel-p-divisible-mixed-characteristic`: Corrected local duality to the dual of twist −1, then used equality of cardinalities with twist +1; no natural positive-twist isomorphism is asserted.
- `KTheoryFiniteLocalFields:L.4/tr-pro-spectrum`: Made n≥2 explicit for R,F,V while preserving TR¹=T and the HM/NS index shift; checked all eleven API items.
- `KTheoryFiniteLocalFields:L.4/norm-restriction-cofibre-sequence`: Restricted the norm–restriction sequence to n≥2 so its last TR level exists; the n=2 example has the correct Witt lengths.
- `KTheoryFiniteLocalFields:L.4/p-typical-tc`: The TC product comes from the homotopy equaliser of id and F, not a fibre of ring map id−F; underlying spectra still have the fibre sequence.
- `KTheoryFiniteLocalFields:L.4/connes-operator`: Removed the unproved inference η≠0⇒ηd≠0; the nonzero-square witness is a precise gap and three other definition tests remain.
- `KTheoryFiniteLocalFields:L.4/tate-cohomology-hm-model`: The node already has i≤−2 and the norm-kernel degree −1; E45 confirms the printed HM range is wrong, while the API uses the right range.
- `KTheoryFiniteLocalFields:L.4/thh-resolution-theorem`: Cofibrations must be admissible degreewise monos whose cokernels lie in E; arbitrary monos in the ambient abelian category were too broad.
- `KTheoryFiniteLocalFields:L.4/thh-of-dvr-with-log-poles`: Corrected cofibrations in projective complexes to split monos/projective cokernels; multiplication by π is a weak equivalence after inverting π.
- `KTheoryFiniteLocalFields:L.4/tr-localization-sequence`: Restricted the displayed differential residue-sequence example to complete mixed characteristic with perfect residue field; the localization theorem remains general.
- `KTheoryFiniteLocalFields:L.5/complete-dvr-eisenstein-presentation`: The Cohen/Witt coefficient embedding and Eisenstein presentation need a precise local-field export beyond the pinned construction of W(k); added its request and gap.
- `KTheoryFiniteLocalFields:L.5/ghost-image-criterion`: Dividing a ghost vector by p requires each coordinate to lie in pR first; torsion freeness makes its quotient unique.
- `KTheoryFiniteLocalFields:L.5/verschiebung-one-is-teichmuller-minus-p`: The p=2 counterexamples are in Z, not every R; odd-p universal identities remain intact.
- `KTheoryFiniteLocalFields:L.5/modified-verschiebung`: The packet already requires a uniformizer; added Irreducible π to the Lean iterate signature so the coefficient’s constant-term unit evaluates to a unit.
- `KTheoryFiniteLocalFields:L.5/tame-base-change-of-log-differentials`: Added coherent K→L and A→L scalar towers to the Lean log base-change map; the tame condition is p∤e, not e=1.
- `KTheoryFiniteLocalFields:L.5/homotopy-orbit-de-rham-witt-module`: Replaced ordinary composition with the divided ghost differential and its universal-polynomial proof; added n>0 to the Lean Teichmüller test.
- `KTheoryFiniteLocalFields:L.5/log-de-rham-witt-dvr-mod-p`: Added s<n to the first basis family and truncated the Z_p example accordingly; otherwise the n=1 example had an extra vector.
- `KTheoryFiniteLocalFields:L.5/tr-log-structure-maps`: M consists of multiplication weak equivalences after inverting π; Aut_A(A)=A× and does not contain the uniformizer.
- `KTheoryFiniteLocalFields:L.5/thh-of-dvr-mod-p`: Made HM’s odd-prime standing hypothesis explicit on the displayed mod-p algebra; the p∣e and p∤e cases have different dimensions.
- `KTheoryFiniteLocalFields:L.5/log-thh-mod-p`: Separated the graded-ring comparison and differential up to a universal unit; the later unit calculation is a dependency, not assumed in its own proof.
- `KTheoryFiniteLocalFields:L.5/log-thh-p-adic`: Made the read HM odd-prime scope explicit; the noncanonical completed odd formula remains a named missing computation.
- `KTheoryFiniteLocalFields:L.5/log-thh-tame-descent`: Added odd p to the tame descent scope; a tame Galois extension, rather than an arbitrary ramified extension, is required.
- `KTheoryFiniteLocalFields:L.5/log-de-rham-witt-tr-level-two`: Norm sequences require 2≤n≤3; the comparison/divisibility base n=1 remains. This prevents the circular use of Lemma5.6.1 in Addendum3.3.9.
- `KTheoryFiniteLocalFields:L.5/norm-restriction-exact-low-degrees`: Restricted the norm sequence to n≥2 while retaining unique divisibility of TR²-degree groups at every positive level.
- `KTheoryFiniteLocalFields:L.5/tr2-of-dvr-divisible`: Corrected the perfect-field kernel to the last V^{n−1} layer; a single V from the entire preceding group is larger at n>2.
- `KTheoryFiniteLocalFields:L.5/log-thh-mod-p-alpha-presentation`: Added the separate K₀ case and confirmed E46’s target-uniformizer correction; the μ_p root identity is not used when u=1, θ=−1.
- `KTheoryFiniteLocalFields:L.5/reduction-mod-p-of-thh-dvr`: κ̃ in ordinary THH requires p∣e in both clauses; the claimed Z_p example was impossible since its mod-p THH degree two vanishes.
- `KTheoryFiniteLocalFields:L.5/kappa-differential`: The κ̃ differential is used only for p∣e; its computation determines the universal unit, giving dκ for all K without assuming a nonexistent κ̃ elsewhere.
- `KTheoryFiniteLocalFields:L.5/tate-infinite-cycles-uniformizer`: Corrected the example to n=1<v_p(e), yielding the e/p hidden extension; there is no TR⁰ or C₁ assertion.
- `KTheoryFiniteLocalFields:L.5/tate-spectral-sequence-first-level`: For K₀ the differential kills κ^p and u₁, leaving Λ(dlog p)⊗k[t±1]; removed the unspecified and misleading extra quotient.
- `KTheoryFiniteLocalFields:L.5/gamma-hat-mod-p-isomorphism`: Separated K₀ from the deeply ramified hidden extension: e/p is not an integer when e=1; its Bockstein argument is the correct separate case.
- `KTheoryFiniteLocalFields:L.5/tate-spectral-sequence-differentials`: Restricted monomial differentials to 0≤v<n; terms with larger valuation survive that part of the computation.
- `KTheoryFiniteLocalFields:L.5/log-de-rham-witt-tr-mod-p`: Corrected the level-one comparison to W₁ω/p; the main Bott comparison is a pro-isomorphism, not a levelwise theorem.
- `KTheoryFiniteLocalFields:L.5/log-de-rham-witt-tr-mod-pv`: Removed the false first-level Bott isomorphism: π^{e/(p−1)} is a nonunit. Theorem C still gives the claimed pro-isomorphism.
- `KTheoryFiniteLocalFields:L.5/thh-of-perfect-field`: Kept Bökstedt’s integral calculation at all primes and restricted this source’s mod-p exterior/DGA model to odd p.
- `KTheoryFiniteLocalFields:L.5/tr-of-perfect-field`: Corrected the Frobenius kernel to p^{n−1}W_nσ=V^{n−1}(TR¹₂); the R multiplication kills positive σ powers in the limit.
- `KTheoryFiniteLocalFields:L.5/hochschild-homology-of-truncated-polynomial-algebra`: Specified relative Hochschild homology over k and the relative enveloping algebra; e=0 does not eliminate arbitrary absolute base homology.
- `KTheoryFiniteLocalFields:L.5/tate-image-of-uniformizer-truncated`: Confirmed E47 visually and replaced u₁ by u_n in the equality case; also excluded level zero.
- `KTheoryFiniteLocalFields:L.5/relative-tc-of-truncated-polynomial-algebra`: Moved the restriction index r inside each inverse limit and removed the spurious outer product; matched Proposition8’s j-indexed sequence.
- `KTheoryFiniteLocalFields:L.5/tr-of-smooth-fp-algebra`: Replaced the invalid colimit/holim shortcut by a fixed-degree pro-zero polynomial summand, surjective Witt restriction and Milnor argument, matching Hesselholt Corollary2.4.7. Finite-level Popescu/continuity inputs are explicit supplier contracts.
- `KTheoryFiniteLocalFields:L.6/w-invariant-prime-to-p-factor`: Removed the conclusion w_i=(q^i−1)w_i^(p) from the hypotheses; it now follows from the primary decomposition and L.2.
- `KTheoryFiniteLocalFields:L.6/even-integral-k-groups`: Replaced the alleged canonical map to an identified Z/w_i by the canonical quotient K_{2i}/Div; identification and splitting are choices.
- `KTheoryFiniteLocalFields:L.6/even-k-groups-tate-module`: Added the finiteness argument before identifying the Tate module with Z_p^{λ_i}; arbitrary direct sums of Prüfer groups cannot be exchanged with inverse limits.
- `KTheoryFiniteLocalFields:L.6/divisible-rank-relation`: The exact sequence is natural with ordinary completion on the left; writing a torsion-split T_i^∧⊕Z/w_i^(p) requires a choice.
- `KTheoryFiniteLocalFields:L.6/k3-torsion-free-lattice`: Added the injective-divisible projection argument for a complement containing P; scoped the unknown splitting to the 2013 source rather than current research status.
- `KTheoryFiniteLocalFields:L.6/odd-integral-to-completed-comparison`: Corrected density to the closed ordinary-completion subgroup; density in the whole completed group requires λ_{i−1}=0.
- `KTheoryFiniteLocalFields:L.6/geisser-hesselholt-regular-local`: Replaced the invalid completion/colimit shortcut by finite-level symbol comparisons, a surjective K/p^n quotient tower and the Witt-filtration kernel argument. The Popescu and Geisser–Levine inputs remain named; confirmed the source’s degree-preserving R−F correction E48.
- `KTheoryFiniteLocalFields:L.7/transfer-completion-formula`: Added the NumberFieldArithmetic Layer5 semilocal prerequisite needed for the transfer sum, beyond the individual completion extension maps.
- `KTheoryFiniteLocalFields:L.7/boundary-at-a-prime-via-localisation`: Fixed degree-two acceptance to the same left-linear tame boundary as L.2; the localization-at-a-prime argument retains the other-place projection.
- `KTheoryFiniteLocalFields:L.7/boundary-completion-compatibility`: Harmonized global and completed boundary signs; the tame-symbol and valuation examples now use the same maps in the naturality square.
- `KTheoryFiniteLocalFields:L.7/semilocal-completed-map`: Added the semilocal supplier edge; finite products commute with K-theory and p-completion, giving the correct global-to-local regulator carrier.

## Inverse-limit arguments

For `L.5/tr-of-smooth-fp-algebra`, first establish the natural fixed-level TR/de Rham–Witt comparison after the Popescu colimit. In each fixed degree, its finitely many positive powers of the degree-two generator form a pro-zero system: restriction multiplies the term with power i by p^i times a unit, and p^n kills the target at length n. They therefore contribute neither a limit nor a lim¹. The degree-zero polynomial term is the Witt tower with surjective restriction. Apply the Milnor sequence to this tower. This matches Hesselholt 1996 Corollary 2.4.7, whose proof and §1.2 restriction-surjectivity statement were checked and added to the node's sources.

For `L.6/geisser-hesselholt-regular-local`, Popescu extends the torsion-free and symbol comparison at each finite coefficient level. UCT identifies coefficient K with K/p^n, whose quotient transitions are surjective also in the next degree; hence the completion's lim¹ vanishes. The logarithmic Witt subgroup is the finite-level image. Illusie's containment of ker(R−F) in the logarithmic subgroup plus the last filtration term identifies its inverse limit with ker(1−F): restrict from length n to any smaller fixed length m to kill that filtration error. Relative comparisons follow from the natural split augmentation. No infinite inverse limit or p-completion is commuted with a filtered colimit.

The CR.4 request now explicitly requires surjective R, p^n-torsion, the standard filtration `Fil^s W_nΩ = ker(W_nΩ → W_sΩ)` and fixed-level filtered-colimit compatibility. RT.2 is asked for finite-level TR continuity with natural restriction and constant generators. H.6 is asked for general countable-tower Milnor and Mittag-Leffler/pro-zero results, without a finiteness assumption on groups; direct H.6 edges were added to both consumers. These are precise existing-owner exports, not local redefinitions. The former completed-comparison gap is replaced by the unread Popescu foundation and its owner question below. The Geisser–Levine and Illusie proof inputs remain honestly named supplier boundaries.

## Baseline and ownership

All 102 declaration statements were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, rather than inferred from current HEAD or name matches. All exist and support their stated uses after these description corrections; no citation was removed and no new baseline declaration was added:

- `mathlib:Ideal.quotientInfRingEquivPiQuotient`: the CRT index is finite.
- `mathlib:rootsOfUnity.isCyclic`: requires `[NeZero k]`; order zero is not an instance asserting cyclicity of all units.
- `tauceti:TauCeti.kummerClassMap`: provides injectivity. The missing Hilbert-90/surjectivity export belongs to ProfiniteCohomology Layer 9, not the former ClassFieldTheory Layer 5 attribution.

Every baseline record now records its independent reread date and reviewer. In particular, existing K₀, representation-ring, Witt, tame-symbol, valuation, completion-extension and symplectic carriers were reused. Witt vectors alone were not credited with the Cohen coefficient-ring theorem for an arbitrary complete mixed-characteristic DVR. The NumberFieldArithmetic Layer 5 semilocal supplier edge was made explicit for both transfer and completed semilocal maps.

The four handed confirmed red-team findings were checked in both the packet and reader document:

| Finding | Ownership verified |
| --- | --- |
| RT-AREA-ktheory-1/37 | InductionRestriction Layer 6 owns integral virtual characters; RT.4 supplies Atiyah–Segal completion/topological K-theory. H-group/simple-space Whitehead and full source proofs stay precise supplier gaps. |
| RT-AREA-ktheory-1/39 | CR.4, on CR.5:log-algebra, owns universal log-Witt complexes and initiality. Five imported specifications preserve the API/tests; L.5 owns the complete-DVR computation. |
| RT-AREA-ktheory-2/21 | L.1 supplies the finite-field K₃/Bloch calculation to V.5. V.5 is not recreated locally. |
| RT-AREA-ktheory-2/33 | RT.2 owns general genuine/modern TR/TC comparisons; L.4 imports them for HM's linear local-field model. |

The registered M.8 regulator stage remains downstream of M.7 and L.2/L.1. The early Chern export is a named M-owned structural request, not a resolved whole-stage M.8→L.1 edge. The new review does not introduce this cycle or invent a supplier stage. Generic log differentials, Witt theory, spectrum constructions and Poincaré foundations remain with their owners. Planets remain central constructions, definitions and named results with six per stage; none was added or renamed.

## Source findings and bibliographic changes

All 42 inherited local findings received this review's own `confirmed` verdict with a locator-specific reason. Confirmation of E24, E25 and E39 means confirmation of the stated missing or circular proof input, not a counterexample to the theorem. E32 is narrowed to a needed proof-input typo: finite mod-p cohomology is indeed finitely generated as a Z_p-module; the sentence fails to state the Z_p-coefficient finiteness used later. E35's correction now distinguishes the actual w₂ invariant from its quotient modulo a prime-to-p modulus. The two inherited paper-finding imports remain imports, not new discoveries by this reviewer.

Six additional findings were checked in the specified public copies, with correction, justification, search scope and an independent confirmed verdict:

- **E43**, Mestel p.30: mod-p acyclicity holds for stable GL, not every GL_n. GL₂(F₂)≅S₃ has nonzero H₁ over F₂. The packet already targets stable GL; the proof consumer now records the source correction.
- **E44**, Mestel Lemma 36 proof, p.30: vanishing of the integral Hom term alone does not imply vanishing of mod-p homology, because of Tor. The mod-p Moore space provides a counterexample to that implication; field-coefficient duality supplies the lemma's correct proof.
- **E45**, HM v2 Remark 4.1.4, p.61: ordinary homology comparison is in degrees i≤−2, not i≤−1. Degree −1 is the norm kernel. For C₃ on Z it is zero, unlike H₀=Z. The packet's range was already correct.
- **E46**, HM v2 (5.2.5), p.77: the target logarithmic uniformizer is π_L. Differentiating the displayed extension formula checks the corrected symbol. The packet already had the corrected expression.
- **E47**, HM v2 Proposition A.1.7, p.109: its equality-case generator is u_n, not u₁. The page image and the same page's proof use the level-n exterior generator. The packet was corrected and level zero excluded.
- **E48**, Geisser–Hesselholt author-copy Theorem 3.1 proof, p.19: R−F preserves differential degree, so its target has degree q, not q−1. The page image confirms the printed typo. The packet already had degree q; its new filtration argument records the correction.

Novelty searches checked author indices and targeted title/locator/errata queries. No exhaustive novelty claim or assertion about unread publisher editions is made. The public author index for the Geisser–Hesselholt paper links the August 9, 2005 copy without a correction link; unrelated Hesselholt errata were not treated as corrections to this paper.

Bibliographic corrections: Exercise IV.6.13 is at K-book PDF p.335 (nodes 25, 27 and 30 and source readSections); the restriction-after-transfer excerpt was corrected at node 27. The HM source and version records now distinguish the v2 PDF hash from the historical e-print archive hash, rather than claiming different hashes imply changed mathematics. Preprint kinds were corrected for the arXiv copies. The dead live K-book errata URL is replaced by the exact archived copy whose hash matches the inherited errata. All current source entries record the independent locator/excerpt and hash check.

The following public versions were used; edition/version and SHA-256 data remain in the packet. An author's or preprint copy was not silently treated as the version of record.

| Source | Public text |
| --- | --- |
| `Kbook.2013` | [Public copy](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf) |
| `Weibel.Handbook.I5` | [Public copy](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/KZsurvey-published.pdf) |
| `CMM.2018` | [Public copy](https://arxiv.org/pdf/1803.10897v2) |
| `Haine.2016` | [Public copy](https://math.berkeley.edu/~phaine/files/KFF.pdf) |
| `Mestel.2014` | [Public copy](https://www.cs.ox.ac.uk/people/david.mestel/essay.pdf) |
| `Kbook.errata` | [Public copy](https://web.archive.org/web/20191110143141id_/https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.errata.pdf) |
| `HesselholtMadsen.2003` | [Public copy](https://arxiv.org/pdf/math/9910186v2) |
| `Milne.CFT.2020` | [Public copy](https://www.jmilne.org/math/CourseNotes/CFT.pdf) |
| `Fesenko.GTM3.2000` | [Public copy](https://msp.org/gtm/2000/03/gtm-2000-03-006p.pdf) |
| `CGZ.BlochUnits.2021` | [Public copy](https://arxiv.org/pdf/1712.04887v3) |
| `HesselholtMadsen.1997a` | [Public copy](https://www.math.nagoya-u.ac.jp/~larsh/papers/004/paper.pdf) |
| `HesselholtMadsen.1997b` | [Public copy](https://www.math.nagoya-u.ac.jp/~larsh/papers/007/polytope.pdf) |
| `Hesselholt.2005` | [Public copy](https://www.math.nagoya-u.ac.jp/~larsh/papers/s01/handbook.pdf) |
| `Hesselholt.1996` | [Public copy](https://www.math.nagoya-u.ac.jp/~larsh/papers/005/acta.pdf) |
| `HesselholtMadsen.2004` | [Public copy](https://www.math.nagoya-u.ac.jp/~larsh/papers/013/final.pdf) |
| `GeisserHesselholt.2006` | [Public copy](https://www.math.nagoya-u.ac.jp/~larsh/papers/011/paper.pdf) |
| `NikolausScholze.2018` | [Public copy](https://arxiv.org/pdf/1707.01799v2) |
| `Sharifi.ANT.20260926` | [Public copy](https://math.ucla.edu/~sharifi/notes/algnum.pdf) |
| `NikolausScholze.2018.published` | [Public copy](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2018/0221/0002/ACTA-2018-0221-0002-a001.pdf) |
| `CalmesEtAl.2026.v4` | [Public copy](https://arxiv.org/pdf/2009.07225v4) |
| `AbdurrahmanVenkatesh.2025.v1` | [Public copy](https://arxiv.org/pdf/2303.13436v1) |
| `AtiyahSegal.1969` | [Public copy](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/atiyahsegal1.pdf) |
| `CalmesEtAl.II.20261005` | [Public copy](https://arxiv.org/pdf/2009.07224v5) |
| `Weibel.Chern2.1993.author` | [Public copy](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/chernclass.pdf) |
| `AbdurrahmanVenkatesh.20261006.author` | [Public copy](https://www.math.ias.edu/~akshay/research/RT.pdf) |

## Suggested forms, tests and validation

The suggested file retains honest `sorry` planning forms and comments for unavailable carriers. Executable signatures changed only where the hypotheses were deficient: the modified-Verschiebung iterate now requires an irreducible uniformizer; log base change has coherent K→L and A→L scalar towers; the Teichmüller differential test requires n>0. Comments harmonize the tame boundary, torsion Tate twist, relative Hochschild base and κ̃ range. Both p=2 non-example comments now require an actual nonzero ηd witness. A review concordance records all 65 corrected node/signature requirements. It supplies no implementation or fake spectrum carrier.

All 26 local definitions/constructions retain at least three meaningful tests. There are 117 tests on those objects (122 total test entries including other nodes); the three independent Connes tests remain after downgrading its fourth non-example to a witness gap. The imported generic log-Witt non-example was also corrected to avoid inferring ηd≠0 solely from η≠0. Its other three supplier tests remain. No claim is made that commented spectrum tests executed.

- `python3 scripts/check_blueprint.py research/blueprint/packets/KTheoryFiniteLocalFields.json`: **0 errors, 0 warnings**, with all seven stages planned and no prerequisite cycle.
- `scripts.source_issues.check_issues` and `scripts.check_errata.versions_checked` applied to the packet's findings/version data: **0 errors**. This invokes the appropriate reusable validators; the blueprint packet is not passed as an errata-job schema.
- Review coverage audit: exactly 280 distinct packet IDs and 280 matching verdicts; all 48 local findings name this independent reviewer; all node implementations remain unchecked.
- Current public PDF fingerprint audit: all 25 source entries match their downloaded public PDFs after the HM artifact correction.
- `git diff --check`: clean.
- `lean-check research/blueprint/suggested/KTheoryFiniteLocalFields.lean`: **did not compile**. It stopped before elaboration at the missing object for `TauCeti.CategoryTheory.GrothendieckGroup.Abelian`. Memory was sufficient (107 GB available). The shared Mathlib checkout is at the required pin; its Tau Ceti HEAD is `cf386627e9176a3827c1a5fe804989fd94a4d216`, not the packet pin. Exact pinned declaration reading was still possible via existing git objects. No build, cache download, update or Lean server was started. A historical successful run in earlier handoffs does not certify this edited file.

The failed attempt checked no declarations and does not certify the final file. The build limitation is reported rather than repaired outside this job's authorization.

## Required reconciliation and questions for the orchestrator

This review is finished. Item 1 is required for acceptance before joint promotion; the other items are already honest supplier/validation boundaries, not reasons to reject a completed target-level pass:

1. Create an authorized reader reconciliation for `research/blueprint/readmes/KTheoryFiniteLocalFields.md`. That file is not listed among issue #440's editable deliverables. It has the four required red-team ownership corrections, but still repeats earlier mathematical scopes and tests corrected here. Concrete conflicting locations are the κ̃/Z_p acceptance at line 6007 (κ̃ does not exist there), the first-level Bott isomorphism at line 6538 (its multiplier is a nonunit), the whole-completed-group density claim at line 8365 (only the ordinary-completion subgroup is generally dense), and the colimit/limit shortcut at line 7099. Reconcile the complete per-node list, source findings, baseline clarifications, requests and gap inventory; these four examples alone do not exhaust the discrepancies.
2. Register the general owner/export for the precise Popescu theorem used by regular F_p and regular-local comparisons. Its unread proof remains the named foundation gap; do not ask L.5/L.6 to define regular-ring geometry twice.
3. Route the existing early M-owned Chern export without a whole M.8→L.1 cycle, and obtain the precise coefficient-ring, completed profinite Adams and p=2 Connes witness contracts. The latter three are new review gaps; supplier files were not edited.
4. Once a build at both exact pins with the imported artifacts exists, elaborate the corrected suggested file. This review cannot certify that unavailable check.

Only the issue's packet, suggested file, this report and this review's own handoff are changed. No campaign/atlas data, reader, supplier packet, previous handoff, labels or issue state is edited manually.
