# BP-QSeriesPartitionsAndMockModularForms~4

Codex — codex-VN3yOq; issue #11492; 20 October 2026. This is a completed bounded revision pass, not a checkpoint. The incoming packet already had 537 nodes against a 300-node budget, so none were added. All stable ids, kinds and unchecked implementation statuses are retained. No layer is mathematically closed, and no implementation is claimed.

The [packet](../packets/QSeriesPartitionsAndMockModularForms.json), [reader](../readmes/QSeriesPartitionsAndMockModularForms.md) and [suggested file](../suggested/QSeriesPartitionsAndMockModularForms.lean) are synchronized. The reader carries all 537 statements, hypotheses, proof steps, source locators, API statements, tests and acceptance checks. There are 44 mathematically edited nodes and three additional status-consistency edits, for 47 changed node records. Three unchanged consumer contracts (indices 393, 408 and 410) obtain their missing transitive inputs through repaired predecessors.

## Review boundary and retained corrections

The preceding independent review remains unchanged: 483 verified, 11 corrected and 43 unverifiable contracts, with a needs_changes verdict. Its per-node ledger, 420 baseline declaration records, twelve in-place contract corrections, 89 source findings and their independent verdicts are retained. Revision4Disposition maps every one of the 43 flagged contracts to a replacement route. These are author arguments for the next independent reviewer, not self-issued acceptance verdicts. Seventeen inherited gap descriptions are preserved under resolvedProofObligations with their replacement nodes; two genuine series-identification gaps remain active.

The retained correction groups include Ligozat geometric/strict cusp widths; Jacobi central parity; the xi-operator convention; meromorphic Jacobi domain and real-analytic residues; the asymptotic and incomplete-Gamma pole orders; strict nontrivial fractions in the mixed mock limit; the corrected crank limit; no-ghost domain; and complete-replicability definitions. Older revision-2 corrections and the five revision-3 replacement routes remain in force. No native carrier absent at the pins has been replaced by an opaque data placeholder.

## Replacement arguments and where to review them

### Rank-one Jacobi and finite Weil

[QM.1/theta-decomposition-weil-representation](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-1-theta-decomposition-weil-representation).

MP.4 §4.7 and MP.6 §§6.17–6.20 are the actual generic owners. The local comparison supplies the positive theta/negative dual coefficient phases, integral-index Heisenberg character, metaplectic central action and separate growth conditions.

### Dedekind phases and finite Fourier bridge

[QM.2/kloosterman-sum-rademacher-jacobi-form](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-2-kloosterman-sum-rademacher-jacobi-form), [QM.2/lehmer-exponent-form](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-2-lehmer-exponent-form), [QM.2/lehmer-exponent-congruences](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-2-lehmer-exponent-congruences), [QM.2/kloosterman-sum-rademacher-mul-odd](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-2-kloosterman-sum-rademacher-mul-odd), [QM.2/kloosterman-sum-rademacher-mul-two-power](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-2-kloosterman-sum-rademacher-mul-two-power), [QM.2/kloosterman-sum-rademacher-double-odd](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-2-kloosterman-sum-rademacher-double-odd), [QM.2/rademacher-odd-root-comparison](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-2-rademacher-odd-root-comparison), [QM.2/rademacher-selberg-formula](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-2-rademacher-selberg-formula).

Meyer–Zolotarev inversion parity supplies the Jacobi-symbol phase; CRT and explicit dyadic residues handle odd multiplicativity, powers of two and doubling. The Selberg–Whiteman route handles nonunit Fourier frequencies at the original gcd(k,6)=1 scope. It uses the IntegralLattices 1G/1H Gauss contract with its half-norm convention.

### Shifted real Poisson

[QM.4/indefinite-theta-s-transformation](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-4-indefinite-theta-s-transformation), [QM.4/indefinite-theta-characteristics-s](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-4-indefinite-theta-characteristics-s).

Use current ThetaSeries Layer1A–1F, positive Fourier phase and real lattice ℤ^r. The B-pairing frequency is transported by the Gram matrix; the covolume is one and the Gaussian determinant factor is retained. No complex Hermitian Poisson contract is assumed.

