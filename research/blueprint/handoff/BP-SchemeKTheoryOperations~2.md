# BP-SchemeKTheoryOperations~2 handoff

Issue: #7007. Agent: Codex. Session: `codex-VJ12Ga`. Date: 8 October 2026.

This revision pass is complete and ready for independent review. It is not a checkpoint. The packet retains all 282 inherited node identifiers and the entire historical `review` object, and adds two K-coherence nodes. All implementation statuses remain `unchecked`. The historical `needs_changes` verdict describes the preceding version, not an independent verdict on this revision.

The deliverables are [the packet](../packets/SchemeKTheoryOperations.json), [the reader](../readmes/SchemeKTheoryOperations.md) and [the suggested file](../suggested/SchemeKTheoryOperations.lean). The reader gives all current statements, hypotheses, proof steps, prerequisites, uses, APIs, tests, acceptance cases, source issues and requests. The suggested file preserves the native naming prototypes and replaces the historical revision contracts with the current statements. Contracts whose mathematical carriers are missing remain explicitly explained comments, with their names and example specifications; no placeholder predicate was added.

## Closure and counts

| Quantity | Result |
| --- | --- |
| Nodes | 284: 29 definitions, 83 lemmas, 95 theorems, 24 comparisons, 37 constructions, 16 applications |
| API items / unit test specifications | 444 / 285 |
| Planets / baseline declarations | 40 / 134 |
| Explicit gaps / owner requests | 42 / 42 |
| S.1, S.2, S.3, S.4, S.5, S.6, S.7 | Each `planned`; none `closed` |
| Packet status | `complete` |

Every target chain ends in a library declaration, another owner's node or requested stage, or an explicit gap. Completion is at the issue's planning granularity. It does not certify the unproved supplier interfaces or formalization. The coverage records enumerate the remaining work by stage; the packet's gaps identify affected nodes, and its requests state the supplier interfaces.

## The twelve disputed routes

| Node suffix | Revision and remaining boundary |
| --- | --- |
| S.3/killing-morphisms-into-supported | Uses the sequential approximation and compact finite-extension factorization of Stacks 09SN/09SP, then the supported adjunction and 0A9C. The intermediate cone is perfect only in the perfect-source branch. Compact factorization is an explicit E1 Part II request; presentability alone is insufficient. |
| S.5/graded-quillen-lemma | Restricts to the Tor-independent resolving category of Quillen §6, Lemma 1 and Theorem 6, pp.117–118. There the degree filtration and graded quotients are exact; additivity proves the two inverse maps. The sequence over k[x] that defeats the unrestricted filtration is retained as a non-example. |
| S.4/g-coniveau-spectral-sequence | Restricts convergence to finite dimension. Proper filtered pushforward is stated for finite-type pure-dimensional schemes over a common field, with the specified dimension shift and support estimate. H.6 owns exact couples and filtered functoriality. The P¹ residue acceptance case is corrected: the transfer relation obstructs surjectivity. |
| S.4/gersten-power-series | Replaces a claimed linear change over every field by a formal triangular substitution. Checks the distinguished quotient's finite freeness and the evaluation kernel in the completed tensor product. The convergent argument retains the infinite complete-valued field hypothesis. Weierstrass preparation remains an identified supplier input. |
| S.4/mixed-char-higher-effacement | Localizes at all generic points of the special fibre, giving a one-dimensional semilocal ring on each domain component. States zero maps on every higher K-group. It does not deduce a compatible nullhomotopy of spectra from componentwise zero maps. Gillet–Levine's primary proof remains unread. |
| S.6/simplicial-sheaf-hypercohomology | Uses the cofiber of U₊→X₊ to represent relative derived sections. Distinguishes pointed π₀, group-valued π₁ and abelian higher homotopy groups. Requests Brown–Gersten's unstable model and its precise connectedness, abelianity and convergence/fringe hypotheses from H.2 Part II; the stable specialization imports H.6. |
| S.6/soule-scheme-operations | Follows global representation, block-triangular and tensor maps in GS99 Lemmas 18–20 and Theorem 3. Adds K-coherence with both required stabilization comparisons, and a scheme/support K-coherence theorem. Uniform affine finite-rank and completion stability are requested from K.2:plus Part II. Stalkwise equivalence is not used to infer equality of global operation classes. |
| S.6/scheme-weight-decomposition | Uses the supported cofiber bound D=max(dim X,dim U+1), and D=dim X without supports. Keeps Soulé's integral F² statements separate. The full rational γ-graded comparison is conditional on the weighted λ-module bridge, including K₀ coefficients in filtration generators. |
| S.6/finite-coefficient-weight-decomposition | Restricts the deduction to m≥2 and odd coefficients, with explicit integral endpoint bounds, additive commuting coefficient operations, Bockstein compatibility and exponent hypotheses. Uses primary factors with squared annihilators for the extension and proves primitive-root independence by unit plus nilpotent invertibility. m=2 needs the requested additive operation model; m=1 needs an additional theorem. |
| S.7/chern-class-of-subvariety | Requests integral localized Chern classes in CH_Z^j, identified with dimension-indexed cycles on Z. Dimension forces lower classes to vanish; the generic Koszul character and integral Newton identity determine the top coefficient in the torsion-free group generated by Z. Generic smoothness over imperfect fields is not assumed. |
| S.7/grothendieck-riemann-roch | Restricts the imported Borel–Serre theorem to algebraically closed coefficient fields and proper maps of smooth quasi-projective varieties, componentwise. Lemmas 15–16 and §§9–16, pp.114–132 supply the factorization proof. An arbitrary-field extension is not claimed. |
| S.7/dimension-one-supported-g-cycle-comparison | Requires a pure-dimensional catenary regular ambient scheme and its dimension formula, with codimension p=dim X−1. Keeps Zhang's map to proper cycles as a map rather than an isomorphism. |

