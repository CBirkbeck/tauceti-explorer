# BP-PrismaticCohomology--PR.0 — target-level pass over PR.0 to PR.7

Claude — session claude-PzcTEw. Refs #978. This continues the merged checkpoints of the same job (pull requests #3107, #3116, #3121, #3134, #3137), whose fifty-four lemma-level δ-ring nodes are kept.

## Status

The packet is **complete**: every layer in scope (PR.0 to PR.7) is `planned`. It has **277 nodes** (23 definitions, 50 lemmas, 68 constructions, 116 theorems, 10 comparisons, 10 applications), 546 API items, 345 unit tests, 48 planets (six per layer), 132 baseline declarations, 90 requests to other roadmaps, 13 gaps and 45 recorded source issues. Nodes by layer: PR.0 88, PR.1 26, PR.2 29, PR.3 25, PR.4 30, PR.5 28, PR.6 25, PR.7 26. The node budget of 300 is not exceeded. Every `implementationStatus` is `unchecked`; nothing is claimed formalised.

RS-01 is accepted and keeps this roadmap unchanged; the packet follows the current structure.

## What this pass did

- **PR.0.** The lemma-level prefix (δ/Frobenius/Witt dictionary, localization, classical completion, Z_(p), δ-stabilization) is unchanged, except that four of its planet marks were removed to respect six planets per layer. Thirty-four target-level nodes were added: free δ-rings, limits/colimits and the Witt adjunction, simplicial δ-rings, the p-local localization of Remark 2.16, Lemma 2.18, distinguished elements, perfect δ-rings, PD envelopes as δ-envelopes, complete regularity, prisms and their category, the four standard prisms and the universal oriented prism, rigidity, Lemmas 3.6–3.9, Theorem 3.10, Tor-independence of perfectoid rings, prismatic envelopes, and three statements of Anschütz–Le Bras. The three gaps of the earlier checkpoints are settled by these nodes (free δ-algebras, the radical localization, derived completion) and are replaced by two precise ones.
- **PR.1 to PR.7** are planned at target level from the TeX sources of the arXiv versions: one node for each target the layer states and each definition or key theorem on the way, with statement, hypotheses, proof outline citing the source, prerequisites, and for definitions and constructions uses, API and unit tests.
- All seven other node ids of the integrated decomposition (`PR.0/distinguished-factor-rigidity`, `local-distinguished-prism-generators`, `rigidity-prism-ideal`, `bounded-prism-complete-flatness`, `perfect-prisms-perfectoid-rings`, `regular-prismatic-envelopes`, `PR.1/prismatic-structure-sheaf`) are now nodes of the packet, with the corrections of review R2.

How the work was organised: the lead session planned PR.0 and fixed a table of node ids shared across layers; seven sub-sessions of the same worker drafted PR.1 to PR.7, one layer each, each reading its sources in full; the lead then merged, removed duplications between layers, replaced stage-level references by node ids, and reviewed. What the lead checked itself is listed under "Checks"; it did not re-derive every proof outline of PR.1 to PR.7, and the independent review should read them against the sources.

## Confirmed red-team findings