### Half-weight rational cusps and growth

[QM.5/twisted-cusp-form-l-function](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-5-twisted-cusp-form-l-function), [QM.5/twisted-l-function-vertical-growth](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-5-twisted-l-function-vertical-growth).

Lift every rational cusp directly to SL₂(ℤ), derive the scalar Mellin functional equation with its phase and c powers, and use two Gamma factors plus strip bounds and Phragmén–Lindelöf. No unavailable generic Fricke theorem is used.

### Multiplier Eichler theory and finite image

[QM.5/kontsevich-quantum-modular](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-5-kontsevich-quantum-modular), [QM.5/lawrence-zagier-theta-transformation](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-5-lawrence-zagier-theta-transformation), [QM.5/poincare-sphere-quantum-modular](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-5-poincare-sphere-quantum-modular).

The lower-boundary multiplier extension is proved explicitly. Negative Fourier conjugation on the finite Heisenberg group, Schur commutation and determinant roots of unity give genuine finite image. The χ± calculation and incomplete-Gamma/erfc scales are specified; no unsupported congruence-kernel claim remains.

### Poincaré WRT and Ohtsuki comparison

[QM.5/lawrence-zagier-radial-limit](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-5-lawrence-zagier-radial-limit), [QM.5/lawrence-zagier-ohtsuki-expansion](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-5-lawrence-zagier-ohtsuki-expansion), [QM.5/poincare-sphere-unified-invariant-radial-limit](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-5-poincare-sphere-unified-invariant-radial-limit).

Specialize QT.4 surgery/Galois/Ohtsuki and Habiro prime Taylor services using the Lawrence–Rozansky star matrix, signature, orientation and finite sum. The exact normalization, modified-Euler coefficients, trivial-connection series and prime-by-prime congruence are displayed, including the p∤30 range.

### Rank/crank, bilateral identity and R estimate

[QM.5/crank-mod-eleven](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-5-crank-mod-eleven), [QM.5/ramanujan-congruence-mod-eleven](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-5-ramanujan-congruence-mod-eleven), [QM.5/atkin-swinnerton-dyer-theorem](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-5-atkin-swinnerton-dyer-theorem), [QM.5/choi-identity](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-5-choi-identity), [QM.5/rank-mixed-mock-asymptotic](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-5-rank-mixed-mock-asymptotic).

Sarma gives the crank11 valence contradiction and Garvan v2 the rank5/7 replacements. The Choi route includes an explicit q-Pfaff convolution and q-Gauss seed before the semifinite/bilateral passage. The R dissection uses τ₀=i/(kz), with the pure Gamma cancellation and remaining exponential scale tracked. The original nontrivial-fraction correction is retained.

### Scalar trace comparisons

[QM.5/zagier-trace-form](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-5-zagier-trace-form), [QM.5/zagier-trace-form-recursions](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-5-zagier-trace-form-recursions), [QM.5/weight-two-heegner-function](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-5-weight-two-heegner-function), [QM.5/modular-diagonal-log-derivative](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-5-modular-diagonal-log-derivative), [QM.5/trace-first-recursion](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-5-trace-first-recursion), [QM.5/weight-two-trace-proposition](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-5-weight-two-trace-proposition), [QM.5/trace-second-recursion](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-5-trace-second-recursion), [QM.5/zagier-traces-theorem](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-5-zagier-traces-theorem).

Construct the rank-one theta components directly, compare the U₄ bracket with constant −8E₄, and compute ordinary and elliptic residues separately. The diagonal coefficient is −240n. This supplies the needed scalar plus-space example without assuming a general Kohnen equivalence.

### Arbitrary-ring vertex Lie quotient

[QM.6/vertex-algebra-lie-algebra](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-6-vertex-algebra-lie-algebra).

Replace the false alternating claim for V/DV by Q/A, where Q=V/DV and A is the central span of self-brackets. Divided translations make the construction work without factorial inversion. Give its universal property, zero-mode action, comparison when 2 is invertible, and an integral neutral-fermion reduction to characteristic2 where a₀a=1 survives the translation quotient. All characteristic-zero consumers retain their intended carrier.