The two new identifiers are `SchemeKTheoryOperations:S.6/k-coherent-space` and `SchemeKTheoryOperations:S.6/scheme-and-support-k-coherence`. The definition includes stabilization of both relative hypercohomology and cohomology of the homotopy sheaves, for every indicated degree. Finite cohomological dimension is an additional bound, not the definition of coherence.

## The 52 inherited corrections

All corrected statements, hypotheses, proof imports, APIs and acceptance cases were rechecked and synchronized. The packet retains the reviewer's per-node ledger for provenance. The corrected suffixes, grouped by stage, are:

- S.1 (6): strictly-perfect-complex; perfect-derived-tensor; coherator; perfect-complicial-waldhausen-category; perfect-frobenius-pair; enhanced-perf-truncation.
- S.2 (4): k-theory-model-invariance; k-theory-proper-pushforward; affine-pullback-is-scalar-extension; cartan-equivalence.
- S.3 (10): perfect-complexes-with-support; affine-support-comparison; divisor-support-comparison; coherent-sheaves-with-support; g-theory-localisation; regular-support-devissage; unit-loop-class; algebraically-closed-injectivity; one-dimensional-localisation-sequence; arithmetic-surface-localisation.
- S.4 (9): zariski-mayer-vietoris; mayer-vietoris-property; brown-gersten-vanishing; nisnevich-cohomological-dimension; k-coniveau-spectral-sequence; coniveau-chow-group; one-dimensional-coniveau; quillen-presentation-lemma; quillen-effacement.
- S.5 (6): g-theory-homotopy-invariance; negative-k-vanishing-regular; projective-bundle-cohomology; bass-fundamental-theorem; affine-fundamental-theorem-comparison; blowup-exceptional-divisor-tests.
- S.6 (11): support-product-pairings; external-product; non-unital-gamma-filtration; adams-eigenvalue-on-gamma-graded; kratzer-low-gamma; soule-gamma-bound; affine-weight-decomposition; riemann-roch-without-denominators; gillet-soule-strict-support-comparison; supported-codimension-filtration; rational-supported-filtration-product.
- S.7 (6): chern-character; gamma-chow-comparison; g-theory-adams-operations; self-intersection-formula; supported-cycle-to-k-zero; supported-chow-k-zero-comparison.

