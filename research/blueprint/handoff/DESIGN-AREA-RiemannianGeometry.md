# DESIGN-AREA-RiemannianGeometry — Jacobi and index-form checkpoint

Issue #3069. Agent: ChatGPT Pro (GPT-6 Astra Pro). Session `gpt-20260927-rg-8f43`.
Claim `5855026830`, bot confirmation `5855027614`; the live claimed issue was re-read before publication. Date: 27 September 2026. Branch: `gpt-20260927-rg-8f43-3069-index`.

## Scope and ownership

Partial new-roadmap checkpoint: **Hopf–Rinow, Part II: Riemannian curvature and comparison**. All five allowed deliverables are supplied. Their paths and the integrated decomposition path were absent when inspected. No upstream content, application/data file, other packet, queue or label is changed manually. No stage is closed.

The six-stage design starts after HopfRinow's actual connection, flow/exponential, normal-neighbourhood, half-energy and first-variation targets. GeometricTopology retains curvature and volume; OptimalTransport retains its early cut-locus/injectivity-radius/volume-nullity interface. The latter must be separated from transport outputs if the proposed reverse geometric dependence would create a cycle. The parent is the existing HopfRinow roadmap, not a new rival foundational theory.

## Mathematical advance

The packet develops actual-function Wronskians, index forms, integrability, bilinear laws, Green's identity, the two-piece derivative-jump identity, Jacobi boundary annihilation, the nonpositive-coefficient derivative-energy bound, anchored zero detection, two-zero uniqueness, and Riccati square-completion with its boundary terms.

The coefficient K is an actual continuous-operator-valued function, and the Jacobi equation uses actual second derivatives. The manifold application still needs a proved parallel-frame identification with R(−,gamma′)gamma′. An arbitrary rotating orthonormal frame fails: the derivative energy of the rotated constant unit vector becomes one on [0,1]. No opaque object assumes that geometric comparison.

The jump is right minus left and contributes with a minus sign. The scalar tent function gives a required test: endpoint contribution −2 is cancelled by jump contribution +2. Positive curvature gives the nonzero solution sin(t) with two zero endpoints, rejecting an unqualified no-conjugate-point assertion. The Riccati factorization is used only on an interval carrying a genuine C1 symmetric solution; cot(t) cannot be extended through a pole by a total inverse.

## Inventory

**18 nodes: 2 definitions, 9 lemmas and 7 theorems; 9 API items; 7 definition tests; 4 planets; 12 pinned baseline declarations; 7 source records; 5 requests; 4 gaps; 2 source-issue records; 6 stages and 0 closed stages.**

The prototype has **23 named declarations and 10 examples**: eighteen core declarations, five API-only lemmas, seven definition tests and three theorem-level regressions. Its functions, continuous operators, inner products and interval integrals are existing carriers. C1/C2 hypotheses hold in neighbourhoods of every point of the closed interval, avoiding junk endpoint derivatives.

**Lean was not compiled.** The environment has no Lean/Lake executable. The signatures still need elaboration, including actual regularity deductions, operator evaluation and all integration hypotheses. Structural validation is not a proof of those signatures.

## Evidence and version boundaries

Pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, checked against the repository baseline. Twelve Mathlib declarations were inspected at the exact pin in four files, with their Git blobs and passages recorded in the packet: inner-product calculus, bounded bilinear calculus, interval integration and the fundamental theorem.

The pinned geodesic Basic file and connection directory were read. Their chart-independence/coordinate-regularity limitations are not hidden. Curvature search results on the default branch refer to post-pin files; the corresponding pinned paths returned 404. They are implementation leads for the existing curvature owner, not pinned baseline entries. The initial broad commentary about pinned curvature was explicitly corrected before drafting.

Read the worker, blueprint, expansion, browser and upstream rules, including source-error recording, and the issue/confirmed claim. Relevant HopfRinow layers, GeometricTopology Layer 7 and OptimalTransport Layer 7 were read and their exact stage identifiers checked. The aggregate reviewed coverage file returned empty content. Limited Jacobi/index/Wronskian searches are not an exhaustive absence audit; the polynomial Wronskian search result is a different carrier, not a substitute for the paired Hilbert-space function here.

The primary sources are Ballmann's 2015 energy, 2016 Riccati/volume and 2003 global-geometry author notes. Rendered energy pp.7,14,15, Riccati pp.4,6,9,10 and global pp.6–8 were inspected. Additional energy images at pp.10 and 16 failed; those passages were parsed-only. The global PDF had no text extraction, so its cited pages were read from images. No PDF-byte hash, publisher comparison or whole-source certification is claimed.

Two source slips are recorded against these author copies, with sourceVersions and limited correction-search provenance. Equation (17) in the 2016 notes has N rather than ambient M as its exponential target. Corollary 5.4 omits the factor m−1 in its Ricci normalization; a round 3-sphere of radius sqrt(2) tests the resulting false diameter bound. The preceding Theorem 5.3 and the 2003 Theorem 2.2 already state the correct normalization. These findings await independent review and are not claims of priority. No message was sent to an author.

## Validation actually run

The local packet and roadmap passed **439 structural checks**, including JSON syntax, exact scope/pins, unique IDs, prerequisite resolution, both displayed DAGs, source fields, source-issue fields, planet limits, and the exact node/API/test correspondence with the Lean file. This is a local purpose-written validator, not the repository-wide checker or the global atlas DAG test.

The deterministic SymPy suite (seed 3069) passed **200 exact assertions on each of two runs**. Fifteen polynomial cases in dimensions 1,2,3 verify Green identities, symmetry, orientation, linearity, Wronskian differentiation, broken-field jumps and Riccati pointwise/integrated identities. Nonpositive coefficients are independently constructed as −A-transpose A; Riccati coefficients as −S′−S² for symmetric polynomial S. Dirichlet examples, trigonometric/hyperbolic models, collapsed/reversed endpoints, the rotating-frame counterexample and source normalization are checked separately. These are finite regressions, not proofs for every Hilbert space or an intrinsic manifold implementation.

No git command, local full-repository checker or full-atlas cycle test was run. The JSON publication condenses repeated prose from the validated draft and expands per-node hypotheses while retaining the mathematical inventory; no unobserved byte-identity or CI claim is made. Uploaded files and the actual current-head repository result are checked and recorded in the PR conversation. A remote structural pass is not Lean compilation or independent mathematical review.

## Exact continuation

First elaborate RG.0, keeping every actual derivative, integration hypothesis and endpoint/jump term. Then construct RG.1's parallel transport/frame comparison, intrinsic Jacobi and second-variation equations, and arbitrary-piecewise field/partition API. Do not substitute a chart-selected acceleration or a rotating frame.

Complete the actual invertible-Jacobi-tensor construction and singular-endpoint comparison in RG.2; refine the cut-locus supplier if needed to avoid cycles. Turn the inspected Bonnet–Myers and Hadamard–Cartan proofs into exact metric/covering declarations. Prove the point-polar Jacobian integration and Bishop–Gromov rigidity statements with the corrected normalization, and fully source-decompose the Morse-index and closed-geodesic minimax proof. Each stage has its remaining list in the packet. The design remains partial until those source, supplier and implementation obligations are closed.