### General Borcherds presentation

[QM.6/borcherds-algebra-triangular-decomposition](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-6-borcherds-algebra-triangular-decomposition), [QM.6/borcherds-characterisation-theorem](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-6-borcherds-characterisation-theorem), [QM.6/monster-lie-algebra-is-borcherds-algebra](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-6-monster-lie-algebra-is-borcherds-algebra), [QM.6/monster-lie-algebra-simple-roots](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-6-monster-lie-algebra-simple-roots), [QM.6/monster-lie-algebra-free-decomposition](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-6-monster-lie-algebra-free-decomposition), [QM.6/twisted-denominator-identity](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-6-twisted-denominator-identity), [QM.6/moonshine-module-complete-replicability](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-6-moonshine-module-complete-replicability).

Normalize real diagonal entries without excluding isotropic or orthogonal imaginary roots. The radical-generator step uses the relative free Chevalley–Eilenberg resolution, Casimir null homotopy, Hopf formula and norm-equality weights; reflection and connected-support arguments then remove a minimal surviving radical. Jurisich §§1.1–1.4 and §§3.2–3.3 give the read inputs. Only after the general theorem is supplied do the Monster-specific negative-pairing specialization and homology/denominator consumers apply.

### Integral J and all-index Hecke

[QM.6/j-laurent-series](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-6-j-laurent-series), [QM.6/modular-function-polynomial-in-j](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-6-modular-function-polynomial-in-j), [QM.6/weakly-holomorphic-hecke-operator](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-6-weakly-holomorphic-hecke-operator), [QM.6/hecke-transform-of-j](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-6-hecke-transform-of-j).

Read current JInputs.lean and distinguish it from the historical baseline. Cancel X in the qj product relation to identify the integral formal expansion. For every m, Hermite normal form includes scalar cosets and yields the divisor-sum coefficient formula; no primitive-only Hecke convention is substituted.

### Discrete overgroups

[QM.6/moonshine-type-modular-group](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-6-moonshine-type-modular-group).

FuchsianOrbifolds8.1 supplies the discrete-overgroup finite-index input. Positive quotient area is justified by a small embedded quotient ball using Layer2 geometry. Powers of parabolics give exactly rational cusp points; width one remains an explicit separate condition.

### Moonshine module and finite data