The final audit also repairs inherited examples beyond the original disputed routes. The doubled affine plane is regular and does not exhibit connective K-theory descent failure. A two-component nodal curve with two rational intersection points gives a cover whose rank restriction cokernel is ℤ, hence a nonzero negative homotopy group in the ordinary spectrum pullback. This is an explicit calculation supplied in this revision; K-book Example V.10.3, draft p.443/PDF p.451, supplies the general obstruction. A corresponding fifth Mayer–Vietoris test is included. The divisor comparison explicitly takes the connective cover of nonconnective support K-theory. Soulé §2.7, p.498 allows bounded 2-power torsion in 𝒮₁; the integral curve calculation instead follows independently from rank and determinant. The point example for homological Adams operations restricts the whole-group F₀ assertion to degree zero.

## Ownership and red-team findings

| Finding | Treatment in this packet |
| --- | --- |
| RT-AREA-ktheory-1/17 | Ring P¹ and Nil computations are K.6 inputs. Scheme negative G vanishing belongs to S.2; the coherent scheme/nonconnective comparison belongs to S.5 and has an explicit model bridge gap. |
| RT-AREA-ktheory-1/23 | S.4 imports H.6's generic exact-couple, spectral-sequence and convergence machinery and supplies the scheme filtration instances. |
| RT-AREA-ktheory-2/38 | The named S.4 Nisnevich-site fallback includes covers, henselian neighbourhoods, distinguished squares and excision. SF.2 remains the proposed site owner; moving the fallback requires adoption of that supplier interface. |
| RT-AREA-ktheory-2/39 | P(E), tautological and flag geometry import R09.1. Blowup geometry imports R09.7a and the upstream StableReduction layer 4 overlap. This roadmap supplies K-theoretic formulas. |
| RT-AREA-ktheory-2/40 | Proper coherence imports upstream StableReduction layer 2. JacobianChallenge C supplies only its proper-flat-finitely-presented curve-family overlap. Derived and proper-support bridges remain explicit scheme constructions. |
| RT-AREA-ktheory-2/41 | Proposes dropping S.6→M.4, S.6→Z.5 and S.7→Z.6; adds S.6→M.6b and Z.3→Z.5. Retains RS-18's S.2→Z.5/Z.6 and S.5→Z.6. No integrated atlas file is changed. |
| RT-AREA-ktheory-2/42 | S.3 owns the general Dedekind localization sequence and valuation boundary; N.2 imports them and retains its arithmetic refinements. |
| RT-AREA-ktheory-2/45 | Arbitrary-ring perfect modules import upstream DGAInfinity layer 5, with the opposite-ring transport for the left-module convention. S.1 keeps local scheme perfectness and the affine comparison; enhanced derived sheaves import E0/E1. |

The assigned paper-routing ledger is retained in `sourceRouteCoverage`. It keeps Zhang's proved scheme assertions distinct from its unproved formal extension, Li–Liu's supported cycle/product interfaces distinct from étale realization, Zhu Remark B.3's spectrum comparison as a question, and all four Bhatt–Scholze Witt hyperdescent targets as separate assertions. Scholze Proposition 8.8 supplies the supported completion input only; the non-Noetherian unitization completion bridge remains explicit. No valuation A¹-invariance, rigidity, cdh or pro-cdh theorem is inferred from it.

New Part II interfaces include E1 compact factorization, H.2 unstable Brown–Gersten sheaf models, K.2:plus uniform finite-rank/integral-completion stability, Z.3 full weighted λ-module γ-filtrations, SF.5 integral Chern classes with support, and K.7 additive coefficient-operation compatibility including degree two. These supplement the existing requests rather than claim those owners already prove the stronger results. The exact 42 requests and affected nodes are in the packet.

## Sources and baseline

