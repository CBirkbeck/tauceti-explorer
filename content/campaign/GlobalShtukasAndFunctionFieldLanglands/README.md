# Global shtukas and Langlands over function fields

## Scope and status

Fix K=F_q(C), a connected reductive K-group G, level away from a finite set, and an algebraically closed characteristic-zero ell-adic coefficient field with ell different from p. Start with split G and an explicit smooth group model; descend to the general L-group with its Galois action. These global shtukas live on C, not on the Fargues--Fontaine curve. V. Lafforgue gives the cuspidal automorphic-to-Galois direction for general G; the full GL_n correspondence has its own construction.

Status: curriculum specification, with established theorem targets and explicitly source-gated extensions. This document does not certify formalized proofs or a complete proof-interior source audit. Each AI proof ticket must replace its source route by an inspected theorem/lemma locator, enumerate intermediate lemmas, search the pinned library, and prove the actual geometric or analytic object has the exported properties. A structure field assuming the conclusion is not completion.

## Stages

### GS.0. Global G-bundles and level structures

**Inputs:** `FunctionFieldArithmetic:FA.6`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.4`.

**Construction and export:** Construct Bun_G on the global curve for the chosen smooth model, its level structures, deformation complex and Harder--Narasimhan bounded opens. Prove the relevant bounded opens have finite type and account for automorphisms and central degree. Give the adelic description of rational points in the appropriate torsor classes rather than identifying the entire stack with one double quotient. Define descent data for nonsplit groups and retain the ramified places.

**Acceptance:** GL_1 gives the Picard stack with all degree components; GL_n with unstable bundles detects that Bun_G itself is not a finite-type proper scheme.

**Source route:** V. Lafforgue global bundle/level setup; SF.6 stacks and deformation foundations.

### GS.1. Global Hecke stacks and classical geometric Satake

**Inputs:** `GlobalShtukasAndFunctionFieldLanglands:GS.0`, `EtaleDualityAndPerverseSheaves:EDC.5`.

**Construction and export:** Construct the Beilinson--Drinfeld Grassmannian over powers of C, bounded Hecke stacks, convolution and collision/factorization maps. Prove the classical equal-characteristic geometric Satake equivalence with its pinning and commutativity normalization; descend nonsplit data via the L-group. This is a separate classical geometry proof even where the existing mixed-characteristic Satake API is reusable. Use rational ell-adic intersection complexes and specify half-Tate-twist choices; integral and modular Satake are further coefficient branches.

**Acceptance:** A torus and the GL_2 minuscule orbit test weight labels, normalization and fusion of two legs; construct the associativity diagrams, not only objectwise isomorphisms.

**Source route:** V. Lafforgue geometric Satake input; Mirkovic--Vilonen classical Satake source must be pinned; campaign EP perverse sheaf foundation.

### GS.2. Shtuka stacks, modifications and truncations

**Inputs:** `GlobalShtukasAndFunctionFieldLanglands:GS.1`.

**Construction and export:** Define a multi-leg global shtuka as successive modifications together with an isomorphism to the pullback by Frobenius on the parameter scheme; specify its direction. Construct bounds, level, partial Frobenius and HN truncations. Prove the needed representability/Deligne--Mumford and finite-type statements with their stabilizer hypotheses; quotient central lattices when required. Build smooth local-model maps to bounded Grassmannians. Nonproperness and unbounded HN degree remain visible.

**Acceptance:** A rank-one shtuka over a finite field checks the Frobenius condition; a two-leg collision checks modification bounds. DM.7 is an optional specialized realization, not a prerequisite for the definition.

**Source route:** V. Lafforgue shtuka construction; L. Lafforgue compactification route for the later GL_n theorem.

### GS.3. Cohomology, correspondences and cuspidal sectors

**Inputs:** `GlobalShtukasAndFunctionFieldLanglands:GS.2`.

**Construction and export:** Construct compactly supported intersection cohomology on bounded truncations and its transition maps, then the filtered colimit used for shtukas. Establish Hecke correspondences, cohomological correspondences and adjunction maps on that colimit with coefficient and support control. Construct the Hecke-finite/cuspidal sector used by V. Lafforgue and prove its required finiteness; do not declare the full untruncated shtuka cohomology finite dimensional. Track the relation between this sector and automorphic cusp forms.

**Acceptance:** At the trivial representation and no legs identify the cusp-form space exactly; a truncation boundary term tests compatibility before passing to the colimit.

**Source route:** V. Lafforgue Hecke-finite cohomology construction; campaign compact-support and intersection-complex contracts.

### GS.4. Partial Frobenius and Drinfeld lemma

**Inputs:** `GlobalShtukasAndFunctionFieldLanglands:GS.3`.

**Construction and export:** Prove Drinfeld's lemma in the exact lisse/finite-rank setting first, then justify its use on the Hecke-finite sector. Construct the continuous action of a product of global Galois groups, specializing legs with explicit independence and coalescence isomorphisms. Verify creation/annihilation and partial Frobenius commute with Hecke operators. A geometric fundamental group of C^I cannot simply be replaced by the product without the partial-Frobenius/descent theorem.

**Acceptance:** One leg recovers the usual action; a diagonal two-leg specialization checks the product-to-diagonal map and the excursion composition relation.

**Source route:** V. Lafforgue Drinfeld-lemma and coalescence arguments; theorem locators fixed on activation.

### GS.5. Excursions and general reductive parameters

**Inputs:** `GlobalShtukasAndFunctionFieldLanglands:GS.4`.

**Construction and export:** Construct excursion operators indexed by invariant functions and Galois tuples, prove the relations and commutativity, and reconstruct continuous semisimple L-group parameters from characters of the excursion algebra. Establish the canonical decomposition of the fixed-level cuspidal space, unramified Satake compatibility and independence from auxiliary leg choices. For nonsplit G include the projection to the Galois group and conjugacy convention. Record nilpotents/generalized eigenspaces rather than assuming simultaneous diagonalizability.

**Acceptance:** GL_1 agrees with FA.4 and unramified GL_n matches characteristic polynomials. The output does not assert every parameter occurs, packet multiplicities, or a full general-group inverse correspondence.

**Source route:** V. Lafforgue arXiv:1209.5352: general reductive automorphic-to-Galois theorem; no Arthur--Selberg trace formula input.

### GS.6. The full GL_n global correspondence

**Inputs:** `FunctionFieldArithmetic:FA.6`, `GlobalShtukasAndFunctionFieldLanglands:GS.2`, `DeligneWeightsAndPurity:DWP.7`.

**Construction and export:** Develop Laurent Lafforgue's independent GL_n route: compactifications of shtukas, boundary analysis, negligible cohomology and induction on rank, trace formula and matching Hecke/Frobenius terms, and construction in both directions. State the bijection between cuspidal automorphic representations with finite-order central character and irreducible continuous n-dimensional ell-adic representations with finite-order determinant, with the coefficient/ramification convention and extension by twists separate. Prove local factors, purity and multiplicity conclusions in the exact theorem range.

**Acceptance:** n=1 recovers reciprocity and n=2 the Drinfeld correspondence. This stage cannot be checked off by GS.5's one-way general-group parameterization.

**Source route:** L. Lafforgue Chtoucas de Drinfeld et correspondance de Langlands; long proof must be decomposed into source-faithful tickets before execution.

### GS.7. Local--global and equal-characteristic comparison

**Inputs:** `GlobalShtukasAndFunctionFieldLanglands:GS.5`, `GlobalShtukasAndFunctionFieldLanglands:GS.6`.

**Construction and export:** At a chosen place compare restriction of the global parameter with the constructed local parameter, beginning with unramified Satake and GL_n and then using a separately located local--global compatibility theorem. Construct local shtuka/uniformization and nearby-cycle comparison maps with their level and boundedness hypotheses; these maps are additional proofs. Reuse the ES7 function-field automorphic branch as a specialized local Langlands input without making the entire global correspondence an early dependency of Fargues--Scholze.

**Acceptance:** Test an unramified place, a ramified GL_2 place and a change of global auxiliary data. Keep semisimplification and monodromy information distinct in every comparison.

**Source route:** Lafforgue sources plus the existing ES7 local/global comparison sources; general G ramified compatibility requires its own source-ready ticket.

## Sources and readiness

- **VLAFFORGUE:** [Vincent Lafforgue, Chtoucas pour les groupes reductifs](https://arxiv.org/abs/1209.5352). Primary abstract inspected: any reductive group over a global function field, automorphic-to-Galois cuspidal decomposition, no trace-formula input.
- **LLAFFORGUE:** [Laurent Lafforgue, Chtoucas de Drinfeld et correspondance de Langlands](https://www.laurentlafforgue.org/math/fulltext.pdf). Primary publication located; GL_n route selected, long proof interior not audited.
- **EXISTING:** Campaign primary source registry. Reuse precise source routes and bounded inspection ledger in cohomology_review.json; existing references do not mean existing proofs.

## Integration and completion

The machine-readable stage graph is in cohomology_extensions.json. Preserve each stage identifier when refining tickets. Construction examples are acceptance obligations, not claims of currently available Lean declarations. `Suggested.lean` records the implementation discipline without introducing axioms or placeholder theorem proofs.