[QM.6/monster-head-characters](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-6-monster-head-characters), [QM.6/monstrous-moonshine-theorem](../readmes/QSeriesPartitionsAndMockModularForms.md#QM-6-monstrous-moonshine-theorem).

Build Miyamoto’s concrete real framed code model without an FLM-book proof assumption. Supply the Ising C₂ bound and finite-module argument through Abe–Buhl–Dong; prove the needed code fusion via Dong–Griess–Lam and Hamming restrictions. Compare the Leech frame and Griess tensor, then use Höhn–Seysen restriction/extension and CFSGBasicProperties P2G/P2R/P2M to identify the presented Monster action. BMW’s complete integer character-certificate route is specified with its actual local subgroup/fusion inputs. The seven-class matrix has determinant 35672555520; four head trace vectors were computed exactly. Compare the 171 explicit Conway–Norton functions using exact cusp/divisor certificates, Cummins–Norton twelve-index uniqueness, and full-level Fricke-function Galois coordinates. The 171 certificates are proof targets with an algorithm and finite bounds, not an assertion that they were all executed. The 15D fixing kernel is separated from its larger order3 eigengroup.

## Ownership and current upstream contracts

RT-AREA-automorphic-1/20 is handled by retaining MP.6 as generic Jacobi owner, MP.4 as finite-Weil owner and QM.1 as the scalar coordinate/growth comparison and q-series application. MP.7 is not used to close a theta identity that its own applications consume. RT-AREA-topology/13 and its accepted bounded correction are retained: QM.5 owns scalar quantum periods and the strange/WRT examples, QT.7 owns knot statements, and the missing matrix-valued multiplicative interface belongs to the requested QSeries Part II. No reverse QT.7 dependency is introduced into base QM.5. Accepted RS-06/RS-10 links are retained. The old unaccepted edge-removal proposal is preserved as history and superseded by the explicit current uses.

The read-only current roadmap checkout was read at 0d144d044dacebca17b654695b6f1ad58f159b27 and the current TauCeti library at a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. No build ran in either checkout. Current JInputs supplies analytic j and qj; the integral formal comparison stays local. IntegralLattices owns the rational lattice carrier, 1G/1H Gauss services and the explicit Layer6E Leech lattice. ThetaSeries Layer1 owns real shifted Poisson. Eleven upstreamImports records give exact statements, consumers, locators, commits and URLs, including open PR contracts for MetaplecticAutomorphicForms #1063, AffineLieAlgebras #1201, CFSGBasicProperties #446, CharacterTheory #978 and FuchsianOrbifolds #1168. Open contracts and current declarations are not presented as theorems implemented at the historical pins. ModularCurves5B/9D supplies the full-level Galois/finite-quotient input; prime-level Tate machinery is not used for arbitrary CN levels.

Thirty supplier requests are listed in full in the packet and reader. The new or narrowed comparisons specify finite-Weil signs, generic Jacobi versus scalar normalization, the relevant QT.4 orientation/prime-Taylor service, scalar half-weight cusp inputs, analytic J, all-index Hecke, character completeness, full ordered torsion bases and finite coarse quotients, and positive quotient covolume geometry. Unknown current stages are recorded as upstream imports, not fabricated atlas ids. No live roadmap, stage-edge, link-map or library file was changed.

## Sources and findings

The register contains 73 sources and 236 version/search receipts. Additional reading is target-specific, with public URL, date, byte hash and theorem/section/page locators in sourceVersions. It is not a claim to have independently reread every inherited source or baseline theorem. The new material includes Sarma, Garvan v2, Chen–Fu, McLaughlin, Bringmann–Folsom, Jurisich, Lawrence–Rozansky, Miyamoto, Höhn–Seysen, BMW and its detailed certificate, Cummins–Norton, Conway–Norton, Abe–Buhl–Dong, Dong–Griess–Lam and Kac–Wang. Gasper’s additional q-Pfaff/q-Gauss reading and the exact Borcherds author copy have their own fresh receipts. CTblLib1.3.11 integer table data were read as data and checked with an independently written exact-arithmetic calculation; no fetched program was executed.

All prose is written in our own words. No source passage, book extract, PDF or fetched code enters the repository. The private-library index was checked; no uncleared copy of FLM, ATLAS, Gasper–Rahman or Kac’s book was used. Public papers supply the replacement routes. The two remaining gaps concern identifying Zwegers’s double-sum definitions with the original fifth- and seventh-order Eulerian mock-theta series; no source-access success is invented for those proofs.

The 89 inherited findings and their 86 confirmed/3 rejected verdicts are unchanged. Four additional findings await independent review: E629 corrects Miyamoto’s repeated plus sign in e⁻; E630 corrects the oscillator commutator in Lemma5.3; E631 scopes the Borcherds15D group correction to the acquired author copy, with a recorded publisher acquisition failure; E632 corrects the repeated β₁ input in Dong–Griess–Lam v1 Lemma5.11. Each has a locator, mathematical reason, corrected target convention and bounded search for prior corrections. The journal typography of the last finding was not collated.

## Remaining work

The active gaps are:

- **Hickerson's identities for the seventh-order mock theta functions**: Zwegers takes the indefinite double sums (Hickerson, Invent. Math. 94 (1988), p. 666) as the definitions of F₀, F₁, F₂. Their equality with Ramanujan's Eulerian series (F₀ = Σq^{n²}/(q^{n+1};q)_n, etc.) is Hickerson's theorem, not public and not planned (it is a formal q-series identity, naturally in QM.0's scope). The definitions and all QM.4 theorems stand without it; only the identification with Ramanujan's functions needs it. Checked numerically to q^{14} for F₀.
- **Fifth-order Eulerian-series identification**: The eight corrected double sums and both six-component completions, unary corrections and S/T matrices are explicit. Identifying these definitions with Ramanujan’s classical Eulerian fifth-order series requires the Andrews identities cited by Zwegers §4.4 pp.71–73, together with absolute convergence, denominator nonvanishing and the justified double-sum interchanges. The Andrews primary proof has not been collated or decomposed here; source identities with the third/eighth corrections are not certified by small coefficients. No congruence kernel is inferred from the generator matrices alone.