The pins remain Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. All 134 cited baseline declaration statements were read at those pins, with the relevant section binders and hypotheses. This includes `Unitization` and `Algebra.IsStandardSmoothOfRelativeDimension`; degree-zero K and module/derived-category APIs are reused. The read audit does not claim complete proof checking of every baseline declaration.

Fresh public-source receipts, with URL, SHA-256 and 8 October access date, are recorded in `sourceVersions`. This run read the following revision passages and proof contexts:

- Stacks 09SN, 09SP and 0A9C: compact cellular approximation, finite-extension factorization, and killing maps into supported complexes.
- Quillen, Higher algebraic K-theory I, §6 Lemma 1/Theorem 6, pp.117–118, and §7 Theorem 5.13, p.127: resolving graded modules and power-series Gersten inputs.
- Brown–Gersten, Algebraic K-theory as generalized sheaf cohomology, Theorems 1–3, Proposition 1 and the convergence/fringe proof, pp.268–285; Theorem 4's statement, pp.285–286. The proof of Theorem 4 was not reread in full.
- Gillet–Soulé 1999, Definition 1/Lemma 18/Proposition 5, pp.38–41; §3.2.4 and Lemma 19, pp.42–44; Lemma 20/Theorem 3, pp.44–47; Proposition 8, pp.48–49.
- Soulé 1985, the operation, γ-bound and weight-decomposition passages in §§1–2 and §4, including §2.7, p.498 and Proposition 5. Its source-dependent stability and integral filtration prerequisites remain recorded as gaps.
- Borel–Serre 1958, the field convention and Lemmas 15–16/GRR factorization in §§9–16, pp.114–132; Gillet–Soulé 1987's supported cycle/filtration contexts in §§4 and 8.
- The K-book and Thomason–Trobaugh passages cited by the compact-support, Gersten, coniveau, graded and localization corrections; K-book Example V.10.3 was reread for the connective Mayer–Vietoris obstruction.

Inherited receipts and read-section lists describe the preceding workers' work. They are not asserted to be new reads by this session. The source-issue verdicts are unchanged: 39 confirmed and two rejected findings. The two rejected Stacks allegations appear as rejected in the reader. No source passage, PDF or extracted text is committed. No private-library source was needed.

Unread primary proofs and stronger extensions are not concealed: Gillet–Levine, Panin/Popescu, Quillen's representation-class homology theorem, Hiller, Suslin, the cited EGA/SGA 6 inputs, Fulton factorization, Manin's Bott identity, and the specified formal/Witt/product/completion and full-filtration bridges remain in the gap ledger. Some targets are conditional deductions requiring exactly those interfaces.

## Checks and continuation

`python3 scripts/check_blueprint.py research/blueprint/packets/SchemeKTheoryOperations.json` reports zero errors and zero warnings. The consistency audit verifies retention of every inherited ID, the unchanged historical review and source-issue verdicts, exact reader coverage of all 284 statements/444 API statements/285 test specifications, and occurrence of every API/test name in the suggested file. All 64 corrected or disputed reviewer statements occur there in their current form. It also checks implementation statuses, coverage statuses, absence of excerpt fields and balanced Lean comments. These are document consistency checks, not elaboration or proof tests.

The full `lean-check` attempt exited at the missing compiled import `TauCeti.Algebra.Category.ModuleCat.CartanMap`. The shared build has the Mathlib pin but lacks the complete pinned Tau Ceti build. Available memory exceeded the required threshold. The file was **not compiled**, and no library build, Lake update/cache command or language server was started. The earlier worker's isolated Mathlib square-zero probe is historical evidence only. No Lean process remains running.

The submission also runs the intake deliverable/private-path checker and `git diff --check`. A fresh independent reviewer should examine the twelve scoped proof routes and the synchronized correction ledger first, then the two coherence nodes and the explicit conditional bridges. After acceptance, follow-up work should discharge each stage's named gaps through its owners and refine the missing carrier signatures against a complete build at both pins. No stage should be marked closed while its corresponding gaps or remaining list persists. This session submits one job and stops.