- **RT-AREA-padic-2/4** (high).
  - PR.7: Handled as consumer. PR.7 does not rest on an unplanned Kisin functor: D_𝔖 is defined prismatically and its full faithfulness is node breuil-kisin-evaluation. The comparison node kisin-functor-comparison cites the R07.4 packet nodes that now state the four targets of the finding (kummer-etale-phi-modules; kisin-modules and phi-n-nabla-modules; weakly-admissible-slope-zero; finite-height-lattices, semistable-finite-height, crystalline-restriction-full-faithfulness, kisin-etale-full-faithfulness) and requests from the stage what they do not state (all Hodge–Tate weights, Z_p-coefficients, and the agreement of Fontaine's functor with the perfectoid description). The overlap between R07.4/kisin-etale-full-faithfulness, R07.4/crystalline-restriction-full-faithfulness and the two PR.7 theorem nodes is reported in restructure.
- **RT-AREA-padic-2/6** (high).
  - PR.4: PR.4/etale-comparison states Bhatt–Scholze Theorem 9.1 for an arbitrary p-adic formal scheme over a perfectoid ring, with the derived prismatic cohomology of PR.2, in the nearby-cycle form and the affine form; PR.4/fixed-points-completed-colimits is Lemma 9.2; PR.4/etale-comparison-without-inverting-d is Remark 9.3; PR.4/etale-comparison-smooth records Theorem 1.8(4) as the smooth corollary; PR.4/perfectoid-artin-schreier-witt is the perfectoid local calculation and PR.4/etale-comparison-coefficients the n → n − 1 and Z_p statements. The warning about syntomic complexes is PR.4/syntomic-not-generic-fibre-etale and concerns Z_p(n) only.
- **RT-AREA-padic-2/24** (medium).
  - PR.2: Recorded as the gap "The arc-topology and arc-descent of perfectoidization": BS22 Definition 8.7, Lemma 8.8 and Proposition 8.10 are assigned to the proposed roadmap ArcTopologyAndDescent and are not planned here. The finding proposed that PR.2 keep Proposition 8.10 and Corollaries 8.11–8.12 as its own nodes; the route decision taken after it moved Proposition 8.10 to ArcTopologyAndDescent and Proposition 8.5 with Corollaries 8.11–8.12 to PerfectoidQuotientsPartIIIntegralPerfectoidization, so PR.2 plans from §8 only Definition 8.2 (perfection-of-prismatic-cohomology, perfection-comparison), Lemma 8.4 (perfectoidization-coconnective), Lemma 8.6 (perfection-descendable), Proposition 8.13 (perfectoidization-symmetric-monoidal) and Corollary 8.14 (connective-perfectoidization-perfectoid). No node of PR.2 uses arc-descent; the gap names PR.4/etale-comparison as the consumer.
  - PR.4: Two gaps name the proposed owners with exact statements: ArcTopologyAndDescent (arc_p-topology, Bhatt–Mathew Corollary 6.17 and Theorems 5.4, 5.13, 6.4, 6.10, Bhatt–Scholze Definition 8.7 – Proposition 8.10), needed by PR.4/etale-comparison, PR.4/tate-twist-perfectoid, PR.4/picard-perfectoid-uniquely-divisible, PR.4/syntomic-etale-comparison, PR.4/syntomic-cohomology-schemes; PerfectoidQuotientsPartIIIntegralPerfectoidization (Bhatt–Scholze Corollary 8.11 and Theorem 10.11), needed by PR.4/etale-comparison and PR.4/perfectoid-etale-cohomological-dimension.
- **RT-AREA-padic-2/25** (medium).
  - PR.4: Étale cohomology is imported: SchemeAndStackFoundations:SF.2 (Spec(S[1/p]) with Z/p^n-coefficients, Artin–Schreier–Witt, Kummer, G_m, Gabber), ClassicalAdicEtaleCohomology:H0 (adic generic fibre and nearby cycles) and ClassicalAdicEtaleCohomology:H1:henselian (Huber's Spec/Spa comparison, Fujiwara–Gabber), each with a request; they are prerequisites of PR.4/perfectoid-artin-schreier-witt, PR.4/etale-comparison, PR.4/etale-comparison-smooth, PR.4/nearby-cycles-comparison and others.
- **RT-AREA-padic-2/26** (medium).
  - PR.1: Corollary 5.5 is its own node PR.1/hodge-tate-comparison-char-p with prerequisite DerivedDeRhamCohomology:DD.3/polynomial-cartier-map (the id exists in the DD packet); PR.1/hodge-tate-affine-line and PR.1/hodge-tate-comparison reduce to it through PR.1/crystallization-of-oriented-prism. The node also fixes the logical order for p = 2 (β(f)² = 0 over crystalline prisms is proved with the Cartier isomorphism).
- **RT-AREA-padic-2/27** (medium).
  - PR.1: PR.1/de-rham-comparison is stated with the hypothesis "W(A/I) is p-torsion-free" (examples: A/I p-torsion-free, or I = (p) with A/p reduced). The unconditional Corollary 15.4 is not stated; the node points to PrismaticCohomology:PR.3/de-rham-comparison-general.
  - PR.3: The unconditional de Rham comparison is node PrismaticCohomology:PR.3/de-rham-comparison-general (BS22 Corollary 15.4, with the derived form BL22 Proposition 5.2.5), a consumer of PrismaticCohomology:PR.3/leta-frobenius-factorisation (Theorem 15.3); Corollary 15.5 is node PrismaticCohomology:PR.3/image-of-frobenius, with the direction of V_i on H^i corrected. PR.1/de-rham-comparison (Theorem 6.4, W(A/I) p-torsion-free) is cited only as the special case; the node says that the two isomorphisms are not compared by the sources.
- **RT-AREA-padic-2/28** (medium).
  - PR.3: PR.3 owns the relative Nygaard filtration (nodes relative-nygaard-large-quasisyntomic, relative-nygaard-filtration, relative-nygaard-graded-pieces, nygaard-hodge-comparison, nygaard-completeness, nygaard-frobenius-colimit) and the Breuil–Kisin twists A{n} of a prism (nodes transversal-prism, transversal-approximation, breuil-kisin-twist-transversal, breuil-kisin-twist, breuil-kisin-twist-examples; BL22 §2). No node plans absolute prismatic cohomology, the absolute Nygaard filtration (BL22 §§3–5.5, PR.5) or syntomic complexes (PR.4); the nodes name PR.4 and PR.5 only as consumers. BL22 §5.1–5.2 are used at the relative level only, and the proof of the de Rham comparison avoids the Cartier–Witt stack.
  - PR.4: PR.4 owns the syntomic complexes and their étale comparison: PR.4/syntomic-complex (quasisyntomic rings, PR.3 objects), PR.4/syntomic-cohomology-formal-schemes (Bhatt–Lurie generality, citing PR.5/absolute-prismatic-cohomology, PR.5/absolute-nygaard-filtration and PR.3/breuil-kisin-twist), PR.4/syntomic-cohomology-schemes, PR.4/syntomic-etale-comparison, PR.4/tate-twist-discreteness; the edge PR.5 → PR.4 is used, nothing of PR.5 is redefined.
  - PR.5: One owner each. PR.5 owns absolute prismatic cohomology (PR.5/absolute-prismatic-cohomology), its Hodge–Tate, crystalline and de Rham specialisations and the absolute Nygaard filtration with its Frobenius (PR.5/absolute-nygaard-filtration, absolute-nygaard-graded-pieces, absolute-nygaard-perfect-prism, absolute-frobenius). The Breuil–Kisin twists are imported from PR.3/breuil-kisin-twist in every node that uses {n}; the relative Nygaard filtration from PR.3/relative-nygaard-filtration. No node defines a twist or a syntomic complex: Z_p(n) appears only in `uses`, as a consumer in PR.4.
- **RT-AREA-padic-2/29** (medium).
  - PR.5: Stacks, quotient stacks, classifying stacks and D/Perf of a stack are not built here: PR.5/cartier-witt-stack, wcart-quotient-presentation, quasi-coherent-complexes-on-wcart, prismatic-crystals-on-wcart, hodge-tate-divisor and sen-operator cite LanglandsParameterStacks:LP1 and SchemeAndStackFoundations:SF.1, with requests that say exactly what those stages do not state (formal stacks, group schemes of infinite type, affine pushforward, comodule description of D(BG), descent along W(R) → W(S)). The quotient presentation WCart = [WCart_0/W^×] (Bhatt–Lurie Proposition 3.2.3) is its own node, PR.5/wcart-quotient-presentation.
- **RT-AREA-padic-2/30** (medium).
  - PR.7: Handled. (a) v-descent of lisse Z_p-sheaves on the diamond generic fibre: node laurent-f-crystals-local-systems cites DiamondEtaleCohomology:C2 with a request stating the sheaf property used in the source's Notation 3.1; etale-realization inherits it. (b) Fargues–Fontaine classification: node weakly-admissible-extension-over-ainf cites VectorBundlesAndIsocrystals:VB2:classification (and its node dieudonne-manin-classification-of-bundles) with a request naming Corollary 11.2.22, Proposition 10.5.6 and Theorem 8.2.10 (1) as the paper prints them; the matching of constructions is a recorded gap. (c) Kisin's functor: PR.7 proves the Breuil–Kisin statements itself from the main theorem (nodes etale-realization-over-breuil-kisin-prism and breuil-kisin-evaluation: the source's Theorems 7.2 and 7.9, Corollary 7.10, Remark 7.12), with no prerequisite in R07.4; the comparison with Kisin's functor is the separate node kisin-functor-comparison, whose prerequisites are the stage FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4 (request) and its existing nodes.
- **RT-AREA-etale/28** (medium).
  - PR.6: One owner: QWittVectors:QW.6. PR.6 imports the framed algebra, γ_s, the q-derivatives, the twisted Leibniz rule, the framed q-de Rham Koszul complex and its reduction modulo q − 1 through the request to QW.6 (which lists the exact statements and asks for the form over a base ring D with an I-completely étale framing, independent of QW.5), and (p, q−1)-completes it: PrismaticCohomology:PR.6/framed-q-pd-datum (import, plus the δ-structure and the ideal J). PR.6 keeps: q-PD envelopes (PrismaticCohomology:PR.6/q-pd-envelope, PrismaticCohomology:PR.6/q-pd-envelope-base-change), the extension of γ_s to D_{J,q}(P), BS22 Lemma 16.21 (PrismaticCohomology:PR.6/gamma-extension-to-q-pd-envelope), the Koszul complex on the envelope (PrismaticCohomology:PR.6/framed-q-de-rham-complex), the q-crystalline site (PrismaticCohomology:PR.6/q-crystalline-site) and the comparisons (PrismaticCohomology:PR.6/q-de-rham-comparison, PrismaticCohomology:PR.6/change-of-framing, PrismaticCohomology:PR.6/q-crystalline-prismatic-comparison, PrismaticCohomology:PR.6/q-de-rham-prismatic-comparison-zp). HQ.1 should import the framed machinery from QW.6 (upstreamNotes).

## Routed paper items

- `PAPER-ANSCHUTZ-LEBRAS-23/11`: PR.0/transversal-prism-regular-sequences
- `PAPER-ANSCHUTZ-LEBRAS-23/127`: PR.0/prismatic-envelope-rank-one-presentation
- `PAPER-ANSCHUTZ-LEBRAS-23/134`: PR.1/p-torsion-free-h0-syntomic (for H^0 of the site; complete for prisms with ((A/I^n)[p])_n pro-zero, with a recorded gap and source issue PrismaticCohomology/E14 for the general case).
- `PAPER-ANSCHUTZ-LEBRAS-23/152`: PR.2/finite-projective-modules-p-complete
- `PAPER-ANSCHUTZ-LEBRAS-23/154`: PR.2/finite-projective-descent-prisms
- `PAPER-ANSCHUTZ-LEBRAS-23/155`: PR.0/unbounded-torsion-example
- `PAPER-ANSCHUTZ-LEBRAS-23/25`: PR.2/derived-crystalline-comparison and PR.2/qrsp-char-p-acrys (4) (the descent half; the syntomic half is PR.1's)
- `PAPER-ANSCHUTZ-LEBRAS-23/29`: PR.2/first-conjugate-piece-cotangent
- `PAPER-ANSCHUTZ-LEBRAS-23/31`: PR.2/conjugate-splitting-and-lifting
- `PAPER-ANSCHUTZ-LEBRAS-23/42`: PR.2/qrsp-prism (5)
- `PAPER-ANSCHUTZ-LEBRAS-23/43`: PR.2/qrsp-char-p-acrys
- `PAPER-ANSCHUTZ-LEBRAS-23/44`: PR.2/qrsp-char-p-acrys (2), (3) and PR.2/regular-semiperfectoid-example
- `PAPER-ANSCHUTZ-LEBRAS-23/45`: PR.3/nygaard-graded-pieces (Theorem 3.4.4 = BS22 Theorem 12.2, with Δ_R/N^{≥1}Δ_R ≅ R as part (3))
- `PAPER-ANSCHUTZ-LEBRAS-23/46`: PR.2/kunneth-formula
- `PAPER-ANSCHUTZ-LEBRAS-23/47`: PR.2/kunneth-formula-formal-schemes
- `PAPER-BHATT-MATHEW-23/009`: PR.4/syntomic-connectivity (with a gap for the trace-free proof of rigidity); the left Kan extension statements also in PR.4/syntomic-cohomology-formal-schemes and PR.4/syntomic-cohomology-schemes
- `PAPER-BHATT-MORROW-SCHOLZE-19/012`: PR.4/syntomic-complex (the definition of Z_p(n) as a fibre and the divided Frobenius over a perfectoid base; the TC filtration and spectral sequence stay with RefinedTraceMethods:RT.6)
- `PAPER-BHATT-MORROW-SCHOLZE-19/013`: PR.4/log-de-rham-witt-comparison
- `PAPER-BHATT-MORROW-SCHOLZE-19/014`: PR.4/nearby-cycles-comparison
- `PAPER-BHATT-MORROW-SCHOLZE-19/069`: PR.4/syntomic-filtered-colimits
- `PAPER-BHATT-MORROW-SCHOLZE-19/070`: PR.4/divided-frobenius-contraction
- `PAPER-BHATT-MORROW-SCHOLZE-19/074`: PR.4/log-forms-divided-frobenius
- `PAPER-BHATT-MORROW-SCHOLZE-19/087`: PR.4/acrys-divided-frobenius-surjective
- `PAPER-BHATT-MORROW-SCHOLZE-19/088`: PR.4/syntomic-complex-char-p (corrected for i = 0, source issue PrismaticCohomology/E41)
- `PAPER-BHATT-MORROW-SCHOLZE-19/098`: PR.6/nygaard-filtration-q-de-rham-coordinates (the q-de Rham instance, BMS2 Remark 9.11), applying the criterion PR.3/nygaard-filtration-in-coordinates
- `PAPER-BHATT-MORROW-SCHOLZE-19/102`: Planned at PR.4; its AΩ input is PR.6/ainf-omega-comparison, with the coordinate formula φ(d_q log T) = ξ̃ d_q log T from PR.6/framed-q-de-rham-complex (d).
- `PAPER-BHATT-MORROW-SCHOLZE-19/103`: Planned at PR.4; its AΩ input is PR.6/ainf-omega-comparison.
- `PAPER-BHATT-MORROW-SCHOLZE-19/104`: Planned at PR.4; its AΩ input is PR.6/ainf-omega-comparison.
- `PAPER-BHATT-SCHOLZE-22/110`: PR.2/perfectoidization-coconnective
- `PAPER-BHATT-SCHOLZE-22/111`: PR.0/perfectoid-tor-independence
- `PAPER-BHATT-SCHOLZE-22/48`: PR.2/perfection-descendable
- `PAPER-BHATT-SCHOLZE-22/52b`: PR.2/perfectoidization-symmetric-monoidal
- `PAPER-BHATT-SCHOLZE-22/52c`: PR.2/connective-perfectoidization-perfectoid
- `PAPER-BHATT-SCHOLZE-22/53`: PR.4/etale-comparison (Theorem 9.1), PR.4/fixed-points-completed-colimits (Lemma 9.2), PR.4/etale-comparison-without-inverting-d (Remark 9.3), PR.4/etale-comparison-smooth (Theorem 1.8(4))
- `PAPER-BHATT-SCHOLZE-22/97`: PR.0/animated-delta-rings
- `PAPER-COLMEZ-DOSPINESCU-NIZIOL-20-B/in-syntomic`: PR.4/syntomic-cohomology-formal-schemes (the complex and its defining triangle), PR.4/syntomic-complex-char-p (crystalline and rational form in characteristic p), PR.4/syntomic-etale-comparison and PR.4/nearby-cycles-comparison (integral comparison with étale cohomology); the Hodge-filtered form in mixed characteristic is handed downstream (upstreamNotes, restructure)

## Requests to other roadmaps

90 requests, each with the exact statement needed and the nodes that use it (packet `requests`; the document lists them by supplier). Suppliers: AInfCohomology:AI.1 (3), AInfCohomology:AI.2 (1), AInfCohomology:AI.3 (2), AInfCohomology:AI.4 (2), ClassicalAdicEtaleCohomology:H0 (1), ClassicalAdicEtaleCohomology:H1:henselian (1), CrystallineCohomology:CR.0 (7), CrystallineCohomology:CR.1 (2), CrystallineCohomology:CR.2 (4), CrystallineCohomology:CR.3 (1), CrystallineCohomology:CR.4 (2), DerivedDeRhamCohomology:DD.0 (5), DerivedDeRhamCohomology:DD.1 (8), DerivedDeRhamCohomology:DD.2 (4), DerivedDeRhamCohomology:DD.4 (4), DerivedDeRhamCohomology:DD.5 (7), DiamondEtaleCohomology:C2 (1), EnhancedDerivedSheaves:E1 (1), EnhancedDerivedSheaves:E2 (3), EnhancedDerivedSheaves:E3 (4), EnhancedDerivedSheaves:E5:abstract (1), EnhancedDerivedSheaves:E5:animation (1), FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4 (1), LanglandsParameterStacks:LP1 (1), PadicHodgeTheory:P7:annulus-foundations (1), PadicHodgeTheory:R06.1 (1), PadicHodgeTheory:R06.2 (1), PerfectoidQuotients:Q0:integral-algebra (4), PerfectoidQuotients:Q2 (1), PerfectoidQuotients:Q3 (2), PerfectoidQuotients:Q4 (1), PerfectoidSpaces:P3 (1), QWittVectors:QW.6 (1), RefinedTraceMethods:RT.3b (1), RefinedTraceMethods:RT.6 (1), SchemeAndStackFoundations:SF.1 (3), SchemeAndStackFoundations:SF.2 (3), SchemeAndStackFoundations:SF.4 (1), VectorBundlesAndIsocrystals:VB2:classification (1).

The prerequisites add 109 stage-level edges to the atlas; none closes a cycle with the recorded stage edges, and a dry run of the atlas merge of the packet succeeds. No node of PR.0 to PR.6 has a RefinedTraceMethods prerequisite; PR.7 cites RT.3b and RT.6 as the atlas already records.

## Gaps

- **Joyal's theorem: Witt vectors are the cofree δ-ring** (needed by PR.0/delta-ring-category).
- **Remark 2.5: derived Frobenius lifts** (needed by PR.0/delta-frobenius-dictionary).
- **p-torsion-freeness of completely flat modules over a general p-torsion-free bounded prism** (needed by PR.1/p-torsion-free-h0-syntomic).
- **BS22 Proposition 8.5: perfectoidization through the perfect prismatic site** (needed by PR.2/perfection-of-prismatic-cohomology, PR.2/perfection-comparison, PR.2/perfectoidization-symmetric-monoidal, PR.2/connective-perfectoidization-perfectoid).
- **The arc-topology and arc-descent of perfectoidization (RT-AREA-padic-2/24)** (needed by PR.2/perfection-of-prismatic-cohomology, PR.4/etale-comparison).
- **The operation P^0 on E_∞-F_p-algebras** (needed by PR.2/perfectoidization-coconnective, PR.2/connective-perfectoidization-perfectoid).
- **The arc_p-topology and arc_p-descent of étale cohomology of the generic fibre (proposed roadmap ArcTopologyAndDescent)** (needed by PR.4/etale-comparison, PR.4/tate-twist-perfectoid, PR.4/picard-perfectoid-uniquely-divisible, PR.4/syntomic-etale-comparison, PR.4/syntomic-cohomology-schemes).
- **Arc-descent and discreteness of perfectoidization (proposed roadmap PerfectoidQuotientsPartIIIntegralPerfectoidization)** (needed by PR.4/etale-comparison, PR.4/perfectoid-etale-cohomological-dimension).
- **A proof of rigidity of syntomic complexes without topological Hochschild homology** (needed by PR.4/syntomic-connectivity).
- **Bounded p-adic formal schemes as a category with étale and p-quasisyntomic topologies** (needed by PR.5/absolute-prismatic-site, PR.5/absolute-prismatic-cohomology, PR.5/absolute-prismatic-descent, PR.5/absolute-site-comparison).
- **Almost description of the perfection of the prism of O_C ⊗̂_{O_K} O_C** (needed by PR.7/crystalline-lattice-to-f-crystal).
- **Matching of the Fargues–Fontaine bundle of a filtered φ-module with M(D)(Y)** (needed by PR.7/weakly-admissible-extension-over-ainf).
- **Period rings and Fontaine's functors for infinite perfect residue fields** (needed by PR.7/crystalline-representation-of-f-crystal, PR.7/crystalline-lattices-theorem, PR.7/breuil-kisin-evaluation).

The arc-topology, the perfectoidization of integral algebras and the K-theory of henselian pairs have accepted owners (routes of the Bhatt–Scholze, Bhatt–Mathew and Clausen–Mathew–Morrow extractions) that are not roadmaps of the atlas yet, so no id can be cited: the nodes that need them carry gaps naming the proposed owner and the exact statement. When those roadmaps exist, the gaps become requests.

## Structure proposals and notes for other roadmaps

- **rescope** (PrismaticCohomology, RefinedTraceMethods, CohomologyComparisons): Give the comparison of the prismatic syntomic complexes Z_p(n) with Fontaine–Messing syntomic cohomology (Antieau–Mathew–Morrow–Nikolaus Section 6, Theorem F) an owner downstream of PrismaticCohomology:PR.4 and RefinedTraceMethods:RT.3b, for instance CohomologyComparisons:CP.6 or a sub-stage of RefinedTraceMethods:RT.3b, with edges PR.4 → owner and RT.3b → owner; consumers of the syntomic route of Colmez–Dospinescu–Nizioł §0.6.1 import it from there.
- **split** (QWittVectors, PrismaticCohomology, HabiroCohomologyFoundations): Split QWittVectors:QW.6 into a framing prefix (framed algebras over a base ring D with an element q, I-completely étale or toric framings for I = (q−1) or (p, q−1), the automorphisms γ_i, q-derivatives, twisted Leibniz rule, framed q-de Rham and q-Hodge Koszul complexes, reduction modulo q − 1, framed Frobenius), requiring only DD.1 and AI.1, and the remainder of QW.6 requiring QW.5. PrismaticCohomology:PR.6 and HabiroCohomologyFoundations:HQ.1 import the prefix.
- **rescope** (PrismaticCohomology, FiniteFlatGroupsAndIntegralPadicHodgeTheory): one owner per statement. Either R07.4 keeps both statements and the two PR.7 nodes are recorded as second proofs linked through the comparison node, or the statement (1) moves to PR.7 (its proof there has lighter prerequisites) and R07.4/kisin-etale-full-faithfulness cites it; the second choice needs R07.4 split so that the stage-level edges stay acyclic (PR.7 → the part of R07.4 using it, and the rest of R07.4 → PR.7 for the comparison).
- **split** (PrismaticCohomology): For the atlas the stage divides naturally into three sub-layers: PR.7:crystals (prismatic-crystal, crystal-descent, quasisyntomic-crystal-comparison, f-crystal-over-prism, prismatic-f-crystal, laurent-f-crystal, artin-schreier-riemann-hilbert, laurent-f-crystals-local-systems, etale-realization, crystalline-realization, f-crystals-over-qrsp), which needs only PR.0–PR.5, SF, DD and C2; PR.7:crystalline-lattices (the nodes for Spf(O_K) up to crystalline-lattices-theorem and mod-p-full-faithfulness-fails), which adds AI.2, R06, VB2:classification, RT.3b and RT.6; and PR.7:breuil-kisin (etale-real

- (PerfectoidQuotients) Q3's description says that it proves Bhatt–Scholze Proposition 7.11 (lifting quasisyntomic covers to bounded prisms). Its proof is the first half of Proposition 7.10 and uses only PR.2; it is planned as PrismaticCohomology:PR.2/quasisyntomic-covers-lift-to-prisms, and Q3 should import it. Bhatt–Scholze Lemma 4.8 (maps out of a perfect prism are determined by their reduction), which Q0:animated-application holds as an inherited aggregate, is planned as PrismaticCohomology:PR.1/perfect-prism-initial.
- (DerivedDeRhamCohomology, PerfectoidQuotients) No stage text states the definition of a quasiregular semiperfectoid ring (BMS2 Definition 4.20). DD.5 speaks of "the semiperfectoid covers used by BMS2", and the PerfectoidQuotients packet records DD.0/DD.5 as its owners. PR.2–PR.4 follow that decision and request the definition from DD.5; DD.5's description should name it.
- (PerfectoidQuotients) A stage edge PerfectoidQuotients:Q3 → PrismaticCohomology:PR.3 is needed: André's flatness lemma (Bhatt–Scholze Theorem 7.14) is used in the proof of Proposition 12.8 (PR.3/nygaard-regular-semiperfectoid). The roadmap lists only AI.1 and PR.2 as requirements of PR.3.
- (RefinedTraceMethods) Export to RT.6, with no prerequisite in the other direction: Bhatt–Scholze Theorem 13.1 and Proposition 15.7 identify π_0 TC^-(S; Z_p), respectively π_0 TP(S/S[u]; Z_p), with the Nygaard completion of Δ_S, respectively of Δ^{(1)}_{S/𝔖}. PR.3 supplies the prismatic half (PR.3/bms2-comparison, nygaard-completion, nygaard-graded-pieces, nygaard-key-case, nygaard-regular-semiperfectoid); RT.6 owns the non-completed theory of BMS2 Construction 7.12, BMS2 Theorem 8.17 and the identification itself.
- (RefinedTraceMethods) Bhatt–Scholze Corollaries 14.2 and 14.3 (K(−; Z_p) is concentrated in even degrees locally on the quasisyntomic site; surjectivity of π_*K(R; Z_p) → π_*K(R/(f_1, …, f_r); Z_p) in odd degrees) follow from PR.4/tate-twist-discreteness and Lemmas 14.4–14.5 together with K(−; Z_p) ≃ τ_{≥0}TC(−; Z_p) on henselian pairs and the motivic filtration on TC. They are left to the proposed Part II of RefinedTraceMethods on henselian pairs and are not nodes of PR.4. The identification gr^n TC(S; Z_p)[−2n] ≃ Z_p(n)(S) (BMS2 Theorem 1.12(5)) and the exact sequence before BMS2 Proposition 8.20 belong to RT.6, which consumes PR.4/syntomic-complex; no PR.4 node has a RefinedTraceMethods prerequisite.
- (CohomologyComparisons, RefinedTraceMethods) Routed item PAPER-COLMEZ-DOSPINESCU-NIZIOL-20-B/in-syntomic: PR.4 exports the syntomic complex with its defining fibre sequence (PR.4/syntomic-cohomology-formal-schemes), its crystalline form in characteristic p (PR.4/syntomic-complex-char-p), the integral comparison map with étale cohomology and its isomorphism after inverting ε (PR.4/syntomic-etale-comparison), and the identification with τ^{≤n}Rψ_* for smooth formal schemes over O_C (PR.4/nearby-cycles-comparison). The Fontaine–Messing form with the Hodge filtration in mixed characteristic and its comparison with Z_p(n) (Antieau–Mathew–Morrow–Nikolaus Theorem F) rests on the Beilinson fibre square and needs an owner downstream of PR.4 and RT.3b; see the structure proposals.
- (QWittVectors, HabiroCohomologyFoundations) RT-AREA-etale/28. The framed q-de Rham machinery has one owner, QWittVectors:QW.6. QW.6 requires QW.5, but the framing prefix that PR.6 needs (framings, the automorphisms γ_i, q-derivatives, the framed q-de Rham complex, reduction modulo q − 1, the framed Frobenius) uses none of QW.5 and should be a stage of its own, stated for a base ring D with an element q and not only for A[[q−1]] over a Λ-ring A; the edge to PrismaticCohomology:PR.6 then starts at that stage. QWittVectors depends on PrismaticCohomology only through QW.1 → PR.0, so the edge closes no cycle. HabiroCohomologyFoundations:HQ.1 should import the framed q-difference complex, the q-integers and the twisted Leibniz rule from the same owner, and from PR.6 only the q-crystalline site, the comparison of the framed complex with q-crystalline cohomology (Bhatt–Scholze Theorem 16.22), change of framing and the comparison with prismatic cohomology over (Z_p[[q−1]], ([p]_q)).
- (AInfCohomology) The acceptance check of AI.7 ("agreement of all prior comparison maps through the uniqueness and polynomial/torus tests of BS22 §18") can cite PR.6/comparison-uniqueness. The agreement of the de Rham specialisation of AΩ built in AI.4 with the one transported from PR.3 through PR.6/ainf-omega-comparison is AI.7's statement; it is not proved in Bhatt–Scholze §§16–18.
- (RefinedTraceMethods) The stage text of PR.7 cites "Corollary 3.9 supplies an underlying pullback-square input": this is Corollary 3.9 of Antieau–Mathew–Morrow–Nikolaus in the numbering of the RT.3b stage text, not a statement of the F-crystals paper, where 3.9 is a remark.

`upstreamNotes` is empty: nothing was noticed inside a Tau Ceti roadmap.

## Mistakes found in the sources

45 entries in `sourceIssues` (32 misprint, 10 gap, 3 error); one (E1) is from an earlier checkpoint. The register already had the entries of the paper extractions (PAPER-BHATT-SCHOLZE-22/E1–E30 and others); those are cited by id in the nodes and not repeated. Entries that quote a stated result: `PrismaticCohomology/E13`, `PrismaticCohomology/E41`, `PrismaticCohomology/E51`, `PrismaticCohomology/E52`.

- `PrismaticCohomology/E41` (BMS2 Proposition 8.20 fails for i = 0 as printed: Z_p(0)(F_p) has H^1 = Z_p) and `E37` (Remark 9.11 prints q = [ε] − 1) were checked in the published version (Publ. math. IHÉS 129, pp. 281 and 290, read at Numdam).
- `E13` (Theorem 1.8 (5) of Bhatt–Scholze needs X quasi-compact and quasi-separated) and the other Bhatt–Scholze entries are scoped to arXiv:1905.08229v4: the Annals text was not available to this worker. The Bhatt–Lurie, F-crystals, Bhatt–Mathew and Anschütz–Le Bras entries are against the arXiv versions listed in `sourceVersions`.
- The lead re-read at their locators: E12, E13, E21, E41, E51, E52, E53, E54, E55 (the non-flatness of W_2(F_p) → W_2(F_p[x]) was recomputed), E57, E61, E63, E71, E76. The remaining entries were verified by the sub-session that found them and are awaiting independent review like all others.

## The suggested Lean file

**It compiled**: `lake env lean` in the shared build at the pinned Mathlib, 0 errors and 897 warnings, all of them `declaration uses 'sorry'`; 6493 lines; no `TauCeti.*` import. Every API name and every unit test of the nodes added in this pass occurs in the file under the packet's name. Conventions: a prism is a structure without the derived-completeness condition, which belongs to DD.1 and cannot be stated in Mathlib today; statements that the sources deduce from it carry "p and I lie in the Jacobson radical" as explicit hypotheses; complexes are objects of Mathlib's derived category of modules; objects owned by other layers or roadmaps are variables or fields of structures of imported data whose docstrings name the owner. Several statements of PR.1 to PR.7 are given in a reduced form that Mathlib can express (affine instead of global, smooth instead of syntomic, a universal property instead of a construction); the docstrings say so.

## Checks

- `python3 scripts/check_blueprint.py` with the pinned declaration index: 0 errors, 0 warnings.
- Every excerpt of the new nodes that cites one of the TeX sources (454) occurs verbatim there; the position of each was compared with the printed number in its locator, using numbering reconstructed from the TeX and checked against the arXiv PDFs. Three mislocated excerpts were found and corrected.
- Stage-level cycle check and atlas-merge dry run, as above.
- The lead wrote the PR.0 nodes from the TeX statements and proofs of Bhatt–Scholze §§2–3; for PR.1 to PR.7 it read the node lists of all layers and, in full, the statements and hypotheses of the theorems marked as planets in PR.1–PR.4, PR.6 and PR.7, against its knowledge of the sources.
- Intake file rules (`research/blueprint/intake.py check-files`) on the four deliverables.

## What remains, by layer

**PR.0** (planned).
- Lemma-level refinement of the target-level nodes added in this pass (free δ-rings, perfect δ-rings, distinguished elements, prisms, perfect prisms and perfectoid rings, PD and prismatic envelopes), in the style of the fifty-four lemma-level nodes that precede them.
- unbounded-torsion-example: prove that f is a nonzerodivisor of R, which the source asserts without proof.
- delta-ring-category: a self-contained proof of Joyal's theorem that W is right adjoint to the forgetful functor, which the source cites.
- BS22 Remark 2.5 (derived Frobenius lifts give δ-structures) and Remark 3.11 (perfectoid covers of regular local rings) are not planned: no target of the stage needs them.

**PR.1** (planned).
- Global (non-affine) forms are stated in the nodes but the Lean section states the affine forms only; the sheaf-level statements on X_ét wait for the étale site of a p-adic formal scheme (requests to SF.2 and SF.4).
- Lemma-level refinement of the proofs of Theorem 5.2 (the compatibility of the two comparison maps for a general PD ideal, left to the reader in the source) and of Lemma 5.4.
- The gap on p-torsion-freeness over a general p-torsion-free bounded prism (PR.1/p-torsion-free-h0-syntomic).

**PR.2** (planned).
- Lemma-level refinement of the coherence of the functor of node derived-prismatic-cohomology: the functorial simplicial cosimplicial δ-algebra F_A(R) of BS22 Lemma 7.7 as an explicit model.
- The computation, with a free resolution, that J/I maps onto gr_1^conj in BS22 Example 7.9 (the source refers to an analogue in Bhatt's paper); it is a proof step of node regular-quotient-prismatic-envelope.
- The base-free formulation of perfectoidization and its arc-descent, which wait for the two proposed roadmaps named in the gaps.

**PR.3** (planned).
- EXPORT to RefinedTraceMethods:RT.6: the identification of the Nygaard completion with π_0 TC^-(S; Z_p) (BS22 Theorem 13.1) and with π_0 TP(S/S[u]; Z_p) (BS22 Proposition 15.7) is proved there from the node bms2-comparison; PR.3 states no trace-theoretic result.
- The E_∞-refinements (multiplicativity of φ̃, of the Bockstein reduction and of the map to the Hodge filtration) are stated in leta-frobenius-factorisation (4), de-rham-comparison-general (1) and nygaard-hodge-comparison (2); a lemma-level plan would split them from the underlying statements and depends on how DD.1 and AI.1 deliver the lax monoidal structures requested.
- The sources do not compare the isomorphism of de-rham-comparison-general with that of PR.1/de-rham-comparison (BS22 Theorem 6.4) when both are defined; a node proving that they agree could be added (for instance through the uniqueness theorem of PR.6).
- Lemma-level decomposition of the key case (the q-factorial identities of BS22 Lemma 12.6 and the q-divided power lemma 12.5) and of the transversal-prism lemmas (BL22 2.2.1–2.2.10), which are elementary and close to the libraries.

**PR.4** (planned).
- Bhatt–Mathew Theorem 1.8 (for p-torsion-free F-smooth schemes Z/p^n(i)_X → τ^{≤i}Rj_*μ_{p^n}^{⊗i} is an isomorphism in degrees < i and injective in degree i with image generated by symbols), the integral comparison beyond smooth formal schemes over O_C; it is quoted in PR.4/syntomic-not-generic-fibre-etale and needs the F-smoothness theory of Bhatt–Mathew Sections 3–5.
- The Fontaine–Messing (Hodge-filtered crystalline) form of the syntomic triangle in mixed characteristic and its comparison with Z_p(n) up to bounded torsion, see upstreamNotes and restructure.
- Bhatt–Lurie Variant 8.5.5 and Corollary 8.5.7 (purity) and the relative first Chern class (Variant 8.4.17), consumers of PR.4/syntomic-cohomology-schemes.
- The second route for the last step of Theorem 9.1 (products of absolutely integrally closed valuation rings of rank ≤ 1), which the source leaves as an exercise.

**PR.5** (planned).
- Bhatt–Lurie §§3.7–3.8 (exponentiating the Sen operator; D(WCart) through the q-de Rham prism for odd p) and §4.8 (comparison of absolute prismatic and q-de Rham cohomology) are not planned: no target of the stage text needs them; a follow-up could add them as an explicit model of RΓ(WCart, −).
- Bhatt–Lurie §3.9 (Sen theory: the Galois-representation interpretation of the Sen operator) is not planned here; it belongs with PR.7 or PadicHodgeTheory.
- Bhatt–Lurie §4.9 (the integral diffracted Hodge complex over Z) is not planned; only its p-completed form enters absolute-hodge-tate-cohomology.
- The proof of Lemma 5.6.14 and the computations inside Proposition 3.6.18 and Lemma 3.6.19 are recorded as proof steps from their statements; a lemma-level pass must read them line by line.
- Globalisation of the Nygaard filtration and of the Frobenius to formal schemes is stated through limits over points; the sheaf-theoretic form on a non-affine qcqs formal scheme depends on the recorded gap.

**PR.6** (planned).
- The ringed q-crystalline site of a non-affine smooth formal scheme (BS22 Remark 16.15 (2)), which the source does not develop; the Zariski-sheaf globalisation of Remark 16.15 (1) is planned in q-crystalline-crystalline-comparison.
- A lemma-level decomposition of the proofs of q-pd-envelope (BS22 Lemma 16.10), q-de-rham-comparison (Theorem 16.22) and comparison-uniqueness (Lemma 18.3), whose steps are recorded in proofSteps.
- An explicit description of the q-PD envelope of (D⟨X⟩, (q−1, X)) by q-divided powers X^n/[n]_q!, which BS22 §16 does not state.

**PR.7** (planned).
- The source's §7.3 (Constructions 7.13–7.16, Lemma 7.15, Corollary 7.17: the logarithmic connection on the value of a crystal over O_Δ⟨I_Δ/p⟩[1/p] at the Breuil–Kisin prism) has no node: no target of the stage needs it. Construction 7.13 (the Čech nerve 𝔖^{(•)}) is part of node breuil-kisin-and-ainf-covers.
- Example 4.6 (Gauss–Manin F-crystals R f_* O_Δ of a proper smooth map) and the statement that the étale realisation commutes with proper smooth pushforward (Example 4.9) are recorded as acceptance checks only.
- Remark 3.11 (D_perf(X_Δ, O_Δ)^{φ=1} ≃ D^b_lisse(X_{p=0}, Z_p)) is an acceptance check of laurent-f-crystals-local-systems, not a node.
- Lemma-level refinement of the proofs of Lemma 6.9, Proposition 6.10 and Lemmas 7.3–7.7, which are kept as proof steps of descent-data-boundedness and etale-realization-over-breuil-kisin-prism.
- The three recorded gaps, and the two overlapping statements with R07.4 reported in restructure.

## Where to resume

The pass is complete, so the next step is the independent review. After it: (1) lemma-level refinement of PR.0's second part, which is the layer nearest the libraries (free δ-rings, the Witt adjunction with a proof of Joyal's theorem, distinguished elements, the four prisms); (2) the follow-ups named in the `remaining` lists; (3) when ArcTopologyAndDescent, the Part II of PerfectoidQuotients and the Part II of RefinedTraceMethods enter the atlas, turn the corresponding gaps into requests; (4) the split of QWittVectors:QW.6 proposed for RT-AREA-etale/28.

## Sources

Read as TeX sources of the arXiv versions (hashes in `sourceVersions`): Bhatt–Scholze, Prisms and prismatic cohomology (v4), in full for §§2–9, 11–18; Bhatt–Lurie, Absolute prismatic cohomology (v1), §§2–5, 7.4–7.5, 8 (appendices not read); Bhatt–Scholze, Prismatic F-crystals (v2), in full; BMS2 (v2), §§4, 7.4, 8, 9.11, 10; Anschütz–Le Bras (v4), §§2.1, 3, 4.9.4, 5.1.6, Appendix A; Bhatt–Mathew, Syntomic complexes (v2), §§1, 5; BMS1 (v3) for conventions only. Antieau–Mathew–Morrow–Nikolaus was consulted for the statements Bhatt–Mathew and the F-crystals paper use. Not available: the Annals version of Bhatt–Scholze; Kisin's and Fargues–Fontaine's texts, which are cited as the F-crystals paper cites them.