Coverage remains honest at the incoming node budget. A follow-up must plan the following remaining targets, retaining the present stable contracts and ownership boundaries:

### QM.0 — partial

- PAPER-YU-23/044, /086, /087 and /090: supply plethystic Adams operations (raising every variable, including the series variable, to its k-th power), the Möbius-weighted plethystic logarithm, restricted cycle partitions and the cycle-index/generalized-binomial composition identities. Work coefficientwise over characteristic-zero coefficient rings with the necessary rational scalars and integral-subring comparison; no analytic convergence assumption. A cycle-type permutation count is distinct from an unordered partition count and needs the fixed-point adapter to the existing Mathlib cycleType convention.
- PAPER-YU-23/094, /102, /106 and /107: reconcile the finite Möbius selector, independent-monomial coefficient/sign formula and valuation/integrality inputs with their foundational arithmetic owner. Preserve the reviewed correction that the sign in /102 is the unweighted sum of all exponents, the nonzero hypotheses of /106, and evenness plus zero/negative reductions in /107. Read the corrected exact source passages and source findings before creating declaration-sized leaves; the existing partition/q-binomial nodes do not establish these inputs.
- PAPER-LIU-ETAL-22/notation-1-3-1 and /B01: reuse QM.0/q-binomial-coefficient as a polynomial, with denominator-free specialization at roots of unity and the signed-index zero adapter. The printed q-integer value at zero is a misprint: QM.0/q-integer has value zero, while the zero q-factorial is one. The additional d_{r,q} and d•_{r,q} are not target nodes here; preserve d₀=1, d•₀=0, d₁=1−q−2q² and d•₁=−q as exact interface tests.
- PAPER-LIU-ETAL-22/gauss-polynomial-identity, /B02, /B04 and /B03: the Gauss alternating Gaussian-polynomial identity and Lemmas B.2.7, B.2.8 and B.3.3 need distinct target contracts or an exact existing supplier match. The finite q-binomial theorem alone is not a recorded proof of every specialization; retain polynomial reciprocity, signed summation ranges and k=0 cases, without rational evaluation before cancellation.

### QM.1 — partial

- DMZ §4.2 (4.13)–(4.18): the Taylor-expansion isomorphism J̃_(k,m)≅M_k⊕M_(k+2)⊕…⊕M_(k+2m) for even k, and its odd-weight analogue, with the polynomials P_(ν,k) and the Rankin–Cohen comparison. The inherited source boundary is unchanged: the cited Eichler–Zagier proofs have not been read. Supply exact weight restrictions where the displayed factorials or denominators degenerate, the modified Taylor coefficients, the count of 2m zeros by the argument principle, and the injectivity/surjectivity proof. The heat identity (4.12) is covered by the 22 new nodes and is no longer a remaining obligation.
- DMZ §4.3: J_{k,1} ≅ M_k ⊕ S_{k+2}, J̃_{k,1} ≅ M_k ⊕ M_{k+2}, J_{k,1} ≅ M⁺_{k−1/2}(Γ₀(4)) (4.23); the forms φ_{0,1} (4.30), φ_{10,1} = η^{18}ϑ₁² (4.28), φ_{12,1}, φ_{−1,2} = ϑ₁(τ, 2z)/η³ (4.31); the structure theorems (4.25) and (4.35) with the relation (4.33) — stated in DMZ without proof.
- DMZ §4.4: V_(k,t), its modified Möbius combination, W_(m₁) for exact divisors, the lowering operators u_t and projections U_t, their composition laws and primitive decomposition (4.37)–(4.46). Distinguish the lower-case index-raising U_s of (4.36), now covered, from the capitalized projection notation. Prove separately which operators preserve each growth condition; the source says W_(m₁) and u_t need not preserve weakness.
- Eichler–Zagier's Jacobi–Eisenstein series E_{k,m} and the finiteness bound dim J_{k,m} ≤ Σ_{ν=0}^{m} dim M_{k+2ν}: no public source with proofs was located in this pass.
- The broader matrix-index and half-index interfaces remain with MP.6. The present positive integral rank-one comparisons are supplied locally; higher-rank Skoruppa and general multiplier growth comparisons require the exact supplier statements before their future consumers are added.

### QM.2 — partial

- Complete the sharper unit-square prime-power and exceptional p=2,3 evaluations needed for refinements beyond the existing gcd(k,6)=1 Selberg–Whiteman target. Preserve the singular/nonsquare branches, actual CRT root sets, A₁(n)=1 and the corrected Johansson signs. Lehmer1938 §§3–4 and1939 §§2–4 provide sources for sharper remainders, but those refinements are not additional targets in this pass.

### QM.3 — partial

- PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18/maass-xi (§4.7, (4.7.3)): supply the vector-valued H_k(ω_L) → S_{2−k}(bar ω_L) exact sequence, with weakly holomorphic kernel, cusp-form image/surjectivity, k=1−n/2, metaplectic action and explicit conjugation/dual-representation conventions. The current harmonic-maass-form, xi-map and xi-surjective nodes are scalar and integral-weight; they do not provide this generality.
- PAPER-SHANKAR-SHANKAR-TANG-ETAL-22/30 (§3.1): construct H_{2−k}(ρ_L^∨) and the Hejhal–Poincaré F_{β,m}, β in L^∨/L and m>0 in Z+Q(β), with the stated spectral normalization. Compare the exact finite Weil-representation supplier and Bruinier/Hejhal seed conventions. The current scalar Maass–Poincaré node has even k≥4 and integer m, so does not cover this instance.
- PAPER-GROSS-ZAGIER-86/262 (IV §6, p.296): the weight-two Hecke-trick family P_{m,s}, Re(s)>0, its all-cusp majorant, unfolding with dx, continuation to s=0 and holomorphic cusp-form limit are missing. The existing holomorphic Poincaré node requires even k≥4. Preserve 0<Re(s)<ε and the conjugation of s in the pairing.
- PAPER-GROSS-ZAGIER-86/264 (IV §6, pp.296–297): the family E_{2,s}, continuation at zero, derivative F=∂_sE_{2,s}|₀ and cusp-form orthogonality need exact targets. QM.3/nonholomorphic-eisenstein-series-e2-star supplies only E₂−3/(π Im τ), not the family, derivative or continuation proof; retain the reviewed convergence correction Re(s)>0 and the log-growth normalization.

### QM.4 — planned

- The selected seventh-order completion nodes use indefinite double sums; the recorded Hickerson gap is still required to identify them with Ramanujan’s Eulerian series. Do not infer that identity from the bounded coefficient check.
- Fifth-order: prove the Andrews Eulerian/double-sum identifications with convergence, denominator nonvanishing and interchange. The coordinates of H₁,G₁,H₂,G₂,F₂ and the S/T matrices are now specified in the existing nodes and the reader. No congruence kernel or classical Eulerian identity follows merely from those formulas. QM.4 is planned with the stated proof gaps, not closed.
- The current MP.6 generic service and the local rank-one dictionary now support the represented Jacobi uses. Broader matrix-index and multiplier extensions remain with their owner. The shifted real Poisson and finite-Weil/scalar trace comparisons are supplied here and are no longer unresolved adapters.

### QM.5 — partial

- Zagier, Quantum modular forms, Example 1: Andrews' identity (8) relating the terminating expressions to the q-series σ(q), σ*(q), and the Proposition (quantum modularity of q^{1/24}σ(q) on Γ₀(2) of weight 1), which needs Cohen's Maass form and the Lewis–Zagier period theory.
- Strong quantum modular forms (Zagier, Quantum modular forms, p. 2) as a definition attaching a formal power series to each rational point; the nodes express the same content through radial-asymptotic-expansion.
- Zagier, Topology 40, §§1, 3–4: the chord-diagram interpretation (Theorem 1), the asymptotics of Stoimenow's numbers (Theorem 4) and Theorem 5.
- Lawrence–Zagier §§5–6 (the fifth-order mock theta connection and other Seifert fibred manifolds).
- Folsom–Ono–Rhoades Theorem1.3, the Rogers–Fine false theta functions, remains a distinct extension. Theorem3.2/Proposition3.3, Choi’s identity and the R cancellation needed by the existing targets now have the local proof route; the prime-power and broader rank-congruence families are not inferred from it.
- Bringmann–Rolen, Radial limits of mock theta functions: Theorem 1.1 and Propositions 5.1–5.3 for all weight-1/2 mock theta functions through the universal function g₂.
- Zagier, Traces of singular moduli, §§5–9 (Borcherds products, the duality A(D, d) = −B(D, d), Hecke operators, other genus-zero groups, other weights) and the harmonic Maass form interpretation of traces (Bruinier–Funke); their sources were not decomposed.
- Partition congruences beyond the Ramanujan triple (Watson's and Atkin's congruences for powers of 5, 7, 11; Ono's congruences for all primes ≥ 5; the Bringmann–Ono rank congruences via harmonic Maass forms) are outside the chosen sources and need their own source acquisition.
- RT-AREA-topology/13: retain QM.5/quantum-modular-form and the Kontsevich/Lawrence–Zagier q-series examples as QM.5 services, with QT.7 retaining knot-specific statements and conjectures. The existing proposal for QM.5→QT.7 needs owner/consumer statement comparison and accepted application; this pass makes no live graph change. Keep QT.4’s actual invariant and HC.3/HC.4 evaluation/rigidity imports distinct from analytic radial-limit proofs.
- ArithmeticQuantumTopology's open request for QT.7/denominator-volume-cocycle, QT.7/knot-matrix-cocycle and QT.7/cocycle-analytic-extension is assigned by its explicit route to QSeriesPartitionsAndMockModularForms, Part II where this general interface is absent. It asks for generic matrix-valued multiplicative cocycles on common pole-free domains, branch-aware weights and smooth or holomorphic extension criteria. This base QM.5 packet supplies only the scalar additive period cocycle; it claims no matrix interface or knot comparison. Retain the open supplier gap and this owner split when planning Part II, without a QT.7 prerequisite in base QM.5.

### QM.6 — partial

- The accepted RS-06 links into QM.6 remain binding, including their restricted comparison/application contracts. The inherited proposal suggesting different analytic inputs is unaccepted and cannot by itself remove the accepted R12.3/R13.3/R13.4a/ModularCurves links. Establish exact input sufficiency/non-use and obtain reviewed restructuring before changing those edges. Accepted RS-10 retains QT.4 and HC.3/HC.4 exports into QM.5; no completion or theorem-existence claim follows from those structural links.

## Validation and next action

- Blueprint checker: zero errors and zero warnings.
- Suggested Lean: lean-check completed at the shared pinned Mathlib build with exit0, nine expected declaration-uses-sorry warnings, no errors and no other warnings. Free memory was checked first; no language server or Lake build/update/cache operation was started. The file is 176 lines, with seven light definitions, nine end-theorem signatures and thirteen proved examples. The only code change explains the new mod11 proof route.
- The sorry-data check, intake file check (four allowed files), all-537 full contract synchronization, internal anchor check and whitespace check passed. The preserved independent-review records and all420 baseline declaration records were compared against the input and are unchanged.
- Counts: 113 definitions, 17 constructions, 250 lemmas, 153 theorems and four comparisons. Definitions/constructions have 777 API items and 514 unit tests; all node kinds together have 795 API items and 527 tests. There are 42 planets (six per layer), 420 retained baseline declarations, two active gaps, 30 supplier requests and zero new nodes.
- No suspicious external instructions were acted on; fetched sources and other authors’ material were treated as data. No credential was used at the direction of untrusted text.

Next action is an independent review of the replacement arguments and four new findings. The completed budgeted pass is not a declaration that the two gaps, supplier implementations or remaining stage extensions are finished. This worker claims no second job.
