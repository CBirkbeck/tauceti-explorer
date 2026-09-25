# K-theory of finite and local fields

*Roadmap `KTheoryFiniteLocalFields`, stages L.1–L.7.*

This document is definitive. Its machine form is the packet `research/blueprint/packets/KTheoryFiniteLocalFields.json`, from which it is generated, so that the two agree. The suggested Lean file `research/blueprint/suggested/KTheoryFiniteLocalFields.lean` is a naming proposal, not an implementation; implementationStatus is `unchecked` for every node. Pins: Mathlib `082e2d3`, Tau Ceti `f790474`.

## Purpose and scope

This roadmap computes the algebraic K-theory of finite fields and of nonarchimedean local fields and their rings of integers. It connects that K-theory to Galois cohomology and to topological cyclic homology, and supplies the local ingredients of the arithmetic K-theory of number fields.

- **L.1** is Quillen's calculation. It develops K-theory with finite coefficients and the Bott element, Brauer lifting and Quillen's space FΨ^q, and it proves that BGL(𝔽_q)^+ is the homotopy fibre of ψ^q − 1 on BU. The consequences are K_{2j}(𝔽_q) = 0 and K_{2j−1}(𝔽_q) ≅ ℤ/(q^j − 1), Galois descent along finite extensions, and transfer formulas that choose no generator.
- **L.2** passes to henselian local rings away from the residue characteristic. It states Gabber's rigidity theorem, builds the localisation sequence of a henselian DVR, and derives the prime-to-p K-theory of local fields and their rings of integers, including K_{2i−1}(E){ℓ} ≅ ℤ/w_i^{(ℓ)}(E).
- **L.3** computes K₂ of local fields. It builds the norm-residue map K₂(E) → μ(E) and proves Moore's theorem, that the kernel is divisible (uniquely divisible in characteristic zero), and computes K₂ of the ring of integers.
- **L.4** specialises the trace theories of RefinedTraceMethods to Hesselholt–Madsen's TR/Frobenius conventions and proves the localisation square relating K-theory and TC of a DVR and its fraction field.
- **L.5** builds the de Rham–Witt complex with log poles and carries out the TR/TC calculations for perfect fields, truncated polynomial rings and complete DVRs (p odd).
- **L.6** assembles the p-adic K-groups of local fields: ranks and torsion through Galois cohomology, the divisible and finite parts of the integral groups, the comparison maps with their kernels and cokernels, and the equal-characteristic case.
- **L.7** proves that completion at a finite place of a number field is compatible with restriction, transfer, localisation boundaries, Hilbert symbols, étale Chern classes and cyclotomic traces.

The blueprint has 244 nodes. Every stage is `partial`: its gaps name the steps that no obtainable source proves.

## Boundaries

The roadmap imports what other roadmaps own and plans nothing twice. The requests section at the end lists each import with the nodes that need it.

**Suppliers.**
- **GeneralAlgebraicKTheory.** K.1–K.3 and K.7: K-groups of exact categories, the plus construction, the resolution and localisation theorems, products and colimits.
- **StableHomotopyKTheory.** H.6: Moore spectra, the Bockstein sequence and ℓ-adic completion.
- **RefinedTraceMethods.**
  - RT.1–RT.3: Hochschild and cyclic homology, THH, TC, the cyclotomic trace, and the nilpotent and rational relative theorems.
  - RT.4:topological: KU, Bott periodicity and Adams operations.
- **KTheoryLowDegrees.** U.3, U.5 and U.6: K₁, the determinant, SK₁ of semilocal rings and the transfer in degree one. Also Z.2: K₀ of fields.
- **K2SymbolsBrauer.** T.2:symbols (Matsumoto's presentation and K₂(𝔽_q)), T.3's tame symbol, and T.7's Hilbert and norm-residue symbols.
- **CrystallineCohomology.** CR.4 (ordinary de Rham–Witt complexes) and CR.5:log-algebra.
- **MotivicEtaleKTheory.** M.1 and M.4–M.8: the étale side (Tate twists, the norm-residue theorem, the étale comparison and étale Chern classes).
- **ArithmeticGaloisDuality.** R02.1 and D7.
- **SchemeKTheoryOperations.** S.6: λ-operations.
- **The Tau Ceti roadmaps.** LocalFieldsRamification (layers 0–2), ClassFieldTheory (layers 5–6), NumberFieldArithmetic (layer 5) and ProfiniteCohomology (layer 9).
- **The libraries.** Mathlib supplies Witt vectors, finite fields, local rings and completions; Tau Ceti supplies K₀ and local-field arithmetic.

**Consumers.**
- **ArithmeticKTheory.** N.2–N.6: finite-field residue terms, Soulé's theorem, the local conditions and the wild kernel.
- **K3BlochGroups.** V.5: K₃ of finite fields.
- **EllipticKTheory**, **HabiroNumberFields** and **HigherLocalFieldsAndHigherClassFieldTheory**.
- **PadicHodgeRegulators.** D.3–D.4: the completed K₃ of unramified local fields and the semilocal map.
- **MotivicEtaleKTheory M.7**, which imports L.2's rigidity (restructure).

## Conventions

- **K-theory with coefficients.** K_n(R; ℤ/m) is π_n(K(R)/m), formed with the mod-m Moore spectrum; its Bockstein sequence is StableHomotopyKTheory H.6's.
- **Completed K-theory.** K_n(R; ℤ_p) is π_n of the p-completion (L.1/completed-k-theory). It is never confused with K_n(R) ⊗ ℤ_p, and finite generation of a completed group is never transferred to K_n.
- **Local fields.** E is a nonarchimedean local field with ring of integers V (or O), uniformiser π, residue field k = 𝔽_q of characteristic p, and μ(E) its roots of unity. w_i^{(ℓ)}(E) is the ℓ-part of w_i(E) = #H⁰(E, ℚ/ℤ(i)).
- **The localisation boundary.** ∂: K_n(E) → K_{n−1}(k), with ∂[π] = 1 and the sign fixed in L.2/dvr-localisation. Splittings that depend on the uniformiser are marked as such.
- **Symbols.** The Hilbert and norm-residue symbols are those of K2SymbolsBrauer T.7, with its arithmetic-Frobenius normalisation. The tame component is (a, b)_d = ω(∂_v{a, b})^{−(q−1)/d}.
- **Trace theories.**
  - The spectra: T(A) is THH, TR^n = T(A)^{C_{p^{n−1}}} with R, F and V, and TC = hofib(R − F), in Hesselholt–Madsen's classical convention.
  - The comparison with the Nikolaus–Scholze convention is L.4's.
  - Hesselholt–Madsen's results assume p odd; the nodes keep that hypothesis.
- **K-book locators.** PDF page = book page + 8, in the author-hosted draft of 29 August 2013.

## Sources

Every statement below is taken from these sources, at the versions recorded; locators name the statement and, where the packets give it, the page. Excerpts are quoted literally, from the LaTeX source or the PDF text.

- **The K-book: An Introduction to Algebraic K-theory**, Charles A. Weibel. Author-hosted combined draft dated 29 August 2013 (published as Graduate Studies in Mathematics 145, American Mathematical Society, 2013) <https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf> (source id `Kbook.2013`).
- **Algebraic K-theory of rings of integers in local and global fields**, Charles Weibel. Handbook of K-theory, vol. 1, chapter I.5 (Springer 2005), author copy <https://sites.math.rutgers.edu/~weibel/archive/papers-dir/KZsurvey-published.pdf> (source id `Weibel.Handbook.I5`).
- **K-theory and topological cyclic homology of henselian pairs**, Dustin Clausen, Akhil Mathew, Matthew Morrow. arXiv:1803.10897v2 (20 July 2020); published in Journal of the American Mathematical Society 34 (2021) <https://arxiv.org/abs/1803.10897> (source id `CMM.2018`).
- **On the K-theory of finite fields**, Peter J. Haine. Talk notes dated 25 September 2016, author page (University of California, Berkeley) <https://math.berkeley.edu/~phaine/files/KFF.pdf> (source id `Haine.2016`).
- **Algebraic K-theory of finite fields**, David Mestel. Cambridge Part III essay, April 2014 (supervised by O. Randal-Williams), author page; the PDF carries no author line, the attribution is the hosting page's <https://www.cs.ox.ac.uk/people/david.mestel/essay.pdf> (source id `Mestel.2014`).
- **Corrections to “The K-book: an introduction to algebraic K-theory”**, Charles A. Weibel. Author's errata list for GSM 145, Wayback Machine copy of https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.errata.pdf (the live file returns 404). <https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.errata.pdf> (source id `Kbook.errata`).
- **On the K-theory of local fields**, Lars Hesselholt, Ib Madsen. arXiv:math/9910186v2 of 22 January 2004 (e-print and its PDF), published Ann. of Math. 158 (2003) 1–113; the published version was not read. <https://arxiv.org/abs/math/9910186> (source id `HesselholtMadsen.2003`).
- **Class Field Theory**, J. S. Milne. Course notes, version 4.03, 6 August 2020. <https://www.jmilne.org/math/CourseNotes/CFT.pdf> (source id `Milne.CFT.2020`).
- **Topological Milnor K-groups of higher local fields**, Ivan Fesenko. Invitation to higher local fields (Geometry & Topology Monographs 3, 2000), Part I, section 6, pp. 61–74; arXiv:math/0012137. <https://msp.org/gtm/2000/03/gtm-2000-03-006p.pdf> (source id `Fesenko.GTM3.2000`).
- **Bloch groups, algebraic K-theory, units, and Nahm's conjecture**, Frank Calegari, Stavros Garoufalidis, Don Zagier. arXiv:1712.04887v3 (6 April 2021), TeX source and PDF; the version of record (Ann. Sci. ÉNS 56, 2023) was not read. <https://arxiv.org/pdf/1712.04887v3> (source id `CGZ.BlochUnits.2021`).
- **On the K-theory of finite algebras over Witt vectors of perfect fields**, Lars Hesselholt and Ib Madsen. Topology 36 (1997), 29–101; author-hosted PDF (59 pp.; printed page = PDF page − 4 in the body) <https://www.math.nagoya-u.ac.jp/~larsh/papers/004/paper.pdf> (source id `HesselholtMadsen.1997a`).
- **Cyclic polytopes and the K-theory of truncated polynomial algebras**, Lars Hesselholt and Ib Madsen. Invent. Math. 130 (1997), 73–97; author-hosted PDF (PDF page 1 = p. 73) <https://www.math.nagoya-u.ac.jp/~larsh/papers/007/polytope.pdf> (source id `HesselholtMadsen.1997b`).
- **K-theory of truncated polynomial algebras**, Lars Hesselholt. Handbook of K-theory, vol. 1, pp. 71–110, Springer 2005 (chapter I.3); author-hosted PDF (PDF page 1 = p. 71) <https://www.math.nagoya-u.ac.jp/~larsh/papers/s01/handbook.pdf> (source id `Hesselholt.2005`).
- **On the p-typical curves in Quillen's K-theory**, Lars Hesselholt. Acta Math. 177 (1996), 1–53; author-hosted PDF <https://www.math.nagoya-u.ac.jp/~larsh/papers/005/acta.pdf> (source id `Hesselholt.1996`).
- **On the de Rham–Witt complex in mixed characteristic**, Lars Hesselholt and Ib Madsen. Ann. Sci. École Norm. Sup. (4) 37 (2004), 1–43; author-hosted final version PDF <https://www.math.nagoya-u.ac.jp/~larsh/papers/013/final.pdf> (source id `HesselholtMadsen.2004`).
- **On the K-theory of complete regular local F_p-algebras**, Thomas Geisser and Lars Hesselholt. Topology 45 (2006), 475–493; author-hosted preprint of 9 August 2005 <https://www.math.nagoya-u.ac.jp/~larsh/papers/011/paper.pdf> (source id `GeisserHesselholt.2006`).
- **On topological cyclic homology**, Thomas Nikolaus and Peter Scholze. arXiv:1707.01799v2 (7 September 2018); Acta Math. 221 (2018) <https://arxiv.org/abs/1707.01799> (source id `NikolausScholze.2018`).

The files read, with their SHA-256:

- author copy: https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf, SHA-256 `a04f53c9393b…`; Author-hosted draft of 29 August 2013; the published GSM 145 text was not read, so findings are scoped to this draft.
- published: Weibel's errata to The K-book (GSM 145, AMS 2013), Wayback Machine copy of https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.errata.pdf, SHA-256 `ef7ed6d08a5f…`
- author copy: https://sites.math.rutgers.edu/~weibel/archive/papers-dir/KZsurvey-published.pdf, SHA-256 `6c6368a61982…`
- preprint: https://arxiv.org/pdf/1803.10897, SHA-256 `ad23c1d7b818…`
- author copy: https://math.berkeley.edu/~phaine/files/KFF.pdf, SHA-256 `88edeb5faa10…`
- author copy: https://www.cs.ox.ac.uk/people/david.mestel/essay.pdf, SHA-256 `cf219af32a8f…`
- preprint: https://arxiv.org/abs/math/9910186, SHA-256 `2f977e87c9b0…`
- preprint: https://arxiv.org/pdf/math/9910186v2, SHA-256 `38f4919e35a7…`
- author copy: https://www.jmilne.org/math/CourseNotes/CFT.pdf, SHA-256 `50d79af78250…`
- published: https://msp.org/gtm/2000/03/gtm-2000-03-006p.pdf, SHA-256 `5917d0fc8df4…`
- preprint: https://arxiv.org/pdf/1712.04887v3, SHA-256 `024317c20a1d…`
- preprint: https://arxiv.org/e-print/math/9910186v2, SHA-256 `2f977e87c9b0…`
- author copy: https://www.math.nagoya-u.ac.jp/~larsh/papers/004/paper.pdf, SHA-256 `833d5ded2fae…`
- author copy: https://www.math.nagoya-u.ac.jp/~larsh/papers/007/polytope.pdf, SHA-256 `0052dc4b8df6…`
- author copy: https://www.math.nagoya-u.ac.jp/~larsh/papers/s01/handbook.pdf, SHA-256 `0f079627b73d…`
- author copy: https://www.math.nagoya-u.ac.jp/~larsh/papers/005/acta.pdf, SHA-256 `bb4677d93dee…`
- author copy: https://www.math.nagoya-u.ac.jp/~larsh/papers/013/final.pdf, SHA-256 `1eb72a65ee10…`
- author copy: https://www.math.nagoya-u.ac.jp/~larsh/papers/011/paper.pdf, SHA-256 `c797fdbf1f97…`
- preprint: https://arxiv.org/abs/1707.01799, SHA-256 `12b6cdbd0d8e…`
- preprint: https://arxiv.org/abs/0802.3938, SHA-256 `db3f296fe7e8…`

## What the pinned libraries have

Neither library has algebraic K-groups beyond K₀, K-theory with coefficients, trace theories or de Rham–Witt complexes. The nodes build on these pinned declarations, each read at its module:

- `tauceti:TauCeti.SplitK0.finrankEquiv` (TauCeti/CategoryTheory/GrothendieckGroup/FiniteDimensionalVectorSpace.lean): SplitK0 (FGModuleCat k) ≃+ ℤ by dimension, for a division ring k with [Small k]; for a finite field this is K₀(F_q) = ℤ in the split-K₀ model.
- `tauceti:TauCeti.AbelianK0` (TauCeti/CategoryTheory/GrothendieckGroup/Abelian.lean): The Grothendieck group of an abelian category (ExactK0 of the abelian exact structure); applied to finite-dimensional representations over F_q it is the representation group R_{F_q}(G).
- `mathlib:ZMod` (Mathlib/Data/ZMod/Defs.lean): The integers modulo n, used for the cyclic groups ℤ/(q^i − 1).
- `mathlib:FiniteField.frobeniusAlgEquivOfAlgebraic` (Mathlib/FieldTheory/Finite/Basic.lean): For an algebraic extension L of a finite field K with #K = q, the Frobenius x ↦ x^q as an element of Gal(L/K).
- `mathlib:FiniteField.orderOf_frobeniusAlgEquivOfAlgebraic` (Mathlib/FieldTheory/Finite/Basic.lean): For L finite over the finite field K, the Frobenius has order [L : K] in Gal(L/K).
- `mathlib:FiniteField.bijective_frobeniusAlgEquivOfAlgebraic_pow` (Mathlib/FieldTheory/Finite/Basic.lean): n ↦ Frob^n is a bijection from Fin [L : K] onto Gal(L/K): the Galois group of a finite extension of finite fields is cyclic, generated by the q-power Frobenius.
- `mathlib:FiniteField.norm_surjective` (Mathlib/FieldTheory/Finite/GaloisField.lean): For finite fields K ⊂ K′, Algebra.norm K : K′ → K is surjective.
- `mathlib:LinearMap.det_restrictScalars` (Mathlib/RingTheory/Norm/Transitivity.lean): For S free over R and A free over S, and f : A →ₗ[S] A, det_R(f.restrictScalars R) = Algebra.norm R (det_S f).
- `mathlib:Matrix.card_GL_field` (Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Card.lean): Nat.card (GL (Fin n) 𝔽) = ∏_{i<n} (q^n − q^i) for a finite field 𝔽 with q elements.
- `mathlib:padicValNat.pow_sub_pow` (Mathlib/NumberTheory/Multiplicity.lean): Lifting the exponent for an odd prime p: if y < x, p ∣ x − y, p ∤ x and n ≠ 0, then v_p(x^n − y^n) = v_p(x − y) + v_p(n).
- `mathlib:Field.exists_primitive_element` (Mathlib/FieldTheory/PrimitiveElement.lean): A finite separable extension E/F has a primitive element: ∃ α, F⟮α⟯ = ⊤.
- `mathlib:IsGalois` (Mathlib/FieldTheory/Galois/Basic.lean): Galois extensions: separable and normal.
- `mathlib:IsGalois.card_aut_eq_finrank` (Mathlib/FieldTheory/Galois/Basic.lean): For a finite Galois extension E/F, #Gal(E/F) = [E : F].
- `mathlib:AdjoinRoot.tensorAlgEquiv` (Mathlib/RingTheory/AdjoinRoot.lean): Base change of AdjoinRoot: T ⊗_R AdjoinRoot p ≃ₐ[T] AdjoinRoot q when q is the image of p.
- `mathlib:Ideal.quotientInfRingEquivPiQuotient` (Mathlib/RingTheory/Ideal/Quotient/Operations.lean): Chinese remainder theorem: for pairwise coprime ideals f i, R ⧸ ⨅ f i ≃+* ∀ i, R ⧸ f i.
- `mathlib:Rep.FiniteCyclicGroup.groupCohomologyIsoEven` (Mathlib/RepresentationTheory/Homological/GroupCohomology/FiniteCyclic.lean): For a finite cyclic group G = ⟨g⟩ and A : Rep k G, H^i(G, A) for i even and nonzero is the homology of A →N A →(g − 1) A.
- `mathlib:Rep.FiniteCyclicGroup.groupCohomologyIsoOdd` (Mathlib/RepresentationTheory/Homological/GroupCohomology/FiniteCyclic.lean): For a finite cyclic group G = ⟨g⟩ and A : Rep k G, H^i(G, A) for i odd is the homology of A →(g − 1) A →N A.
- `mathlib:HenselianRing` (Mathlib/RingTheory/Henselian.lean): R is henselian at I: I ≤ Jacobson radical, and every monic f with a simple root a₀ modulo I has a root a ≡ a₀ mod I.
- `mathlib:HenselianLocalRing` (Mathlib/RingTheory/Henselian.lean): A local ring that is henselian at its maximal ideal.
- `mathlib:IsDiscreteValuationRing` (Mathlib/RingTheory/DiscreteValuationRing/Basic.lean): A local principal ideal domain that is not a field.
- `mathlib:IsLocalRing.ResidueField` (Mathlib/RingTheory/LocalRing/ResidueField/Defs.lean): The residue field R ⧸ 𝔪 of a local ring.
- `mathlib:IsLocalRing.residue` (Mathlib/RingTheory/LocalRing/ResidueField/Defs.lean): The quotient map R →+* ResidueField R.
- `mathlib:IsNonarchimedeanLocalField` (Mathlib/NumberTheory/LocalField/Basic.lean): A field with a valuative relation and topology that is a valuative topology, locally compact and nontrivial: finite extensions of ℚ_p and F_q((t)).
- `tauceti:TauCeti.henselianLocalRing_integer` (TauCeti/NumberTheory/LocalField/Henselian.lean): The integer ring 𝒪[K] of a nonarchimedean local field is a henselian local ring.
- `tauceti:IsDedekindDomain.HeightOneSpectrum.henselianLocalRing_adicCompletionIntegers` (TauCeti/RingTheory/DedekindDomain/AdicValuation/Completion.lean): The integers of the v-adic completion of a Dedekind domain form a henselian local ring.
- `tauceti:TauCeti.HenselianRing.exists_pow_eq_and_sub_one_mem_of_sub_one_mem` (TauCeti/RingTheory/Henselian.lean): In a ring henselian at J, for I ≤ J and n invertible, every w ≡ 1 mod I is a^n for some a ≡ 1 mod I.
- `tauceti:TauCeti.rootsOfUnityEquivResidueFieldUnits` (TauCeti/NumberTheory/LocalField/Teichmuller.lean): For a nonarchimedean local field K with residue field of cardinality q, reduction rootsOfUnity (q − 1) 𝒪[K] ≃* 𝓀[K]ˣ (Teichmüller).
- `tauceti:TauCeti.rootsOfUnityEquivResidueField` (TauCeti/RingTheory/RootsOfUnity/Henselian.lean): For a henselian local ring R and n invertible in R, reduction is an isomorphism rootsOfUnity n R ≃* rootsOfUnity n (ResidueField R).
- `mathlib:CommGroup.torsion` (Mathlib/GroupTheory/Torsion.lean): The torsion subgroup of an abelian group; μ(E) is CommGroup.torsion Eˣ.
- `mathlib:rootsOfUnity` (Mathlib/RingTheory/RootsOfUnity/Basic.lean): rootsOfUnity k M, the subgroup of Mˣ of elements with ζ^k = 1.
- `mathlib:rootsOfUnity.isCyclic` (Mathlib/RingTheory/RootsOfUnity/Basic.lean): rootsOfUnity k R is cyclic for a domain R.
- `mathlib:KaehlerDifferential` (Mathlib/RingTheory/Kaehler/Basic.lean): The module of Kähler differentials Ω[S⁄R]; Ω¹_E is Ω[E⁄ℤ].
- `mathlib:IsDedekindDomain.HeightOneSpectrum` (Mathlib/RingTheory/DedekindDomain/Ideal/Lemmas.lean): Height-one primes of a Dedekind domain: the finite places v of a number field F (for 𝓞_F).
- `mathlib:IsDedekindDomain.HeightOneSpectrum.adicCompletion` (Mathlib/RingTheory/DedekindDomain/AdicValuation.lean): The completion F_v of F for the v-adic valuation.
- `mathlib:IsDedekindDomain.HeightOneSpectrum.adicCompletionIntegers` (Mathlib/RingTheory/DedekindDomain/AdicValuation.lean): The ring of integers 𝓞_v of F_v, the valuation subring of the completed valuation.
- `mathlib:NumberField` (Mathlib/NumberTheory/NumberField/Basic.lean): Number fields (characteristic zero, finite over ℚ).
- `mathlib:Algebra.norm` (Mathlib/RingTheory/Norm/Defs.lean): The norm of a finite free algebra; the degree-one transfer of a finite field extension.
- `mathlib:IsLocalization.flat` (Mathlib/RingTheory/Flat/Localization.lean): A localisation of R is a flat R-module; used for R → R_𝔭.
- `mathlib:IsDedekindDomain.flat_iff_torsion_eq_bot` (Mathlib/RingTheory/Flat/TorsionFree.lean): Over a Dedekind domain a module is flat iff it is torsion-free; used for 𝓞_(v) → 𝓞_v.
- `tauceti:TauCeti.teichmuller` (TauCeti/NumberTheory/LocalField/Teichmuller.lean): The Teichmüller lift 𝓀[K]ˣ →* 𝒪[K]ˣ of a nonarchimedean local field, with image the (q − 1)-st roots of unity.
- `tauceti:TauCeti.residue_teichmuller` (TauCeti/NumberTheory/LocalField/Teichmuller.lean): The Teichmüller lift is a section of reduction: residue (teichmuller K α) = α.
- `tauceti:TauCeti.eq_teichmuller` (TauCeti/NumberTheory/LocalField/Teichmuller.lean): A (q − 1)-torsion unit of 𝒪[K] reducing to α is teichmuller K α.
- `tauceti:TauCeti.rootsOfUnityFieldEquivResidueFieldUnits` (TauCeti/NumberTheory/LocalField/Teichmuller.lean): Reduction identifies rootsOfUnity (q − 1) K with 𝓀[K]ˣ.
- `tauceti:TauCeti.isUnit_natCard_residueField_sub_one` (TauCeti/NumberTheory/LocalField/Teichmuller.lean): q − 1 is a unit of 𝒪[K] (it reduces to −1).
- `tauceti:TauCeti.exists_eq_mul_zpow_of_irreducible` (TauCeti/NumberTheory/LocalField/NormalizedValuation.lean): For an irreducible π of 𝒪[K], every x ∈ Kˣ is a unit times a power of π.
- `tauceti:IsDedekindDomain.HeightOneSpectrum.adicCompletionExtension` (TauCeti/RingTheory/DedekindDomain/AdicCompletionExtension.lean): For w over v, the ring homomorphism K_v →+* L_w continuously extending K → L.
- `tauceti:IsDedekindDomain.HeightOneSpectrum.adicCompletionExtension_coe` (TauCeti/RingTheory/DedekindDomain/AdicCompletionExtension.lean): The square K → K_v → L_w, K → L → L_w commutes.
- `tauceti:IsDedekindDomain.HeightOneSpectrum.isNonarchimedeanLocalField_adicCompletion` (TauCeti/RingTheory/DedekindDomain/AdicValuation/ValuativeRel.lean): An adic completion with finite residue field is a nonarchimedean local field.
- `tauceti:IsDedekindDomain.HeightOneSpectrum.residueFieldEquivAdicCompletion` (TauCeti/RingTheory/DedekindDomain/AdicValuation/ValuativeRel.lean): (R ⧸ v) ≃+* 𝓀[K_v], the residue field of the completion.
- `tauceti:IsDedekindDomain.HeightOneSpectrum.residueFieldEquivAdicCompletionIntegers` (TauCeti/RingTheory/DedekindDomain/AdicValuation/Completion.lean): The residue field R ⧸ v is the residue field of the completed integers 𝓞_v.
- `tauceti:TauCeti.kummerMap` (TauCeti/FieldTheory/GaloisCohomology/Kummer.lean): The Kummer map Kˣ → H¹(G_K, μ_n) for n invertible in K: the degree-one étale Chern class.
- `mathlib:DividedPowerAlgebra` (Mathlib/RingTheory/DividedPowerAlgebra/Init.lean): The divided power algebra Γ_R(M) of an R-module M, the quotient of a polynomial ring on ℕ × M by the divided power relations.
- `mathlib:DualNumber` (Mathlib/Algebra/DualNumber.lean): The dual numbers R[ε] = TrivSqZeroExt R R, with ε² = 0.
- `mathlib:ExteriorAlgebra` (Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean): The exterior algebra Λ_R M of an R-module M (the Clifford algebra of the zero quadratic form).
- `mathlib:Ideal.exists_pow_inf_eq_pow_smul` (Mathlib/RingTheory/Filtration.lean): The Artin–Rees lemma: for R noetherian, M finite and N ⊂ M there is k with I^n M ∩ N = I^{n−k}(I^k M ∩ N) for n ≥ k.
- `mathlib:IsAdicComplete` (Mathlib/RingTheory/AdicCompletion/Basic.lean): An R-module M is I-adically complete: Hausdorff and precomplete for the I-adic topology.
- `mathlib:IsNoetherianRing` (Mathlib/RingTheory/Noetherian/Defs.lean): A (semi)ring is Noetherian if all its ideals are finitely generated.
- `mathlib:KaehlerDifferential.D` (Mathlib/RingTheory/Kaehler/Basic.lean): The universal derivation D: S → Ω[S⁄R] of an R-algebra S; for R = Z it is the target of Connes' operator on HH_0 = A.
- `mathlib:MonoidAlgebra` (Mathlib/Algebra/MonoidAlgebra/Defs.lean): The monoid algebra R[M] of a monoid M over a semiring R (finitely supported functions with convolution product); the pointed monoid algebra A(Π) = A[Π]/A·{0} is its quotient by the base point.
- `mathlib:PerfectRing` (Mathlib/FieldTheory/Perfect.lean): PerfectRing R p: the p-th power map of R is bijective.
- `mathlib:Polynomial.IsEisensteinAt` (Mathlib/RingTheory/Polynomial/Eisenstein/Basic.lean): f ∈ R[X] is Eisenstein at an ideal 𝓟: leading coefficient ∉ 𝓟, lower coefficients ∈ 𝓟, constant coefficient ∉ 𝓟².
- `mathlib:PowerSeries` (Mathlib/RingTheory/PowerSeries/Basic.lean): Formal power series R⟦X⟧ in one variable over a semiring R; the big Witt vectors of HM are (1 + xk⟦x⟧)^× modulo (1 + x^{m+1}k⟦x⟧)^×.
- `mathlib:TruncatedWittVector` (Mathlib/RingTheory/WittVector/Truncated.lean): TruncatedWittVector p n R, the p-typical Witt vectors of length n (functions Fin n → R), a commutative ring for p prime; this is W_n(R) of HM.
- `mathlib:TruncatedWittVector.truncate` (Mathlib/RingTheory/WittVector/Truncated.lean): The ring homomorphism TruncatedWittVector p m R → TruncatedWittVector p n R for n ≤ m, compatible with WittVector.truncate: the restriction map R of Witt vectors.
- `mathlib:WittVector.equiv` (Mathlib/RingTheory/WittVector/Compare.lean): The ring isomorphism 𝕎 (ZMod p) ≃+* ℤ_[p].
- `mathlib:WittVector.fontaineTheta` (Mathlib/RingTheory/Perfectoid/FontaineTheta.lean): Fontaine's map θ: 𝕎 R♭ →+* R for a p-adically complete ring R, the limit of the maps 𝕎 R♭ → R/p^{n+1}.
- `mathlib:WittVector.frobenius` (Mathlib/RingTheory/WittVector/Frobenius.lean): The Witt vector Frobenius 𝕎 R →+* 𝕎 R, defined by the Frobenius polynomials for every commutative ring R (for R of characteristic p it is WittVector.map of the p-th power map).
- `mathlib:WittVector.ghostMap` (Mathlib/RingTheory/WittVector/Basic.lean): The ghost map 𝕎 R →+* (ℕ → R), a ring homomorphism sending a Witt vector to its ghost components w_n = Σ p^i a_i^{p^{n−i}}.
- `mathlib:WittVector.isDiscreteValuationRing` (Mathlib/RingTheory/WittVector/DiscreteValuationRing.lean): For k a perfect field of characteristic p, 𝕎 k is a discrete valuation ring (instance), with p irreducible.
- `mathlib:WittVector.teichmuller` (Mathlib/RingTheory/WittVector/Teichmuller.lean): The Teichmüller lift R →* 𝕎 R, a monoid homomorphism with 0-th coefficient r and all others 0 (HM's multiplicative section a ↦ [a] before truncation).
- `mathlib:WittVector.verschiebung` (Mathlib/RingTheory/WittVector/Verschiebung.lean): The Verschiebung 𝕎 R →+ 𝕎 R shifting coefficients up by one (an additive homomorphism).
- `mathlib:groupCohomology` (Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean): Group cohomology H^n(G, A) of a k-linear G-representation A, as cohomology of inhomogeneous cochains.
- `mathlib:tateCohomology` (Mathlib/RepresentationTheory/Homological/TateCohomology/Basic.lean): Tate cohomology tateCohomology M n (n ∈ ℤ) of a representation M of a finite group, defined from the Tate complex splicing inhomogeneous chains and cochains by the norm.
- `tauceti:Rep.FiniteCyclicGroup.periodicIso` (TauCeti/RepresentationTheory/Homological/TateCohomology/Periodic.lean): For a finite cyclic group G and a representation M, tateCohomology M m ≅ tateCohomology M n whenever m ≡ n mod 2 (two-periodicity).
- `tauceti:TauCeti.kummerClassMap_injective` (TauCeti/FieldTheory/GaloisCohomology/Kummer.lean): For n invertible in the field K, the Kummer map Kˣ ⧸ (Kˣ)ⁿ → H¹(G_K, μ_n) is injective (surjectivity, Hilbert 90, is not in the library).
- `mathlib:PadicInt` (Mathlib/NumberTheory/Padics/PadicIntegers.lean): The p-adic integers ℤ_[p], the coefficient ring of the completed K-groups and of H^j(L, ℤ_p(i)).
- `mathlib:DivisibleBy` (Mathlib/GroupTheory/Divisible.lean): Divisibility of an additive monoid by a set of scalars with an explicit division function; the divisible subgroups whose supremum is Div(A).
- `mathlib:AddCommGrpCat.injective_of_divisible` (Mathlib/Algebra/Category/Grp/Injective.lean): A divisible abelian group is injective in AddCommGrpCat, so the divisible part of an abelian group is a direct summand.
- `mathlib:AddSubgroup.torsionBy` (Mathlib/Algebra/Module/Torsion/Basic.lean): The n-torsion subgroup A[n] of an additive abelian group, the terms of the Tate-module tower.
- `mathlib:cyclotomicCharacter` (Mathlib/NumberTheory/Cyclotomic/CyclotomicCharacter.lean): The p-adic cyclotomic character (L ≃+* L) →* ℤ_[p]ˣ, through which G_L acts on the Tate twists.
- `mathlib:IsCyclotomicExtension` (Mathlib/NumberTheory/Cyclotomic/Basic.lean): Cyclotomic extensions, for L(ζ_p) and L(√−1) in the w-invariant formulas.
- `mathlib:continuousCohomology` (Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean): Continuous cohomology of a topological representation, the carrier for H^j(L, M).
- `mathlib:ContinuousCohomology.zeroIso` (Mathlib/RepresentationTheory/Homological/ContCohomology/LowDegree.lean): The identification of H^0 with the invariants.
- `mathlib:Module.finrank` (Mathlib/LinearAlgebra/Dimension/Finrank.lean): The rank of a module, used for the ℤ_p-rank [L : ℚ_p] of H^1(L, ℤ_p(i)) and K_{2i−1}(L; ℤ_p).
- `mathlib:WittVector` (Mathlib/RingTheory/WittVector/Defs.lean): p-typical Witt vectors W(R); W(𝔽_q) is the factor of the big Witt vectors describing K_1(𝔽_q[[t]], (t); ℤ_p).
- `tauceti:TauCeti.ContCohomology.H0` (TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean): The degree-zero explicit continuous cohomology, the fixed-point subgroup M^G.
- `tauceti:TauCeti.kummerClassMap` (TauCeti/FieldTheory/GaloisCohomology/Kummer.lean): The Kummer map K^×/(K^×)^n → H^1(G_K, μ_n), proved injective; surjectivity (Hilbert 90) is not in the baseline and is requested from ClassFieldTheory Layer 5 (kummerEquiv_mixed).
- `mathlib:FiniteField.algebraMap_norm_eq_pow` (Mathlib/FieldTheory/Finite/GaloisField.lean): For finite fields K ⊆ K′, algebraMap K K′ (Algebra.norm K x) = x^((|K′| − 1)/(|K| − 1)): the field norm as a power, the degree-one transfer formula.

## Layer overview

| Layer | Title | Nodes | Planets | Coverage |
|---|---|---|---|---|
| L.1 | Quillen's finite-field calculation | 39 | 6 | partial |
| L.2 | Henselian local rings away from the residue characteristic | 17 | 6 | partial |
| L.3 | Integral K₂ of local fields | 18 | 6 | partial |
| L.4 | Trace constructions | 35 | 6 | partial |
| L.5 | Witt vectors and residue-characteristic calculations | 83 | 6 | partial |
| L.6 | Local higher K-groups | 41 | 5 | partial |
| L.7 | Local-to-global compatibility | 11 | 6 | partial |

Each layer section below opens with the layer's coverage record, then states every node: its statement and hypotheses, the proof outline, for definitions and constructions the API and the unit tests, its acceptance checks, its dependencies and its sources.

## L.1 — Quillen's finite-field calculation

*Coverage: partial.* Quillen's calculation is decomposed along Quillen's own route as written out by Haine and Mestel: the Brauer character and Brauer lifting (with Green's theorem cited), its ψ^q-invariance, λ-compatibility, stabilisation and the lift of F_{q^r}; the homotopy fixed points FΨ^q, its homotopy groups and the lifting bijection; Quillen's map θ; the cohomology of FΨ^q (additively for every ℓ ≠ p, as a ring for odd ℓ); the Sylow count and the detection theorem for H^*(GL_n(F_q); F_ℓ) at odd ℓ; the integral homology equivalence; Theorem IV.1.12 and Corollary IV.1.13. The Adams/Frobenius comparison is proved on FΨ^q (Frobenius corresponds to ψ̃^p) and, in the K-book's form, through the Quillen–Hiller operations imported from SchemeKTheoryOperations S.6. Restriction and transfer are constructed in both models; the Galois formulas (Ex. IV.6.13, through the splitting of ℓ ⊗_k ℓ), the Galois action, injectivity onto the invariants and surjectivity of transfer are proved without choosing a generator. The determinant in degree one is imported from KTheoryLowDegrees U.6 and compared with the norm (U.5); the degree-two symbol calculation is recovered in Quillen's model and compared with K2SymbolsBrauer T.2/k2-finite-field as an acceptance check (see restructure for why it is not a prerequisite). K_0(F_q) = Z is the baseline TauCeti.SplitK0.finrankEquiv (with KTheoryLowDegrees Z.2). Finite coefficients (K(R)/m, the Bott element, products) are planned here because no stage owned them (ArithmeticKTheory N.1's gap), together with K_*(F_q; Z/m), Browder's ring (cited) and the algebraic closure. Topological K-theory and Bott periodicity are imported from RefinedTraceMethods RT.4:topological, the plus construction from StableHomotopyKTheory H.3 and GeneralAlgebraicKTheory K.2:plus, the Bockstein sequence from StableHomotopyKTheory H.6.

- Remaining: Quillen's vanishing of H̃_*(GL(F_q); F_p) (Quillen 1972, §11): gap, node L.1/gl-mod-p-acyclic.
- Remaining: The prime ℓ = 2 (q odd) in the cohomology comparison: gap, nodes L.1/fpsi-cohomology-ring, L.1/gl-cohomology-detection, L.1/quillen-homology-iso.
- Remaining: Quillen's Lemma 12 (abelian ℓ-subgroups of GL_n(F_q) are conjugate into C^m) and Quillen's detection for wreath products (The Adams conjecture, Prop. 3.4): gap, node L.1/gl-cohomology-detection.
- Remaining: Green's theorem on Brauer characters: gap, node L.1/green-virtual-character.
- Remaining: Browder's mod-ℓ ring structure and scholium; Araki–Toda multiplications on Moore spectra: gaps, nodes L.1/browder-mod-l-ring and L.1/mod-m-products (the latter also requested from StableHomotopyKTheory H.6).
- Remaining: Answers to the requests to RefinedTraceMethods RT.4:topological (Adams operations on BU, Atiyah map, K̃U^1(BG) = 0; proposed as a Part II), StableHomotopyKTheory H.6 (Moore multiplications, Eilenberg–Moore spectral sequence), SchemeKTheoryOperations S.6 (Quillen–Hiller operations and Hiller's universality), GeneralAlgebraicKTheory K.7, KTheoryLowDegrees U.5 and U.6.
- Remaining: Re-derive Mestel's Lemmas 26–29 (the classes c_i(W), e_{jr}(W) and the product formula) against Quillen 1972 §§8–9 before implementation (gap on the expository source).
- Remaining: Once K2SymbolsBrauer--T.1 cites GeneralAlgebraicKTheory K.2:plus instead of the umbrella K.2 (restructure), add K2SymbolsBrauer:T.2/k2-finite-field and K2SymbolsBrauer:T.1/k2-pi2 as prerequisites of L.1/degree-two-symbols.

### K-theory of a ring with coefficients Z/m

`L.1/k-theory-mod-m` · definition · planet “K-theory with finite coefficients”

Let R be a ring with unit and m ≥ 1 an integer. Let K(R) be the connective algebraic K-theory spectrum of R (GeneralAlgebraicKTheory K.1 and K.2:plus: its zeroth space is ΩBQP(R) ≃ K_0(R) × BGL(R)^+). Define K(R; Z/m) = K(R)/m, the cofibre of multiplication by m on K(R) (StableHomotopyKTheory H.6), equivalently K(R) ∧ P^∞(Z/m) with P^∞(Z/m) the mod-m Moore spectrum, and K_n(R; Z/m) = π_n(K(R)/m) for n ∈ Z. Because K(R) is connective, K_n(R; Z/m) = 0 for n < 0 and K_0(R; Z/m) = K_0(R)/m. The construction is a functor from rings to spectra: a ring map f: R → S gives f_*: K(R)/m → K(S)/m. For n ≥ 2, K_n(R; Z/m) is the group [P^n(Z/m), BGL(R)^+] of based homotopy classes from the mod-m Moore space (K-book Definition IV.2.1), and the two descriptions agree through the zeroth-space identification of K.2:plus. This convention (the connective spectrum) is the one used throughout L.1 and L.2; K_0 and negative degrees of other deloopings are not used.

**Hypotheses.**

- R is a ring with unit (commutative whenever products are used); m ≥ 1.
- K(R) is the connective K-theory spectrum of GeneralAlgebraicKTheory; negative K-groups are not part of this object.

**Proof.**

1. Take the connective spectrum K(R) from the iterated S- or Q-construction (StableHomotopyKTheory:H.5:S-delooping/iterated-S-construction-omega-spectrum; GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q for the identification of its zeroth space with K_0(R) × BGL(R)^+).
2. Apply the mod-m cofibre E ↦ E/m of StableHomotopyKTheory H.6 (StableHomotopyKTheory:H.6/mod-l-homotopy-and-bockstein-sequence), which is a functor on spectra; K(R)/m is therefore a functor of R.
3. The universal coefficient (Bockstein) sequence 0 → K_n(R)/m → K_n(R; Z/m) → mK_{n−1}(R) → 0 is the H.6 sequence for E = K(R); it holds for every n ∈ Z and is split, not naturally, when m ≢ 2 (mod 4).
4. Transfer: for f: R → S with S finitely generated projective as an R-module, the exact functor P(S) → P(R) induces f_*: K(S) → K(R) (GeneralAlgebraicKTheory:K.3/resolution-theorem, transfers), hence f_*: K(S)/m → K(R)/m.
5. Filtered colimits: K(−) commutes with filtered colimits of rings (GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories) and so does E ↦ E/m, because it is a cofibre; hence K_n(colim R_α; Z/m) = colim K_n(R_α; Z/m).
6. Coprime decomposition: if m = m_1 m_2 with gcd(m_1, m_2) = 1 then K_n(R; Z/m) ≅ K_n(R; Z/m_1) × K_n(R; Z/m_2) naturally (K-book Proposition IV.2.7, with its misprint corrected; see sourceIssues).

**API.**

- `TauCeti.KTheory.coeff` (data): The spectrum K(R)/m, functorial in the ring R.
- `TauCeti.KTheory.coeffGroup` (data): K_n(R; Z/m) = π_n(K(R)/m) for n ∈ Z.
- `TauCeti.KTheory.coeffGroup_neg` (simp): K_n(R; Z/m) = 0 for n < 0.
- `TauCeti.KTheory.coeffGroup_zero` (characterisation): K_0(R; Z/m) ≅ K_0(R)/m.
- `TauCeti.KTheory.reduce` (projection): The reduction K_n(R) → K_n(R; Z/m), inducing K_n(R)/m ↪ K_n(R; Z/m).
- `TauCeti.KTheory.bockstein` (projection): The Bockstein ∂: K_n(R; Z/m) → mK_{n−1}(R) ⊂ K_{n−1}(R).
- `TauCeti.KTheory.coeff_exact` (relation): 0 → K_n(R)/m → K_n(R; Z/m) → mK_{n−1}(R) → 0 is exact for every n (H.6).
- `TauCeti.KTheory.coeff_map_comp` (functoriality): (g ∘ f)_* = g_* ∘ f_* and id_* = id on K_*(−; Z/m).
- `TauCeti.KTheory.coeffTransfer` (functoriality): For S finitely generated projective over R, the transfer K_n(S; Z/m) → K_n(R; Z/m), compatible with reduction and Bockstein.
- `TauCeti.KTheory.coeff_colim` (compatibility): K_n(colim_α R_α; Z/m) ≅ colim_α K_n(R_α; Z/m) for a filtered system of rings.
- `TauCeti.KTheory.coeff_change` (functoriality): For m | m′ the maps K_n(R; Z/m) → K_n(R; Z/m′) (induced by Z/m → Z/m′, a ↦ (m′/m)a) and K_n(R; Z/m′) → K_n(R; Z/m) (reduction), compatible with the Bockstein sequences.
- `TauCeti.KTheory.coeff_coprime` (equivalence): For coprime m_1, m_2, K_n(R; Z/m_1m_2) ≅ K_n(R; Z/m_1) × K_n(R; Z/m_2).
- `TauCeti.KTheory.coeff_module` (structure): For R commutative, K_*(R; Z/m) is a graded K_*(R)-module through K(R) ∧ K(R)/m → K(R)/m (K-book Ex. IV.2.5), and reduction is K_*(R)-linear.

**Unit tests.**

- `TauCeti.KTheory.coeffGroup_one_field` (computation): For F = F_5 and m = 4, K_1(F_5; Z/4) ≅ F_5^×/F_5^{×4} ≅ Z/4.
- `TauCeti.KTheory.coeffGroup_one_modulus` (degenerate): For m = 1, K(R)/1 ≃ 0, so K_n(R; Z/1) = 0 for every n.
- `TauCeti.KTheory.coeffGroup_zero_field` (compatibility): For a field F, K_0(F; Z/m) ≅ SplitK0(FGModuleCat F)/m ≅ Z/m, compatibly with TauCeti.SplitK0.finrankEquiv.
- `TauCeti.KTheory.coeff_not_tensor` (non-example): K_2(F_3; Z/2) ≅ Z/2 (it is 2K_1(F_3) = {±1}) while K_2(F_3) ⊗ Z/2 = 0; defining K_n(R; Z/m) as K_n(R) ⊗ Z/m fails.
- `TauCeti.KTheory.coeff_integers_two` (non-example): K_2(Z; Z/2) ≅ Z/4 (K-book Example IV.2.5.1): the group is not a Z/2-module, so K_*(R; Z/2) is not the homotopy of a Z/2-module spectrum in general.

**Acceptance.**

- For a field F and m ≥ 1, K_1(F; Z/m) ≅ F^×/F^{×m}, because K_0(F) = Z has no m-torsion.
- K_2(F_q; Z/ℓ) ≅ Z/ℓ when ℓ divides q − 1, although K_2(F_q) ⊗ Z/ℓ = 0: finite coefficients are not the tensor product.

**Used by.**

- K-book IV.2 and Remark IV.1.13.1: the mod-ℓ groups K_*(F_q; Z/ℓ) and the Bott element live here
- L.2/gabber-rigidity: rigidity is an equivalence K(R)/m ≃ K(R/I)/m
- L.2/henselian-dvr-mod-m-splitting and L.2/mod-m-local-field-ring: the mod-m localisation sequence of a DVR
- ArithmeticKTheory N.5 (Soulé's theorem, K-book V.6.8): K_n(R; Z/ℓ) with its product and Bott element; the N.1 packet records that no stage owned it
- HabiroNumberFields HB.1: finite-coefficient K_3 and its Chern class
- MotivicEtaleKTheory M.7: étale K-theory is built by descent of finite-coefficient K-theory spectra

**Depends on.** other roadmaps: `StableHomotopyKTheory:H.6/mod-l-homotopy-and-bockstein-sequence`, `StableHomotopyKTheory:H.5:S-delooping/iterated-S-construction-omega-spectrum`, `GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q`, `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`, `GeneralAlgebraicKTheory:K.3/resolution-theorem`, `GeneralAlgebraicKTheory:K.7/biexact-pairings-and-products`; libraries: `tauceti:TauCeti.SplitK0.finrankEquiv`.

**Sources.**

- `Kbook.2013`, Definition IV.2.4 (PDF p. 288): “Definition 2.4. The mod ℓ K-groups of R are defined to be the abelian group: K_m(R; Z/ℓ) = π_m(K(R); Z/ℓ), m ∈ Z.” — The definition; this node fixes K(R) as the connective spectrum.
- `Kbook.2013`, Universal Coefficient Theorem IV.2.5 (PDF p. 288): “Universal Coefficient Theorem 2.5. There is a short exact sequence 0 → K_m(R) ⊗ Z/ℓ → K_m(R; Z/ℓ) → ℓK_{m−1}(R) → 0 for every m ∈ Z, C, and ℓ. It is split exact unless ℓ ≡ 2 mod 4.” — The Bockstein sequence of the API.
- `Kbook.2013`, Example IV.2.3.1 (PDF p. 287): “If E is a spectrum, then (by S-duality) the homotopy groups π_*(E; Z/ℓ)” — Finite-coefficient homotopy of a spectrum is that of E ∧ P^∞(Z/ℓ).
- `Kbook.2013`, Exercise IV.2.5 (PDF p. 292): “Show that K_*(R; Z/ℓ^ν) is a graded module over K_*(R), associated to the evident pairing” — The module structure of the API.
- `Kbook.2013`, Example IV.2.5.1 (PDF p. 288): “K_2(Z; Z/2) ≅ K_2(R; Z/2) ≅ π_2(BO; Z/2) = Z/4.” — The non-example test.

### Products on K-theory with coefficients

`L.1/mod-m-products` · theorem

Let R be a commutative ring, ℓ a prime and ν ≥ 1 with ℓ^ν ∉ {2, 3, 4, 8}. Then K(R)/ℓ^ν is a homotopy associative and homotopy commutative ring spectrum, so K_*(R; Z/ℓ^ν) is a graded-commutative ring, natural in R, and the reduction K_*(R) → K_*(R; Z/ℓ^ν) is a ring homomorphism. For a spectrum E with π_n(E) = 0 for all even n > 0 and all n < 0 the same conclusion holds for every ℓ^ν, including 2, 3, 4 and 8 (Browder's scholium); in particular K_*(F_q; Z/ℓ^ν) is a graded-commutative ring for every ℓ^ν. For general m ≢ 2 (mod 4) the ring structure on K_*(R; Z/m) is defined through the coprime decomposition into prime powers, each outside {2, 3, 4, 8} after replacing m by a multiple when needed.

**Hypotheses.**

- R commutative; ℓ^ν ∉ {2, 3, 4, 8} for the general statement.
- For Browder's case, E = K(F_q) uses K_{2i}(F_q) = 0 for i ≥ 1 (L.1/quillen-k-groups).

**Proof.**

1. K(R) is a homotopy commutative ring spectrum for R commutative (GeneralAlgebraicKTheory K.7 products; StableHomotopyKTheory H.5:S-delooping smash products). Requested: GeneralAlgebraicKTheory K.7.
2. The Moore spectrum P^∞(Z/ℓ^ν) carries a homotopy associative and commutative multiplication for ℓ^ν ∉ {2, 3, 4, 8} (Araki–Toda; the K-book cites Neisendorfer 8.5–8.6 by S-duality). Requested from StableHomotopyKTheory H.6, whose text defines E/m but not its multiplication.
3. The smash product of two homotopy commutative ring spectra is one; K(R)/ℓ^ν = K(R) ∧ P^∞(Z/ℓ^ν).
4. Browder's scholium for spectra with vanishing positive even homotopy is cited from Browder [Br, 1.8] by the K-book and not proved there; it is recorded as a gap. It is used only for K(F_q) at ℓ^ν ∈ {2, 3, 4, 8}.

**Acceptance.**

- For R = Z and ℓ^ν = 2 the conclusion fails in the sense that K_2(Z; Z/2) ≅ Z/4 is not killed by 2, so no unital Z/2-algebra structure on K_*(Z; Z/2) exists; the theorem excludes ℓ^ν = 2.
- For R = F_q with ℓ | q − 1 the product ζ·ζ of the class ζ ∈ K_1(F_q; Z/ℓ) of a generator is the reduction of the integral symbol {ζ, ζ} ∈ K_2(F_q) = 0, hence zero.

**Depends on.** this roadmap: `L.1/k-theory-mod-m`; other roadmaps: `GeneralAlgebraicKTheory:K.7/biexact-pairings-and-products`, `GeneralAlgebraicKTheory:K.7`, `StableHomotopyKTheory:H.6`.

**Sources.**

- `Kbook.2013`, Theorem IV.2.8 (PDF p. 290): “Theorem 2.8. Let R be a commutative ring, and suppose ℓ^ν ≠ 2, 3, 4, 8. Then K(R) ∧ P^∞(Z/ℓ^ν) is a homotopy associative and commutative ring spectrum. In particular, K_*(R; Z/ℓ^ν) is a graded-commutative ring.” — The main statement.
- `Kbook.2013`, Scholium IV.2.8.1 (PDF p. 290): “has observed that if π_m(E) = 0 for all even m > 0 (and m < 0) then E ∧ P^∞(Z/ℓ^ν) is a homotopy associative and commutative ring spectrum even for ℓ^ν = 2, 3, 4, 8. This applies in particular to E = K(F_q)” — Browder's scholium, cited by the source.
- `Kbook.2013`, IV.2, Products (PDF p. 289): “So from now on, we shall exclude the pathological cases ℓ^ν = 2, 3, 4, 8.” — The excluded moduli.

### The Bott element of a primitive root of unity

`L.1/bott-element` · construction · planet “Bott element”

Let R be a commutative ring, m ≥ 2, and ω ∈ R^× a root of unity of order exactly m, generating the subgroup μ_m ⊂ R^× it spans. The Bott element β_ω ∈ K_2(R; Z/m) is the image of the class of the map P^2(Z/m) → Bμ_m classifying the homomorphism Z/m = H_1(P^2(Z/m)) → μ_m, 1 ↦ ω, under Bμ_m → BGL_1(R) → BGL(R) → BGL(R)^+ (K-book Remark IV.2.5.3; P^2(Z/m) = S^1 ∪_m e^2). Its Bockstein is ∂β_ω = [ω] ∈ mK_1(R), and it is natural: a ring map f: R → S sends β_ω to β_{f(ω)}. The Universal Coefficient Theorem alone determines a lift of [ω] only up to K_2(R)/m; the construction through Bμ_m removes this choice, and the Bott element depends on ω only, not on a splitting.

**Hypotheses.**

- R commutative; ω has order exactly m in R^×; m ≥ 2.
- Products and powers β^k are used only where L.1/mod-m-products applies.

**Proof.**

1. The Moore space P^2(Z/m) is S^1 with a 2-cell attached by a degree-m map; a based map P^2(Z/m) → Bμ_m = K(μ_m, 1) is the same as a homomorphism H_1(P^2(Z/m)) = Z/m → μ_m. Take the one sending 1 to ω.
2. Compose with Bμ_m → BGL_1(R) → BGL(R) → BGL(R)^+ to obtain an element of [P^2(Z/m), BGL(R)^+], a group because BGL(R)^+ is an H-space, which is K_2(R; Z/m) (L.1/k-theory-mod-m, using the zeroth-space identification of GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q).
3. Bockstein: restricting along S^1 → P^2(Z/m) gives the loop ω ∈ π_1(Bμ_m), whose image in π_1 BGL(R)^+ = K_1(R) is [ω]; this is ∂β_ω, and m[ω] = [ω^m] = 0.
4. Naturality in R follows from the naturality of BGL(−)^+ (StableHomotopyKTheory:H.3/plus-construction-universal-property).
5. The K-book states that ω ↦ β_ω is a homomorphism μ_m → K_2(R; Z/m) unless m ≡ 2 (mod 4) ('a posteriori'); this is cited, not proved, and is not used below except through L.1/browder-mod-l-ring.

**API.**

- `TauCeti.KTheory.bott` (constructor): β_ω ∈ K_2(R; Z/m) for ω of order exactly m in R^×.
- `TauCeti.KTheory.bockstein_bott` (simp): ∂β_ω = [ω] ∈ K_1(R).
- `TauCeti.KTheory.map_bott` (functoriality): f_*(β_ω) = β_{f(ω)} for a ring map f: R → S.
- `TauCeti.KTheory.bott_pow_change` (relation): For m | m′ and ω′ of order m′ with ω′^{m′/m} = ω, reduction K_2(R; Z/m′) → K_2(R; Z/m) sends β_{ω′} to β_ω.
- `TauCeti.KTheory.bott_eq_of_split` (compatibility): β_ω is one of the lifts of [ω] provided by the Universal Coefficient Theorem; any other lift differs from it by an element of K_2(R)/m.
- `TauCeti.KTheory.bott_mul` (relation): For m ≢ 2 (mod 4), ω ↦ β_ω, defined for every ω ∈ μ_m through the inclusion μ_m ⊂ GL_1(R), is a group homomorphism μ_m → K_2(R; ℤ/m); the Bott element is β_ω for ω of exact order m (K-book Remark IV.2.5.3, cited).

**Unit tests.**

- `TauCeti.KTheory.bott_integers_two_order` (non-example): For R = Z, m = 2: β_{−1} has order 4 in K_2(Z; Z/2) ≅ Z/4, and 2β_{−1} is the image of {−1, −1}; a construction landing in a Z/2-module fails.
- `TauCeti.KTheory.bott_finiteField_generates` (computation): For R = F_5, m = 4, ω = 2 (of order 4): β_2 generates K_2(F_5; Z/4) ≅ Z/4, its Bockstein being [2] ∈ 4K_1(F_5) = F_5^×.
- `TauCeti.KTheory.bockstein_bott_units` (compatibility): Under K_1(R) → R^× (determinant, for R commutative local), ∂β_ω = ω.
- `TauCeti.KTheory.bott_trivial_modulus` (degenerate): For m = 2 and R a field of characteristic 2 there is no ω of order 2, and no Bott element is defined; for R = F_3, m = 2, β_{−1} generates K_2(F_3; Z/2) ≅ Z/2.

**Acceptance.**

- For R = Z and m = 2, ω = −1: β_{−1} ∈ K_2(Z; Z/2) ≅ Z/4 has 2β_{−1} = {−1, −1} ≠ 0 (K-book Ex. IV.2.4(b)), so β_{−1} has order 4.
- For R = F_q with m | q − 1, β_ω generates K_2(F_q; Z/m) ≅ mK_1(F_q) ≅ Z/m, since its Bockstein [ω] generates μ_m.

**Used by.**

- K-book Remark IV.1.13.1 and L.1/browder-mod-l-ring: β generates the even part of K_*(F_q; Z/ℓ) as a polynomial ring
- L.2/mod-m-local-field-ring (K-book Proposition V.6.10): K_*(E; Z/m) is a module over Z/m[β]
- Weibel Handbook I.5, Example 17: the Harris–Segal map restricted to Z/ℓ^ν is ζ^{⊗i} ↦ β^i followed by the Bockstein (ArithmeticKTheory N.5)
- K-book Proposition V.6.8.1 (Soulé): multiplication by β^{i−1} moves classes from K_1 to K_{2i−1} with coefficients (ArithmeticKTheory N.5)
- HabiroNumberFields HB.2: 'Construct ... the Bott element and Soulé's Chern-product formula'

**Depends on.** this roadmap: `L.1/k-theory-mod-m`; other roadmaps: `GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q`, `StableHomotopyKTheory:H.3/plus-construction-universal-property`, `StableHomotopyKTheory:H.6/mod-l-homotopy-and-bockstein-sequence`.

**Sources.**

- `Kbook.2013`, Example IV.2.5.2 (PDF p. 288): “Suppose that R contains a primitive ℓth root of unity ζ. The Universal Coefficient Theorem 2.5 provides an element β ∈ K_2(R; Z/ℓ), mapping to ζ ∈ ℓK_1(R). This element is called the Bott element” — The Bott element and its Bockstein.
- `Kbook.2013`, Remark IV.2.5.3 (PDF p. 289): “One way to choose β is to observe that the inclusion of µ_ℓ in GL_1(R) induces a map Bµ_ℓ → BGL(R) → BGL(R)^+ and therefore a set function µ_ℓ → K_2(R; Z/ℓ).” — The construction used here.
- `Kbook.2013`, Remark IV.2.5.3 (PDF p. 289): “A posteriori, it turns out that this is a group homomorphism unless ℓ ≡ 2 (mod 4).” — The additivity API item, cited.
- `Kbook.2013`, Exercise IV.2.4(b) (PDF p. 292): “is nonzero on β and 2β = {−1, −1}, but zero on 3β.” — The order-4 test for R = Z, m = 2.

### The Brauer character of a modular representation

`L.1/brauer-character` · definition

Fix an injective group homomorphism ι: \bar F_p^× → C^× (it exists: \bar F_p^× is the group of roots of unity of order prime to p, and C^× contains a unique copy of it; it is a choice, fixed once for L.1). Let G be a finite group and V a finite-dimensional representation of G over F_q, q = p^ν. The Brauer character of V is the function χ_V: G → C, χ_V(g) = Σ_λ μ(λ) ι(λ), the sum over the eigenvalues λ ∈ \bar F_q^× = \bar F_p^× of g acting on V ⊗_{F_q} \bar F_q, counted with multiplicity μ(λ). It is a class function, χ_V(1) = dim V, additive in short exact sequences of representations, multiplicative for tensor products, and χ_V(g) = χ_V(g_{p′}) for the p′-part g_{p′} of g, since a unipotent element has all eigenvalues 1. The eigenvalues of an element of G lie in \bar F_q, not in F_q: an embedding of F_q^× alone does not define χ_V (see sourceIssues).

**Hypotheses.**

- ι: \bar F_p^× → C^× is injective and fixed; changing it is recorded in the API.
- G finite, V finite-dimensional over F_q.

**Proof.**

1. Eigenvalues of g on V ⊗ \bar F_q are roots of its characteristic polynomial, which has coefficients in F_q; they are nonzero because g is invertible and have finite multiplicative order, so they lie in \bar F_p^× and ι applies.
2. Class function: conjugate elements have the same characteristic polynomial.
3. Additivity: for 0 → V′ → V → V″ → 0 the characteristic polynomial of g on V is the product of those on V′ and V″.
4. Multiplicativity: the eigenvalues of g on V ⊗ W are the products λμ, and ι is multiplicative.
5. The value at 1 is dim V; the value at g equals the value at g_{p′} because g = g_{p′}g_p with commuting factors and g_p unipotent.

**API.**

- `TauCeti.Brauer.character` (constructor): χ_V: G → C for a finite-dimensional F_q-representation V and the fixed embedding ι.
- `TauCeti.Brauer.character_one` (simp): χ_V(1) = dim V.
- `TauCeti.Brauer.character_conj` (simp): χ_V(hgh^{−1}) = χ_V(g).
- `TauCeti.Brauer.character_add` (relation): χ_V = χ_{V′} + χ_{V″} for a short exact sequence 0 → V′ → V → V″ → 0.
- `TauCeti.Brauer.character_tensor` (relation): χ_{V ⊗ W} = χ_V · χ_W.
- `TauCeti.Brauer.character_pow` (relation): χ_{Φ^*V}(g) = χ_V(g^p), where Φ^*V is V with scalars twisted by Frobenius.
- `TauCeti.Brauer.character_pPart` (characterisation): χ_V(g) = χ_V(g_{p′}) for the p′-part of g.
- `TauCeti.Brauer.character_restrict` (functoriality): For a homomorphism f: H → G, χ_{f^*V} = χ_V ∘ f.
- `TauCeti.Brauer.character_baseChange` (compatibility): For F_q ⊂ F_{q′}, χ_{V ⊗ F_{q′}} = χ_V (the same eigenvalues).
- `TauCeti.Brauer.character_change_embedding` (other): For u prime to the order of every element of G, so that ι ∘ (x ↦ x^u) is again an embedding of the p′-roots of unity, replacing ι by ι ∘ (x ↦ x^u) replaces χ_V(g) by χ_V(g^u).

**Unit tests.**

- `TauCeti.Brauer.character_units` (computation): G = F_q^× on F_q: χ(z) = ι(z).
- `TauCeti.Brauer.character_GL2_F3` (computation): V = F_3^2 for GL_2(F_3): χ_V(u) = 2 for u = (1 1; 0 1), χ_V(−1) = −2, and (1/48)Σ_g |χ_V(g)|² = 2.
- `TauCeti.Brauer.character_trivialGroup` (degenerate): For G trivial, χ_V is the constant dim V.
- `TauCeti.Brauer.character_not_reduction` (non-example): For G = Z/p and W a nontrivial complex character, the reduction of W modulo p is the trivial representation, whose Brauer character is 1 ≠ χ_W: the Brauer character is not the character of a lift.

**Acceptance.**

- For G = F_q^× acting on F_q by multiplication, χ(z) = ι(z).
- For G = GL_2(F_3) and V = F_3^2 the natural representation, χ_V(1) = 2, χ_V(−1) = −2, χ_V(u) = 2 for u = (1 1; 0 1), and Σ_g |χ_V(g)|²/48 = 2 (recomputed by enumeration of the 48 elements).

**Used by.**

- K-book IV.1, before Theorem IV.1.12, and Example IV.5.8: defines the Brauer lifting ρ_n of the standard representation
- L.1/green-virtual-character: Green's theorem says χ_V is a virtual character
- L.1/brauer-lift-frobenius-invariant: the eigenvalues are permuted by x ↦ x^q, so χ_V(g^q) = χ_V(g)

**Depends on.** libraries: `mathlib:ZMod`, `mathlib:FiniteField.frobeniusAlgEquivOfAlgebraic`.

**Sources.**

- `Haine.2016`, Convention 5.3, Definition 5.7 (p. 8–9): “Fix, once and for all, an embedding” — The fixed embedding of \bar F_q^× into C^×.
- `Haine.2016`, Definition 5.7 (p. 9): “The Brauer character of V is the function χ_V : G → C defined by” — The definition by lifted eigenvalues with multiplicity.
- `Mestel.2014`, §5.3 (p. 11): “If we choose an embedding into the complex numbers” — The embedding of the multiplicative group of the algebraic closure, taken compatibly on finite extensions.

### Green's theorem: Brauer characters are virtual characters

`L.1/green-virtual-character` · theorem

Let G be a finite group, V a representation of G by n × n matrices over a finite field F containing the eigenvalues λ_1(g), …, λ_n(g) of every g ∈ G, ι: F^× → C^× an injective homomorphism and S ∈ Z[t_1, …, t_n] a symmetric polynomial. Then g ↦ S(ι(λ_1(g)), …, ι(λ_n(g))) is the character of a virtual complex representation, that is, an element of R_C(G). In particular (S = t_1 + … + t_n, after extending scalars from F_q to a finite field containing all eigenvalues) the Brauer character χ_V of L.1/brauer-character lies in R_C(G), and so does the class function of every λ-operation applied to it.

**Hypotheses.**

- G finite; F a finite field containing all eigenvalues; ι injective.

**Proof.**

1. The source's theorem is Green's (Trans. AMS 1955, Theorem 1), which the K-book, Haine and Mestel cite and none of them proves; recorded as a gap ('Green's theorem on Brauer characters').
2. The reduction from F_q to a finite field F containing the eigenvalues uses L.1/brauer-character (character_baseChange): extending scalars does not change the Brauer character.

**Acceptance.**

- For GL_2(F_3) and the natural representation, the Brauer character has ⟨χ, χ⟩ = 2 and no linear constituent (recomputed), so it is a difference ψ_4 − ψ_2 of irreducible characters of degrees 4 and 2: a virtual character that is not a character.
- For an abelian group G and V a sum of characters over F, the virtual character is the sum of the lifted characters, a genuine representation.

**Depends on.** this roadmap: `L.1/brauer-character`.

**Sources.**

- `Mestel.2014`, Theorem 14 (p. 11): “Then if ι : F∗→ C∗ is any homomorphic embedding, and S is any symmetric polynomial in n variables with integer coefficients, then the function” — The statement with a symmetric polynomial S.
- `Mestel.2014`, Theorem 14, proof (p. 11): “Proof. [Gre55], Theorem 1.” — Cited, not proved.
- `Haine.2016`, Theorem 5.8 (Green) (p. 9): “The Brauer character χ_V is the character of a unique virtual complex representation” — The case S = t_1 + … + t_n.

### Brauer lifting

`L.1/brauer-lift` · construction · planet “Brauer lifting”

Fix ι as in L.1/brauer-character. For a finite group G let R_{F_q}(G) be the Grothendieck group of finite-dimensional F_q-representations of G (relations from short exact sequences; its multiplication is tensor product) and R_C(G) the complex representation ring, identified with the ring of virtual characters. Brauer lifting is the ring homomorphism β_G = β_{G,ι}: R_{F_q}(G) → R_C(G), [V] ↦ the virtual representation with character χ_V (well defined by L.1/green-virtual-character and the additivity of χ_V). It is natural in G for restriction along group homomorphisms, preserves dimension (augmentation), commutes with the λ-operations and Adams operations (L.1/brauer-lift-lambda-ring), lands in the ψ^q-fixed part R_C(G)^{ψ^q} (L.1/brauer-lift-frobenius-invariant) and is compatible with extension of scalars F_q ⊂ F_{q′}. The Brauer lift of a genuine representation is in general only a virtual representation (the natural representation of GL_2(F_3) is an example).

**Hypotheses.**

- G finite; q = p^ν; ι fixed.
- R_{F_q}(G) is the Grothendieck group of the abelian category of finite-dimensional representations; for finite fields every such representation is projective over F_q, so this is the K-book's R_A(G) with A = F_q.

**Proof.**

1. Additivity and multiplicativity of χ_V (L.1/brauer-character) make V ↦ χ_V a ring homomorphism from the Grothendieck ring into class functions.
2. Green's theorem (L.1/green-virtual-character) shows the image lies in the virtual characters, identified with R_C(G) by orthogonality of irreducible characters.
3. Naturality: χ_{f^*V} = χ_V ∘ f (brauerCharacter restrict).
4. Augmentation: χ_V(1) = dim V.

**API.**

- `TauCeti.Brauer.lift` (constructor): β_G: R_{F_q}(G) →+* R_C(G).
- `TauCeti.Brauer.character_lift` (simp): The character of β_G[V] is χ_V.
- `TauCeti.Brauer.lift_one` (simp): β_G[1] = 1 for the trivial one-dimensional representation.
- `TauCeti.Brauer.lift_dim` (compatibility): dim β_G(x) = dim x (augmentations).
- `TauCeti.Brauer.lift_restrict` (functoriality): β_H ∘ f^* = f^* ∘ β_G for f: H → G.
- `TauCeti.Brauer.lift_baseChange` (compatibility): β_{G, F_{q′}}[V ⊗ F_{q′}] = β_{G, F_q}[V].
- `TauCeti.Brauer.lift_psi` (relation): β_G ∘ ψ^k = ψ^k ∘ β_G and β_G ∘ λ^k = λ^k ∘ β_G (L.1/brauer-lift-lambda-ring).
- `TauCeti.Brauer.lift_psi_q` (relation): ψ^q ∘ β_G = β_G (L.1/brauer-lift-frobenius-invariant).
- `TauCeti.Brauer.lift_stabilise` (relation): i_n^* β(id_{n+1}) = β(id_n) + 1 in R_C(GL_n(F_q)) (L.1/brauer-lift-stabilisation).

**Unit tests.**

- `TauCeti.Brauer.lift_units` (computation): For G = F_q^× on F_q, β[F_q] = ι|_{F_q^×}.
- `TauCeti.Brauer.lift_GL2_F3_virtual` (non-example): β of the natural representation of GL_2(F_3) has ⟨χ, χ⟩ = 2 and no linear constituent, so it is not the class of a representation: a definition by a homomorphism GL_n(F_q) → U(n) fails.
- `TauCeti.Brauer.lift_trivialGroup` (degenerate): For G trivial, β: Z → Z is the identity.
- `TauCeti.Brauer.lift_pGroup` (computation): For G a p-group, every F_q-representation has all eigenvalues 1, so β[V] = dim V · 1.
- `TauCeti.Brauer.lift_cyclic` (compatibility): For C = F_{q^r}^× acting on F_{q^r}, β = Σ_{i<r} ι^{q^i} (L.1/brauer-lift-cyclic).

**Acceptance.**

- For G = F_q^× acting on F_q, β[F_q] = ι|_{F_q^×}, a linear character.
- For GL_2(F_3), β of the natural representation is ψ_4 − ψ_2 (degrees 4 and 2), not a representation.

**Used by.**

- K-book IV.1 before Theorem 1.12, Haine 6.11, Mestel 5.5: the Brauer lift of the standard representation of GL_n(F_q) gives θ_n: BGL_n(F_q) → FΨ^q
- K-book Example IV.5.8: Brauer lifting is a λ-ring homomorphism, so ρ_* commutes with λ^k and ψ^k
- Mestel §5.4 and §8: the lift of F_{q^r} as a representation of F_{q^r}^× detects the cohomology of GL_n(F_q)

**Depends on.** this roadmap: `L.1/brauer-character`, `L.1/green-virtual-character`, `L.1/brauer-lift-lambda-ring`, `L.1/brauer-lift-frobenius-invariant`; libraries: `tauceti:TauCeti.AbelianK0`.

**Sources.**

- `Kbook.2013`, Example IV.5.8 (PDF p. 323): “It induces a homomorphism R_{F_q}(G) → R_C(G) called the Brauer lifting.” — The Brauer lifting as a map of representation rings.
- `Haine.2016`, Observation 5.9 (p. 9): “Thus the Brauer lifting defines a homomorphism” — Additivity gives a homomorphism of representation rings.
- `Kbook.2013`, IV.1, before Theorem 1.12 (PDF p. 277): “For each n, the Brauer lifting of the trivial and standard n-dimensional representations of GL_n(F_q) are n-dimensional complex representations, given by homomorphisms 1_n, id_n : GL_n(F_q) → U.” — Quoted for the correction: the lift of the standard representation is virtual (sourceIssues).

### The Brauer lift of an F_q-representation is fixed by ψ^q

`L.1/brauer-lift-frobenius-invariant` · lemma

For every finite group G and every finite-dimensional F_q-representation V, ψ^q(β_G[V]) = β_G[V] in R_C(G); equivalently χ_V(g^q) = χ_V(g) for all g ∈ G. Hence Brauer lifting lands in R_C(G)^{ψ^q}.

**Hypotheses.**

- q = p^ν is the number of elements of the field of definition of V.

**Proof.**

1. On R_C(G), ψ^q acts on characters by (ψ^q χ)(g) = χ(g^q).
2. The eigenvalues of g^q are the λ^q for the eigenvalues λ of g, with multiplicity.
3. The characteristic polynomial of g has coefficients in F_q, so its multiset of roots is stable under x ↦ x^q (FiniteField.frobeniusAlgEquivOfAlgebraic applied to a splitting field); hence Σ ι(λ^q) = Σ ι(λ).

**Acceptance.**

- For G = F_{q^2}^× acting on F_{q^2} (viewed over F_q), χ(z) = ι(z) + ι(z^q), and indeed χ(z^q) = ι(z^q) + ι(z^{q^2}) = χ(z).
- The hypothesis that V is defined over F_q is needed: the one-dimensional F_{q^2}-representation of F_{q^2}^× on F_{q^2} has Brauer character ι, and ι(z^q) = ι(z) forces z^{q−1} = 1, which fails for a generator z of F_{q^2}^×.

**Depends on.** this roadmap: `L.1/brauer-character`; libraries: `mathlib:FiniteField.frobeniusAlgEquivOfAlgebraic`.

**Sources.**

- `Haine.2016`, Observation 5.10 (p. 9): “the Adams operation on R_C(G) fixes the Brauer lift of V” — The statement.
- `Mestel.2014`, §5.3 (p. 11): “the set of eigenvalues of the automorphism E(g) of k^n is invariant under the Frobenius isomorphism” — The reason.

### Brauer lifting is a homomorphism of λ-rings

`L.1/brauer-lift-lambda-ring` · lemma

For every finite group G, Brauer lifting β_G: R_{F_q}(G) → R_C(G) commutes with the λ-operations and the Adams operations: β_G(λ^k x) = λ^k β_G(x) and β_G(ψ^k x) = ψ^k β_G(x) for all k ≥ 0 and x ∈ R_{F_q}(G). Consequently the maps it induces on homotopy classes into BU commute with λ^k and ψ^k.

**Hypotheses.**

- The λ-ring structures are those of K-book Ex. II.4.2 (exterior powers).

**Proof.**

1. For a representation V with eigenvalues λ_1, …, λ_n of g, the eigenvalues of g on Λ^k V are the products λ_{i_1} ⋯ λ_{i_k}, i_1 < … < i_k; so χ_{Λ^kV}(g) = e_k(ι(λ_1), …, ι(λ_n)).
2. In R_C(G) the λ-operations are determined by characters: the character of λ^k of a virtual representation with 'eigenvalues' is the elementary symmetric function e_k of them; applied to β_G[V] (whose character at g is the power sum of the ι(λ_i)) this gives e_k(ι(λ_1), …, ι(λ_n)) by Newton's identities, and R_C(G) is torsion-free so the identity of characters is an identity in R_C(G). This is the 'elementary calculation with characters' of the source, and Green's theorem with S = e_k (L.1/green-virtual-character) shows each side is a virtual character.
3. Extend from representations to R_{F_q}(G) because λ_t is a homomorphism to the multiplicative group of power series on both sides.
4. ψ^k is a universal polynomial in the λ^i, so commutation with λ^k gives commutation with ψ^k; directly, χ_{ψ^kV}(g) = Σ ι(λ_i)^k = χ_V(g^k).

**Acceptance.**

- For V the natural representation of GL_2(F_3), β(Λ^2 V) = β(det), the linear character g ↦ ι(det g), which is λ^2 β(V).
- In degree k = 0 and k = 1 the statement is β_G(1) = 1 and β_G = β_G; the first non-trivial case k = 2 for a one-dimensional V gives λ^2 β(V) = 0, matching Λ^2 of a line.

**Depends on.** this roadmap: `L.1/brauer-character`, `L.1/green-virtual-character`.

**Sources.**

- `Kbook.2013`, Example IV.5.8 (PDF p. 323): “Now an elementary calculation with characters (which we omit) shows that the Brauer lifting is actually a homomorphism of λ-rings.” — The statement; the calculation is written out in the proof steps.
- `Haine.2016`, Remark 4.21 (p. 7): “The Adams operations on R_C(G) induce operations on the characters given by” — ψ^k on characters.

### Stabilisation of the Brauer lift of the standard representation

`L.1/brauer-lift-stabilisation` · lemma

Let id_n be the standard representation of GL_n(F_q) on F_q^n and i_n: GL_n(F_q) → GL_{n+1}(F_q), g ↦ diag(g, 1). Then i_n^* id_{n+1} ≅ id_n ⊕ 1, hence i_n^* β(id_{n+1}) = β(id_n) + 1 in R_C(GL_n(F_q)), and the virtual characters ρ_n = β(id_n) − n satisfy i_n^* ρ_{n+1} = ρ_n.

**Hypotheses.**

- The standard embeddings i_n.

**Proof.**

1. The restriction of F_q^{n+1} along i_n is F_q^n ⊕ F_q with GL_n(F_q) acting trivially on the last coordinate.
2. Brauer lifting is additive and natural (L.1/brauer-lift), and the trivial representation lifts to 1.

**Acceptance.**

- For n = 1 and q = 3: i_1^* β(id_2) at diag(−1, 1) takes the value ι(−1) + 1 = 0 = β(id_1)(−1) + 1.
- The compatible family (ρ_n) has virtual dimension 0, so it defines maps into BU rather than Z × BU.

**Depends on.** this roadmap: `L.1/brauer-lift`.

**Sources.**

- `Kbook.2013`, Example IV.5.3.1 (PDF p. 321): “As n varies, the representations id_n of GL_n(A) are related by the relation” — The relation i_n^* id_{n+1} = id_n ⊕ 1.
- `Kbook.2013`, IV.1, before Theorem 1.12 (PDF p. 277): “Quillen observed that ρ_n and ρ_{n+1} are compatible up to homotopy with the inclusion of BGL_n(F_q) in BGL_{n+1}(F_q).” — The compatibility used for ρ.

### The Brauer lift of a finite field as a representation of its units

`L.1/brauer-lift-cyclic` · lemma

Let r ≥ 1, C = F_{q^r}^× (cyclic of order q^r − 1) and L the representation of C on F_{q^r}, viewed as an r-dimensional F_q-vector space, by multiplication. Then the eigenvalues of z ∈ C on L ⊗_{F_q} \bar F_q are z, z^q, …, z^{q^{r−1}}, so χ_L(z) = Σ_{i=0}^{r−1} ι(z^{q^i}) and β_C[L] = W := ι ⊕ ι^q ⊕ … ⊕ ι^{q^{r−1}}, a genuine r-dimensional representation (a sum of distinct linear characters when z generates C).

**Hypotheses.**

- r ≥ 1; the multiplicative group of F_{q^r} is cyclic of order q^r − 1.

**Proof.**

1. F_{q^r} ⊗_{F_q} \bar F_q ≅ \bar F_q^r by a ⊗ w ↦ (a w, a^q w, …, a^{q^{r−1}} w) (L.1/galois-tensor-splitting with the Galois group generated by Frobenius, FiniteField.bijective_frobeniusAlgEquivOfAlgebraic_pow).
2. Under this isomorphism multiplication by z acts on the i-th coordinate by z^{q^i}; so the eigenvalues are the conjugates z^{q^i}.
3. Apply the definition of the Brauer character and identify the virtual character Σ ι^{q^i} with the sum of linear characters.

**Acceptance.**

- For q = 2, r = 2: C = F_4^× ≅ Z/3 and β[L] = ι ⊕ ι^2, the sum of the two nontrivial characters of Z/3; its character at a generator is ω + ω^2 = −1.
- The source's (Mestel §5.4) description 'dimension r − 1' and 'eigenvalues {1, z, …}' is corrected to dimension r and eigenvalues {z, …, z^{q^{r−1}}} (sourceIssues).

**Depends on.** this roadmap: `L.1/brauer-character`, `L.1/brauer-lift`, `L.1/galois-tensor-splitting`; libraries: `mathlib:FiniteField.bijective_frobeniusAlgEquivOfAlgebraic_pow`.

**Sources.**

- `Mestel.2014`, §5.4 (p. 12): “It has a natural representation L over k, obtained by letting C = k(µl)∗act on k(µl) by multiplication” — The representation L.
- `Mestel.2014`, §5.4 (p. 12): “W = ζ ⊕ζq ⊕ζq2 ⊕. . . ⊕ζqr−1.” — The lift W.

### The homotopy fixed points FΨ^q of the Adams operation

`L.1/fpsi` · definition · planet “The space FΨ^q”

Let q ≥ 2 be an integer and ψ^q: BU → BU a map representing the Adams operation ψ^q on K̃U^0 = [−, BU] (imported from RefinedTraceMethods RT.4:topological, see the request). Define FΨ^q as the homotopy pullback of (id, ψ^q): BU → BU × BU along the diagonal, that is, the space of pairs (x, γ) with x ∈ BU and γ a path in BU from x to ψ^q(x), with φ: FΨ^q → BU, (x, γ) ↦ x. Equivalently (up to homotopy equivalence over BU) FΨ^q is the homotopy fibre of 1 − ψ^q: BU → BU, the difference being formed in the H-group BU. FΨ^q is an H-space (fibre of an H-map between homotopy-commutative H-groups), and a map ψ^k: BU → BU commuting with ψ^q up to a chosen homotopy induces a self-map ψ̃^k of FΨ^q over ψ^k. The K-book's variant FΨ^k = hofib(Ψ^k − 1: Z × BU → BU) (VI.7) adds π_0 = Z; the connected FΨ^q defined here is its basepoint component.

**Hypotheses.**

- q ≥ 2 an integer (q a prime power in all applications).
- ψ^q: BU → BU is an H-map representing ψ^q on K̃U^0 of finite complexes and, through the Milnor sequence, of CW complexes.

**Proof.**

1. Form the homotopy pullback BU ×_{BU×BU} BU^I (Haine, Definition 6.3; Mestel, diagram (4.1)).
2. Identify it with hofib(1 − ψ^q) using the difference map d: BU × BU → BU of the H-group structure (Mestel, Lemma 10; Haine, Lemma 6.7).
3. The H-structure: 1 − ψ^q is an H-map because ψ^q is additive and BU is homotopy commutative, and the homotopy fibre of an H-map of H-spaces is an H-space (StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence).
4. Induced self-maps: given a homotopy ψ^kψ^q ≃ ψ^qψ^k, the map of pullback diagrams induces ψ̃^k: FΨ^q → FΨ^q with φψ̃^k = ψ^kφ; different homotopies change ψ̃^k by the action of [FΨ^q, U], and the induced map on homotopy groups is independent of the choice (the long exact sequence is natural, and ∂ is onto π_{2i−1}(FΨ^q)).

**API.**

- `TauCeti.KU.FPsi` (data): The space FΨ^q = BU ×_{BU×BU} BU^I.
- `TauCeti.KU.FPsi.proj` (projection): φ: FΨ^q → BU.
- `TauCeti.KU.FPsi.hofibEquiv` (equivalence): FΨ^q ≃ hofib(1 − ψ^q: BU → BU) over BU.
- `TauCeti.KU.FPsi.hspace` (instance): FΨ^q is an H-space and φ is an H-map.
- `TauCeti.KU.FPsi.lift` (universal-property): A map f: X → BU with a homotopy f ≃ ψ^q f determines a map X → FΨ^q over BU.
- `TauCeti.KU.FPsi.adams` (functoriality): ψ̃^k: FΨ^q → FΨ^q covering ψ^k, well defined on homotopy groups.
- `TauCeti.KU.FPsi.boundary` (projection): ∂: π_{2i}(BU) → π_{2i−1}(FΨ^q), surjective with kernel (q^i − 1)π_{2i}(BU).

**Unit tests.**

- `TauCeti.KU.FPsi.pi_one` (computation): π_1(FΨ^q) ≅ Z/(q − 1); for q = 4 it is Z/3.
- `TauCeti.KU.FPsi.pi_three` (computation): π_3(FΨ^q) ≅ Z/(q^2 − 1); for q = 2 it is Z/3 and for q = 3 it is Z/8.
- `TauCeti.KU.FPsi.pi_even` (degenerate): π_{2i}(FΨ^q) = 0 for every i ≥ 0 (connected, no even homotopy).
- `TauCeti.KU.FPsi.not_fixed_points` (non-example): The strict fixed-point set {x : ψ^q(x) = x} of a chosen representative is not homotopy invariant; FΨ^q is the homotopy pullback, not a fixed-point subspace.
- `TauCeti.KU.FPsi.adams_pi` (characterisation): ψ̃^k acts on π_{2i−1}(FΨ^q) ≅ Z/(q^i − 1) as multiplication by k^i.

**Acceptance.**

- π_1(FΨ^q) ≅ Z/(q − 1) and π_2(FΨ^q) = 0 (L.1/fpsi-homotopy).
- For q = 1, 1 − ψ^1 is null and the homotopy fibre is BU × U, with π_n ≅ Z for every n ≥ 1, which is not the K-theory of any finite field: the hypothesis q ≥ 2 is used.

**Used by.**

- K-book Theorem IV.1.12, Haine §6, Mestel §4: BGL(F_q)^+ is identified with FΨ^q
- K-book Theorem VI.7.9 (Hesselholt–Madsen): the p-completed K-theory of a p-adic local field splits off FΨ^k × BFΨ^k (L.6)
- L.1/fpsi-lifting: maps into FΨ^q are ψ^q-invariant classes into BU when [X, U] = 0

**Depends on.** other roadmaps: `RefinedTraceMethods:RT.4:topological`, `StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence`.

**Sources.**

- `Haine.2016`, Definition 6.3 (p. 10): “The space Fψ^q is the pullback” — The definition as a pullback.
- `Haine.2016`, Definition 6.3 (p. 10): “Hence a point the space Fψ^q can be viewed as a pair (x, γ), where x ∈ BU and γ is a path from x to ψ^q(x).” — The points of FΨ^q.
- `Haine.2016`, Lemma 6.7 (p. 10): “We have that Fψ^q ≃ hofib(1 − ψ^q).” — The homotopy-fibre description.
- `Kbook.2013`, IV.1, before Theorem 1.12 (PDF p. 276): “Adams had shown that the Adams operations ψ^k on topological K-theory (II.4.4) are represented by maps ψ^k : BU → BU” — The representing maps ψ^k.

### Homotopy groups of FΨ^q

`L.1/fpsi-homotopy` · theorem

For every integer q ≥ 2, FΨ^q is connected and simple, π_{2i}(FΨ^q) = 0 for i ≥ 1, and π_{2i−1}(FΨ^q) ≅ Z/(q^i − 1) for i ≥ 1; more precisely the boundary ∂: π_{2i}(BU) ≅ Z → π_{2i−1}(FΨ^q) of the fibration FΨ^q → BU → BU (second map 1 − ψ^q) is surjective with kernel (q^i − 1)π_{2i}(BU).

**Hypotheses.**

- q ≥ 2.

**Proof.**

1. Bott periodicity: π_{2i}(BU) ≅ Z (i ≥ 1), π_{2i−1}(BU) = 0, π_0(BU) = 0 (RefinedTraceMethods RT.4:topological: 'π_*ku = Z[β]').
2. ψ^q acts on π_{2i}(BU) = K̃U(S^{2i}) as multiplication by q^i (K-book Example II.4.4.1; requested from RT.4:topological with the Adams operations).
3. The long exact sequence of the fibration (StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence and L.1/fpsi) gives 0 → π_{2i}(FΨ^q) → Z →(1 − q^i) Z → π_{2i−1}(FΨ^q) → π_{2i−1}(BU) = 0; since q^i ≠ 1, multiplication by 1 − q^i is injective.
4. Degree 0: π_1(BU) = 0 → π_0(FΨ^q) → π_0(BU) = 0, so FΨ^q is connected.
5. Simplicity: the action of π_1(FΨ^q) on π_n(FΨ^q) is compatible with the exact sequence, and BU is simply connected (Mestel, Lemma 12); alternatively FΨ^q is an H-space.

**Acceptance.**

- q = 2: π_1 = 0, π_3 = Z/3, π_5 = Z/7, π_7 = Z/15.
- q = 3: π_1 = Z/2, π_3 = Z/8, π_5 = Z/26.
- q = 4: π_1 = Z/3, π_3 = Z/15, and |π_3| = 15 matches K_3(F_4) ≅ Z/15 in K3BlochGroups V.5.

**Depends on.** this roadmap: `L.1/fpsi`; other roadmaps: `RefinedTraceMethods:RT.4:topological`, `StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence`.

**Sources.**

- `Haine.2016`, Lemma 6.8 (p. 10): “The space Fψ^q is simple and we have π_{2n}(Fψ^q) = 0 and π_{2n−1}(Fψ^q) = Z/(q^n − 1).” — The statement.
- `Mestel.2014`, Lemma 12 (p. 9): “The space FΨq is simple (that is, its fundamental group acts trivially on the higher homotopy groups) with homotopy groups” — Simplicity and the groups.
- `Kbook.2013`, IV.1, after Theorem 1.12 (PDF p. 277): “On homotopy groups, II.4.4.1 shows that ψ^q is multiplication by q^i on π_{2i}BU” — The action of ψ^q on π_{2i}BU.

### ψ^q-invariant maps lift uniquely to FΨ^q

`L.1/fpsi-lifting` · lemma

Let X be a CW complex with [X, U] = [X, ΩBU] = 0. Then φ_*: [X, FΨ^q] → [X, BU]^{ψ^q}, the set of classes f with ψ^q f ≃ f, is a bijection. For a finite group G, [BG, U] = K̃U^{−1}(BG) = 0 (Atiyah), so [BG, FΨ^q] ≅ [BG, BU]^{ψ^q}; the same holds for BGL(F_q) = colim_n BGL_n(F_q), since K̃U^{−1}(BGL(F_q)) = 0 by the Milnor sequence and the Mittag-Leffler property of the profinite groups K̃U^0(BGL_n(F_q)).

**Hypotheses.**

- X a CW complex with [X, U] = 0.

**Proof.**

1. Surjectivity: a class f with a homotopy f ≃ ψ^q f is by definition a map X → FΨ^q (the universal property of the homotopy pullback, L.1/fpsi).
2. Injectivity: two lifts of homotopic maps differ by a map X → ΩBU = U (the fibre of the path fibration), which is null by hypothesis (Mestel, Lemma 13).
3. For X = BG with G finite: K̃U^1(BG) = 0 is part of the Atiyah–Segal completion theorem (Mestel, Theorem 15, citing Benson; Haine, Lemma 6.10, citing Atiyah–Segal), requested from RT.4:topological and recorded as a gap.
4. For X = BGL(F_q): the Milnor sequence 0 → lim^1 K̃U^{−2}(BGL_n) → K̃U^{−1}(BGL) → lim K̃U^{−1}(BGL_n) → 0 with the last term 0 and the lim^1 term vanishing for the inverse system of compact groups K̃U^0(BGL_n(F_q)) (Atiyah–Segal completion); this step is part of the same gap.

**Acceptance.**

- For X a point both sides are the single class.
- For X = BZ/(q − 1) with its tautological character χ, the class of χ − 1 in [BZ/(q−1), BU] is ψ^q-fixed exactly when χ^q = χ, which holds, and it lifts to FΨ^q.

**Depends on.** this roadmap: `L.1/fpsi`; other roadmaps: `RefinedTraceMethods:RT.4:topological`.

**Sources.**

- `Mestel.2014`, Lemma 13 (p. 10): “Let X be a space with [X, ΩBU] = 0 (where ΩBU is the loop space of BU). Then the pushforward of φ : FΨq → BU gives a bijection” — The lemma.
- `Haine.2016`, Lemma 6.9 (p. 10): “Suppose that X is a CW-complex so that [X, U] = 0. Then” — The same statement in Haine's notes.
- `Haine.2016`, Lemma 6.10 (p. 10): “Suppose that G is a finite group. Then [BG, BU]^{ψ^q} ≅ [BG, Fψ^q].” — The finite-group case.
- `Mestel.2014`, Theorem 15 (p. 12): “Let G be a compact Lie group. Then K̃^1(BG) = 0.” — Atiyah's vanishing, cited.

### Quillen's map from BGL(F_q) to FΨ^q

`L.1/quillen-map` · construction

Fix ι as in L.1/brauer-character and q = p^ν. For each n, the virtual representation ρ_n = β(id_n) − n ∈ R_C(GL_n(F_q)) is ψ^q-fixed (L.1/brauer-lift-frobenius-invariant), so its image under the Atiyah map R_C(G) → [BG, Z × BU] → [BG, BU] (a representation V goes to the classifying map of EG ×_G V) lies in [BGL_n(F_q), BU]^{ψ^q} and lifts uniquely (L.1/fpsi-lifting) to θ_n ∈ [BGL_n(F_q), FΨ^q]. The θ_n are compatible with the inclusions BGL_n → BGL_{n+1} (L.1/brauer-lift-stabilisation) and assemble to θ: BGL(F_q) → FΨ^q; by Theorem IV.1.8 θ extends to θ^+: BGL(F_q)^+ → FΨ^q, the induced maps on homotopy groups being independent of the extension. The composite ρ = φ ∘ θ^+: BGL(F_q)^+ → BU is the K-book's Brauer lift map, and ρ_*: K_n(F_q) → π_n(BU). All of these depend on the choice of ι; changing ι by x ↦ x^u (u a p′-adic unit) composes θ with ψ̃^u.

**Hypotheses.**

- q = p^ν; ι: \bar F_p^× → C^× injective and fixed.
- The Atiyah map and the H-group structure of BU are imported with topological K-theory (RT.4:topological).

**Proof.**

1. Atiyah map: for a complex representation V of a finite group G, EG ×_G V → BG is a vector bundle, classified by a map BG → BU(dim V) → Z × BU; extend to R_C(G) additively in the H-group [BG, Z × BU], and project to the BU factor for virtual dimension 0 (Haine, Definition 5.1 and Observation 5.2). It commutes with ψ^k because both sides are λ-ring maps (Haine, Observation 5.2).
2. ρ_n has virtual dimension 0 and is ψ^q-fixed, so it defines a class in [BGL_n(F_q), BU]^{ψ^q}; lift it by L.1/fpsi-lifting to θ_n.
3. Compatibility: θ_{n+1} restricted to BGL_n(F_q) and θ_n have the same image in [BGL_n(F_q), BU] (L.1/brauer-lift-stabilisation), hence are homotopic by injectivity in L.1/fpsi-lifting; since BGL_n → BGL_{n+1} is a cofibration, choose representatives inductively that restrict strictly, and pass to the colimit.
4. Extension over the plus construction: FΨ^q is an H-space (L.1/fpsi), so Theorem IV.1.8 (StableHomotopyKTheory:H.3/plus-construction-universal-property) gives θ^+ with θ = θ^+ ∘ i, and θ^+_* on homotopy groups is independent of the choice.
5. The class of φθ in [BGL(F_q), BU] is determined by the θ_n because [BGL(F_q), BU] ≅ lim_n [BGL_n(F_q), BU] (Haine, Construction 6.11; the lim^1 vanishing is part of the Atiyah–Segal gap).

**API.**

- `TauCeti.KTheory.FiniteField.quillenMap` (constructor): θ: BGL(F_q) → FΨ^q attached to ι.
- `TauCeti.KTheory.FiniteField.quillenMap_restrict` (characterisation): θ restricted to BGL_n(F_q) is the unique lift of the Atiyah class of β(id_n) − n.
- `TauCeti.KTheory.FiniteField.quillenMapPlus` (universal-property): θ^+: BGL(F_q)^+ → FΨ^q with θ = θ^+ ∘ i; its effect on homotopy groups is independent of choices.
- `TauCeti.KTheory.FiniteField.brauerLiftMap` (projection): ρ = φ ∘ θ^+: BGL(F_q)^+ → BU and ρ_*: K_n(F_q) → π_n(BU).
- `TauCeti.KTheory.FiniteField.quillenMap_pi_one` (compatibility): On π_1, θ^+ is the determinant K_1(F_q) → F_q^× followed by the isomorphism F_q^× → π_1(FΨ^q) given by ι.
- `TauCeti.KTheory.FiniteField.quillenMap_change` (other): Replacing ι by ι ∘ (x ↦ x^u) replaces θ by ψ̃^u ∘ θ.
- `TauCeti.KTheory.FiniteField.atiyahMap` (data): R_C(G) → [BG, Z × BU], a λ-ring homomorphism.

**Unit tests.**

- `TauCeti.KTheory.FiniteField.quillenMap_pi_one_F2` (degenerate): For q = 2, π_1(FΨ^2) = 0 and K_1(F_2) = 0: θ^+ is trivial on π_1.
- `TauCeti.KTheory.FiniteField.quillenMap_pi_one_F5` (computation): For q = 5, θ^+_* : K_1(F_5) ≅ F_5^× → π_1(FΨ^5) ≅ Z/4 is an isomorphism, sending the class of the unit 2 to a generator.
- `TauCeti.KTheory.FiniteField.brauerLiftMap_odd` (compatibility): ρ_* = 0 on K_{2i−1}(F_q), since π_{2i−1}(BU) = 0: the map to BU alone does not see K_*(F_q); the lift to FΨ^q does.
- `TauCeti.KTheory.FiniteField.quillenMap_not_rep` (non-example): θ_2 is not of the form B(h) for a homomorphism h: GL_2(F_3) → U(2), since β(id_2) is virtual (L.1/brauer-lift tests).

**Acceptance.**

- On π_1: θ^+_* : K_1(F_q) = GL(F_q)/E(F_q) → π_1(FΨ^q) ≅ Z/(q − 1) is the determinant followed by an isomorphism F_q^× ≅ Z/(q − 1) depending on ι (Mestel §9: 'f_* on π_1 is the determinant map').
- For n = 1, θ_1: BF_q^× → FΨ^q lifts the class of ι|_{F_q^×} − 1.

**Used by.**

- L.1/quillen-homology-iso and L.1/quillen-fibration: θ is the map shown to be a homology equivalence; θ^+ is Quillen's equivalence
- L.1/frobenius-is-adams: θ ∘ BΦ is compared with ψ̃^p ∘ θ
- K-book Example IV.5.8 and IV.5.9.2: ρ_* commutes with λ^k and ψ^k
- Mestel §7.3: cohomology classes of FΨ^q are pulled back along E#: BG → FΨ^q for ψ^q-invariant representations E

**Depends on.** this roadmap: `L.1/brauer-lift`, `L.1/brauer-lift-frobenius-invariant`, `L.1/brauer-lift-stabilisation`, `L.1/fpsi`, `L.1/fpsi-lifting`; other roadmaps: `RefinedTraceMethods:RT.4:topological`, `StableHomotopyKTheory:H.3/plus-construction-universal-property`, `GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q`.

**Sources.**

- `Haine.2016`, Construction 6.11 (p. 11): “be a map representing the homotopy class given by the image of the standard representation” — θ_n from the Brauer lift of the standard representation.
- `Haine.2016`, Construction 6.11 (p. 11): “Moreover, since [BGL(F_q), BU] ≅ lim_n [BGL_n(F_q), BU], this class is unique.” — Uniqueness of the class in BU.
- `Kbook.2013`, IV.1, before Theorem 1.12 (PDF p. 277): “By Theorem 1.8, ρ induces a map from BGL(F_q)^+ to BU, and hence maps ρ_*: K_n(F_q) → π_n(BU)” — ρ and ρ_* in the K-book.
- `Mestel.2014`, §9 (p. 30): “we have that f∗ on π1 is the determinant map, so kills the commutator subgroup of π1(BGLk).” — The degree-one acceptance.

### The cohomology of FΨ^q, additively

`L.1/fpsi-cohomology` · theorem

Let q = p^ν and ℓ ≠ p a prime, and let r be the order of q in (Z/ℓ)^×. Then H̃^*(FΨ^q; Q) = 0 and H̃^*(FΨ^q; F_p) = 0, and there is an isomorphism of graded F_ℓ-vector spaces H^*(FΨ^q; F_ℓ) ≅ F_ℓ[c_r, c_{2r}, …] ⊗ Λ[e_r, e_{2r}, …] with |c_{jr}| = 2jr and |e_{jr}| = 2jr − 1 (j ≥ 1). The multiplicative structure is L.1/fpsi-cohomology-ring.

**Hypotheses.**

- q = p^ν ≥ 2; ℓ prime, ℓ ≠ p; r = min{s ≥ 1 : ℓ | q^s − 1}.

**Proof.**

1. Q and F_p: π_*(FΨ^q) is finite of order prime to p in every degree (L.1/fpsi-homotopy), so k′ ⊗ π_i(FΨ^q) = 0 for k′ = Q, F_p, and the mod-C Hurewicz theorem (Mestel, Theorem 16, citing Mosher–Tangora) gives H̃^*(FΨ^q; k′) = 0.
2. Write FΨ^q = BU ×_{BU×BU} BU^I and apply the Eilenberg–Moore spectral sequence with E_2 = Tor_{H^*(BU×BU)}(H^*(BU), H^*(BU^I)) (Mestel, Theorem 19, citing Hatcher's notes; convergence for simply connected base with finite-dimensional cohomology in each degree). The spectral sequence is not proved in any source read (gap) and is requested from StableHomotopyKTheory H.6.
3. With A = H^*(BU × BU; F_ℓ) = F_ℓ[c′_i, c″_i]: the diagonal kills c′_i − c″_i and (id, ψ^q) kills q^i c′_i − c″_i, since ψ^q acts on c_i by q^i (RT.4 request). Split A into the four polynomial subrings on c′_i − c″_i (r | i), c′_i − c″_i (r ∤ i), q^i c′_i − c″_i (r ∤ i) and c′_i (r | i); q^i is a unit mod ℓ and q^i ≢ 1 mod ℓ when r ∤ i.
4. By the Künneth formula for Tor and Tor_{F_ℓ[x_i]}(F_ℓ, F_ℓ) = Λ[y_i] (Mestel, Lemmas 17–18; Koszul resolution), E_2 ≅ F_ℓ[c_{jr}] ⊗ Λ[e_{jr}], concentrated in the second quadrant with multiplicative generators on the edges, so E_2 = E_∞; this gives the additive isomorphism (Mestel, Theorem 20).

**Acceptance.**

- q = 2, ℓ = 3: r = 2, so H^*(FΨ^2; F_3) has its first nonzero positive-degree class e_2 in degree 3, matching π_3(FΨ^2) ≅ Z/3 and π_1 = 0.
- q = 5, ℓ = 2: r = 1, so e_1 ∈ H^1(FΨ^5; F_2) ≠ 0, matching π_1(FΨ^5) ≅ Z/4.
- q = 3, ℓ = 3 is excluded (ℓ = p); indeed H̃^*(FΨ^3; F_3) = 0.

**Depends on.** this roadmap: `L.1/fpsi`, `L.1/fpsi-homotopy`; other roadmaps: `RefinedTraceMethods:RT.4:topological`, `StableHomotopyKTheory:H.6`.

**Sources.**

- `Mestel.2014`, Theorem 20 (p. 16): “There is an isomorphism of additive groups H∗(FΨq) ∼= P[cr, c2r, . . .] ⊗∧[er, e2r, . . .], with deg(cjr) = 2jr and deg(ejr) = 2jr − 1 for j ≥ 1.” — The additive computation (coefficients F_ℓ, ℓ ≠ p).
- `Mestel.2014`, Theorem 19 (p. 15): “Let X → B be a map and Y → B a fibration, with B simply connected and all the cohomology groups of X, Y and B finite-dimensional.” — The Eilenberg–Moore spectral sequence, cited to Hatcher.
- `Mestel.2014`, Theorem 16 (p. 13): “Let k′ be a field, and suppose that k′ ⊗Z πi(X) = 0 for all i < n. Then Hi(X; k′) = 0 for 0 < i < n.” — The Q and F_p cases.

### The cohomology ring of FΨ^q at an odd prime

`L.1/fpsi-cohomology-ring` · theorem

Let q = p^ν, ℓ an odd prime different from p, and r the order of q modulo ℓ. Let c_i ∈ H^{2i}(FΨ^q; F_ℓ) be φ^* of the mod-ℓ reduction of the universal Chern class, and let e_{jr} ∈ H^{2jr−1}(FΨ^q; F_ℓ) be the mod-ℓ reduction of the unique class ẽ_{jr} ∈ H^{2jr−1}(FΨ^q; Z/(q^{jr} − 1)) whose image under the mapping-cylinder coboundary is Γ^*z for the relative class z with j′z = c̃_{jr} ⊗ 1 − 1 ⊗ c̃_{jr} (Mestel, Definition 24); its Bockstein is β(ẽ_{jr}) = φ^*(c̃_{jr}). Then the F_ℓ-algebra map F_ℓ[c_r, c_{2r}, …] ⊗ Λ[e_r, e_{2r}, …] → H^*(FΨ^q; F_ℓ) is an isomorphism.

**Hypotheses.**

- ℓ odd, ℓ ≠ p. The case ℓ = 2 (q odd) is not treated in the sources read (gap).

**Proof.**

1. Construct ẽ_i from the morphism of maps Γ: φ → Δ of diagram (4.1) (Mestel, §7.1.3, Definition 22 and the map D_g of (7.5)), using that H^{odd}(BU) = 0; Lemma 21 gives β(ẽ_i) = φ^*(c̃_i).
2. e_{jr}^2 = 0 by graded commutativity, ℓ being odd.
3. Linear independence of the monomials c^α e^β (Mestel, Lemma 25): pull back along E#: BC^m → FΨ^q for the ψ^q-invariant representation W^m of C^m, C = F_{q^r}^× (L.1/brauer-lift-cyclic), compute c_i(W) and e_{jr}(W) in H^*(BC) (Mestel, Lemma 26), the addition maps μ, ν and the compatibility of D_Γ with them (Lemmas 27–28), and the product formula (Lemma 29); the images are independent in H^*(BC^m) for m large.
4. Combine with the additive count of L.1/fpsi-cohomology: an injective algebra map between graded spaces of the same finite dimension in each degree is an isomorphism (Mestel, Theorem 30).

**Acceptance.**

- For q = 2, ℓ = 3 the lowest classes are e_2 in degree 3 and c_2 in degree 4, and H^3(FΨ^2; F_3) ≅ F_3, H^4 ≅ F_3.
- For q = 4, ℓ = 3 (r = 1): H^1 = F_3·e_1, H^2 = F_3·c_1 and H^3 = F_3·e_2 ⊕ F_3·c_1e_1, so dim H^3 = 2; the Poincaré series is ∏_{j≥1} (1 + t^{2j−1})/(1 − t^{2j}).

**Depends on.** this roadmap: `L.1/fpsi-cohomology`, `L.1/brauer-lift-cyclic`, `L.1/fpsi-lifting`; libraries: `mathlib:Rep.FiniteCyclicGroup.groupCohomologyIsoEven`, `mathlib:Rep.FiniteCyclicGroup.groupCohomologyIsoOdd`.

**Sources.**

- `Mestel.2014`, Theorem 30 (p. 25): “There is an algebra isomorphism P[cr, c2r, . . .] ⊗∧[er, e2r, . . .] → H∗(FΨq).” — The statement.
- `Mestel.2014`, Definition 24 (p. 20): “ejr ∈ H2jr−1(FΨq), j ≥ 0, is the image of ˜ejr under reduction of coefficients mod l” — The classes e_{jr}.
- `Mestel.2014`, §7 (p. 17): “We are also going to assume that l ≠ 2. The case l = 2 introduces some technicalities that are not included here for reasons of space, but can be found in Quillen's paper.” — The case ℓ = 2 is omitted (gap).

### A Sylow ℓ-subgroup of GL_n(F_q) lies in a wreath product of cyclic groups

`L.1/gl-sylow-in-wreath` · lemma

Let ℓ be an odd prime, q = p^ν with ℓ ≠ p, r the order of q modulo ℓ, C = F_{q^r}^× (cyclic of order q^r − 1), and n = rm + k with 0 ≤ k < r. Embed Σ_m ⋉ C^m in GL_n(F_q) by choosing an F_q-basis of F_{q^r} (C acting by multiplication, Σ_m permuting the m blocks, identity on the last k coordinates). Then v_ℓ(|GL_n(F_q)|) = v_ℓ(|Σ_m ⋉ C^m|), so Σ_m ⋉ C^m contains a Sylow ℓ-subgroup of GL_n(F_q).

**Hypotheses.**

- ℓ odd prime, ℓ ≠ p; r = order of q in (Z/ℓ)^×.

**Proof.**

1. |GL_n(F_q)| = q^{n(n−1)/2} ∏_{j=1}^n (q^j − 1) (Matrix.card_GL_field, after rewriting q^n − q^i = q^i(q^{n−i} − 1)).
2. ℓ ∤ q, and ℓ | q^j − 1 iff r | j; so v_ℓ|GL_n(F_q)| = Σ_{i=1}^m v_ℓ(q^{ir} − 1).
3. Lifting the exponent (padicValNat.pow_sub_pow with x = q^r, y = 1, ℓ odd): v_ℓ(q^{ir} − 1) = v_ℓ(q^r − 1) + v_ℓ(i).
4. Hence v_ℓ|GL_n(F_q)| = m·v_ℓ(q^r − 1) + v_ℓ(m!) = v_ℓ((q^r − 1)^m m!) = v_ℓ|Σ_m ⋉ C^m|.
5. A subgroup whose order has the full ℓ-adic valuation contains a Sylow ℓ-subgroup of itself which is Sylow in GL_n(F_q) (Sylow's theorems in Mathlib).

**Acceptance.**

- q = 2, ℓ = 3, n = 4: r = 2, m = 2; |GL_4(F_2)| = 20160 = 2^6·3^2·5·7 and |Σ_2 ⋉ (F_4^×)^2| = 2·9 = 18, both with 3-adic valuation 2.
- q = 4, ℓ = 3, n = 3: r = 1, m = 3; v_3|GL_3(F_4)| = v_3(3·15·63) = 1 + 1 + 2 = 4 and v_3(3^3·3!) = 3 + 1 = 4.
- For ℓ = 2 the formula v_ℓ(q^{ir} − 1) = v_ℓ(q^r − 1) + v_ℓ(i) fails: q = 3, r = 1, i = 2 gives v_2(3^2 − 1) = 3 ≠ v_2(3 − 1) + v_2(2) = 2; the lemma is stated for odd ℓ only.

**Depends on.** libraries: `mathlib:Matrix.card_GL_field`, `mathlib:padicValNat.pow_sub_pow`.

**Sources.**

- `Mestel.2014`, Lemma 32 (p. 27): “Σ_m ⋉ C^m ↪ GL_n k detects the mod-l cohomology of GL_n k.” — The detection statement whose proof is this Sylow count.
- `Mestel.2014`, Lemma 32, proof (p. 27): “it is enough to show that Σm ⋉Cm contains a Sylow l-subgroup of GLnk.” — The reduction to a Sylow count; the count uses ℓ ≠ 2.

### The mod-ℓ cohomology of GL_n(F_q)

`L.1/gl-cohomology-detection` · theorem

Let ℓ be an odd prime different from p, q = p^ν, r the order of q modulo ℓ, C = F_{q^r}^×, π = Gal(F_{q^r}/F_q) ≅ Z/r acting on C by z ↦ z^q, and n = rm + k with 0 ≤ k < r. Restriction along Σ_m ⋉ (π ⋉ C)^m ↪ GL_n(F_q) induces an isomorphism of F_ℓ-algebras H^*(GL_n(F_q); F_ℓ) ≅ H^*(C^m; F_ℓ)^{Σ_m ⋉ π^m}. Moreover the composite H^*(FΨ^q; F_ℓ) → H^*(GL_n(F_q); F_ℓ) → H^*(C^m; F_ℓ)^{Σ_m ⋉ π^m} (the first map θ_n^*) is surjective and, in each fixed degree, injective for m large.

**Hypotheses.**

- ℓ odd, ℓ ≠ p. The case ℓ = 2 is a gap (not treated in the sources read).

**Proof.**

1. Surjectivity: H^*(C; F_ℓ)^π is generated additively by classes c′_{ir}, e′_{ir} of degrees 2ir, 2ir − 1 (Mestel §8.1, citing Totaro; H^*(C; F_ℓ) additively from Mathlib's Rep.FiniteCyclicGroup.groupCohomologyIsoEven/Odd, the cup-product and π-invariant description being cited), and these are hit by c_{ir}, e_{ir} from H^*(FΨ^q) through W = β_C[L] (L.1/brauer-lift-cyclic); the map from FΨ^q factors through GL_n(F_q), so restriction is onto the invariants; Künneth and Σ_m-invariants give the m-fold statement.
2. Injectivity, step 1: mod-ℓ cohomology of a finite group is detected on a Sylow ℓ-subgroup (Cartan–Eilenberg XII.10, cited by Mestel as Theorem 31; not proved in the sources read), and Σ_m ⋉ C^m contains one (L.1/gl-sylow-in-wreath).
3. Injectivity, step 2: cohomology of Σ_m ⋉ C^m is detected by abelian subgroups of exponent dividing a power of ℓ (Quillen, The Adams conjecture, Topology 1971, Proposition 3.4; cited by Mestel as Lemma 34, not read), and every such subgroup of GL_n(F_q) is conjugate into C^m (Quillen 1972, Lemma 12; omitted by Mestel, Lemma 33). Both are gaps.
4. Hence H^*(GL_n(F_q)) → H^*(C^m) is injective with image in the Σ_m ⋉ π^m-invariants (inner automorphisms act trivially on cohomology), and it is an isomorphism onto them by step 1 (Mestel, Theorem 35).
5. The final claim: the monomials in c_{jr}, e_{jr} of a fixed degree map to linearly independent elements of H^*(C^m) once m exceeds the degree (L.1/fpsi-cohomology-ring).

**Acceptance.**

- n < r (so m = 0): H̃^*(GL_n(F_q); F_ℓ) = 0, since ℓ ∤ |GL_n(F_q)| = q^{n(n−1)/2}∏_{j≤n}(q^j − 1).
- q = 2, ℓ = 3, n = 2 (r = 2, m = 1): H^*(GL_2(F_2); F_3) = H^*(S_3; F_3) ≅ H^*(Z/3; F_3)^{Z/2}, nonzero exactly in degrees ≡ 0, 3 (mod 4); the lowest positive degree 3 and the next one 4 match e_2 and c_2 of H^*(FΨ^2; F_3).

**Depends on.** this roadmap: `L.1/gl-sylow-in-wreath`, `L.1/brauer-lift-cyclic`, `L.1/fpsi-cohomology-ring`, `L.1/quillen-map`; libraries: `mathlib:Rep.FiniteCyclicGroup.groupCohomologyIsoEven`, `mathlib:Rep.FiniteCyclicGroup.groupCohomologyIsoOdd`.

**Sources.**

- `Mestel.2014`, Theorem 35 (p. 29): “The restriction map i∗m : H∗(GLnk) → H∗(Cm)Σm⋉πm is an algebra isomorphism.” — The statement.
- `Mestel.2014`, Lemma 33 (p. 28–29): “Any abelian subgroup of GLnk of exponent dividing la for some a (i.e. gla = 1 for all g in the subgroup) is conjugate to a subgroup of Cm.” — Quillen's lemma, omitted by the source ('Proof. Omitted. See Quillen's paper, lemma 12.').
- `Mestel.2014`, Lemma 34 (p. 29): “Let G be a group whose mod-l cohomology is detected by abelian subgroups of exponent dividing la with a ≥ 1. Then the semi-direct product Σm ⋉ Gm has the same property.” — Cited from Quillen 1971, Proposition 3.4.
- `Mestel.2014`, Theorem 31 (p. 27): “Let H be a Sylow p-subgroup of a group G, and let M be a G-module. Then the restriction map” — Cartan–Eilenberg detection, cited.

### The general linear group of F_q has no mod-p homology stably

`L.1/gl-mod-p-acyclic` · theorem

For q = p^ν, H̃_*(GL(F_q); F_p) = 0, where GL(F_q) = colim_n GL_n(F_q); and H̃_*(GL(F_q); Q) = 0.

**Hypotheses.**

- q = p^ν; coefficients in the characteristic.

**Proof.**

1. Rational part: each GL_n(F_q) is finite, so H̃_*(GL_n(F_q); Q) = 0 (transfer to the trivial subgroup), and homology commutes with the colimit.
2. Mod-p part: this is Quillen 1972, §11; it is not proved in the K-book, in Haine or in Mestel ('it is in section 11 of Quillen's paper, but is omitted here'), and Quillen's paper was not available; recorded as the gap 'Quillen's vanishing of the mod-p homology of GL(F_q)'.

**Acceptance.**

- The vanishing is stable only: GL_2(F_2) ≅ S_3 has H^n(S_3; F_2) ≅ F_2 for every n ≥ 0, since restriction to the self-normalising abelian Sylow 2-subgroup Z/2 is an isomorphism.
- Consistent with L.1/quillen-k-groups: the orders q^i − 1 are prime to p, so K_*(F_q) has no p-torsion and K_*(F_q; Z/p) = 0 in positive degrees.

**Depends on.** none.

**Sources.**

- `Mestel.2014`, §9 (p. 30): “It can also be shown that GLnk has no mod p homology—it is in section 11 of Quillen's paper, but is omitted here for reasons of space.” — The statement, cited to Quillen §11.
- `Mestel.2014`, §9 (p. 30): “Also, GLk is the union of finite groups GLnk, and hence has zero rational homology” — The rational part.

### Quillen's map is an integral homology equivalence

`L.1/quillen-homology-iso` · theorem

The map θ: BGL(F_q) → FΨ^q of L.1/quillen-map induces isomorphisms H_*(BGL(F_q); Z) ≅ H_*(FΨ^q; Z).

**Hypotheses.**

- q = p^ν. The proof is complete in the sources read only for the primes ℓ ≠ 2, p; the prime ℓ = 2 (q odd) and the prime p are gaps.

**Proof.**

1. For ℓ odd, ℓ ≠ p: θ^* is an isomorphism on H^*(−; F_ℓ) (L.1/gl-cohomology-detection with n → ∞, L.1/fpsi-cohomology-ring); both spaces have finite-dimensional mod-ℓ cohomology in each degree, so θ_* is an isomorphism on H_*(−; F_ℓ) by the universal coefficient theorem (Mestel, Lemma 36).
2. For ℓ = p and for Q: both sides are acyclic (L.1/fpsi-cohomology, L.1/gl-mod-p-acyclic).
3. For ℓ = 2 with q odd: Quillen's argument is not in the sources read (gap).
4. A map inducing isomorphisms on homology with coefficients Q and F_ℓ for all primes ℓ is an integral homology isomorphism (Mestel, Theorem 37, citing Hatcher).

**Acceptance.**

- In degree 1: H_1(BGL(F_q); Z) = GL(F_q)^{ab} = K_1(F_q) ≅ F_q^× and H_1(FΨ^q; Z) = π_1(FΨ^q) ≅ Z/(q − 1), and θ_* is the determinant composed with ι (L.1/quillen-map).
- For q = 2 the statement includes H̃_*(BGL(F_2); F_2) = 0, a consequence of the mod-p gap node.

**Depends on.** this roadmap: `L.1/quillen-map`, `L.1/gl-cohomology-detection`, `L.1/fpsi-cohomology`, `L.1/fpsi-cohomology-ring`, `L.1/gl-mod-p-acyclic`.

**Sources.**

- `Haine.2016`, Construction 6.11 (p. 11): “is dedicated to computing the homology and cohomology of BGL(F_q) and Fψ^q with various coefficients to show that the map θ is an integral homology equivalence.” — The statement, as the goal of Quillen's paper.
- `Mestel.2014`, Theorem 37 (p. 30): “A map f : X → Y induces isomorphisms on integral homology if and only if it induces isomorphisms on homology with coefficients in Q and in Fp′ for all primes p′.” — The assembly over all primes.
- `Mestel.2014`, Lemma 36 (p. 29): “Suppose g : X → Y is a map with g∗ : H∗(Y ; k) → H∗(X; k) an isomorphism. Then g∗: H∗(X; k) → H∗(Y ; k) is an isomorphism.” — Cohomology to homology.

### Quillen's theorem: BGL(F_q)^+ is the homotopy fibre of ψ^q − 1

`L.1/quillen-fibration` · theorem · planet “Quillen's theorem on BGL(F_q)^+”

For every finite field F_q, the map θ^+: BGL(F_q)^+ → FΨ^q of L.1/quillen-map is a homotopy equivalence. Equivalently, BGL(F_q)^+ →ρ BU →(ψ^q − 1) BU is a homotopy fibration sequence, with ρ the Brauer lift map.

**Hypotheses.**

- F_q a finite field; ι fixed.

**Proof.**

1. θ induces an integral homology isomorphism (L.1/quillen-homology-iso).
2. FΨ^q is an H-space (L.1/fpsi), so by Remark IV.1.8.1 (StableHomotopyKTheory:H.3/plus-construction-universal-property: 'an integral homology isomorphism BGL(R) → H into an H-space is acyclic and induces BGL(R)^+ ≃ H') θ^+ is a homotopy equivalence. Alternatively both spaces are simple and Whitehead's theorem for simple spaces applies (Haine, Theorem 6.5; Mestel, Theorem 38).
3. The fibration form follows from L.1/fpsi (FΨ^q ≃ hofib(1 − ψ^q)) and ρ = φθ^+.

**Acceptance.**

- The equivalence is compatible with π_1: K_1(F_q) ≅ F_q^× ≅ Z/(q − 1).
- For q = 2 the equivalence makes BGL(F_2)^+ simply connected (K_1(F_2) = 0) with π_3 ≅ Z/3 and π_2 = π_4 = 0.

**Depends on.** this roadmap: `L.1/quillen-homology-iso`, `L.1/quillen-map`, `L.1/fpsi`; other roadmaps: `StableHomotopyKTheory:H.3/plus-construction-universal-property`.

**Sources.**

- `Kbook.2013`, Theorem IV.1.12 (PDF p. 277): “Theorem 1.12. (Quillen) The map BGL(F_q)^+ → BU identifies BGL(F_q)^+ with the homotopy fiber of ψ^q − 1. That is, the following is a homotopy fibration.” — The statement.
- `Haine.2016`, Goal 6.6 (p. 10): “The universal property of the plus construction will then give a map” — The passage from θ to θ^+.
- `Haine.2016`, Theorem 6.5 (Dror) (p. 10): “If X and Y are simple spaces and f : X → Y induces an isomorphism on integral homology, then f is a weak homotopy equivalence.” — Whitehead's theorem for simple spaces.

### Quillen's computation of the K-groups of a finite field

`L.1/quillen-k-groups` · theorem · planet “K-theory of finite fields”

For every finite field F_q and every i ≥ 1: K_{2i}(F_q) = 0 and K_{2i−1}(F_q) ≅ Z/(q^i − 1). Together with K_0(F_q) ≅ Z (by dimension; TauCeti.SplitK0.finrankEquiv in the split-K₀ model, KTheoryLowDegrees Z.2) this is the complete table K_*(F_q). The isomorphism K_{2i−1}(F_q) ≅ Z/(q^i − 1) is the composite of θ^+_* with the boundary ∂: π_{2i}(BU) ≅ Z → π_{2i−1}(FΨ^q); it depends on ι and on a generator of π_{2i}(BU), so no generator of K_{2i−1}(F_q) is canonical; every formula below is stated without one.

**Hypotheses.**

- F_q a finite field, q = p^ν; i ≥ 1.

**Proof.**

1. K_n(F_q) = π_n BGL(F_q)^+ for n ≥ 1 (GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q).
2. θ^+ is a homotopy equivalence (L.1/quillen-fibration), so K_n(F_q) ≅ π_n(FΨ^q).
3. π_{2i}(FΨ^q) = 0 and π_{2i−1}(FΨ^q) ≅ Z/(q^i − 1) (L.1/fpsi-homotopy).
4. K_0(F_q) ≅ Z is the baseline dimension isomorphism (TauCeti.SplitK0.finrankEquiv) transported through GeneralAlgebraicKTheory's identification of K_0; it is not part of Quillen's argument.

**Acceptance.**

- q = 2: K_1 = 0, K_3 ≅ Z/3, K_5 ≅ Z/7, K_7 ≅ Z/15.
- q = 3: K_1 ≅ Z/2, K_3 ≅ Z/8; q = 4: K_3 ≅ Z/15; q = 9: K_3 ≅ Z/80 (K3BlochGroups V.5 imports the case i = 2 for every q, including 2 and 3).
- K_2(F_q) = 0 for every q, in agreement with Matsumoto's symbol calculation (L.1/degree-two-symbols).
- The table is not deduced from |GL_n(F_q)| (Matrix.card_GL_field): the order of the group does not determine its homology.

**Depends on.** this roadmap: `L.1/quillen-fibration`, `L.1/fpsi-homotopy`; other roadmaps: `GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q`; libraries: `tauceti:TauCeti.SplitK0.finrankEquiv`, `mathlib:ZMod`.

**Sources.**

- `Kbook.2013`, Corollary IV.1.13 (PDF p. 277): “Corollary 1.13. For every finite field F_q, and n ≥ 1, we have K_n(F_q) = π_nBGL(F_q)^+ ≅ Z/(q^i − 1) (n = 2i − 1), 0 (n even).” — The statement (displayed cases written inline).
- `Weibel.Handbook.I5`, Example 15 (p. 148): “Quillen computed the K-theory of F_q in [47], showing that K_{2i}(F_q) = 0 for i > 0 and that K_{2i−1}(F_q) ≅ Z/w_i(F_q).” — The same table with w_i(F_q) = q^i − 1.
- `Haine.2016`, Theorem 3.1 (p. 4): “For all n ≥ 1 we have K_{2n}(F_q) = 0 and K_{2n−1}(F_q) ≅ Z/(q^n − 1).” — The table in Haine's notes.

### The Adams/Frobenius comparison

`L.1/frobenius-is-adams` · theorem

Let Φ: F_q → F_q, x ↦ x^p, be the absolute Frobenius and Φ_* its action on K_*(F_q). Under Quillen's equivalence θ^+ (L.1/quillen-fibration), Φ corresponds to the Adams operation ψ̃^p on FΨ^q: θ^+ ∘ BGL(Φ)^+ and ψ̃^p ∘ θ^+ induce the same maps on homotopy groups. Consequently Φ_* acts on K_{2i−1}(F_q) as multiplication by p^i, and every automorphism σ = Φ^a of F_q acts on K_{2i−1}(F_q) as multiplication by p^{ai}.

**Hypotheses.**

- F_q, q = p^ν; i ≥ 1.

**Proof.**

1. For the standard representation id_n of GL_n(F_q), the representation g ↦ Φ(g) (entrywise p-th power) has eigenvalues λ^p, so β(Φ^* id_n) = ψ^p β(id_n) in R_C(GL_n(F_q)) (L.1/brauer-lift-lambda-ring, character_pow of L.1/brauer-character).
2. Hence φθ_n ∘ BΦ and ψ^p φθ_n agree in [BGL_n(F_q), BU] (the Atiyah map commutes with ψ^p), so θ_n ∘ BΦ ≃ ψ̃^p ∘ θ_n by the lifting bijection of L.1/fpsi-lifting; the same holds on BGL(F_q), using [BGL(F_q), U] = 0 (part of the lifting lemma).
3. Extend to the plus construction: both composites are extensions of the same map BGL(F_q) → FΨ^q, so they induce the same maps on homotopy groups (StableHomotopyKTheory:H.3/plus-construction-universal-property, independence of the factorisation).
4. On π_{2i−1}(FΨ^q) = ∂(π_{2i}(BU)), ψ̃^p acts as p^i because ∂ψ^p = ψ̃^p∂ and ψ^p = p^i on π_{2i}(BU) (L.1/fpsi, RT.4 request).
5. Automorphisms of F_q are the powers of Φ (FiniteField.bijective_frobeniusAlgEquivOfAlgebraic_pow over the prime field).

**Acceptance.**

- q = 4, i = 2: Φ acts on K_3(F_4) ≅ Z/15 as multiplication by 4, an automorphism of order 2 = [F_4 : F_2], since 4^2 = 16 ≡ 1 mod 15.
- q = p: Φ = id and p^i ≡ 1 mod (p^i − 1), consistent.
- In degree 1, Φ acts on K_1(F_q) = F_q^× by x ↦ x^p, which is multiplication by p on the cyclic group Z/(q − 1).

**Depends on.** this roadmap: `L.1/quillen-fibration`, `L.1/quillen-map`, `L.1/brauer-lift-lambda-ring`, `L.1/fpsi-lifting`, `L.1/fpsi`, `L.1/quillen-k-groups`; other roadmaps: `RefinedTraceMethods:RT.4:topological`, `StableHomotopyKTheory:H.3/plus-construction-universal-property`; libraries: `mathlib:FiniteField.bijective_frobeniusAlgEquivOfAlgebraic_pow`.

**Sources.**

- `Haine.2016`, Theorem 3.1 (3.1.c) (p. 5): “denote the absolute Frobenius automorphism. Then for all n ≥ 1, the induced homomorphism” — The Frobenius statement (the displayed map is K_{2n−1}(F_q) → K_{2n−1}(F_q)).
- `Haine.2016`, Theorem 3.1 (3.1.c) (p. 5): “is given by multiplication by p^n.” — The value p^n.
- `Kbook.2013`, IV.1, before Theorem 1.12 (PDF p. 277): “and show (5.5.2) that ψ^p is induced by the Frobenius on F_q, so that ψ^q is the identity map on K_n(F_q).” — The K-book's form of the comparison, through λ-operations (L.1/adams-psi-p-frobenius).

### ψ^p is the Frobenius on the K-theory of an F_p-algebra

`L.1/adams-psi-p-frobenius` · theorem

Let A be a commutative algebra over a field of characteristic p, Φ: A → A, a ↦ a^p, and ψ^p the Adams operation on K_n(A), n > 0, and on [X, BGL(A)^+] (Quillen–Hiller operations, imported from SchemeKTheoryOperations S.6). Then ψ^p = Φ_*. In particular, for A = F_q with q = p^ν, ψ^q = (ψ^p)^ν = (Φ^ν)_* = id on K_n(F_q) for n > 0 and on [X, BGL(F_q)^+].

**Hypotheses.**

- A commutative, pA = 0; n > 0.
- The operations are those of K-book IV.5 (through the representation rings R_A(G)); SchemeKTheoryOperations S.6 is asked to supply them in this form.

**Proof.**

1. On representation rings, ψ^p = Φ^* on R_A(G) (K-book Ex. II.4.2(b), via the splitting principle for R_A(G); requested from S.6 with the operations).
2. The operations on [X, BGL(A)^+] are induced from R_A(GL_n(A)) through q: R_A(G) → [BG, BGL(A)^+] (Proposition IV.5.3), and q(Φ^*) is induced by Φ: A → A by naturality in A (K-book proof of 5.5.2).
3. ψ^jψ^k = ψ^{jk} (S.6) gives ψ^q = (ψ^p)^ν, and Φ^ν = id on F_q (FiniteField.frobeniusAlgEquivOfAlgebraic has order ν over F_p).

**Acceptance.**

- On K_1(A) = A^× (A local), ψ^p(a) = a^p = Φ(a) (K-book Example IV.5.4.1: ψ^k(a) = a^k).
- Consistent with L.1/frobenius-is-adams: on K_{2i−1}(F_q) both give multiplication by p^i, and ψ^q = q^i ≡ 1 mod (q^i − 1).
- For A perfect, ψ^p is an automorphism, so K_n(A) is uniquely p-divisible (K-book Proposition IV.5.6).

**Depends on.** other roadmaps: `SchemeKTheoryOperations:S.6`; libraries: `mathlib:FiniteField.orderOf_frobeniusAlgEquivOfAlgebraic`.

**Sources.**

- `Kbook.2013`, Corollary IV.5.5.2 (PDF p. 322): “Corollary 5.5.2. If A is an algebra over a field of characteristic p, ψ^p is the Frobenius Φ_* on K_n(A), n>0, and more generally on [X, BGL(A)^+] for all X.” — The statement.
- `Kbook.2013`, Corollary IV.5.5.2, proof (PDF p. 322): “This follows from the fact (Ex. II.4.2) that ψ^p = Φ^* on the representation ring R_A(G)” — The proof route.
- `Kbook.2013`, Exercise II.4.2(b) (PDF p. 106): “When p = 0 in A, show that ψ^p = Φ^* in R_A(G), where Φ : A → A is the Frobenius Φ(a) = a^p.” — The representation-ring input.

### Adams operations on the K-theory of a finite field

`L.1/adams-on-finite-field-k` · theorem

For every k ≥ 1 and i ≥ 1, the Adams operation ψ^k acts on K_{2i−1}(F_q) as multiplication by k^i.

**Hypotheses.**

- F_q finite; ψ^k the Quillen–Hiller Adams operation (SchemeKTheoryOperations S.6).

**Proof.**

1. The map [X, BGL(F_q)^+] → [X, BGL(C)^+] → [X, BU] induced by Brauer lifting is a homomorphism of λ-rings (K-book Example IV.5.8): Brauer lifting is a λ-ring map (L.1/brauer-lift-lambda-ring), and the universality of q: R_A(π_1X) → [X, BGL(A)^+] for maps to representable functors (K-book Proposition IV.5.7, proved by obstruction theory in Hiller, cited) transports it; Proposition IV.5.7 is requested from S.6.
2. Hence ρ ∘ ψ^k ≃ ψ^k ∘ ρ as maps BGL(F_q)^+ → BU; lifting to FΨ^q as in L.1/frobenius-is-adams, θ^+ ∘ ψ^k and ψ̃^k ∘ θ^+ induce the same maps on homotopy groups.
3. ψ̃^k acts on π_{2i−1}(FΨ^q) = ∂π_{2i}(BU) as k^i, since ψ^k = k^i on π_{2i}(BU) (II.4.4.1; RT.4 request).

**Acceptance.**

- k = p recovers L.1/frobenius-is-adams; k = q gives multiplication by q^i ≡ 1, i.e. ψ^q = id (L.1/adams-psi-p-frobenius).
- k = −1 is not an Adams operation here (k ≥ 1).

**Depends on.** this roadmap: `L.1/brauer-lift-lambda-ring`, `L.1/quillen-map`, `L.1/quillen-fibration`, `L.1/fpsi`; other roadmaps: `SchemeKTheoryOperations:S.6`, `RefinedTraceMethods:RT.4:topological`.

**Sources.**

- `Kbook.2013`, Example IV.5.9.2 (PDF p. 324): “Example 5.9.2. For finite fields, we have ψ^k(x) = k^i x for x ∈ K_{2i−1}(F_q). This follows from Example 5.8 and the fact (II.4.4.1) that ψ^k = k^i on π_{2i}BU” — The statement and its proof route.
- `Kbook.2013`, Example IV.5.8 (PDF p. 323): “It follows from 5.7 and 5.7.1 that [X, BGL(F_q)^+] → [X, BGL(C)^+] → [X, BU] are homomorphisms of λ-rings.” — Brauer lifting commutes with the operations.
- `Kbook.2013`, Proposition IV.5.7 (PDF p. 323): “is universal for maps to representable functors.” — Hiller's universality, cited.

### The tensor square of a finite Galois extension splits

`L.1/galois-tensor-splitting` · lemma

Let ℓ/k be a finite Galois extension of fields with group G. The ℓ-algebra map ℓ ⊗_k ℓ → ∏_{g∈G} ℓ, x ⊗ y ↦ (x·g(y))_{g∈G}, where ℓ acts through the left factor, is an isomorphism. Consequently, for an ℓ-vector space V, the ℓ-vector space ℓ ⊗_k V (V regarded as a k-space, ℓ acting on the left factor) is naturally isomorphic to ⊕_{g∈G} g^*V, where g^*V is V with ℓ acting through g.

**Hypotheses.**

- ℓ/k finite Galois with group G (IsGalois); in L.1 the case of finite fields, where G is cyclic generated by the q-power Frobenius.

**Proof.**

1. Choose a primitive element α with minimal polynomial f over k (Field.exists_primitive_element), so ℓ ≅ k[x]/(f).
2. Base change of AdjoinRoot (AdjoinRoot.tensorAlgEquiv) gives ℓ ⊗_k ℓ ≅ ℓ[x]/(f).
3. Over ℓ, f = ∏_{g∈G}(x − g(α)) with distinct roots, since ℓ/k is normal and separable and #G = [ℓ : k] (IsGalois.card_aut_eq_finrank).
4. The Chinese remainder theorem (Ideal.quotientInfRingEquivPiQuotient) gives ℓ[x]/(f) ≅ ∏_g ℓ[x]/(x − g(α)) ≅ ∏_g ℓ; tracing α shows the composite is x ⊗ y ↦ (x g(y))_g.
5. For V: ℓ ⊗_k V ≅ (ℓ ⊗_k ℓ) ⊗_ℓ V ≅ ⊕_g ℓ_g ⊗_ℓ V = ⊕_g g^*V, naturally in V.

**Acceptance.**

- For F_4/F_2 with G = {1, Frob}: F_4 ⊗_{F_2} F_4 ≅ F_4 × F_4 by x ⊗ y ↦ (xy, xy^2).
- For a non-Galois extension such as Q(2^{1/3})/Q the tensor square is Q(2^{1/3}) × Q(2^{1/3}, ω), not a product of copies of Q(2^{1/3}): the Galois hypothesis is needed.

**Depends on.** libraries: `mathlib:Field.exists_primitive_element`, `mathlib:AdjoinRoot.tensorAlgEquiv`, `mathlib:IsGalois`, `mathlib:IsGalois.card_aut_eq_finrank`, `mathlib:Ideal.quotientInfRingEquivPiQuotient`.

**Sources.**

- `Kbook.2013`, Exercise IV.6.13 (PDF p. 332): “and that f^*f_* is multiplication by [S ⊗_R S] ∈ K_0(S).” — The class [S ⊗_R S] that this lemma computes for a Galois extension.
- `Mestel.2014`, §5.4 (p. 12): “By Galois theory, this is an isomorphism (by dimension-counting).” — The finite-field case of the splitting, used for the Brauer lift of F_{q^r}.

### Restriction and transfer for finite extensions of finite fields

`L.1/restriction-and-transfer` · construction

Let i: F_q → F_{q′}, q′ = q^d, be an extension of finite fields, G = Gal(F_{q′}/F_q) = ⟨φ_q⟩ with φ_q(x) = x^q. Restriction i^*: K_n(F_q) → K_n(F_{q′}) is the functoriality of K-theory along i (base change P(F_q) → P(F_{q′}), V ↦ F_{q′} ⊗ V; on BGL^+ it is induced by GL(F_q) ⊂ GL(F_{q′})). Transfer i_*: K_n(F_{q′}) → K_n(F_q) is induced by the exact forgetful functor P(F_{q′}) → P(F_q) (restriction of scalars; GeneralAlgebraicKTheory K.3 transfers); in the plus model it is induced by GL(F_{q′}) → GL(F_q) obtained from F_{q′}^m ≅ F_q^{md} after choosing an F_q-basis of F_{q′}, and the induced map on homotopy groups does not depend on the basis. Both are defined for K_n(−; Z/m) (L.1/k-theory-mod-m) and are compatible with reduction and Bockstein. The Galois group acts on K_n(F_{q′}) through g_* for g ∈ G. No generator of any K-group enters the definitions.

**Hypotheses.**

- F_q ⊂ F_{q′} finite fields, d = [F_{q′} : F_q].

**Proof.**

1. Restriction: functoriality of K(−) (GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories).
2. Transfer: F_{q′} is a finitely generated free F_q-module, so restriction of scalars P(F_{q′}) → P(F_q) is exact and induces i_* (GeneralAlgebraicKTheory:K.3/resolution-theorem).
3. Plus model: a basis of F_{q′} over F_q identifies F_{q′}^m ≅ F_q^{md} and gives GL_m(F_{q′}) → GL_{md}(F_q); another basis changes the map by conjugation, which acts trivially on the homotopy of the H-space BGL(F_q)^+ (K-book IV.1.1.3). The + = Q comparison (GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q) is natural for exact functors of split exact categories, so the two transfers agree.
4. Coefficients: apply E ↦ E/m to the maps of spectra (L.1/k-theory-mod-m).
5. Projection formula: i_*(i^*x · y) = x · i_*y for x ∈ K_*(F_q), y ∈ K_*(F_{q′}) (GeneralAlgebraicKTheory:K.7/biexact-pairings-and-products; K.3 transfers).

**API.**

- `TauCeti.KTheory.FiniteField.res` (data): i^*: K_n(F_q) → K_n(F_{q′}) for F_q ⊂ F_{q′}.
- `TauCeti.KTheory.FiniteField.tr` (data): i_*: K_n(F_{q′}) → K_n(F_q), induced by restriction of scalars.
- `TauCeti.KTheory.FiniteField.tr_plus` (compatibility): i_* agrees with the plus-construction transfer of K-book IV.1.1.3 for every F_q-basis of F_{q′}.
- `TauCeti.KTheory.FiniteField.res_comp` (functoriality): (j ∘ i)^* = j^* ∘ i^* and (j ∘ i)_* = i_* ∘ j_* for F_q ⊂ F_{q′} ⊂ F_{q″}; id^* = id_* = id.
- `TauCeti.KTheory.FiniteField.galois_act` (functoriality): G acts on K_n(F_{q′}) by g ↦ g_*, a group action, with i^* landing in the invariants (g ∘ i = i).
- `TauCeti.KTheory.FiniteField.tr_galois` (relation): i_* ∘ g_* = i_* for g ∈ G (g is an F_q-linear automorphism of the forgetful functor's source).
- `TauCeti.KTheory.FiniteField.tr_res` (relation): i_* ∘ i^* = d (L.1/galois-transfer-formula).
- `TauCeti.KTheory.FiniteField.res_tr` (relation): i^* ∘ i_* = Σ_{g∈G} g_* (L.1/galois-transfer-formula).
- `TauCeti.KTheory.FiniteField.projection` (relation): i_*(i^*x · y) = x · i_*y.
- `TauCeti.KTheory.FiniteField.res_coeff` (compatibility): Restriction and transfer on K_*(−; Z/m) commute with reduction and Bockstein.
- `TauCeti.KTheory.FiniteField.res_one` (compatibility): In degree 1, i^* is the inclusion F_q^× ⊂ F_{q′}^× and i_* is the norm (L.1/determinant-degree-one).

**Unit tests.**

- `TauCeti.KTheory.FiniteField.res_tr_degree_three` (computation): For F_2 ⊂ F_4, degree 3: i^*: Z/3 → Z/15 has image the subgroup of order 3, i_*i^* = 2 and i^*i_* = 5 (= 1 + 4).
- `TauCeti.KTheory.FiniteField.res_trivial_extension` (degenerate): For F_q = F_{q′}, i^* = i_* = id.
- `TauCeti.KTheory.FiniteField.tr_one_norm` (compatibility): For F_3 ⊂ F_9 in degree 1, i_*: F_9^× → F_3^× is Algebra.norm, x ↦ x^4, which is onto (FiniteField.norm_surjective).
- `TauCeti.KTheory.FiniteField.res_not_iso` (non-example): For F_2 ⊂ F_4 in degree 3, restriction is not surjective (Z/3 → Z/15) and transfer is not injective: a definition making both isomorphisms fails.
- `TauCeti.KTheory.FiniteField.res_tr_degree_one` (computation): For F_3 ⊂ F_9 in degree 1, i^*i_* = 1 + φ_3 is x ↦ x^{1+3} on F_9^×.

**Acceptance.**

- For d = 1 both maps are the identity.
- In degree 1 the transfer is the norm F_{q′}^× → F_q^× (L.1/determinant-degree-one).

**Used by.**

- K-book Corollary IV.1.13: restriction is injective onto the Galois invariants and transfer is onto
- K3BlochGroups V.5/finite-field-transfer: restriction and transfer in degree three with their formulas
- ArithmeticKTheory N.2 (localisation sequences and finite extensions, K-book V.6.6.4): the residue maps N_{p′/p} of the morphism of localisation sequences are these transfers
- K-book Proposition V.6.8.1 (Soulé; ArithmeticKTheory N.5): 'the transfer maps K_{2i−1}(R′/p′) → K_{2i−1}(R/p) are all onto by IV.1.13'
- K-book Corollary IV.2.8.2: transfer from F_q(ζ_ℓ) produces β′ and ζ′

**Depends on.** this roadmap: `L.1/k-theory-mod-m`; other roadmaps: `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`, `GeneralAlgebraicKTheory:K.3/resolution-theorem`, `GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q`, `GeneralAlgebraicKTheory:K.7/biexact-pairings-and-products`; libraries: `mathlib:FiniteField.bijective_frobeniusAlgEquivOfAlgebraic_pow`.

**Sources.**

- `Kbook.2013`, Transfer maps IV.1.1.3 (PDF p. 269): “If R → S is a ring map such that S ≅ R^d as an R-module, the isomorphisms S^m ≅ R^{md} induce a group map GL(S) → GL(R) and hence a map BGL(S)^+ → BGL(R)^+, again unique up to homotopy.” — The plus-model transfer.
- `Kbook.2013`, Definition IV.6.3.2 (PDF p. 328): “Then there is a forgetful functor P(S) → P(R) and hence a “transfer” functor f_* : K_*(S) → K_*(R).” — The Q-model transfer.

### Transfer after restriction, and restriction after transfer

`L.1/galois-transfer-formula` · lemma

Let i: k → ℓ be a finite field extension of degree d. Then i_* ∘ i^* = multiplication by d on K_n(k) and on K_n(k; Z/m). If ℓ/k is Galois with group G then i^* ∘ i_* = Σ_{g∈G} g_* on K_n(ℓ) and on K_n(ℓ; Z/m).

**Hypotheses.**

- ℓ/k finite; for the second formula Galois with group G.

**Proof.**

1. i_* i^* is induced by the exact functor V ↦ ℓ ⊗_k V from P(k) to P(k), naturally isomorphic to V ↦ V^d; by additivity (GeneralAlgebraicKTheory:K.3/additivity-for-exact-categories) and the fact that isomorphic exact functors induce the same map (GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories) it is multiplication by d = [ℓ] ∈ K_0(k) = Z.
2. i^* i_* is induced by W ↦ ℓ ⊗_k W from P(ℓ) to P(ℓ), naturally isomorphic to W ↦ ⊕_{g∈G} g^*W (L.1/galois-tensor-splitting), where g^*: P(ℓ) → P(ℓ) is base change along g; by additivity this is Σ_g g_* (the sum over G is invariant under g ↦ g^{−1}).
3. The same identities hold after E ↦ E/m (L.1/k-theory-mod-m), since they are identities of maps of spectra up to homotopy obtained from natural isomorphisms of exact functors.

**Acceptance.**

- For F_2 ⊂ F_4 in degree 1 (K_1(F_2) = 0, K_1(F_4) = F_4^×): i^*i_* = 1 + Frob is x ↦ x·x^2 = x^3 = 1 on F_4^×, and indeed K_1(F_2) = 0.
- For k = ℓ both formulas give the identity.

**Depends on.** this roadmap: `L.1/galois-tensor-splitting`, `L.1/restriction-and-transfer`, `L.1/k-theory-mod-m`; other roadmaps: `GeneralAlgebraicKTheory:K.3/additivity-for-exact-categories`, `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`.

**Sources.**

- `Kbook.2013`, Exercise IV.6.13 (PDF p. 332): “If f : R → S and S is in P(R), show that f_*f^* is multiplication by [S] ∈ K_0(R), and that f^*f_* is multiplication by [S ⊗_R S] ∈ K_0(S).” — The two composites.
- `Kbook.2013`, Exercise IV.6.13 (PDF p. 332): “If f : R → S is a Galois extension with group G, show that” — The Galois formula f^*f_* = Σ_{g∈G} g (the displayed sum is lost in the text layer).
- `Kbook.2013`, Corollary IV.2.8.2, proof (PDF p. 290): “Since i_*i^* is” — Used in the source with the Galois formula (Σ_{g∈G} g_* by Ex. IV.6.13).

### The Galois action on the odd K-groups of a finite field

`L.1/frobenius-action-extension` · lemma

Let F_q ⊂ F_{q′}, q′ = q^d, with G = Gal(F_{q′}/F_q) generated by φ_q: x ↦ x^q. For i ≥ 1 and 0 ≤ j < d, (φ_q^j)_* acts on K_{2i−1}(F_{q′}) as multiplication by q^{ij}. Hence the G-invariants K_{2i−1}(F_{q′})^G are the elements killed by q^i − 1, the unique subgroup of order q^i − 1 of the cyclic group K_{2i−1}(F_{q′}) ≅ Z/(q^{di} − 1), and Σ_{g∈G} g_* is multiplication by 1 + q^i + … + q^{i(d−1)} = (q^{di} − 1)/(q^i − 1).

**Hypotheses.**

- q = p^ν, q′ = q^d, i ≥ 1.

**Proof.**

1. φ_q = Φ^ν where Φ is the absolute Frobenius of F_{q′}; by L.1/frobenius-is-adams applied to F_{q′}, Φ_* = p^i on K_{2i−1}(F_{q′}), so (φ_q^j)_* = p^{iνj} = q^{ij}.
2. G = {φ_q^j : 0 ≤ j < d} (FiniteField.bijective_frobeniusAlgEquivOfAlgebraic_pow).
3. In a cyclic group of order q^{di} − 1, the kernel of multiplication by q^i − 1 is the subgroup of order gcd(q^i − 1, q^{di} − 1) = q^i − 1 (L.1/quillen-k-groups gives cyclicity).
4. Sum over G: Σ_{j<d} q^{ij} = (q^{di} − 1)/(q^i − 1).

**Acceptance.**

- F_2 ⊂ F_4, i = 2: the Frobenius acts on K_3(F_4) ≅ Z/15 by 4, the invariants have order 3 = |K_3(F_2)|, and 1 + 4 = 5.
- F_3 ⊂ F_27, i = 1: G acts on F_27^× by x ↦ x^{3^j}, invariants F_3^× of order 2, and 1 + 3 + 9 = 13 = 26/2.

**Depends on.** this roadmap: `L.1/frobenius-is-adams`, `L.1/quillen-k-groups`; libraries: `mathlib:FiniteField.bijective_frobeniusAlgEquivOfAlgebraic_pow`.

**Sources.**

- `Haine.2016`, Theorem 3.1 (3.1.c) (p. 5): “denote the absolute Frobenius automorphism. Then for all n ≥ 1, the induced homomorphism” — The Frobenius action, from which the action of φ_q = Φ^ν follows.
- `Kbook.2013`, VI.1, finite characteristic (PDF p. 473): “The action of the Frobenius automorphism φ(x) = x^p on F induces multiplication by p^i on K_{2i−1}(F̄_p); we say that the action is twisted i times.” — The same twist, for the algebraic closure.

### Restriction is injective onto the Galois invariants, and transfer is onto

`L.1/finite-field-galois-descent` · theorem

Let F_q ⊂ F_{q′} be finite fields with G = Gal(F_{q′}/F_q). For every n ≥ 1, restriction i^*: K_n(F_q) → K_n(F_{q′}) is injective with image K_n(F_{q′})^G, and transfer i_*: K_n(F_{q′}) → K_n(F_q) is surjective. The same holds for K_0 (restriction Z → Z is the identity, transfer is multiplication by d = [F_{q′} : F_q], so for n = 0 only injectivity and the identification with invariants hold; transfer on K_0 is onto only when d = 1).

**Hypotheses.**

- F_q ⊂ F_{q′}; n ≥ 1 for the full statement.

**Proof.**

1. Even n ≥ 2: all groups vanish (L.1/quillen-k-groups).
2. n = 2i − 1: write d = [F_{q′} : F_q]. By L.1/frobenius-action-extension, i^*i_* = Σ_g g_* is multiplication by M = (q^{di} − 1)/(q^i − 1) on the cyclic group K_{2i−1}(F_{q′}) of order q^{di} − 1, whose image is the subgroup of order (q^{di} − 1)/gcd(M, q^{di} − 1) = q^i − 1, which is K_{2i−1}(F_{q′})^G.
3. im(i^*) ⊆ K_{2i−1}(F_{q′})^G because g ∘ i = i; and im(i^*) ⊇ im(i^*i_*) = K_{2i−1}(F_{q′})^G. So im(i^*) = K_{2i−1}(F_{q′})^G has order q^i − 1 = |K_{2i−1}(F_q)|, and i^* is injective.
4. Surjectivity of i_*: i^*(im i_*) = im(i^*i_*) = im(i^*), and i^* is injective, so im(i_*) = K_{2i−1}(F_q).
5. The proof uses no generator of any cyclic group; it rests on L.1/galois-transfer-formula and L.1/frobenius-action-extension.

**Acceptance.**

- F_2 ⊂ F_4, n = 3: Z/3 ↪ Z/15 onto the subgroup of order 3 = the Frobenius invariants; transfer Z/15 → Z/3 onto.
- F_3 ⊂ F_9, n = 1: F_3^× ↪ F_9^× with image the φ_3-invariants {x : x^3 = x} ∩ F_9^× = F_3^×, and the norm x ↦ x^4 is onto F_3^×.
- The statement fails for the transfer on K_0 when d > 1 (image dZ): the theorem is stated for n ≥ 1.

**Depends on.** this roadmap: `L.1/quillen-k-groups`, `L.1/frobenius-action-extension`, `L.1/galois-transfer-formula`, `L.1/restriction-and-transfer`.

**Sources.**

- `Kbook.2013`, Corollary IV.1.13 (PDF p. 277): “Moreover, if F_q ⊂ F_{q′} then K_n(F_q) → K_n(F_{q′}) is an injection, identifying K_n(F_q) with K_n(F_{q′})^G, where G = Gal(F_{q′}/F_q); the transfer map K_n(F_{q′}) → K_n(F_q) is onto (see 1.1.3).” — The statement; the proof steps derive it without choosing generators.
- `Haine.2016`, Theorem 3.1 (3.1.b) (p. 5): “is a field extension, then” — Injectivity of restriction (Haine's (3.1.b)).

### The restriction and transfer formulas in odd degrees

`L.1/finite-field-transfer-formulas` · theorem

Let F_q ⊂ F_{q′} with d = [F_{q′} : F_q] and i ≥ 1. On K_{2i−1}: i_* ∘ i^* = multiplication by d on K_{2i−1}(F_q) ≅ Z/(q^i − 1); i^* ∘ i_* = multiplication by (q^{di} − 1)/(q^i − 1) on K_{2i−1}(F_{q′}) ≅ Z/(q^{di} − 1); and the Frobenius φ_q acts on K_{2i−1}(F_{q′}) as multiplication by q^i. These statements involve no choice of generator. With a choice of generator x of K_{2i−1}(F_{q′}), (q^{di} − 1)/(q^i − 1)·x generates the image of i^*, but which generator of K_{2i−1}(F_q) it comes from depends on the choice and is not part of the theorem.

**Hypotheses.**

- F_q ⊂ F_{q′}, i ≥ 1.

**Proof.**

1. i_*i^* = d and i^*i_* = Σ_g g_* (L.1/galois-transfer-formula).
2. Σ_g g_* = (q^{di} − 1)/(q^i − 1) and φ_q = q^i (L.1/frobenius-action-extension).
3. Consistency check, not an input: i^*(i_*i^*) = (i^*i_*)i^*, so d ≡ (q^{di} − 1)/(q^i − 1) modulo q^i − 1, which holds since q^{ij} ≡ 1.

**Acceptance.**

- F_2 ⊂ F_4, i = 2: d = 2, (16 − 1)/(4 − 1) = 5, and 5 ≡ 2 mod 3.
- F_3 ⊂ F_9, i = 2: d = 2, (81 − 1)/(9 − 1) = 10, 10 ≡ 2 mod 8; K_3(F_3) ≅ Z/8 ↪ K_3(F_9) ≅ Z/80.
- The degree-three case is imported by K3BlochGroups V.5/finite-field-transfer.

**Depends on.** this roadmap: `L.1/galois-transfer-formula`, `L.1/frobenius-action-extension`, `L.1/finite-field-galois-descent`.

**Sources.**

- `Kbook.2013`, Corollary IV.1.13 (PDF p. 277): “the transfer map K_n(F_{q′}) → K_n(F_q) is onto (see 1.1.3).” — Surjectivity, refined here by the composite formulas.
- `Kbook.2013`, Exercise IV.6.13 (PDF p. 332): “If f : R → S and S is in P(R), show that f_*f^* is multiplication by [S] ∈ K_0(R)” — The formula i_*i^* = d.

### Products in the K-theory of a finite field

`L.1/finite-field-products-vanish` · lemma

For every finite field F_q and all m, n ≥ 1, the product K_m(F_q) ⊗ K_n(F_q) → K_{m+n}(F_q) is zero. Hence K_*(F_q) is the ring Z ⊕ (⊕_{i≥1} Z/(q^i − 1)) with K_0 = Z acting by multiplication and all products of positive-degree classes zero.

**Hypotheses.**

- F_q finite; the product is that of GeneralAlgebraicKTheory K.7 (graded commutative for commutative rings).

**Proof.**

1. If m + n is even, the target K_{m+n}(F_q) is 0 (L.1/quillen-k-groups).
2. If m + n is odd, one of m, n is even and ≥ 2, so that factor is 0.
3. K_0(F_q) = Z acts through the unit.

**Acceptance.**

- The symbol {a, b} ∈ K_2(F_q) of two units is 0.
- With coefficients the products do not vanish: β·β ≠ 0 in K_4(F_q; Z/ℓ) for ℓ | q − 1 (L.1/browder-mod-l-ring).

**Depends on.** this roadmap: `L.1/quillen-k-groups`; other roadmaps: `GeneralAlgebraicKTheory:K.7/biexact-pairings-and-products`.

**Sources.**

- `Kbook.2013`, Remark IV.1.13.1 (PDF p. 277): “Remark 1.13.1. Clearly all products in the ring K_*(F_q) are trivial.” — The statement (for positive degrees).

### Degree one: the determinant, restriction and the field norm

`L.1/determinant-degree-one` · comparison

For every finite field F_q, the determinant GL(F_q) → F_q^× induces an isomorphism K_1(F_q) ≅ F_q^× (KTheoryLowDegrees U.6), so Quillen's K_1(F_q) ≅ Z/(q − 1) is the cyclic group F_q^× with no preferred generator. Under this identification, for F_q ⊂ F_{q′}: restriction is the inclusion F_q^× ⊂ F_{q′}^×; transfer is the field norm N_{F_{q′}/F_q} = Algebra.norm, x ↦ x^{(q′−1)/(q−1)}; the Galois automorphism φ_q acts by x ↦ x^q; and these agree with the degree-one case of L.1/finite-field-galois-descent and L.1/frobenius-action-extension. Under Quillen's equivalence, θ^+ on π_1 is the determinant followed by the isomorphism F_q^× ≅ π_1(FΨ^q) determined by ι.

**Hypotheses.**

- F_q ⊂ F_{q′} finite fields.

**Proof.**

1. K_1(F) = GL(F)/E(F) ≅ F^× by the determinant for a field F (KTheoryLowDegrees U.6: 'Compute K₁ of ... finite fields'; it identifies π_1 BGL(A)^+ with the explicit quotient, the comparison identifying determinant and transfer).
2. Restriction: det commutes with the inclusion GL(F_q) ⊂ GL(F_{q′}).
3. Transfer: the F_q-determinant of an F_{q′}-linear automorphism is the norm of its F_{q′}-determinant (LinearMap.det_restrictScalars); this is KTheoryLowDegrees U.5's 'on a field's unit group, this agrees with the field norm' and K-book III.1.7.1.
4. Frobenius: det(φ_q(g)) = φ_q(det g) = det(g)^q.
5. Consistency: the norm is onto (FiniteField.norm_surjective), matching surjectivity of transfer; the φ_q-invariants of F_{q′}^× are F_q^×, matching L.1/finite-field-galois-descent.

**Acceptance.**

- For F_4/F_2: the norm F_4^× → F_2^× is trivial and K_1(F_2) = 0.
- For F_9/F_3: the norm is x ↦ x^4, onto F_3^× = {±1}; restriction F_3^× ⊂ F_9^× has image the elements with x^3 = x.
- The roadmap's acceptance 'Verify the finite-field K1 formula agrees with the ordinary field norm' is this node.

**Depends on.** this roadmap: `L.1/restriction-and-transfer`, `L.1/quillen-map`; other roadmaps: `KTheoryLowDegrees:U.6`, `KTheoryLowDegrees:U.5`; libraries: `mathlib:LinearMap.det_restrictScalars`, `mathlib:FiniteField.norm_surjective`, `mathlib:FiniteField.algebraMap_norm_eq_pow`.

**Sources.**

- `Kbook.2013`, Corollary III.1.7.1 and the paragraph after it (PDF p. 195): “When j : F → E is a finite field extension, it is easy to see from 1.1.2 that the transfer map j_*: E^× → F^× is the classical norm map.” — Transfer in degree one is the norm.
- `Mestel.2014`, §9 (p. 30): “we have that f∗ on π1 is the determinant map, so kills the commutator subgroup of π1(BGLk).” — The degree-one behaviour of Quillen's map.

### Degree two: K_2 of a finite field and its symbols

`L.1/degree-two-symbols` · comparison

For every finite field F_q, K_2(F_q) = π_2 BGL(F_q)^+ = 0 (the case i = 1 of L.1/quillen-k-groups). Consequently every Steinberg symbol {a, b} ∈ K_2(F_q), the product of the classes of a, b ∈ F_q^× in K_1(F_q), vanishes, and K_2(F_q) ≅ H_2(E(F_q); Z) = 0. This recovers in Quillen's model the field-symbol calculation K_2(F_q) = 0 that K2SymbolsBrauer T.2/k2-finite-field proves from Matsumoto's presentation; the agreement is through the identification K_2 = π_2 BGL^+ = H_2(E) of K2SymbolsBrauer T.1:plus.

**Hypotheses.**

- F_q finite.

**Proof.**

1. K_2(F_q) = 0 by L.1/quillen-k-groups (i = 1).
2. Steinberg symbols are products of K_1-classes (K-book Example IV.1.10.1); they vanish because the target vanishes (L.1/finite-field-products-vanish).
3. K_2(R) = π_2 BGL(R)^+ ≅ H_2(E(R); Z) (K-book Corollary IV.1.7.1; StableHomotopyKTheory:H.3/plus-pi2-universal-central-extension).
4. The comparison with K2SymbolsBrauer:T.2/k2-finite-field is recorded as an acceptance check and not as a prerequisite: in the current stage graph K2SymbolsBrauer T.1 and T.2 lie downstream of L.1 (see restructure).

**Acceptance.**

- K_2(F_2) = 0, K_2(F_3) = 0, K_2(F_4) = 0: in agreement with K-book Corollary III.6.1.1 (K_2(F_q) = 1 in multiplicative notation).
- K_2(F_q; Z/ℓ) ≅ Z/ℓ for ℓ | q − 1 is not zero: the vanishing is integral (L.1/finite-field-mod-m-groups).

**Depends on.** this roadmap: `L.1/quillen-k-groups`, `L.1/finite-field-products-vanish`; other roadmaps: `StableHomotopyKTheory:H.3/plus-pi2-universal-central-extension`.

**Sources.**

- `Kbook.2013`, Corollary IV.1.7.1 (PDF p. 273): “The group K_2(R) = π_2BGL(R)^+ is isomorphic to the group K_2(R) ≅ H_2(E(R); Z) of Chapter III.” — The comparison of the two K_2's.
- `Kbook.2013`, Example IV.1.10.1 (PDF p. 274): “the product of the r_i ∈ K_1(R) is an element {r_1, ..., r_n} of K_n(R). These elements are called Steinberg symbols” — Symbols as products.
- `Kbook.2013`, Corollary III.6.1.1 (PDF p. 239): “K_2(F_q) = 1 for every finite field F_q.” — The symbol-side calculation (owned by K2SymbolsBrauer T.2).

### The K-groups of a finite field with coefficients

`L.1/finite-field-mod-m-groups` · theorem

For every finite field F_q and every m ≥ 1: K_0(F_q; Z/m) ≅ Z/m, and for i ≥ 1, K_{2i−1}(F_q; Z/m) ≅ K_{2i−1}(F_q)/m ≅ Z/gcd(m, q^i − 1) and K_{2i}(F_q; Z/m) ≅ mK_{2i−1}(F_q) ≅ Z/gcd(m, q^i − 1), through the Bockstein. In particular K_n(F_q; Z/p^ν) = 0 for n ≥ 1, and if m | q − 1 then K_n(F_q; Z/m) ≅ Z/m for all n ≥ 0.

**Hypotheses.**

- F_q finite, q = p^ν; m ≥ 1.

**Proof.**

1. Universal coefficient sequence (L.1/k-theory-mod-m) with the table of L.1/quillen-k-groups.
2. n = 2i − 1: K_{2i−1}(F_q)/m = Z/gcd(m, q^i − 1), and mK_{2i−2}(F_q) = 0 (for i = 1, K_0 = Z is torsion-free; for i ≥ 2, K_{2i−2} = 0).
3. n = 2i: K_{2i}(F_q)/m = 0 and mK_{2i−1}(F_q) is the m-torsion of Z/(q^i − 1), cyclic of order gcd(m, q^i − 1).
4. If m | q − 1 then m | q^i − 1 for all i.

**Acceptance.**

- q = 2, m = 3: K_1 = K_2 = 0 and K_3 = K_4 = Z/3 (as 3 ∤ 1, 3 | 3).
- q = 3, m = 2: K_n(F_3; Z/2) ≅ Z/2 for all n ≥ 0.
- q = 5, m = 4: K_n(F_5; Z/4) ≅ Z/4 for all n ≥ 0, in agreement with the Remark IV.1.13.1 case ℓ | q − 1 (here with ℓ = 4 a prime power).

**Depends on.** this roadmap: `L.1/k-theory-mod-m`, `L.1/quillen-k-groups`.

**Sources.**

- `Kbook.2013`, Remark IV.1.13.1 (PDF p. 277): “If ℓ | (q − 1), the long exact sequence for homotopy with mod-ℓ coefficients (2.1.1) shows that K_n(F_q; Z/ℓ) ≅ Z/ℓ for all n ≥ 0.” — The case m | q − 1.
- `Kbook.2013`, Universal Coefficient Theorem IV.2.5 (PDF p. 288): “There is a short exact sequence 0 → K_m(R) ⊗ Z/ℓ → K_m(R; Z/ℓ) → ℓK_{m−1}(R) → 0” — The general case.

### Browder's theorem: the mod-ℓ K-theory ring of a finite field

`L.1/browder-mod-l-ring` · theorem

Let ℓ be a prime (or a prime power) with ℓ | q − 1. Choose a generator ζ of F_q^× and a primitive ℓ-th root of unity ω ∈ F_q^×. Let ζ also denote the reduction of [ζ] in K_1(F_q; Z/ℓ) = F_q^×/ℓ and β = β_ω ∈ K_2(F_q; Z/ℓ) the Bott element (∂β = [ω]). Then K_*(F_q; Z/ℓ) ≅ Z/ℓ[β, ζ]/(ζ^2) as graded rings, and ρ_* maps the even part ⊕_n K_{2n}(F_q; Z/ℓ) ≅ Z/ℓ[β] isomorphically, as a ring, onto ⊕_n π_{2n}(BU; Z/ℓ). The presentation depends on the choices of ζ and ω; the ring does not.

**Hypotheses.**

- ℓ | q − 1; the product is that of L.1/mod-m-products (valid for K(F_q) for every modulus by Browder's scholium).

**Proof.**

1. Additively each K_n(F_q; Z/ℓ) is Z/ℓ (L.1/finite-field-mod-m-groups); ζ generates K_1 and β generates K_2 (its Bockstein generates μ_ℓ).
2. ζ^2 = 0: it is the reduction of the integral product {ζ, ζ} ∈ K_2(F_q) = 0 (L.1/finite-field-products-vanish).
3. That β^n generates K_{2n}(F_q; Z/ℓ) and βζ-type monomials generate the odd groups, and that ρ_* is multiplicative on the even part, is Browder's theorem [Br], cited by the K-book and not proved in the sources read (gap 'Browder's computation of the mod-ℓ ring').

**Acceptance.**

- For q = 5, ℓ = 4: K_*(F_5; Z/4) ≅ Z/4[β, ζ]/(ζ^2) with ζ = [2] and β = β_2.
- In degree 3 the generator is βζ, and its image under ρ_* is 0 (π_3(BU; Z/ℓ) = 0).

**Depends on.** this roadmap: `L.1/finite-field-mod-m-groups`, `L.1/bott-element`, `L.1/mod-m-products`, `L.1/finite-field-products-vanish`, `L.1/quillen-map`.

**Sources.**

- `Kbook.2013`, Remark IV.1.13.1 (PDF p. 277): “The choice of a primitive unit ζ ∈ F_q^× and a primitive ℓth root of unity ω gives generators ζ for K_1(F_q; Z/ℓ) and the Bott element β for K_2(F_q; Z/ℓ), respectively. (The Bockstein sends β to ω ∈ K_1(F_q).)” — The generators.
- `Kbook.2013`, Remark IV.1.13.1 (PDF p. 277): “that K_*(F_q; Z/ℓ) ≅ Z/ℓ[β, ζ]/(ζ^2) as a graded ring, and that the natural isomorphism from the even part ⊕_nK_{2n}(F_q; Z/ℓ) ≅ Z/ℓ[β] to ⊕π_{2n}(BU; Z/ℓ) is a ring isomorphism.” — Browder's theorem, cited.

### The K-theory of the algebraic closure of a finite field

`L.1/algebraic-closure-k-groups` · theorem

Let \bar F_p be an algebraic closure of F_p and Γ = Gal(\bar F_p/F_p). Then K_{2i}(\bar F_p) = 0 for i ≥ 1; K_{2i−1}(\bar F_p) = colim_ν K_{2i−1}(F_{p^ν}) is a divisible torsion group isomorphic to ⊕_{ℓ≠p} Q_ℓ/Z_ℓ ≅ \bar F_p^×; the Frobenius x ↦ x^p acts on it as multiplication by p^i; there is a Γ-equivariant isomorphism K_{2i−1}(\bar F_p) ≅ μ(\bar F_p)^{⊗i} = μ(i) (the i-th Tate twist), and every isomorphism of abelian groups between them is Γ-equivariant; and for every subfield F_q the map K_*(F_q) → K_*(\bar F_p)^{Gal(\bar F_p/F_q)} is an isomorphism in positive degrees.

**Hypotheses.**

- i ≥ 1; \bar F_p = ∪ F_{p^ν} inside a fixed algebraic closure.

**Proof.**

1. K-theory commutes with filtered colimits of rings (GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories), so K_n(\bar F_p) = colim K_n(F_{p^ν}) over the divisibility-directed system.
2. Even degrees vanish termwise (L.1/quillen-k-groups).
3. Odd degrees: the transition maps are injective (L.1/finite-field-galois-descent); the colimit of the cyclic groups Z/(p^{νi} − 1) along injections is a torsion group in which every element of order prime to p has all roots, and its ℓ-part is Q_ℓ/Z_ℓ for ℓ ≠ p because v_ℓ(p^{νi} − 1) is unbounded along the system; so it is ⊕_{ℓ≠p} Q_ℓ/Z_ℓ.
4. Frobenius: on each K_{2i−1}(F_{p^ν}), Φ_* = p^i (L.1/frobenius-is-adams), compatibly with the transition maps.
5. Γ-module: every x ∈ K_{2i−1}(\bar F_p) comes from a finite level, so the action of Γ ≅ \hat Z is determined by the Frobenius, acting as p^i; μ(i) is ⊕_{ℓ≠p}Q_ℓ/Z_ℓ with Frobenius acting as ζ ↦ ζ^{p^i}; any group isomorphism commutes with multiplication by p^i and hence with Γ.
6. Invariants: K_{2i−1}(\bar F_p)^{Gal(\bar F_p/F_q)} = ∪_{d} K_{2i−1}(F_{q^d})^{Gal(F_{q^d}/F_q)} = K_{2i−1}(F_q) (L.1/finite-field-galois-descent).

**Acceptance.**

- K_1(\bar F_p) = \bar F_p^× ≅ ⊕_{ℓ≠p}Q_ℓ/Z_ℓ, with Frobenius x ↦ x^p.
- K_3(\bar F_2)^{Gal(\bar F_2/F_4)} = K_3(F_4) ≅ Z/15.
- K_{2i−1}(\bar F_p) has no p-torsion: K_n(\bar F_p) is uniquely p-divisible for n > 0 (K-book Proposition IV.5.6).

**Depends on.** this roadmap: `L.1/quillen-k-groups`, `L.1/finite-field-galois-descent`, `L.1/frobenius-is-adams`; other roadmaps: `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`.

**Sources.**

- `Kbook.2013`, VI.1, finite characteristic (PDF p. 473): “Recall from IV.1.13 that K_n(F̄_p) = 0 for even n > 0, and that K_{2i−1}(F̄_p) = ∪K_{2i−1}(F_{p^ν}) is isomorphic as an abelian group to F̄_p^× ≅ Q/Z[1/p].” — The groups.
- `Kbook.2013`, VI.1, finite characteristic (PDF p. 473): “The action of the Frobenius automorphism φ(x) = x^p on F induces multiplication by p^i on K_{2i−1}(F̄_p); we say that the action is twisted i times.” — The Frobenius twist.
- `Haine.2016`, Corollary 3.1.1 (p. 5): “If F_q ⊂ F̄_p is a subfield, then the canonical map” — The invariants statement (3.1.1.c).

### The mod-m K-theory ring of the algebraic closure of a finite field

`L.1/algebraic-closure-mod-m-ring` · theorem

Let m ≥ 2 with p ∤ m (and m ∉ {2, 3, 4, 8} for the ring structure unless it is taken from Browder's scholium, which applies since K_{2i}(\bar F_p) = 0). Then K_n(\bar F_p; Z/m) ≅ Z/m for n even ≥ 0 and 0 for n odd; the choice of a primitive m-th root of unity ω determines a graded ring isomorphism Z/m[β] ≅ K_*(\bar F_p; Z/m), β ↦ β_ω; and g ∈ Gal(\bar F_p/F_p) with g(ω) = ω^a acts on K_{2i}(\bar F_p; Z/m) as multiplication by a^i, so K_{2i}(\bar F_p; Z/m) ≅ mK_{2i−1}(\bar F_p) ≅ μ_m^{⊗i}.

**Hypotheses.**

- p ∤ m; \bar F_p an algebraic closure of F_p.

**Proof.**

1. Additively: UCT (L.1/k-theory-mod-m) with L.1/algebraic-closure-k-groups: K_{2i}(\bar F_p)/m = 0 and mK_{2i−1}(\bar F_p) ≅ Z/m; K_{2i−1}(\bar F_p)/m = 0 since the group is divisible; K_0 = Z/m.
2. Ring: K_*(\bar F_p; Z/m) = colim K_*(F_q; Z/m) over q ≡ 1 mod m (L.1/k-theory-mod-m, filtered colimits); on each term the ring is Z/m[β, ζ]/(ζ^2) (L.1/browder-mod-l-ring); β_ω maps to β_ω (L.1/bott-element naturality), and ζ_q dies in F_{q^m}^×/m because ζ_q = g^{(q^m − 1)/(q − 1)} for a generator g of F_{q^m}^× and (q^m − 1)/(q − 1) = 1 + q + … + q^{m−1} ≡ m ≡ 0 mod m.
3. Galois action: g_*β_ω = β_{ω^a} = aβ_ω (naturality and additivity of the Bott element, m ≢ 2 mod 4, or directly from the Bockstein, which is injective in degree 2 here), hence a^i on β^i.

**Acceptance.**

- m = 3, p = 2: K_*(\bar F_2; Z/3) ≅ Z/3[β]; the Frobenius x ↦ x^2 sends ω to ω^2 and acts on K_4 = Z/3·β^2 by 2^2 = 4 ≡ 1 and on K_2 by 2 ≡ −1.
- K_1(\bar F_p; Z/m) = \bar F_p^×/m = 0, unlike K_1(F_q; Z/m) for m | q − 1.

**Depends on.** this roadmap: `L.1/algebraic-closure-k-groups`, `L.1/browder-mod-l-ring`, `L.1/bott-element`, `L.1/k-theory-mod-m`, `L.1/mod-m-products`.

**Sources.**

- `Kbook.2013`, Remark IV.1.13.1 (PDF p. 277): “Hence the ring K_*(F̄_p; Z/ℓ) is the direct limit of the K_*(F_q; Z/ℓ). As each ζ vanishes and the Bott elements map to each other, we have: K_*(F̄_p; Z/ℓ) ≅ Z/ℓ[β] ≅ π_*(BU; Z/ℓ).” — The colimit argument.
- `Kbook.2013`, Corollary VI.1.3.1(iii) (PDF p. 473): “When p ∤ m, the choice of a Bott element β ∈ K_2(F; Z/m) determines a graded ring isomorphism K_*(F; Z/m) ≅ Z/m[β].” — The ring isomorphism.
- `Kbook.2013`, Proposition VI.1.7.1, proof (PDF p. 476): “Thus g sends β to aβ, and g sends β^i to (aβ)^i = a^iβ^i.” — The Galois action.

### ℓ-adically completed K-theory K(R; ℤ_ℓ)

`L.1/completed-k-theory` · definition · also realises L.6

Let R be a ring with unit and ℓ a prime. The ℓ-completed K-theory spectrum of R is K(R; ℤ_ℓ) = holim_ν K(R)/ℓ^ν, the derived ℓ-completion of StableHomotopyKTheory H.6 applied to the connective K-theory spectrum K(R), where K(R)/ℓ^ν = K(R; ℤ/ℓ^ν) is L.1/k-theory-mod-m and the tower is formed by the reduction maps K(R)/ℓ^{ν+1} → K(R)/ℓ^ν. Its homotopy groups K_n(R; ℤ_ℓ) = π_n K(R; ℤ_ℓ), n ∈ ℤ, are the ℓ-adic (completed) K-groups of R. They come with the natural completion map κ: K_n(R) → K_n(R; ℤ_ℓ), induced by K(R) → holim_ν K(R)/ℓ^ν, and the reductions ρ_ν: K_n(R; ℤ_ℓ) → K_n(R; ℤ/ℓ^ν), with Milnor's exact sequence 0 → lim¹_ν K_{n+1}(R; ℤ/ℓ^ν) → K_n(R; ℤ_ℓ) → lim_ν K_n(R; ℤ/ℓ^ν) → 0. The construction is a functor of R, has transfers along ring maps R → S making S a finitely generated projective R-module, and K_*(R; ℤ_ℓ) is a graded-commutative ring when R is commutative. The integral groups K_n(R), the completed groups K_n(R; ℤ_ℓ) and the finite-coefficient groups K_n(R; ℤ/ℓ^ν) are three separate carriers, related only by κ and ρ_ν: in general K_n(R; ℤ_ℓ) is neither K_n(R) ⊗ ℤ_ℓ nor lim_ν K_n(R)/ℓ^ν.

**Hypotheses.**

- R is a ring with unit, commutative when products are used; ℓ is a prime.
- K(R) is the connective K-theory spectrum; no negative K-groups enter, so K_n(R; ℤ_ℓ) = 0 for n < 0.
- For the local fields of this layer ℓ = p is the residue characteristic; the case ℓ ≠ p is the one used in L.2 (rigidity) and is the same construction.

**Proof.**

1. Form the tower ⋯ → K(R)/ℓ^{ν+1} → K(R)/ℓ^ν → ⋯ → K(R)/ℓ of cofibres of multiplication by ℓ^ν (StableHomotopyKTheory:H.6/mod-l-homotopy-and-bockstein-sequence; L.1/k-theory-mod-m), the maps being induced by the reductions of Moore spectra, and take its homotopy limit (StableHomotopyKTheory:H.6/l-adic-completion-milnor-sequence).
2. The Milnor lim¹ sequence of a tower of spectra gives the displayed extension (StableHomotopyKTheory:H.6/l-adic-completion-milnor-sequence).
3. Functoriality and transfers: a ring map (resp. an exact functor P(S) → P(R) for S finite projective over R) gives a map of towers, hence of homotopy limits (GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories, GeneralAlgebraicKTheory:K.3/resolution-theorem).
4. Products: the ring spectrum structure of K(R) for commutative R (GeneralAlgebraicKTheory:K.7/biexact-pairings-and-products) passes to the homotopy limit (K-book IV.2.9: the completion of a homotopy associative and commutative ring spectrum is one).
5. Vanishing in negative degrees: π_{−1} of the homotopy limit is lim¹_ν K_0(R)/ℓ^ν, which is zero because the transition maps are surjective (Mittag-Leffler); all lower groups vanish because each K(R)/ℓ^ν is connective.
6. Finite products: K(R × S) ≃ K(R) × K(S) (GeneralAlgebraicKTheory:K.7/invariance-products-and-colimits), and cofibres and homotopy limits commute with finite products, so K(R × S; ℤ_ℓ) ≃ K(R; ℤ_ℓ) × K(S; ℤ_ℓ).

**API.**

- `TauCeti.KTheory.completed` (data): The spectrum K(R; ℤ_ℓ) = holim_ν K(R)/ℓ^ν, functorial in the ring R.
- `TauCeti.KTheory.completedGroup` (data): K_n(R; ℤ_ℓ) = π_n K(R; ℤ_ℓ) for n ∈ ℤ, a ℤ_ℓ-module (the homotopy of an ℓ-complete spectrum is derived ℓ-complete).
- `TauCeti.KTheory.toCompleted` (projection): The completion map κ: K_n(R) → K_n(R; ℤ_ℓ), natural in R.
- `TauCeti.KTheory.completedReduce` (projection): ρ_ν: K_n(R; ℤ_ℓ) → K_n(R; ℤ/ℓ^ν), with ρ_ν ∘ κ the reduction of L.1/k-theory-mod-m and compatible with ν ↦ ν − 1.
- `TauCeti.KTheory.completed_milnor` (relation): 0 → lim¹_ν K_{n+1}(R; ℤ/ℓ^ν) → K_n(R; ℤ_ℓ) → lim_ν K_n(R; ℤ/ℓ^ν) → 0 is exact.
- `TauCeti.KTheory.completed_eq_lim_of_finite` (characterisation): If every K_{n+1}(R; ℤ/ℓ^ν) is finite, K_n(R; ℤ_ℓ) → lim_ν K_n(R; ℤ/ℓ^ν) is an isomorphism.
- `TauCeti.KTheory.completed_mod` (compatibility): K(R; ℤ_ℓ)/ℓ^ν ≃ K(R)/ℓ^ν, hence 0 → K_n(R; ℤ_ℓ)/ℓ^ν → K_n(R; ℤ/ℓ^ν) → K_{n−1}(R; ℤ_ℓ)[ℓ^ν] → 0 is exact.
- `TauCeti.KTheory.completedGroup_neg` (simp): K_n(R; ℤ_ℓ) = 0 for n < 0.
- `TauCeti.KTheory.completed_map_comp` (functoriality): (g ∘ f)_* = g_* ∘ f_* and id_* = id on K_*(−; ℤ_ℓ), and κ, ρ_ν are natural.
- `TauCeti.KTheory.completedTransfer` (functoriality): For S finitely generated projective over R, the transfer K_n(S; ℤ_ℓ) → K_n(R; ℤ_ℓ), compatible with κ and ρ_ν.
- `TauCeti.KTheory.completed_prod` (equivalence): K(R × S; ℤ_ℓ) ≃ K(R; ℤ_ℓ) × K(S; ℤ_ℓ), compatibly with κ; by induction for finite products.
- `TauCeti.KTheory.completed_ring` (structure): For R commutative, K_*(R; ℤ_ℓ) is a graded-commutative ring and κ, ρ_ν are ring maps.
- `TauCeti.KTheory.completed_eq_tensor_of_fg` (example): If K_n(R) and K_{n−1}(R) are finitely generated, κ induces K_n(R) ⊗ ℤ_ℓ ≅ K_n(R; ℤ_ℓ) (Handbook 59).

**Unit tests.**

- `TauCeti.KTheory.completedGroup_finiteField_char` (computation): For q = p^f and n ≥ 1, K_n(𝔽_q; ℤ_p) = 0, and K_0(𝔽_q; ℤ_p) ≅ ℤ_p.
- `TauCeti.KTheory.completedGroup_zero_field` (compatibility): For every field F, K_0(F; ℤ_p) ≅ ℤ_p: the Milnor lim¹ term vanishes because K_1(F; ℤ/p^ν) ≅ F^×/p^ν has surjective transition maps, and the isomorphism is κ ⊗ ℤ_p composed with Tau Ceti's rank equivalence SplitK0.finrankEquiv: SplitK0(FGModuleCat F) ≃ ℤ.
- `TauCeti.KTheory.completedGroup_finiteField_prime_to_p` (computation): For ℓ ≠ p and i ≥ 1, κ ⊗ ℤ_ℓ: K_{2i−1}(𝔽_q) ⊗ ℤ_ℓ → K_{2i−1}(𝔽_q; ℤ_ℓ) is an isomorphism onto ℤ/(q^i − 1)_ℓ, where (N)_ℓ is the ℓ-part of N: for finitely generated K-groups the carrier is K_n ⊗ ℤ_ℓ (Handbook 59).
- `TauCeti.KTheory.completedGroup_zero_ring` (degenerate): For the zero ring, K(0; ℤ_ℓ) ≃ 0, so K_n(0; ℤ_ℓ) = 0 for every n.
- `TauCeti.KTheory.completedGroup_complex_two` (non-example): K_2(ℂ; ℤ_ℓ) ≅ ℤ_ℓ although K_2(ℂ) is uniquely divisible, so lim_ν K_2(ℂ)/ℓ^ν = 0: defining K_n(R; ℤ_ℓ) as lim_ν K_n(R)/ℓ^ν loses the Tate module of K_{n−1}(R).
- `TauCeti.KTheory.completedGroup_one_Qp` (non-example): For p odd, K_1(ℚ_p; ℤ_p) ≅ ℤ_p², while K_1(ℚ_p) ⊗_ℤ ℤ_p = ℚ_p^× ⊗_ℤ ℤ_p contains ℤ_p ⊗_ℤ ℤ_p and is not finitely generated over ℤ_p: defining K_n(R; ℤ_p) as K_n(R) ⊗ ℤ_p fails.

**Acceptance.**

- K_n(𝔽_q; ℤ_p) = ℤ_p for n = 0 and 0 for n > 0 when p = char 𝔽_q, because K_n(𝔽_q; ℤ/p^ν) = 0 for n ≥ 1 (L.1/finite-field-mod-m-groups).
- K_2(ℂ; ℤ_ℓ) ≅ ℤ_ℓ comes entirely from the Tate module of K_1(ℂ) = ℂ^× (K-book IV.2.9): the Tate-module term cannot be dropped.
- K_3(L; ℤ_p) for L/ℚ_p finite is L.6/completed-k-groups-of-p-adic-fields; PadicHodgeRegulators D.3's K₃(L; ℤ_p) is this carrier.

**Used by.**

- Handbook I.5, Theorem 61 and K-book Theorem VI.7.4: the completed groups K_n(V; ℤ_p) ≅ K_n(E; ℤ_p) of a p-adic field are computed in this carrier
- Hesselholt–Madsen, Theorem D: the p-adic homotopy type of K(K) is a statement about this completion
- PadicHodgeRegulators D.3: 'Define K₃(L;Z_p) using H's derived p-completion, and prove the product comparison': D.3's group is K_3(L; ℤ_p) here, and the product comparison is the API item KTheory.completed_prod
- KTheoryFiniteLocalFields L.7/semilocal-completed-map: the target ∏_{v|p} K_n(F_v; ℤ_p) of the global-to-local map
- KTheoryFiniteLocalFields L.2/rigidity-l-adic and HabiroNumberFields HB.2: K_n(𝒪; ℤ_ℓ) ≅ K_n(𝔽_q) ⊗ ℤ_ℓ for ℓ ≠ p is stated in this carrier
- L.6/completion-exact-sequence and the comparison nodes of this layer: the maps κ and ρ_ν are the comparison maps whose kernels and cokernels this layer computes

**Depends on.** this roadmap: `L.1/k-theory-mod-m`; other roadmaps: `StableHomotopyKTheory:H.6/l-adic-completion-milnor-sequence`, `StableHomotopyKTheory:H.6/mod-l-homotopy-and-bockstein-sequence`, `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`, `GeneralAlgebraicKTheory:K.3/resolution-theorem`, `GeneralAlgebraicKTheory:K.7/biexact-pairings-and-products`, `GeneralAlgebraicKTheory:K.7/invariance-products-and-colimits`; libraries: `mathlib:PadicInt`.

**Sources.**

- `Kbook.2013`, IV.2.9, The ℓ-adic completion (PDF p. 290; book p. 282): “The ℓ-adic completion of a spectrum E, ˆEℓ, is the homotopy limit (over ν) of the spectra E ∧P∞(Z/ℓν). We let πn(E; Zℓ) denote the homotopy groups of this spectrum; if E = K(R) we write Kn(R; Zℓ)” — The definition of the carrier and of K_n(R; ℤ_ℓ).
- `Weibel.Handbook.I5`, Completed K-theory 59 (p. 164; PDF p. 26): “It will be convenient to fix a prime ℓ and pass to the ℓ-adic completion K(R) of the K-theory space K(R), where R is any ring. We also write Kn(R; Zℓ) for πnK(R).” — The same carrier in the survey the stage text cites.

## L.2 — Henselian local rings away from the residue characteristic

*Coverage: partial.* Gabber's rigidity theorem (spectrum-level, with Suslin's and Gillet–Thomason's cases and the failure for negative K-theory) is stated from the K-book and Clausen–Mathew–Morrow, its proof being a gap; it is specialised to henselian local rings with finite residue field, with finite and ℓ-adic coefficients (the latter in the form HabiroNumberFields HB.2 requests). The localisation sequence of a DVR is constructed integrally and with coefficients, as a sequence of K_*(O)-modules with ∂[π] = 1 and a fixed sign convention, together with its compatibility with the Bockstein. For a henselian DVR the mod-m sequence splits with the uniformiser-dependent section r^{-1}(a)·{π}. The divisibility argument (Bockstein sequences at every ν against the finite-field values) gives the ℓ-torsion and mod-ℓ^ν groups of the odd K-groups and the unique ℓ-divisibility of the even ones, hence the canonical prime-to-p decomposition of K_*(O) (Handbook Proposition 58). For the fraction field: the canonical, uniformiser-independent splitting of K_{2i}(L) (used by L.3 in degree 2), K_{2i−1}(O) ≅ K_{2i−1}(L) for i ≥ 2 (false for i = 1, recorded), the dependence of the degree-one, finite-coefficient and specialisation splittings on π, the full prime-to-p description of K_*(L), K_*(L; Z/m) and K_*(L; Z_ℓ), and the corrected Proposition V.6.10. For ArithmeticKTheory's request, the ℓ-part (ℓ ≠ p) of the e-invariant of a local field is shown bijective with target of order w_i^{(ℓ)}(L) = (q^i − 1)_ℓ, through the ℓ-torsion of K_{2i−1}(L^sep) as a G_L-module (the local-field case of Suslin's Proposition VI.1.7.1). Rigidity is owned here rather than by MotivicEtaleKTheory M.7 (restructure).

- Remaining: Gabber's proof of rigidity for henselian pairs (Gabber 1992; Suslin 1984; Gillet–Thomason 1984): gap, node L.2/gabber-rigidity; every other L.2 node rests on it.
- Remaining: Answers to the requests to tauceti:TauCetiRoadmap/LocalFieldsRamification (finite extensions of local fields and their integers; unramified extensions and the residue action of G_L), GeneralAlgebraicKTheory K.7 (K_*(O)-linearity of the localisation boundary) and KTheoryLowDegrees U.5 (the degree-one boundary).
- Remaining: Confirmation by MotivicEtaleKTheory M.7 of the ownership split in restructure (M.7 imports L.2/gabber-rigidity; Suslin's rigidity for algebraically closed fields, K-book VI.1.1–VI.1.7.1, stays with M.7).

### Gabber's rigidity theorem

`L.2/gabber-rigidity` · theorem · planet “Gabber's rigidity theorem”

Let (R, I) be a henselian pair (Mathlib's HenselianRing R I: I is contained in the Jacobson radical and simple roots of monic polynomials lift from R/I) and let n ≥ 1 be invertible in R (equivalently in R/I, as I lies in the Jacobson radical). Then the reduction map K(R)/n → K(R/I)/n of connective K-theory spectra with Z/n coefficients (L.1/k-theory-mod-m) is an equivalence. Consequently K_m(R; Z/n) ≅ K_m(R/I; Z/n) for every m ≥ 0, and the reduced homology H̃_*(GL(I); Z/n) of the congruence subgroup GL(I) = ker(GL(R) → GL(R/I)) vanishes. The statement fails for negative K-groups. Special cases proved earlier: complete discrete valuation rings of mixed characteristic with n prime to the residue characteristic (Suslin), and strict henselisations of smooth algebras over a field (Gillet–Thomason).

**Hypotheses.**

- (R, I) a henselian pair of commutative rings (the K-book's definition by idempotent lifting in finite R-algebras and Mathlib's root-lifting definition agree; CMM Definition 1.3 uses the latter).
- n invertible in R.
- Connective K-theory; the conclusion is false for negative K-groups (K-book Example IV.2.10.2).

**Proof.**

1. Degree 0 and 1 as a check (not the proof): for (R, I) henselian, idempotent matrices lift, so K_0(R) ≅ K_0(R/I); for R local with maximal ideal I, K_1(R; Z/n) = R^×/n and every unit ≡ 1 mod I is an n-th power (TauCeti.HenselianRing.exists_pow_eq_and_sub_one_mem_of_sub_one_mem), so R^×/n ≅ (R/I)^×/n.
2. The theorem is Gabber's (K-theory of Henselian local rings and Henselian pairs, Contemp. Math. 126, 1992). The K-book states it without proof (IV.2.10), and CMM state it as Theorem 1.4 and use it. Gabber's proof has two halves (CMM Remark 4.37): a reduction to henselisations of smooth algebras over a field at a rational point, and that case, which is also Gillet–Thomason's; Suslin's 'method of universal homotopies' is the classical engine. None of these papers was available: the proof is recorded as the gap 'Gabber's rigidity theorem is cited, not proved'.
3. The two forms of the conclusion agree: an equivalence of spectra gives isomorphisms on π_m for m ≥ 0; conversely, the K-book's form for m ≥ 1 with the degree-0 isomorphism gives an equivalence of connective spectra.

**Acceptance.**

- For R = Z_p (or any complete DVR of mixed characteristic with residue field F_p) and ℓ ≠ p: K_1(Z_p; Z/ℓ) = Z_p^×/ℓ ≅ F_p^×/ℓ, and K_2(Z_p; Z/ℓ) ≅ K_2(F_p; Z/ℓ) ≅ Z/gcd(ℓ, p − 1).
- For R = k[[x]], I = (x), 1/ℓ ∈ k: K_n(k[[x]]; Z/ℓ) ≅ K_n(k; Z/ℓ) for all n ≥ 0 (K-book Example IV.2.10.1).
- Failure for n not invertible: for R = Z_p, I = (p) and n = p, K_1(Z_p; Z/p) = Z_p^×/p has order p (p odd) while K_1(F_p; Z/p) = F_p^×/p = 0.

**Depends on.** this roadmap: `L.1/k-theory-mod-m`; libraries: `mathlib:HenselianRing`, `tauceti:TauCeti.HenselianRing.exists_pow_eq_and_sub_one_mem_of_sub_one_mem`.

**Sources.**

- `Kbook.2013`, Theorem IV.2.10 (PDF p. 291): “Theorem 2.10 (Rigidity Theorem). Let (R, I) be a Hensel pair with 1/ℓ ∈ R. Then for all n ≥ 1, K_n(R; Z/ℓ) ≅ K_n(R/I; Z/ℓ)” — The statement in the K-book (m ≥ 1).
- `CMM.2018`, Theorem 1.4 (p. 3): “Let (R, I) be a henselian pair. Suppose n is invertible in R. Then the map K(R)/n → K(R/I)/n is an equivalence of spectra.” — The spectrum-level statement used here.
- `CMM.2018`, §1.1 (p. 3): “one has the following result of Gabber [27], preceded by work of Suslin [81] and Gillet–Thomason [35].” — The attribution, including Suslin's and Gillet–Thomason's cases.
- `CMM.2018`, Remark 4.37 (p. 36): “Recall that Gabber's proof [27] of rigidity is cleanly separated into two halves: the first half reduces the general case to the case of henselizations of smooth algebras over a field at a rational point, and the second half proves that case.” — The structure of the unread proof.
- `Kbook.2013`, Example IV.2.10.2 (PDF p. 291): “Example 2.10.2. A restriction like n ≥ 0 is necessary.” — Negative K-groups are excluded.

### Rigidity for a henselian local ring with finite residue field

`L.2/rigidity-finite-residue-field` · theorem

Let O be a henselian local ring (for example a henselian DVR, the integers 𝒪[K] of a nonarchimedean local field, or the integers of a completion of a Dedekind domain) with residue field F_q of characteristic p, and let m ≥ 1 with p ∤ m. Then reduction r: O → F_q induces an equivalence K(O)/m ≃ K(F_q)/m; hence K_0(O; Z/m) ≅ Z/m and, for i ≥ 1, K_{2i−1}(O; Z/m) ≅ K_{2i}(O; Z/m) ≅ Z/gcd(m, q^i − 1), all isomorphisms induced by r.

**Hypotheses.**

- O henselian local with residue field F_q; p ∤ m.

**Proof.**

1. p ∤ m means m is a unit in F_q, hence in O (a local ring: an element is a unit iff its residue is nonzero).
2. Apply L.2/gabber-rigidity to the henselian pair (O, 𝔪_O) (HenselianLocalRing).
3. The groups are those of L.1/finite-field-mod-m-groups.
4. Instances: TauCeti.henselianLocalRing_integer and IsDedekindDomain.HeightOneSpectrum.henselianLocalRing_adicCompletionIntegers supply the henselian hypothesis for local-field integers and completions.

**Acceptance.**

- O = Z_5, m = 4: K_n(Z_5; Z/4) ≅ Z/4 for every n ≥ 0.
- O = Z_2, m = 3: K_1 = K_2 = 0, K_3 = K_4 = Z/3.
- O = F_q[[t]]: the same groups as F_q, and here r has the section F_q ⊂ F_q[[t]].

**Depends on.** this roadmap: `L.2/gabber-rigidity`, `L.1/finite-field-mod-m-groups`; libraries: `mathlib:HenselianLocalRing`, `mathlib:IsLocalRing.residue`, `tauceti:TauCeti.henselianLocalRing_integer`, `tauceti:IsDedekindDomain.HeightOneSpectrum.henselianLocalRing_adicCompletionIntegers`.

**Sources.**

- `Kbook.2013`, Proposition V.6.10, proof (PDF p. 423): “Since the ring R of integers in E is a complete DVR and R/πR ≅ F_q, Gabber rigidity (2.10) implies that” — Rigidity applied to the integers of a local field (the rest of that sentence is corrected in sourceIssues).
- `Weibel.Handbook.I5`, Proposition 58, proof (p. 164): “We see from Gabber's rigidity theorem [17] that the groups K_n(V; Z/ℓ^ν) are isomorphic to K_n(F_q; Z/ℓ^ν) for n > 0.” — The same use in the Handbook.

### ℓ-adic rigidity for a henselian local ring with finite residue field

`L.2/rigidity-l-adic` · theorem

Let O be a henselian local ring with residue field F_q of characteristic p and ℓ ≠ p a prime. Then reduction induces K_n(O; Z_ℓ) ≅ K_n(F_q; Z_ℓ) for all n ≥ 0, where K_n(−; Z_ℓ) = π_n of the ℓ-adic completion holim_ν K(−)/ℓ^ν; and K_n(F_q; Z_ℓ) ≅ K_n(F_q) ⊗ Z_ℓ: Z_ℓ for n = 0, Z/(q^i − 1)_ℓ for n = 2i − 1 and 0 for n = 2i ≥ 2, where (N)_ℓ is the ℓ-part of N. In particular K_3(O; Z_ℓ) ≅ K_3(F_q) ⊗ Z_ℓ ≅ Z/(q^2 − 1)_ℓ.

**Hypotheses.**

- O henselian local with residue field F_q; ℓ ≠ char F_q.

**Proof.**

1. The equivalences K(O)/ℓ^ν ≃ K(F_q)/ℓ^ν (L.2/rigidity-finite-residue-field) are compatible with the reduction maps in ν, so their homotopy limit is an equivalence of ℓ-adic completions.
2. For F_q the groups K_n(F_q; Z/ℓ^ν) are finite, so the lim^1 term of the Milnor sequence vanishes and K_n(F_q; Z_ℓ) is an extension of the Tate module of K_{n−1}(F_q) by the ℓ-adic completion of K_n(F_q) (StableHomotopyKTheory:H.6/l-adic-completion-milnor-sequence); the Tate module of a finite group is 0 and the ℓ-adic completion of a finite group is its ℓ-part, while K_0 = Z completes to Z_ℓ.

**Acceptance.**

- HabiroNumberFields HB.2 (CGZ Lemma 4.1): for a number field F, a prime q of F not above p and O the completion of O_F at q, K_3(O; Z_p) ≅ K_3(k(q)) ⊗ Z_p, cyclic of order the p-part of Nq^2 − 1.
- O = Z_7, ℓ = 2: K_3(Z_7; Z_2) ≅ Z/16 (7^2 − 1 = 48 = 16·3).
- The completed group K_{2i}(O; Z_ℓ) = 0 does not say K_{2i}(O) = 0: K_{2i}(O) is uniquely ℓ-divisible and can be uncountable (L.2/even-k-uniquely-l-divisible).

**Depends on.** this roadmap: `L.2/rigidity-finite-residue-field`, `L.1/quillen-k-groups`, `L.1/completed-k-theory`; other roadmaps: `StableHomotopyKTheory:H.6/l-adic-completion-milnor-sequence`.

**Sources.**

- `Kbook.2013`, The ℓ-adic completion IV.2.9 (PDF p. 290): “If the homotopy groups π_{n+1}(E; Z/ℓ^ν) are finite, the lim^1 term vanishes and, by Universal Coefficients (2.5), π_n(E; Z_ℓ) is an extension of the Tate module of π_{n−1}(E) by the ℓ-adic completion of π_n(E).” — The passage from finite to ℓ-adic coefficients.
- `Weibel.Handbook.I5`, Completed K-theory 59 (p. 164): “If in addition the abelian groups K_n(R) are finitely generated, there can be no Tate module and we have” — K_n(R; Z_ℓ) = K_n(R) ⊗ Z_ℓ for finitely generated groups, applied to F_q.

### The localisation sequence of a discrete valuation ring

`L.2/dvr-localisation` · theorem · planet “Localization sequence of a discrete valuation ring”

Let O be a discrete valuation ring with fraction field L, residue field k and uniformiser π. There is a homotopy fibration (cofibre sequence of spectra) K(k) →i_* K(O) → K(L), with i_* the transfer of O → k, giving the long exact sequence … → K_n(k) → K_n(O) → K_n(L) →∂ K_{n−1}(k) → … → K_0(k) → K_0(O) → K_0(L) → 0, and, after E ↦ E/m, the same sequence for K_*(−; Z/m). It is a sequence of K_*(O)-modules: with K_*(O) acting on K_*(L) through O → L and on K_*(k) through r: O → k, ∂(x·y) = r(x)·∂(y) for x ∈ K_*(O) and y ∈ K_*(L) (convention fixed here; the other order introduces the sign (−1)^{|x|}). In degree one, ∂: K_1(L) = L^× → K_0(k) = Z is the valuation, ∂[π] = [k] = 1, and i_*: K_0(k) → K_0(O) is zero.

**Hypotheses.**

- O a discrete valuation ring (a regular noetherian domain of dimension 1); the residue field k need not be finite here.

**Proof.**

1. O is a Dedekind domain with one nonzero prime; apply the Dedekind case of Quillen's localisation theorem (GeneralAlgebraicKTheory:K.3/abelian-localization-theorem), which uses the resolution theorem (O regular) and dévissage for finite-length torsion modules.
2. Coefficients: smash the cofibre sequence of spectra with the Moore spectrum (L.1/k-theory-mod-m).
3. Module structure: P(O) acts by tensor product on the sequence of abelian categories M_tors(O) → M(O) → M(L) (K-book V.6.1.1); the resulting K_*(O)-linearity of ∂ is GeneralAlgebraicKTheory K.7's 'compatibility with ... localisation boundaries' (requested). The sign convention is recorded in sourceIssues: the K-book uses both orders.
4. Degree one: ∂[s] = [R/sR] for a non-zero-divisor s (K-book Example V.6.1.2; KTheoryLowDegrees U.5: 'the boundary map from a discrete valuation field's units to K₀ of its residue field equals the valuation'); so ∂[π] = [k] = 1 and ∂[uπ^a] = a.
5. i_*[k] = [O/πO] = [O] − [πO] = 0 in K_0(O) = Z, so K_0(O) ≅ K_0(L) = Z.

**Acceptance.**

- For O = Z_(p): the end of the sequence is 0 → Z_(p)^× → Q^× → Z → 0 (valuation) and K_0(F_p) → K_0(Z_(p)) is 0.
- For O = k[[t]] the boundary on K_2 is the tame symbol (K-book V.6.6.1), a check against K2SymbolsBrauer T.3.
- ∂ does not depend on π; the specialisation λ_π(y) = ∂({π}·y) does (L.2/change-of-uniformiser).

**Depends on.** this roadmap: `L.1/k-theory-mod-m`; other roadmaps: `GeneralAlgebraicKTheory:K.3/abelian-localization-theorem`, `GeneralAlgebraicKTheory:K.7`, `KTheoryLowDegrees:U.5`; libraries: `mathlib:IsDiscreteValuationRing`.

**Sources.**

- `Kbook.2013`, V.6.6 (PDF p. 417): “Hence the localization sequence of 6.1 with S = R − {0} becomes the long exact sequence:” — The Dedekind (here DVR) localisation sequence.
- `Kbook.2013`, V.6.1.1 (PDF p. 414): “This is a sequence of K_*(R)-modules, because P(R) acts on the sequence of abelian categories” — The module structure.
- `Kbook.2013`, Example V.6.1.2 (PDF p. 414): “In particular, when R is a domain we have ∂(s) = [R/sR].” — The degree-one boundary.
- `Kbook.2013`, Theorem V.6.9.1, proof (PDF p. 422): “we see that ∂_{m′}{a′, s′} = {a′, [k]} = a′ · 1 = a” — The left-linearity convention used here.

### Localisation boundaries and Bockstein homomorphisms

`L.2/localisation-bockstein-compatibility` · lemma

For a DVR O with fraction field L and residue field k, and m ≥ 1, the reduction maps K_*(−) → K_*(−; Z/m) and the Bocksteins β_m: K_*(−; Z/m) → K_{*−1}(−) commute with the maps K(k) → K(O) → K(L), and the localisation boundaries satisfy ∂ ∘ red = red ∘ ∂ and ∂ ∘ β_m = −β_m ∘ ∂: K_{n+1}(L; Z/m) → K_{n−1}(k). In particular, if a ∈ K_{n+1}(L; Z/m) has ∂a = b ∈ K_n(k; Z/m), then ∂(β_m a) = −β_m b.

**Hypotheses.**

- O a DVR; the sign is that of the 3×3 lemma for the chosen suspension isomorphisms.

**Proof.**

1. The localisation cofibre sequence K(k) → K(O) → K(L) → ΣK(k) (L.2/dvr-localisation) and the cofibre sequence E →m E → E/m → ΣE of each term form a 3×3 diagram of cofibre sequences in the stable homotopy category (StableHomotopyKTheory H.5:spectra, fibre/cofibre sequences; H.6 for E/m).
2. Naturality of E ↦ E/m gives the commutation with reduction; the 3×3 lemma gives anticommutation of the two boundaries.

**Acceptance.**

- For O = Z_(p), n = 0, m | p − 1: a = [π] ∈ K_1(Q; Z/m) has ∂a = 1 ∈ K_0(F_p; Z/m) = Z/m and β_m 1 = 0 in K_{−1}(F_p) = 0: consistent.
- K-book Corollary V.6.9.2 uses exactly this to split K_{2i}(F) → K_{2i−1}(k) from the mod-ℓ splitting.

**Depends on.** this roadmap: `L.2/dvr-localisation`, `L.1/k-theory-mod-m`; other roadmaps: `StableHomotopyKTheory:H.6/mod-l-homotopy-and-bockstein-sequence`, `StableHomotopyKTheory:H.5:S-delooping/iterated-S-construction-omega-spectrum`.

**Sources.**

- `Kbook.2013`, Corollary V.6.9.2, proof (PDF pp. 422–423): “By compatibility of localization sequences (Ex. 5.2), the image of a under K_{2i+1}(F; Z/ℓ) → K_{2i}(F) is sent by ∂ to b.” — The compatibility, used with the Bockstein (the target should be the Bockstein of b; sourceIssues).

### The mod-m localisation sequence of a henselian DVR splits

`L.2/henselian-dvr-mod-m-splitting` · theorem

Let O be a henselian DVR with fraction field L, residue field k, uniformiser π, and m ≥ 1 invertible in k. Then for every n ≥ 1 the sequence 0 → K_n(O; Z/m) → K_n(L; Z/m) →∂ K_{n−1}(k; Z/m) → 0 is exact, and s_π(a) = r^{−1}(a)·{π} is a section of ∂, where r: K_*(O; Z/m) ≅ K_*(k; Z/m) is the rigidity isomorphism and · is the K_*(L)-module structure on K_*(L; Z/m). The section depends on π (L.2/change-of-uniformiser). For n = 0, K_0(O; Z/m) ≅ K_0(L; Z/m) ≅ Z/m. The same exactness (without the explicit section) holds for every DVR with 1/m ∈ k (K-book Theorem V.6.9.1, through the henselisation).

**Hypotheses.**

- O a henselian DVR; m invertible in k. The residue field need not be finite.

**Proof.**

1. Rigidity: r: K(O)/m ≃ K(k)/m (L.2/gabber-rigidity).
2. ∂(r^{−1}(a)·{π}) = r(r^{−1}(a))·∂{π} = a·[k] = a, by the K_*(O)-linearity of ∂ and ∂[π] = 1 (L.2/dvr-localisation); so ∂ is surjective in every degree.
3. Surjectivity of every ∂ makes each i_*: K_{n−1}(k; Z/m) → K_{n−1}(O; Z/m) zero, and the long exact sequence breaks into the short exact sequences, split by s_π.

**Acceptance.**

- L = Q_5, m = 4: K_1(Q_5; Z/4) = Q_5^×/4 ≅ Z/4 ⊕ Z/4 (from μ_4 and 5^Z), matching K_1(Z_5; Z/4) ⊕ K_0(F_5; Z/4) ≅ Z/4 ⊕ Z/4.
- L = Q_5, m = 4, n = 2: K_2(Q_5; Z/4) has order 16 = |K_2(Z_5; Z/4)|·|K_1(F_5; Z/4)|, as UCT gives K_2(Q_5)/4 ⊕ 4K_1(Q_5) = μ(Q_5)/4 ⊕ μ_4.
- For m = p (not invertible) the sequence need not split in the same way: K_1(Z_p; Z/p) = Z_p^×/p ≠ 0 = K_1(F_p; Z/p).

**Depends on.** this roadmap: `L.2/gabber-rigidity`, `L.2/dvr-localisation`, `L.1/k-theory-mod-m`; libraries: `mathlib:HenselianLocalRing`, `mathlib:IsDiscreteValuationRing`.

**Sources.**

- `Kbook.2013`, Theorem V.6.9.1 (PDF pp. 421–422): “Theorem 6.9.1. If R is a discrete valuation ring with residue field k, then the localization sequence with coefficients breaks up: 0 → K_n(R; Z/ℓ) → K_n(F; Z/ℓ) −∂→ K_{n−1}(k; Z/ℓ) → 0.” — The statement for every DVR.
- `Kbook.2013`, Theorem V.6.9.1, proof (PDF p. 422): “By Gabber Rigidity 2.10, K_*(k; Z/ℓ) ≅ K_*(R^h; Z/ℓ) ≅ lim K_*(R′_{m′}; Z/ℓ).” — The case 1/ℓ ∈ k through the henselisation; for henselian O no colimit is needed.

### Odd K-groups of a henselian local ring: ℓ-torsion and reduction mod ℓ^ν

`L.2/odd-k-l-torsion` · lemma

Let O be a henselian local ring with residue field F_q of characteristic p, ℓ ≠ p a prime and i ≥ 1. Then reduction induces isomorphisms ℓ^ν K_{2i−1}(O) ≅ ℓ^ν K_{2i−1}(F_q) for every ν ≥ 1, hence K_{2i−1}(O){ℓ} ≅ K_{2i−1}(F_q){ℓ} ≅ Z/(q^i − 1)_ℓ, and K_{2i−1}(O)/ℓ^ν ≅ K_{2i−1}(F_q)/ℓ^ν for every ν ≥ 1. Also K_{2i}(O)/ℓ = 0.

**Hypotheses.**

- O henselian local with residue field F_q; ℓ ≠ p; i ≥ 1.

**Proof.**

1. Write A_n = K_n(O), B_n = K_n(F_q). Reduction gives a map of Bockstein sequences 0 → A_n/ℓ^ν → K_n(O; Z/ℓ^ν) → ℓ^νA_{n−1} → 0 to the same for B, whose middle map is an isomorphism (L.2/rigidity-finite-residue-field).
2. n = 2i: B_{2i}/ℓ^ν = 0 (L.1/quillen-k-groups). The left map A_{2i}/ℓ^ν → 0 is injective (middle iso), so A_{2i}/ℓ^ν = 0; then the right map ℓ^νA_{2i−1} → ℓ^νB_{2i−1} is an isomorphism (snake lemma: its kernel is the cokernel of the left map).
3. n = 2i − 1: ℓ^νB_{2i−2} = 0 (for i = 1, B_0 = Z is torsion-free). So A_{2i−1}/ℓ^ν → B_{2i−1}/ℓ^ν is injective with cokernel ℓ^νA_{2i−2}; it is also surjective, since A_{2i−1}{ℓ} → B_{2i−1}{ℓ} is onto by the previous step and B_{2i−1}{ℓ} → B_{2i−1}/ℓ^ν is onto for a finite cyclic group.
4. This is the divisibility argument that the stage text requires before passing from finite coefficients to integral groups: nothing is inferred from K_*(O; Z/ℓ^ν) alone without the Bockstein sequences at every ν.

**Acceptance.**

- O = Z_7, ℓ = 3, i = 1: K_1(Z_7){3} = μ_3(Z_7) ≅ Z/3 ≅ F_7^×{3}.
- O = Z_2, ℓ = 3, i = 2: K_3(Z_2){3} ≅ K_3(F_2) ≅ Z/3.
- Coefficients Z/ℓ alone would not suffice: they determine only the ℓ-rank and cannot tell A_{2i−1}{ℓ} ≅ Z/ℓ from Z/ℓ^2; every ν is used.

**Depends on.** this roadmap: `L.2/rigidity-finite-residue-field`, `L.1/k-theory-mod-m`, `L.1/quillen-k-groups`; other roadmaps: `StableHomotopyKTheory:H.6/mod-l-homotopy-and-bockstein-sequence`.

**Sources.**

- `Weibel.Handbook.I5`, Proposition 58, proof (p. 164): “it follows that K_{2i−1}(V) has a cyclic summand isomorphic to Z/w^{(ℓ)}_i(E), and that the complement is uniquely ℓ-divisible.” — The conclusion; the Handbook argues through Bockstein spectral sequences, replaced here by the Bockstein sequences at every ν.
- `Kbook.2013`, Proposition VI.7.3, proof (PDF p. 517): “By Gabber Rigidity 2.10, K_{2i−1}(V; Z/ℓ^ν) and K_{2i−1}(F_q; Z/ℓ^ν) ≅ w^{(ℓ)}_i(F_q) are isomorphic.” — The same comparison in the K-book.

### Even K-groups of a henselian local ring are uniquely ℓ-divisible

`L.2/even-k-uniquely-l-divisible` · lemma

Let O be a henselian local ring with residue field F_q of characteristic p, ℓ ≠ p a prime and i ≥ 1. Then K_{2i}(O) is uniquely ℓ-divisible: K_{2i}(O)/ℓ = 0 and the ℓ-torsion of K_{2i}(O) is 0. Hence K_{2i}(O) is a Z_(p)-module, and for O a henselian DVR K_2(O) ⊗ Z[1/p] is uniquely divisible.

**Hypotheses.**

- O henselian local with residue field F_q; ℓ ≠ p; i ≥ 1.

**Proof.**

1. K_{2i}(O)/ℓ = 0 is part of L.2/odd-k-l-torsion (degree 2i).
2. Torsion: in the Bockstein diagram in degree 2i + 1, 0 → A_{2i+1}/ℓ^ν → K_{2i+1}(O; Z/ℓ^ν) → ℓ^νA_{2i} → 0 over 0 → B_{2i+1}/ℓ^ν → K_{2i+1}(F_q; Z/ℓ^ν) → ℓ^νB_{2i} = 0 → 0, the left map is an isomorphism (L.2/odd-k-l-torsion for i + 1), so ℓ^νA_{2i} ≅ coker = 0.
3. An abelian group that is uniquely ℓ-divisible for all ℓ ≠ p is a Z_(p)-module.

**Acceptance.**

- O = Z_p: K_2(Z_p) is uniquely ℓ-divisible for ℓ ≠ p (it is U_2 ⊕ μ_{p^∞}(Q_p) by Moore's theorem with the errata correction, a check owned by L.3).
- O = F_q[[t]]: K_2(F_q[[t]]) = K_2(F_q) ⊕ U_2 = U_2, uniquely divisible (K-book Theorem VI.7.2).
- The statement is about K_{2i}(O), not K_{2i}(L): K_2(Q_5) has the ℓ-torsion μ_4 for ℓ = 2 (L.2/even-k-field-splitting).

**Depends on.** this roadmap: `L.2/odd-k-l-torsion`, `L.1/k-theory-mod-m`, `L.1/quillen-k-groups`.

**Sources.**

- `Weibel.Handbook.I5`, Proposition 58 (p. 164): “There is also a decomposition K_{2i}(E) ≅ K_{2i}(V) ⊕ K_{2i−1}(F_q), and the group K_{2i}(V) is uniquely ℓ-divisible for every prime ℓ ≠ p, i.e., a Z_(p)-module.” — The statement.
- `Kbook.2013`, Theorem VI.7.2, proof (PDF p. 516): “By Gabber rigidity (2.10), U_n is uniquely ℓ-divisible for all ℓ ≠ p and n > 0.” — The equal-characteristic form.
- `Kbook.2013`, VI.7, before Proposition 7.3 (PDF p. 516): “Recall that an abelian group which is uniquely ℓ-divisible for all ℓ ≠ p is the same thing as a Z_(p)-module.” — The Z_(p)-module formulation.

### The K-theory of a henselian local ring with finite residue field away from p

`L.2/prime-to-p-ring-of-integers` · theorem · planet “K-theory of a henselian DVR away from p”

Let O be a henselian local ring with residue field F_q of characteristic p and i ≥ 1. Let T_{2i−1} ⊂ K_{2i−1}(O) be the subgroup of torsion elements of order prime to p. Then reduction restricts to an isomorphism T_{2i−1} ≅ K_{2i−1}(F_q) ≅ Z/(q^i − 1), and K_{2i−1}(O) = T_{2i−1} ⊕ U_{2i−1} with U_{2i−1} = ker(K_{2i−1}(O) → K_{2i−1}(F_q)) a Z_(p)-module. This decomposition is canonical (no uniformiser or generator enters). K_{2i}(O) is a Z_(p)-module. In degree 1, T_1 = μ_{q−1}(O), the Teichmüller roots of unity.

**Hypotheses.**

- O henselian local with residue field F_q; i ≥ 1.

**Proof.**

1. For each ℓ ≠ p, reduction T_{2i−1}{ℓ} = K_{2i−1}(O){ℓ} → K_{2i−1}(F_q){ℓ} is an isomorphism (L.2/odd-k-l-torsion). K_{2i−1}(F_q) is finite of order prime to p (L.1/quillen-k-groups), so summing over ℓ ≠ p gives T_{2i−1} ≅ K_{2i−1}(F_q) and in particular reduction is onto.
2. Let t: K_{2i−1}(F_q) → T_{2i−1} be the inverse; it splits reduction, so K_{2i−1}(O) = T_{2i−1} ⊕ U_{2i−1}.
3. U_{2i−1} has no ℓ-torsion (T_{2i−1} ∩ U_{2i−1} = 0 and the ℓ-torsion lies in T) and U_{2i−1}/ℓ^ν = 0, since K_{2i−1}(O)/ℓ^ν ≅ K_{2i−1}(F_q)/ℓ^ν ≅ T_{2i−1}/ℓ^ν (L.2/odd-k-l-torsion); so U_{2i−1} is uniquely ℓ-divisible for all ℓ ≠ p.
4. K_{2i}(O) is a Z_(p)-module (L.2/even-k-uniquely-l-divisible).
5. Degree 1: K_1(O) = O^× for a local ring and T_1 = μ_{q−1}(O) ≅ F_q^× (TauCeti.rootsOfUnityEquivResidueFieldUnits for local-field integers; TauCeti.rootsOfUnityEquivResidueField in general, q − 1 being invertible).

**Acceptance.**

- O = Z_p (p odd), i = 1: Z_p^× = μ_{p−1} × (1 + pZ_p) with 1 + pZ_p ≅ Z_p a Z_(p)-module.
- O = Z_2, i = 2: K_3(Z_2) ⊇ T_3 ≅ K_3(F_2) ≅ Z/3; the 2-part of the torsion (Z/8 inside Z/w_2(Q_2) = Z/24) lies in U_3, a Z_(2)-module.
- O = F_q[[t]]: T_{2i−1} is the image of K_{2i−1}(F_q) under the inclusion F_q ⊂ F_q[[t]], so the canonical decomposition agrees with K-book Theorem VI.7.2's.

**Depends on.** this roadmap: `L.2/odd-k-l-torsion`, `L.2/even-k-uniquely-l-divisible`, `L.1/quillen-k-groups`; libraries: `tauceti:TauCeti.rootsOfUnityEquivResidueField`, `tauceti:TauCeti.rootsOfUnityEquivResidueFieldUnits`.

**Sources.**

- `Weibel.Handbook.I5`, Proposition 58 (p. 164): “If i > 0 there is a summand of K_{2i−1}(V) ≅ K_{2i−1}(E) isomorphic to K_{2i−1}(F_q) ≅ Z/(q^i − 1), detected by the e-invariant. The complementary summand is uniquely ℓ-divisible for every prime ℓ ≠ p, i.e., a Z_(p)-module.” — The statement (for i = 1 the identification with K_1(E) is corrected in sourceIssues).
- `Kbook.2013`, Proposition VI.7.3 (PDF p. 517): “Proposition 7.3. For n > 0 we have K_n(E) ≅ K_n(V) ⊕ K_{n−1}(F_q), and the groups K_n(V) are Z_(p)-modules.” — Quoted for the correction: only the even groups and the complementary summands are Z_(p)-modules (sourceIssues).

### The even K-groups of the fraction field of a henselian DVR

`L.2/even-k-field-splitting` · theorem

Let O be a henselian DVR with fraction field L and finite residue field F_q of characteristic p, and i ≥ 1. Then 0 → K_{2i}(O) → K_{2i}(L) →∂ K_{2i−1}(F_q) → 0 is exact. Let t: K_{2i−1}(F_q) ≅ T_{2i−1} ⊂ K_{2i−1}(O) be the inverse of reduction on the prime-to-p torsion (L.2/prime-to-p-ring-of-integers). For any uniformiser π, s(y) = t(y)·{π} is a section of ∂, and s does not depend on π. Its image is the subgroup K_{2i}(L)_{p′} of torsion elements of order prime to p, so K_{2i}(L) = K_{2i}(O) ⊕ K_{2i}(L)_{p′} canonically and ∂: K_{2i}(L)_{p′} ≅ K_{2i−1}(F_q) ≅ Z/(q^i − 1). For i = 1: K_2(L) = K_2(O) ⊕ K_2(L)_{p′}, the section being u ↦ {ω(u), π} with ω the Teichmüller lift of u ∈ F_q^×.

**Hypotheses.**

- O a henselian DVR with finite residue field F_q; i ≥ 1. The ring structure of K_*(O) and K_*(L) is that of GeneralAlgebraicKTheory K.7.

**Proof.**

1. Section: ∂(t(y)·{π}) = r(t(y))·∂{π} = y·[F_q] = y (L.2/dvr-localisation: left K_*(O)-linearity and ∂[π] = 1); so ∂ is onto.
2. Injectivity on the left: K_{2i}(F_q) = 0 (L.1/quillen-k-groups), so the previous term of the localisation sequence vanishes.
3. Independence of π: for u ∈ O^×, t(y)·{uπ} − t(y)·{π} = t(y)·{u}, the image of a class of K_{2i}(O) killed by q^i − 1 (because t(y) is); K_{2i}(O) has no torsion prime to p (L.2/even-k-uniquely-l-divisible), so this class is 0.
4. Image: s(y) is killed by q^i − 1, which is prime to p, so s lands in K_{2i}(L)_{p′}; and K_{2i}(L)_{p′} ∩ K_{2i}(O) = 0 by the same lemma; hence ∂ restricts to an isomorphism K_{2i}(L)_{p′} ≅ K_{2i−1}(F_q).
5. i = 1: T_1 = μ_{q−1}(O) = Teichmüller units (TauCeti.rootsOfUnityEquivResidueFieldUnits), so s(u) = {ω(u), π}.

**Acceptance.**

- L = Q_5, i = 1: K_2(Q_5)_{5′} ≅ F_5^× ≅ Z/4, which is μ(Q_5) = μ_4; this is the prime-to-p part of Moore's theorem (L.3).
- L = F_3((t)), i = 2: K_4(F_3((t))) = K_4(F_3[[t]]) ⊕ Z/8 with K_4(F_3[[t]]) uniquely divisible (K-book Theorem VI.7.2).
- Unlike the degree-one splitting L^× ≅ O^× × π^Z, this splitting is canonical (L.2/change-of-uniformiser).

**Depends on.** this roadmap: `L.2/dvr-localisation`, `L.2/prime-to-p-ring-of-integers`, `L.2/even-k-uniquely-l-divisible`, `L.1/quillen-k-groups`; other roadmaps: `GeneralAlgebraicKTheory:K.7/biexact-pairings-and-products`; libraries: `tauceti:TauCeti.rootsOfUnityEquivResidueFieldUnits`.

**Sources.**

- `Weibel.Handbook.I5`, Proposition 58, proof (p. 164): “If x ∈ K_{2i−1}(V), the product {x, π} ∈ K_{2i}(E) maps to the image of x in K_{2i−1}(F_q) under the boundary map ∂ in the localization sequence.” — The section.
- `Weibel.Handbook.I5`, Proposition 58, proof (p. 164): “Hence the summand of K_{2i−1}(V) isomorphic to K_{2i−1}(F_q) lifts to a summand of K_{2i}(E).” — The splitting.
- `Kbook.2013`, Corollary V.6.9.2 (PDF p. 422): “Corollary 6.9.2. If R is a discrete valuation domain whose residue field k is finite, then for all i > 0: K_{2i−1}(R) ≅ K_{2i−1}(F) and there is a split exact sequence” — The split sequence (for every DVR with finite residue field; the i = 1 part of the first claim is corrected in sourceIssues).

### The odd K-groups of a henselian DVR and of its fraction field

`L.2/odd-k-ring-of-integers-equals-field` · theorem

Let O be a henselian DVR with fraction field L and finite residue field F_q. For i ≥ 2 the map K_{2i−1}(O) → K_{2i−1}(L) is an isomorphism. For i = 1 it is the inclusion O^× → L^× with cokernel Z (the valuation): 0 → O^× → L^× → Z → 0.

**Hypotheses.**

- O a henselian DVR with finite residue field; i ≥ 1.

**Proof.**

1. In the localisation sequence (L.2/dvr-localisation) … → K_{2i}(L) →∂ K_{2i−1}(F_q) →i_* K_{2i−1}(O) → K_{2i−1}(L) →∂ K_{2i−2}(F_q) → …, the first ∂ is onto (L.2/even-k-field-splitting), so i_* = 0 and K_{2i−1}(O) → K_{2i−1}(L) is injective.
2. For i ≥ 2, K_{2i−2}(F_q) = 0 (L.1/quillen-k-groups), so the map is onto.
3. For i = 1, K_0(F_q) = Z and ∂: L^× → Z is the valuation, onto; i_*: K_0(F_q) → K_0(O) is zero.

**Acceptance.**

- L = Q_p: K_3(Z_p) ≅ K_3(Q_p) (i = 2), while K_1(Z_p) = Z_p^× ≠ Q_p^× = K_1(Q_p).
- K-book Corollary V.6.9.2 and Handbook Proposition 58 state K_{2i−1}(V) ≅ K_{2i−1}(E) for all i > 0; the case i = 1 is false, as this node records.

**Depends on.** this roadmap: `L.2/dvr-localisation`, `L.2/even-k-field-splitting`, `L.1/quillen-k-groups`.

**Sources.**

- `Kbook.2013`, Corollary V.6.9.2 (PDF p. 422): “then for all i > 0: K_{2i−1}(R) ≅ K_{2i−1}(F)” — The claim, corrected at i = 1 (sourceIssues).
- `Kbook.2013`, Proposition VI.7.3, proof (PDF p. 517): “In particular, K_{2i−1}(V) ≅ K_{2i−1}(E).” — The same identification in VI.7.

### Which splittings depend on the uniformiser

`L.2/change-of-uniformiser` · lemma

Let O be a henselian DVR with fraction field L, residue field k, and let π, π′ = uπ (u ∈ O^×) be uniformisers. (a) Degree one, integrally: the splittings Z → L^×, 1 ↦ π and 1 ↦ π′, of the valuation differ by u, so L^× ≅ O^× × Z depends on π. (b) Degree 2i ≥ 2, integrally, k finite: the section of K_{2i}(L) → K_{2i−1}(k) of L.2/even-k-field-splitting does not depend on π. (c) With coefficients, m invertible in k: the sections s_π(a) = r^{−1}(a)·{π} of L.2/henselian-dvr-mod-m-splitting satisfy s_{π′}(a) − s_π(a) = r^{−1}(a)·{u}, which is nonzero in general; for a = 1 ∈ K_0(k; Z/m) it is the class of u in O^×/m ⊂ L^×/m = K_1(L; Z/m). (d) The specialisation λ_π(y) = ∂({π}·y) for y ∈ K_n(L) satisfies λ_{π′}(y) = λ_π(y) + {ū}·∂(y) (with the left-linearity convention of L.2/dvr-localisation); the boundary ∂ itself does not depend on π.

**Hypotheses.**

- O henselian DVR; for (b) finite residue field; for (c) m invertible in k.

**Proof.**

1. (a) Immediate.
2. (b) Shown in L.2/even-k-field-splitting: the difference t(y)·{u} is a torsion class of order prime to p in K_{2i}(O), which has none.
3. (c) {uπ} = {u} + {π} in K_1(L), and the module structure is additive in the K_1-argument.
4. (d) ∂({u}·y) = r({u})·∂y by K_*(O)-linearity (L.2/dvr-localisation), and {uπ}·y = {u}·y + {π}·y.

**Acceptance.**

- L = Q_11, m = 5, u a Teichmüller generator of μ_10: s_{uπ}(1) − s_π(1) = [u] ≠ 0 in Q_11^×/5, since u is not a fifth power (it has order 10).
- L = Q_11, i = 1 integrally: the section F_11^× → K_2(Q_11), v ↦ {ω(v), π}, is the same for π = 11 and π = 22 = 2·11: {ω(v), 2} lies in K_2(Z_11) and is 10-torsion, hence 0.
- The K-book's own formula (V.6.6.4) reads λ_{s′}(a) = λ_s(a) + (−1)^n{u, ∂a}; the sign reflects its other linearity convention (sourceIssues).

**Depends on.** this roadmap: `L.2/dvr-localisation`, `L.2/even-k-field-splitting`, `L.2/henselian-dvr-mod-m-splitting`.

**Sources.**

- `Kbook.2013`, V.6.6.4 (PDF p. 418): “we define the specialization map λ_s : K_n(F) → K_n(k) by λ_s(a) = ∂({s, a}).” — The specialisation map.
- `Kbook.2013`, V.6.6.4 (PDF p. 418): “a different choice of parameter will yield a different specialization map” — Its dependence on the parameter.
- `Weibel.Handbook.I5`, Theorem 56, proof (p. 163): “The map K_{n−1}(F_q) → K_n(E) sending x to {x, π} splits the localization sequence” — The uniformiser-dependent splitting in the equal-characteristic case.

### The prime-to-residue-characteristic part of local-field K-theory

`L.2/local-field-prime-to-p` · theorem · planet “Prime-to-p part of local-field K-theory”

Let L be the fraction field of a henselian DVR O with finite residue field F_q of characteristic p (for example a nonarchimedean local field, of characteristic 0 or p), and ℓ ≠ p a prime, i ≥ 1. Integral groups: K_{2i}(L){ℓ} ≅ Z/(q^i − 1)_ℓ (through ∂) and K_{2i−1}(L){ℓ} ≅ Z/(q^i − 1)_ℓ (through reduction on O; for i = 1 this is μ_{ℓ^∞}(L)); the prime-to-p torsion subgroups are K_{2i}(L)_{p′} ≅ K_{2i−1}(L)_{p′} ≅ Z/(q^i − 1); for i ≥ 2 the complement of K_{2i−1}(L)_{p′} is a Z_(p)-module, and the complement K_{2i}(O) of K_{2i}(L)_{p′} is a Z_(p)-module; for i = 1, L^× = μ_{q−1} × U_1-part × π^Z is not of this form. Finite coefficients (p ∤ m): K_n(L; Z/m) ≅ K_n(O; Z/m) ⊕ K_{n−1}(F_q; Z/m), splitting depending on π. ℓ-adic coefficients: K_{2i}(L; Z_ℓ) ≅ Z/(q^i − 1)_ℓ, K_{2i−1}(L; Z_ℓ) ≅ Z/(q^i − 1)_ℓ for i ≥ 2, and K_1(L; Z_ℓ) ≅ Z/(q − 1)_ℓ ⊕ Z_ℓ. These three kinds of statement are distinct: the integral K_{2i}(L) is not determined by K_{2i}(L; Z_ℓ).

**Hypotheses.**

- O henselian DVR with finite residue field F_q, char F_q = p; ℓ ≠ p; i ≥ 1.

**Proof.**

1. Integral, even: K_{2i}(L) = K_{2i}(O) ⊕ K_{2i}(L)_{p′} with K_{2i}(O) uniquely ℓ-divisible (L.2/even-k-field-splitting, L.2/even-k-uniquely-l-divisible).
2. Integral, odd: K_{2i−1}(L) ≅ K_{2i−1}(O) for i ≥ 2 (L.2/odd-k-ring-of-integers-equals-field) and the structure of K_{2i−1}(O) (L.2/prime-to-p-ring-of-integers); for i = 1, μ_{ℓ^∞}(L) = μ_{ℓ^∞}(O) ≅ μ_{ℓ^∞}(F_q) (TauCeti.rootsOfUnityEquivResidueField).
3. Finite coefficients: L.2/henselian-dvr-mod-m-splitting.
4. ℓ-adic: the split sequences of L.2/henselian-dvr-mod-m-splitting for m = ℓ^ν, with π fixed, are compatible in ν, so K_n(L; Z_ℓ) ≅ K_n(O; Z_ℓ) ⊕ K_{n−1}(F_q; Z_ℓ); insert L.2/rigidity-l-adic (K_n(O; Z_ℓ) ≅ K_n(F_q) ⊗ Z_ℓ) and K_0(F_q; Z_ℓ) = Z_ℓ.

**Acceptance.**

- L = Q_5, ℓ = 2: K_2(Q_5){2} ≅ Z/4, K_3(Q_5){2} ≅ K_4(Q_5){2} ≅ Z/8 (24 = 8·3), K_1(Q_5; Z_2) ≅ Z/4 ⊕ Z_2.
- L = F_2((t)), ℓ = 3: K_3{3} ≅ K_4{3} ≅ Z/3, K_5{3} = K_6{3} = 0 (2^3 − 1 = 7), K_7{3} ≅ Z/3 (15).
- The p-part is not covered: for L = Q_p, K_3(Q_p; Z_p) ≅ Z_p ⊕ Z/w_2^{(p)}(Q_p) (K-book Theorem VI.7.4, L.6), which no prime-to-p statement predicts.

**Depends on.** this roadmap: `L.2/even-k-field-splitting`, `L.2/even-k-uniquely-l-divisible`, `L.2/odd-k-ring-of-integers-equals-field`, `L.2/prime-to-p-ring-of-integers`, `L.2/henselian-dvr-mod-m-splitting`, `L.2/rigidity-l-adic`; libraries: `tauceti:TauCeti.rootsOfUnityEquivResidueField`.

**Sources.**

- `Weibel.Handbook.I5`, §5.6, before Proposition 58 (pp. 163–164): “For p-adic fields, the following calculation reduces the problem to the prime p.” — The role of this node.
- `Kbook.2013`, Proposition VI.7.3 (PDF p. 517): “When n = 2i − 1, K_n(V) ≅ K_n(E) is the direct sum of a torsionfree Z_(p)-module and the Harris-Segal summand (see 2.5), which is isomorphic to Z/w_i(E).” — The odd groups (the prime-to-p part of Z/w_i(E) is Z/(q^i − 1)).
- `Kbook.2013`, Proposition VI.7.3, proof (PDF p. 517): “It remains to show that T_i and D_i are uniquely ℓ-divisible for ℓ ≠ p and i > 0” — The prime-to-p divisibility argument.

### The K-theory of a local field with finite coefficients

`L.2/mod-m-local-field-ring` · theorem · planet “K-theory of local fields with finite coefficients”

Let O be a henselian DVR with fraction field L, finite residue field F_q of characteristic p, uniformiser π, and let m ≥ 2 with p ∤ m and m | q − 1. Additively, for all n ≥ 1, K_n(L; Z/m) ≅ K_n(O; Z/m) ⊕ K_{n−1}(O; Z/m) ≅ (Z/m)^2, and K_0(L; Z/m) ≅ Z/m. If moreover m = ℓ^ν ∉ {2, 3, 4, 8}, so that K_*(−; Z/m) is a graded-commutative ring, then K_*(O; Z/m) ≅ K_*(F_q; Z/m) ≅ Z/m[β, ζ]/(ζ^2) (β the Bott element of a primitive m-th root of unity of O, ζ the class of a Teichmüller generator of μ_{q−1}), K_*(L; Z/m) is a free K_*(O; Z/m)-module on 1 and z_π = [π] ∈ K_1(L; Z/m) = L^×/L^{×m}, hence a free Z/m[β]-module on 1, ζ, z_π, ζz_π, and z_π^2 = [−1]·z_π, which is 0 if q ≡ 1 (mod 2m) or q is a power of 2. The basis element z_π depends on π (L.2/change-of-uniformiser). This corrects K-book Proposition V.6.10, which gives the basis 1, z only.

**Hypotheses.**

- O henselian DVR with finite residue field F_q; p ∤ m, m | q − 1; for the ring statement m = ℓ^ν ∉ {2, 3, 4, 8}.

**Proof.**

1. Additive: L.2/henselian-dvr-mod-m-splitting with L.2/rigidity-finite-residue-field and L.1/finite-field-mod-m-groups (m | q − 1 gives Z/m in every degree).
2. Ring: rigidity is a ring isomorphism (reduction is a ring map), and K_*(F_q; Z/m) ≅ Z/m[β, ζ]/(ζ^2) (L.1/browder-mod-l-ring, L.1/mod-m-products); μ_m ⊂ O by Hensel (TauCeti.rootsOfUnityEquivResidueField), so β is defined on O.
3. The section s_π(a) = r^{−1}(a)·{π} is multiplication by z_π in the ring K_*(L; Z/m); since ∂ maps z_π·K_{*−1}(O; Z/m) isomorphically onto K_{*−1}(F_q; Z/m), K_*(L; Z/m) = K_*(O; Z/m) ⊕ z_π K_*(O; Z/m) freely.
4. z_π^2 is the reduction of {π, π} = {−1, π} (K-book III.5.10.2), that is [−1]·z_π; [−1] = 0 in L^×/m when −1 is an m-th power, e.g. q ≡ 1 mod 2m (then μ_{2m} ⊂ O) or m odd.

**Acceptance.**

- L = Q_11, m = 5: K_1(Q_11; Z/5) = Q_11^×/5 ≅ Z/5·ζ ⊕ Z/5·z_π has order 25; the K-book's 'free on 1 and z' would give order 5.
- L = Q_11, m = 5, n = 2: K_2(Q_11; Z/5) ≅ Z/5·β ⊕ Z/5·ζz_π; by UCT it is K_2(Q_11)/5 ⊕ 5K_1(Q_11) = μ(Q_11)/5 ⊕ μ_5, of order 25.
- Passing to the union E_q of all such fields with residue field F_q (totally ramified towers) kills z_π but not ζ: K_*(E_q; Z/m) ≅ Z/m[β, ζ]/(ζ^2), not Z/m[β] as K-book Example V.6.10.2 states; ζ dies only after also enlarging the residue field (K-book Proposition VI.1.4).

**Depends on.** this roadmap: `L.2/henselian-dvr-mod-m-splitting`, `L.2/rigidity-finite-residue-field`, `L.1/finite-field-mod-m-groups`, `L.1/browder-mod-l-ring`, `L.1/mod-m-products`, `L.1/bott-element`; libraries: `tauceti:TauCeti.rootsOfUnityEquivResidueField`.

**Sources.**

- `Kbook.2013`, Proposition V.6.10 (PDF p. 423): “If the residue field is F_q and q ≡ 1 (mod m), then K_*(E; Z/m) is a free Z/m[β]-module on generators 1 and z, where β is the Bott element and z is the class of π in K_1(E; Z/m) = E^×/E^{×m}.” — The statement corrected here (sourceIssues).
- `Kbook.2013`, Proposition V.6.10 (PDF p. 423): “Since {π, π} = {−1, π} in K_2(E) (5.10.2), the ring structure is given by z^2 = [−1] · z.” — The relation z^2 = [−1]z.
- `Kbook.2013`, Example V.6.10.2 (PDF p. 423): “Taking the direct limit over all E, we see that K_*(E_q; Z/m) = Z/m[β].” — The consequence corrected in the acceptance.

### The numbers w_i^{(ℓ)} of a local field away from p

`L.2/w-invariant-local-field` · lemma

Let L be a nonarchimedean local field with residue field F_q of characteristic p, L^sep a separable closure, G_L = Gal(L^sep/L), ℓ ≠ p and i ∈ Z, i ≠ 0. Then G_L acts on μ_{ℓ^∞}(L^sep) through the residue map G_L → Gal(\bar F_q/F_q), the q-power Frobenius acting by ζ ↦ ζ^q; hence the arithmetic Frobenius acts on Z/ℓ^∞(i) by multiplication by q^i, and W_i^{(ℓ)}(L) = (Z/ℓ^∞(i))^{G_L} (ArithmeticKTheory N.4) is cyclic of order w_i^{(ℓ)}(L) = (q^{|i|} − 1)_ℓ = w_i^{(ℓ)}(F_q), the ℓ-part of q^{|i|} − 1 (for i < 0, q^i − 1 = −q^i(q^{−i} − 1) and q is a unit in ℤ_ℓ).

**Hypotheses.**

- L a nonarchimedean local field (either characteristic); ℓ ≠ p; i ≠ 0.

**Proof.**

1. For every finite Galois L′ ⊂ L^sep, the integers O′ of L′ are a henselian local ring with residue field k′ and reduction μ_{ℓ^ν}(O′) ≅ μ_{ℓ^ν}(k′) is a G_L-equivariant isomorphism (TauCeti.rootsOfUnityEquivResidueField; finite extensions of local fields are local fields, requested from tauceti LocalFieldsRamification Layer 0).
2. Taking the union, μ_{ℓ^∞}(L^sep) ≅ μ_{ℓ^∞}(\bar F_q) equivariantly for the residue action; the residue map G_L → Gal(\bar F_q/F_q) ≅ \hat Z is onto (unramified extensions of every degree, LocalFieldsRamification Layer 2).
3. The Frobenius acts on μ_{ℓ^∞}(\bar F_q) by ζ ↦ ζ^q, so on the i-th twist by ζ ↦ ζ^{q^i}; an element is invariant under the closed subgroup topologically generated by Frobenius iff it is killed by q^i − 1; μ_{ℓ^∞}[q^i − 1] is cyclic of order (q^i − 1)_ℓ.
4. This agrees with the exponent criterion of ArithmeticKTheory N.4 (K-book Lemma VI.2.2.1): Gal(L(ζ_{ℓ^ν})/L) is generated by Frobenius, acting as q, and has exponent dividing i iff ℓ^ν | q^i − 1.

**Acceptance.**

- L = Q_5, ℓ = 2: w_1^{(2)} = 4, w_2^{(2)} = 8, w_3^{(2)} = 4 (124 = 4·31).
- L = Q_7, ℓ = 2: w_1^{(2)} = 2, w_2^{(2)} = 16 (48 = 16·3); ℓ = 3: w_1^{(3)} = 3, w_2^{(3)} = 3.
- For ℓ = p the formula fails: w_1^{(p)}(Q_p(ζ_p)) = p although (q − 1)_p = 1.

**Depends on.** other roadmaps: `ArithmeticKTheory:N.4/the-w-invariant`; libraries: `tauceti:TauCeti.rootsOfUnityEquivResidueField`, `tauceti:TauCeti.henselianLocalRing_integer`, `mathlib:IsNonarchimedeanLocalField`.

**Sources.**

- `Kbook.2013`, Example VI.2.3.1 (PDF p. 479): “Let E be a local field, finite over Q_p and with residue field F_q. Then w_i(E) is w_i(F_q) = q^i − 1 times a power of p.” — The statement for p-adic fields.
- `Kbook.2013`, Example VI.2.3.1 (PDF p. 479): “using the observation that (for ℓ ≠ p) the number of ℓ-primary roots of unity in E(ζ_ℓ) is the same as in F_q(ζ_ℓ).” — The reason.
- `Weibel.Handbook.I5`, Definition 12 (p. 147): “Fix a prime ℓ. For any field F, define integers w^{(ℓ)}_i(F) by” — The definition by exponents of cyclotomic Galois groups.

### The ℓ-torsion in the odd K-groups of the separable closure of a local field

`L.2/separable-closure-l-torsion` · theorem

Let L be a nonarchimedean local field with residue field F_q of characteristic p, L^sep a separable closure with residue field \bar F_q, G_L = Gal(L^sep/L), ℓ ≠ p and i ≥ 1. Then reduction along the integers of the finite subextensions induces an isomorphism K_{2i−1}(L^sep){ℓ} ≅ K_{2i−1}(\bar F_q){ℓ} ≅ Q_ℓ/Z_ℓ, equivariant for G_L acting on \bar F_q through the residue map; consequently K_{2i−1}(L^sep){ℓ} ≅ Z/ℓ^∞(i) as G_L-modules, and every isomorphism of abelian groups between them is G_L-equivariant.

**Hypotheses.**

- L nonarchimedean local field; ℓ ≠ p; i ≥ 1.

**Proof.**

1. K-theory commutes with filtered colimits (GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories), and so does ℓ-power torsion: K_{2i−1}(L^sep){ℓ} = colim_{L′} K_{2i−1}(L′){ℓ} over finite subextensions L′.
2. Each L′ is a local field whose integers O′ are a henselian DVR with finite residue field k′ (LocalFieldsRamification Layer 0; TauCeti.henselianLocalRing_integer). For i ≥ 2, K_{2i−1}(L′){ℓ} ≅ K_{2i−1}(O′){ℓ} ≅ K_{2i−1}(k′){ℓ} (L.2/odd-k-ring-of-integers-equals-field, L.2/odd-k-l-torsion); for i = 1 both are μ_{ℓ^∞}.
3. Naturality: for L′ ⊂ L″ the square with O′ → O″ and k′ → k″ commutes, so the isomorphisms pass to the colimit; the k′ exhaust \bar F_q (unramified extensions of every degree, LocalFieldsRamification Layer 2), giving colim K_{2i−1}(k′){ℓ} = K_{2i−1}(\bar F_q){ℓ} ≅ Q_ℓ/Z_ℓ (L.1/algebraic-closure-k-groups).
4. Equivariance: σ ∈ G_L carries O′ to O_{σL′} and covers the residue automorphism σ̄.
5. Galois module: K_{2i−1}(\bar F_q){ℓ} ≅ Z/ℓ^∞(i) for Gal(\bar F_q/F_q) (L.1/algebraic-closure-k-groups), and μ_{ℓ^∞}(L^sep) ≅ μ_{ℓ^∞}(\bar F_q) G_L-equivariantly (L.2/w-invariant-local-field). Both sides are Q_ℓ/Z_ℓ with G_L acting through the same character into Z_ℓ^×, and every group endomorphism of Q_ℓ/Z_ℓ is Z_ℓ-linear.

**Acceptance.**

- L = Q_p, i = 1: K_1(L^sep){ℓ} = μ_{ℓ^∞}(\bar Q_p), and Frobenius acts by ζ ↦ ζ^p.
- This is the ℓ ≠ p case of Suslin's K-book Proposition VI.1.7.1 for \bar Q_p; the proof here uses only rigidity and Quillen's computation, not Suslin's rigidity for algebraically closed fields.

**Depends on.** this roadmap: `L.2/odd-k-ring-of-integers-equals-field`, `L.2/odd-k-l-torsion`, `L.2/w-invariant-local-field`, `L.1/algebraic-closure-k-groups`; other roadmaps: `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`; libraries: `tauceti:TauCeti.henselianLocalRing_integer`, `mathlib:IsNonarchimedeanLocalField`.

**Sources.**

- `Kbook.2013`, Proposition VI.1.7.1 (PDF p. 476): “Proposition 1.7.1. If F is algebraically closed and i > 0, the torsion submodule of K_{2i−1}(F) is isomorphic to µ(i) as an Aut(F)-module.” — The general statement whose ℓ ≠ p part for \bar L is proved here.
- `Kbook.2013`, Exercise VI.1.3 (PDF p. 477): “and that K_{2i−1}(E)_tors → K_{2i−1}(Q̄_p) is an injection modulo p-torsion.” — The injectivity used in the next node.

### The e-invariant of a local field away from p

`L.2/e-invariant-local-field` · theorem · planet “e-invariant of a local field”

Let L be a nonarchimedean local field with residue field F_q of characteristic p, ℓ ≠ p and i ≥ 1. Then K_{2i−1}(L){ℓ} → (K_{2i−1}(L^sep){ℓ})^{G_L} is an isomorphism, both groups being cyclic of order w_i^{(ℓ)}(L) = (q^i − 1)_ℓ. Composed with any G_L-isomorphism K_{2i−1}(L^sep){ℓ} ≅ Z/ℓ^∞(i) (for instance the one used in ArithmeticKTheory N.5's e-invariant), it gives K_{2i−1}(L){ℓ} ≅ W_i^{(ℓ)}(L): the ℓ-primary e-invariant of L is an isomorphism for every ℓ ≠ p. The prime-to-p torsion of K_{2i−1}(L) is Z/(q^i − 1), and the torsion subgroup of K_{2i−1}(L) is Z/(q^i − 1) ⊕ (a p-group).

**Hypotheses.**

- L nonarchimedean local field; ℓ ≠ p; i ≥ 1.

**Proof.**

1. Reduction identifies K_{2i−1}(L){ℓ} with K_{2i−1}(F_q){ℓ} (L.2/local-field-prime-to-p) and K_{2i−1}(L^sep){ℓ} with K_{2i−1}(\bar F_q){ℓ} (L.2/separable-closure-l-torsion), compatibly with L → L^sep and F_q → \bar F_q.
2. G_L acts on K_{2i−1}(\bar F_q){ℓ} through its image Gal(\bar F_q/F_q) (surjective), so the invariants are K_{2i−1}(\bar F_q){ℓ}^{Gal(\bar F_q/F_q)} = K_{2i−1}(F_q){ℓ} (L.1/algebraic-closure-k-groups).
3. Hence the map is the identity of K_{2i−1}(F_q){ℓ} under these identifications, and its order is (q^i − 1)_ℓ = w_i^{(ℓ)}(L) (L.2/w-invariant-local-field).
4. Any G_L-isomorphism K_{2i−1}(L^sep){ℓ} ≅ Z/ℓ^∞(i) induces an isomorphism on invariants with W_i^{(ℓ)}(L); this is how ArithmeticKTheory N.5 uses it (Harris–Segal proof, K-book Theorem VI.2.5).
5. Torsion: the prime-to-p torsion is the product of the ℓ-parts; the rest of the torsion is p-primary.

**Acceptance.**

- L = Q_p(ζ_m) with p ≢ 1 mod ℓ^{a+1} as in the Harris–Segal proof: w_i^{(ℓ)}(L) = w_i^{(ℓ)}(F_q) and e is an isomorphism on ℓ-parts.
- L = Q_5, i = 2, ℓ = 3: K_3(Q_5){3} ≅ Z/3 ≅ W_2^{(3)}(Q_5) (24 = 8·3).
- For ℓ = p the statement is false in general and belongs to L.6: K_3(Q_p) has p-torsion Z/w_2^{(p)}(Q_p) detected differently (K-book Proposition VI.7.3).

**Depends on.** this roadmap: `L.2/local-field-prime-to-p`, `L.2/separable-closure-l-torsion`, `L.2/w-invariant-local-field`, `L.1/algebraic-closure-k-groups`; other roadmaps: `ArithmeticKTheory:N.4/the-w-invariant`.

**Sources.**

- `Kbook.2013`, Exercise VI.1.3 (PDF p. 477): “Let E be a local field, finite over Q_p and with residue field F_q. Use Theorem 1.6 and the proof of 1.5.1 to show that K_{2i−1}(E)_tors is the direct sum of Z/(q^i − 1) and a p-group” — The torsion statement.
- `Kbook.2013`, Example VI.2.3.1 (PDF pp. 479–480): “the map K_{2i−1}(E)_tors −e→ Z/w_i(E) is a surjection up to p-torsion, and induces an isomorphism on ℓ-primary torsion subgroups K_{2i−1}(E){ℓ} ≅ Z/w^{(ℓ)}_i for ℓ ≠ p.” — The e-invariant statement.
- `Kbook.2013`, Definition VI.2.1 (PDF p. 477): “Since K_*(F) → K_*(F̄) is a homomorphism of G-modules, with G acting trivially on K_n(F), it follows that there is a natural map” — The map whose ℓ-part is shown bijective.

## L.3 — Integral K₂ of local fields

*Coverage: partial.* Every target of the stage text has a node. The map K₂(E) → μ(E) from local symbols is L.3/norm-residue-map, built on K2SymbolsBrauer T.7/classical-local-symbols at the canonical exponent w = #μ(E) (the symbols themselves, the quadratic Hilbert symbol and the local comparison are T.7's and are imported, not re-planned; T.7/classical-local-symbols records the split surjectivity and Moore's theorem as L.3's, as checked). The full collection of Hilbert-symbol components is L.3/norm-residue-power-compatibility and L.3/hilbert-symbol-components, with the tame components L.3/tame-component. The structure theorem is L.3/moore-theorem, assembled prime by prime (L.3/moore-kernel-prime-to-p from L.2, L.3/k2-no-p-torsion-char-p and L.3/k2-p-divisible-equal-characteristic in characteristic p, L.3/moore-kernel-p-divisible-mixed-characteristic and the cited L.3/merkurjev-p-torsion-free in characteristic 0, L.3/moore-kernel-uncountable). The canonical short exact sequence is L.3/moore-kernel, kept separate from the splittings of L.3/norm-residue-split-surjective, which are choices until torsion-freeness makes the torsion subgroup a canonical complement. The residue-characteristic and characteristic-zero variants, with the roots-of-unity term written out, are L.3/moore-equal-characteristic and L.3/moore-mixed-characteristic (the latter corrects K-book VI.7, see sourceIssues). The ring-of-integers subgroup and the tame-symbol quotient are L.3/local-k2-localisation-sequence and L.3/ring-of-integers-subgroup. Consistency with the local norm-residue map is L.3/norm-residue-local-reciprocity (with T.7/local-comparison for the cohomological side) and with the residue-field unit group is L.3/tame-component at d = q − 1. The consumers' needs are supplied: ArithmeticKTheory N.6 (Moore's theorem, and the kernel of K₂(F) → K₂(F_v) through L.7/hilbert-symbol-completion) and HigherLocalFieldsAndHigherClassFieldTheory HL.1 and HL.4 (the n = 1 symbols with their Hilbert-symbol components and tame part, and K₂(E)/⋂ mK₂(E) ≅ μ(E)). The localisation splitting u ↦ {ω(u), π} is L.2/even-k-field-splitting (author A), used here rather than re-planned.

- Remaining: Merkurjev's theorem (no p-torsion in U(E) for char E = 0) is cited, not decomposed: no public source of its proof was read (gap).
- Remaining: Hilbert's Theorem 90 for K₂ in the Artin–Schreier case, used by L.3/k2-no-p-torsion-char-p, is cited to Merkurjev–Suslin (gap; the K-book's own treatment is circular).
- Remaining: The general-d tame formula of L.3/tame-component is proved here by the classical local class field theory computation; the only source statement read is the case d = 2 over ℚ_p (Exercise III.6.7), so the formula should be checked against Serre, Local Fields XIV §3 (gap).
- Remaining: Moore's own proof of the divisibility was not read; the p-part in characteristic 0 is proved through the degree-two norm residue theorem and local duality instead (gap).
- Remaining: Requests to MotivicEtaleKTheory M.5, KTheoryLowDegrees U.3 and the upstream layers LocalFieldsRamification Layer 1 and ClassFieldTheory Layers 5 and 6 must be answered.

### The norm residue map K₂(E) → μ(E)

`L.3/norm-residue-map` · construction · planet “Norm residue map K₂(E) → μ(E)”

Conventions (pinned for the layer): E is a nonarchimedean local field in Mathlib's sense (IsNonarchimedeanLocalField with its ValuativeRel), 𝒪 = 𝒪[E] its valuation ring, 𝔪 its maximal ideal, k = 𝓀[E] its residue field with q elements, p = char k, v the normalised valuation (Tau Ceti's normalizedValuation) and π a uniformiser. μ(E) is the torsion subgroup of E^×, finite cyclic of order w = w(E) = (q − 1)·p^a with a ≥ 0 and a = 0 when char E = p; μ(E) = μ_{q−1}(E) × μ_{p^∞}(E), the first factor being the image of the Teichmüller lift ω : k^× → 𝒪^×. K_2(E) is Matsumoto's group (K2SymbolsBrauer T.2/matsumoto), identified with Quillen's K_2 by T.1/k2-pi2, written additively with symbols {a, b}. For d ≥ 1 with μ_d ⊆ E, (x, y)_{E,d} ∈ μ_d is K2SymbolsBrauer T.7's d-th power norm residue symbol, (x, y)_{E,d} = rec_E(x)(η)/η for η^d = y, where rec_E is local reciprocity with the arithmetic-Frobenius normalisation of ClassFieldTheory Layer 6. ∂_v is K2SymbolsBrauer T.3's tame symbol in the roadmap normalisation, ∂_v{f, g} = (−1)^{v(f)v(g)}·ū_f^{v(g)}·ū_g^{−v(f)}, so ∂_v{u, π} = ū; the K-book's tame symbol is ∂^{Kb}_v = ∂_v^{−1}. Definition: h_E : K_2(E) → μ(E) is the w-th power norm residue homomorphism of K2SymbolsBrauer T.7/classical-local-symbols at the canonical exponent m = w = #μ(E): h_E{a, b} = (a, b)_{E,w}. It is well defined because μ_w(E) = μ(E) (every root of unity of E has order dividing w) and w is invertible in E (in characteristic p, x^{p^k} − 1 = (x − 1)^{p^k}, so μ(E) has no p-torsion and w = q − 1 ≡ −1 mod p). No primitive root of unity is chosen: the target is the group μ(E) itself. For d | w the d-th power symbol is h_E followed by ζ ↦ ζ^{w/d} (L.3/norm-residue-power-compatibility); these are the Hilbert-symbol components of h_E (L.3/hilbert-symbol-components).

**Hypotheses.**

- E is a nonarchimedean local field (either characteristic).
- Local reciprocity is ClassFieldTheory Layer 6's, with arithmetic-Frobenius normalisation; the symbol inherits that normalisation and the variable order x ↦ (x, −) of K-book Example III.6.2.3.

**Proof.**

1. μ(E) is finite of order w = (q − 1)·p^a, with prime-to-p part μ_{q−1}(E) (the image of the Teichmüller lift, Tau Ceti's rootsOfUnityFieldEquivResidueFieldUnits) and p-part μ_{p^∞}(E): LocalFieldsRamification Layer 1 ('finiteness of μ(K) and its order; the p-part and the prime-to-p part of μ(K)'). It is cyclic, being a finite subgroup of the units of a field (Mathlib's rootsOfUnity.isCyclic for rootsOfUnity w E).
2. w is invertible in E: trivial in characteristic 0; in characteristic p the group μ(E) has no element of order p, so w = q − 1, which is a unit of 𝒪 (Tau Ceti's isUnit_natCard_residueField_sub_one).
3. Apply T.7/classical-local-symbols with m = w, for which μ_w ⊆ E holds (indeed μ(E) = μ_w(E)): (−, −)_{E,w} is bimultiplicative with values in μ_w(E) = μ(E), satisfies (a, 1 − a)_{E,w} = 1, and descends to K_2(E) by Matsumoto's theorem (T.2/matsumoto).
4. Record the value on symbols, h_E{a, b} = (a, b)_{E,w}, and the vanishing h_E{a, c^w} = 1 (bimultiplicativity).

**API.**

- `normResidueMap` (constructor): For a nonarchimedean local field E, the homomorphism K_2(E) →+ Additive μ(E), {a, b} ↦ (a, b)_{E,w} with w = Nat.card μ(E).
- `normResidueMap_symbol` (simp): normResidueMap E {a, b} = (a, b)_{E,w}.
- `normResidueMap_symbol_pow_right` (simp): normResidueMap E {a, c^w} = 1, and normResidueMap E {a, 1 − a} = 1.
- `normResidueMap_surjective` (characterisation): normResidueMap E is surjective (node L.3/norm-residue-split-surjective).
- `normResidueMap_pow_eq` (relation): For d | w: (normResidueMap E x)^{w/d} = the d-th power symbol of x (node L.3/norm-residue-power-compatibility).
- `normResidueMap_tame` (compatibility): For d | q − 1: (normResidueMap E x)^{w/d} = ω(∂_v x)^{−(q−1)/d} (node L.3/tame-component).
- `normResidueMap_two` (compatibility): If char E ≠ 2 then (normResidueMap E x)^{w/2} = hilbertK2 x, the quadratic Hilbert symbol of T.7/hilbert-symbol-steinberg.
- `normResidueMap_eq_one_iff_norm` (characterisation): normResidueMap E {x, y} = 1 ↔ x is a norm from E(η), η^w = y (node L.3/norm-residue-local-reciprocity).
- `mooreKernel` (data): ker (normResidueMap E) (node L.3/moore-kernel).
- `normResidueMap_localSymbol` (compatibility): For a named primitive w-th root ζ ∈ E, normResidueMap E {a, b} = ζ^{ε·w·inv_E(β_ζ{a, b})} (T.7/local-comparison, with its fixed sign ε).

**Unit tests.**

- `normResidueMap_Q2` (computation): E = ℚ₂, w = 2: normResidueMap {−1, −1} = −1, and normResidueMap {−1, 5} = 1 (the conic −x² + 5y² = 1 has the solution x = 2, y = 1).
- `normResidueMap_Q5` (computation): E = ℚ₅, w = 4: normResidueMap {5, 2} = ω(2), the fourth root of unity ≡ 2 mod 5, and normResidueMap {2, 5} = ω(3) = ω(2)^{−1}; a direct Frobenius computation gives σ₅(2^{1/4})/2^{1/4} ≡ 2^{(5−1)/4} = 2 mod 5.
- `normResidueMap_laurent` (computation): E = 𝔽_p((t)), w = p − 1: normResidueMap {t, a} = a and normResidueMap {a, t} = a^{−1} for a ∈ 𝔽_p^×, the Teichmüller lift being the inclusion 𝔽_p^× ⊂ 𝔽_p((t)).
- `normResidueMap_degenerate` (degenerate): normResidueMap {a, 1 − a} = 1, normResidueMap {1, b} = 1 and normResidueMap {a, c^w} = 1; for E = 𝔽₂((t)) one has w = 1 and normResidueMap = 0.
- `normResidueMap_not_tame` (non-example): E = ℚ₂: both entries of {−1, −1} are units, so its tame symbol is 1, but normResidueMap {−1, −1} = −1; a definition through the Teichmüller lift of the tame symbol alone fails whenever p | w.
- `normResidueMap_hilbert_Q3` (compatibility): E = ℚ₃ (w = 2): normResidueMap {3, −1} = c_{ℚ₃}(3, −1) = −1, the Hilbert symbol of T.7/hilbert-symbol-steinberg; ℚ₃(√−1) is unramified, so 3 is not a norm from it.

**Acceptance.**

- h_{ℚ₂}{−1, −1} = −1 (w(ℚ₂) = 2; K-book Example III.6.2.5).
- h_E{a, b} = 1 whenever b ∈ (E^×)^w, and h_E{a, 1 − a} = 1.
- The target is μ(E); no statement identifies it with ℤ/w without naming a generator.

**Used by.**

- L.3/moore-kernel and L.3/moore-theorem: the uniquely divisible part of K_2(E) is the kernel of h_E, and h_E identifies the torsion with μ(E)
- ArithmeticKTheory N.6/tame-and-wild-kernels: the wild kernel in degree two is the kernel of the Hilbert symbols h_{F_v} ∘ c_v (through L.7/hilbert-symbol-completion)
- HigherLocalFieldsAndHigherClassFieldTheory HL.4/higher-tame-symbol: the n = 1 case of the explicit symbols: h_E with its Hilbert-symbol components and its tame part
- HigherLocalFieldsAndHigherClassFieldTheory HL.1/topological-versus-algebraic-k-groups: K_2(E)/U(E) ≅ μ(E) is the topological K_2 of a one-dimensional local field
- L.7/hilbert-symbol-completion: the local symbols of a number field at its finite places are h_{F_v} evaluated on completed classes

**Depends on.** other roadmaps: `K2SymbolsBrauer:T.7/classical-local-symbols`, `K2SymbolsBrauer:T.2/matsumoto`, `K2SymbolsBrauer:T.1/k2-pi2`; libraries: `mathlib:IsNonarchimedeanLocalField`, `mathlib:CommGroup.torsion`, `mathlib:rootsOfUnity`, `mathlib:rootsOfUnity.isCyclic`, `tauceti:TauCeti.isUnit_natCard_residueField_sub_one`, `tauceti:TauCeti.rootsOfUnityFieldEquivResidueFieldUnits`.

**Sources.**

- `Kbook.2013`, Example III.6.2.3 (PDF p. 241; book p. 233): “The roots of unity in a local field F form a finite cyclic group µ, equal to the group µm of all mth roots of unity for some integer m with 1/m ∈ F. The classical mth power norm residue symbol is a map K2(F) → µm defined as follows” — The map K_2(E) → μ(E) at the exponent m = #μ(E), from the local norm residue symbol; '1/m ∈ F' is the invertibility of w.
- `Weibel.Handbook.I5`, §5.6, before Theorem 57 (p. 163 of the Handbook; PDF p. 25): “For K2, there is a norm residue symbol K2(E) → µ(E) and we have the following result” — The same map with target μ(E), as used in Moore's theorem.

### Changing the exponent of the norm residue symbol

`L.3/norm-residue-power-compatibility` · lemma

Let F be a nonarchimedean local field, m ≥ 1 invertible in F with μ_m ⊆ F, and d | m. Then (x, y)_{F,d} = ((x, y)_{F,m})^{m/d} for all x, y ∈ F^×; on K_2(F) the d-th power symbol is the m-th power symbol followed by μ_m → μ_d, ζ ↦ ζ^{m/d}. For F = E and m = w this gives (−, −)_{E,d} = h_E^{w/d} for every d | w.

**Hypotheses.**

- F is a nonarchimedean local field; μ_m ⊆ F and m is invertible in F; d | m.
- The symbols are T.7's, both defined with the same reciprocity map rec_F.

**Proof.**

1. Choose η in a separable closure with η^m = y; then η^{m/d} is a d-th root of y.
2. By T.7's characterisation (normResidueSymbol_apply), (x, y)_{F,d} = rec_F(x)(η^{m/d})/η^{m/d} and (x, y)_{F,m} = rec_F(x)(η)/η.
3. rec_F(x) is a field automorphism, so rec_F(x)(η^{m/d})/η^{m/d} = (rec_F(x)(η)/η)^{m/d}; the reciprocity element rec_F(x) does not depend on the exponent.
4. Both sides are homomorphisms out of K_2(F) agreeing on symbols, so they agree on K_2(F) (T.2/matsumoto).

**Acceptance.**

- ℚ₅ with m = 4, d = 2: (5, 2)_{ℚ₅,2} = ω(2)² = −1, the Legendre symbol (2/5).
- d = 1 gives the trivial symbol; d = m gives the identity.
- The formula uses the power map μ_m → μ_d, not a projection onto a direct factor (compare L.3/hilbert-symbol-components).

**Depends on.** other roadmaps: `K2SymbolsBrauer:T.7/classical-local-symbols`, `K2SymbolsBrauer:T.2/matsumoto`.

**Sources.**

- `Kbook.2013`, Example III.6.2.3 (PDF p. 241): “The Galois group GF = Gal(K/F) is canonically isomorphic to Hom(F×, µm), with the automorphism g of K corresponding to the homomorphism ζ : F× → µm sending a ∈ F× to ζ(a) = g(x)/x, where x^m = a.” — The Kummer description g(x)/x with x^m = a, from which the exponent change is the computation (g(x)/x)^{m/d} = g(x^{m/d})/x^{m/d}.
- `Milne.CFT.2020`, Chapter III, Remark 4.5 (PDF p. 123; notes p. 114): “The Hilbert symbol is related to the local Artin map by the formula φK(b)(a^{1/n}) = (a, b)a^{1/n}.” — The same characterisation through the Artin map; Milne's (a, b) is T.7's (b, a).

### The Hilbert-symbol components of the norm residue map

`L.3/hilbert-symbol-components` · theorem

With the conventions of L.3/norm-residue-map, write w = ∏_ℓ ℓ^{a_ℓ}. (i) μ(E) = ∏_ℓ μ_{ℓ^{a_ℓ}}(E), and h_E = ∏_ℓ π_ℓ ∘ h_E for the projections π_ℓ. (ii) π_ℓ ∘ h_E = ((−, −)_{E,ℓ^{a_ℓ}})^{u_ℓ}, where u_ℓ·(w/ℓ^{a_ℓ}) ≡ 1 mod ℓ^{a_ℓ}; so h_E and the family of Hilbert symbols ((−, −)_{E,d})_{d | w} determine each other. (iii) For ℓ ≠ p the ℓ-primary symbol is tame: (−, −)_{E,ℓ^{a_ℓ}} = (ω ∘ ∂_v)^{−(q−1)/ℓ^{a_ℓ}} (L.3/tame-component). (iv) An ℓ = p component exists exactly when char E = 0 and μ_p ⊆ E (a ≥ 1); it is not a function of the tame symbol: it is non-trivial on the tame kernel for ℚ₂. (v) If char E ≠ 2 then 2 | w and (−, −)_{E,2} = h_E^{w/2} is the quadratic Hilbert symbol c_E of T.7/hilbert-symbol-steinberg; if char E = 2 there is no quadratic component (w = q − 1 is odd). Warning: π_ℓ ∘ h_E is not (−, −)_{E,ℓ^{a_ℓ}} in general: for E = ℚ₂(ζ₃) (q = 4, w = 6) one has π₃ ∘ h_E = ((−, −)_{E,3})² = ((−, −)_{E,3})^{−1}.

**Hypotheses.**

- E is a nonarchimedean local field; the conventions of L.3/norm-residue-map.

**Proof.**

1. Primary decomposition of the finite cyclic group μ(E) (Chinese remainder theorem).
2. For ζ ∈ μ(E) with components ζ_ℓ, ζ^{w/ℓ^{a_ℓ}} = ζ_ℓ^{w/ℓ^{a_ℓ}}, the other components having order dividing w/ℓ^{a_ℓ}; with L.3/norm-residue-power-compatibility this gives (x)_{E,ℓ^{a_ℓ}} = (π_ℓ h_E(x))^{w/ℓ^{a_ℓ}} and hence (ii).
3. (iii) is L.3/tame-component with d = ℓ^{a_ℓ}, which divides q − 1 for ℓ ≠ p.
4. (iv): in characteristic p there are no non-trivial p-power roots of unity; for ℚ₂ the element {−1, −1} has trivial tame symbol and h = −1 (K-book Example III.6.2.5).
5. (v): for d = 2, T.7's normResidueSymbol_two identifies the square symbol with the conic Hilbert symbol.

**Acceptance.**

- E = ℚ_p, p odd: w = p − 1, every component is tame, and the quadratic Hilbert symbol is h^{(p−1)/2} = ε ∘ ∂^{Kb}_v, recovering K-book Exercise III.6.7.
- E = ℚ₂: w = 2 and h_E = c_{ℚ₂} is purely wild (q − 1 = 1).
- E = ℚ₃(ζ₃): w = 6, the 2-component is tame (q − 1 = 2) and the 3-component wild.
- E = ℚ₂(ζ₃): π₃ ∘ h_E{a, b} = ω(∂_v{a, b}) while (a, b)_{E,3} = ω(∂_v{a, b})^{−1}.

**Depends on.** this roadmap: `L.3/norm-residue-map`, `L.3/norm-residue-power-compatibility`, `L.3/tame-component`; other roadmaps: `K2SymbolsBrauer:T.7/hilbert-symbol-steinberg`, `K2SymbolsBrauer:T.7/classical-local-symbols`.

**Sources.**

- `Kbook.2013`, Exercise III.6.7 (PDF p. 252; book p. 244): “Let ((r, s))p denote the Hilbert symbol on Q̂p (6.2.2), and (r, s)p the tame symbol K2(Q̂p) → F×p. Assume that p is odd, so that there is a unique surjection ε: F×p → {±1}. Show that ((r, s))p = ε((r, s)p) for all r, s ∈ Q̂×p.” — The quadratic component over ℚ_p, p odd, as a function of the tame symbol: the case d = 2 of (iii) and (v).
- `Kbook.2013`, Example III.6.2.5 (PDF p. 242): “The group K2(Q̂2) is the direct sum of the cyclic group of order 2 generated by {−1, −1} and a uniquely divisible group.” — The wild component at p = 2, detected on {−1, −1}, a symbol of two units.
- `Weibel.Handbook.I5`, §5.6 (p. 163; PDF p. 25): “The group µ(E) of roots of unity in E (or V) is identified with (F∗q) × µp∞(E), where the first factor arises from Teichmüller’s theorem that V× → F×q = Z/(q−1) has a unique splitting” — The decomposition of μ(E) into its tame and wild parts.

### The tame components of the norm residue symbol and the residue-field unit group

`L.3/tame-component` · comparison

With the conventions of L.3/norm-residue-map, let d | q − 1 (so μ_d ⊆ μ_{q−1}(E) = ω(k^×)). For all a, b ∈ E^×, (a, b)_{E,d} = ω(∂_v{a, b})^{−(q−1)/d} = ω(∂^{Kb}_v(a, b))^{(q−1)/d}. On K_2(E) the d-th power symbol is (ω ∘ ∂_v)^{−(q−1)/d}. For d = q − 1: the (q − 1)-st power symbol h_E^{p^a}, followed by the reduction μ_{q−1}(E) ≅ k^× (inverse of ω), is ∂^{Kb}_v = ∂_v^{−1}; this is the consistency of the norm residue map with the residue-field unit group. In characteristic p (w = q − 1): h_E = ω ∘ ∂^{Kb}_v.

**Hypotheses.**

- E is a nonarchimedean local field, d | q − 1.
- Local reciprocity is normalised so that a uniformiser acts on unramified extensions as arithmetic Frobenius (ClassFieldTheory Layer 6); with the geometric normalisation every exponent changes sign.
- The general-d formula is not in a source read (see gaps); the proof below is the classical computation.

**Proof.**

1. Units: for u, u′ ∈ 𝒪^×, E(u′^{1/d})/E is unramified (X^d − u′ is separable modulo 𝔪, d being prime to p), and rec_E(u) is trivial on unramified extensions; so (u, u′)_{E,d} = 1 by T.7's characterisation.
2. (π, u)_{E,d}: for η^d = u, rec_E(π) acts on the unramified extension E(η) as arithmetic Frobenius, so rec_E(π)(η) ≡ η^q mod 𝔪 and (π, u)_{E,d} ≡ η^{q−1} = u^{(q−1)/d}; the value lies in μ_d ⊆ ω(k^×), and a (q − 1)-torsion unit is the Teichmüller lift of its residue (Tau Ceti's eq_teichmuller), so (π, u)_{E,d} = ω(ū)^{(q−1)/d}.
3. Skew-symmetry of Steinberg symbols (T.2/symbol-consequences) gives (u, π)_{E,d} = ω(ū)^{−(q−1)/d}, and {π, π} = {π, −1} gives (π, π)_{E,d} = ω(−1)^{(q−1)/d}.
4. Bimultiplicativity and E^× = π^ℤ·𝒪^× (Tau Ceti's exists_eq_mul_zpow_of_irreducible) reduce the general pair to these; compare with T.3's values ∂_v{π, u} = ū^{−1}, ∂_v{u, π} = ū, ∂_v{π, π} = −1 and ∂_v{u, u′} = 1 (T.3/tame-symbol, T.3/tame-symbol-uniformizer-independence).
5. d = q − 1: h_E^{p^a} = (−, −)_{E,q−1} (L.3/norm-residue-power-compatibility), and ω^{−1} ∘ ω(∂_v)^{−1} = ∂_v^{−1}.
6. d = 2 over ℚ_p recovers K-book Exercise III.6.7, the sign being invisible there.

**Acceptance.**

- ℚ₅, d = 4: ∂_v{5, 2} = 3, so (5, 2)_{ℚ₅,4} = ω(3)^{−1} = ω(2); directly rec(5)(2^{1/4})/2^{1/4} ≡ 2^{(5−1)/4} = 2 mod 5. With the opposite sign one would get ω(3), which the direct computation refutes.
- ℚ₇, d = 3: ∂_v{7, 2} = 2^{−1} = 4, so (7, 2)_{ℚ₇,3} = ω(4)^{−2} = ω(4), and directly 2^{(7−1)/3} = 4 mod 7.
- ℚ₅, d = 2: (5, 2)_{ℚ₅,2} = ω(3)^{−2} = −1 = (2/5).
- 𝔽_p((t)): h_E{t, a} = ω(ā) = a for a ∈ 𝔽_p^×.

**Depends on.** this roadmap: `L.3/norm-residue-power-compatibility`; other roadmaps: `K2SymbolsBrauer:T.7/classical-local-symbols`, `K2SymbolsBrauer:T.3/tame-symbol`, `K2SymbolsBrauer:T.3/tame-symbol-uniformizer-independence`, `K2SymbolsBrauer:T.2/symbol-consequences`; libraries: `tauceti:TauCeti.teichmuller`, `tauceti:TauCeti.eq_teichmuller`, `tauceti:TauCeti.residue_teichmuller`, `tauceti:TauCeti.exists_eq_mul_zpow_of_irreducible`.

**Sources.**

- `Kbook.2013`, Exercise III.6.7 (PDF p. 252): “Assume that p is odd, so that there is a unique surjection ε: F×p → {±1}. Show that ((r, s))p = ε((r, s)p) for all r, s ∈ Q̂×p.” — The case d = 2, E = ℚ_p of the formula; the general d is the classical computation recorded as a gap.
- `Kbook.2013`, Lemma III.6.3 (PDF p. 242): “The tame symbol is onto, because if u ∈ R× then v(u) = 0 and ∂v(π, u) = ū.” — The K-book's tame symbol ∂^{Kb}, with ∂^{Kb}(π, u) = ū, the inverse of the roadmap's; the formula is (ω ∘ ∂^{Kb})^{(q−1)/d}.

### The norm residue symbol against local reciprocity

`L.3/norm-residue-local-reciprocity` · lemma

With the conventions of L.3/norm-residue-map, let d | w, x, y ∈ E^× and η^d = y. Then (x, y)_{E,d} = 1 if and only if x ∈ N_{E(η)/E}(E(η)^×). So for fixed y the group {x : (x, y)_{E,d} = 1} is the norm group of the Kummer extension E(η)/E, of index [E(η) : E], the order of y in E^×/E^{×d}; and h_E{x, y} = 1 if and only if x is a norm from E(y^{1/w}). This is the consistency of h_E with the local norm-residue (reciprocity) map. For d = 2: (x, y)_{E,2} = 1 iff x = a² − y b² for some a, b ∈ E (the conic criterion of T.7/hilbert-symbol-steinberg).

**Hypotheses.**

- E is a nonarchimedean local field; d | w, so μ_d ⊆ E and E(η)/E is an abelian Kummer extension.

**Proof.**

1. (x, y)_{E,d} = rec_E(x)(η)/η (T.7's characterisation), which is 1 exactly when rec_E(x) fixes η, i.e. when rec_E(x) restricts to the identity on E(η).
2. Local reciprocity for the finite abelian extension E(η)/E (ClassFieldTheory Layer 6): rec induces E^×/N_{E(η)/E}E(η)^× ≅ Gal(E(η)/E), so rec_E(x)|_{E(η)} = 1 iff x ∈ N_{E(η)/E}E(η)^×.
3. The index is #Gal(E(η)/E) = [E(η) : E], which by Kummer theory is the order of y in E^×/E^{×d}.
4. For d = w apply it to h_E{x, y} = (x, y)_{E,w}.

**Acceptance.**

- ℚ₃, d = 2, y = −1: ℚ₃(i) is unramified, its norms are the elements of even valuation, so (3, −1)_{ℚ₃,2} = −1 and (u, −1)_{ℚ₃,2} = 1 for units u.
- ℚ₂: −1 is not a norm from ℚ₂(i), since x² + y² = −1 has no solution in ℚ₂, so (−1, −1)_{ℚ₂,2} = −1.
- The variable order: x is the argument of rec, y the Kummer variable; Milne's (a, b) is this (b, a).

**Depends on.** this roadmap: `L.3/norm-residue-map`; other roadmaps: `K2SymbolsBrauer:T.7/classical-local-symbols`.

**Sources.**

- `Milne.CFT.2020`, Chapter III, Theorem 4.4(d) (PDF p. 122; notes p. 113): “(d) (a, b) = 1 if and only if b is a norm from K[ⁿ√a].” — The norm criterion for one Kummer extension, in Milne's variable order, which is the reverse of T.7's.
- `Kbook.2013`, Example III.6.2.3 (PDF p. 241): “The name “norm residue” comes from the fact that for each x, the map y ↦ {x, y} is trivial if and only if x ∈ NK×.” — The source's norm-residue property, to be read with (x, y)_F in place of {x, y} (K2SymbolsBrauer/E2); the node states the one-extension refinement.

### The norm residue map is a split surjection; sections are choices

`L.3/norm-residue-split-surjective` · theorem

With the conventions of L.3/norm-residue-map: for every generator ζ of μ(E) the homomorphism (ζ, −)_{E,w} : E^× → μ(E) is surjective; for x ∈ E^× with (ζ, x)_{E,w} = ζ the map s_{ζ,x} : μ(E) → K_2(E), ζ^i ↦ i·{ζ, x}, is a well-defined homomorphism with h_E ∘ s_{ζ,x} = id. In particular h_E is surjective. The section s_{ζ,x} depends, as a formula, on the pair (ζ, x); two sections differ by a homomorphism μ(E) → U(E) = ker h_E, and whether that difference vanishes is Moore's theorem with the torsion-freeness of U(E) (L.3/moore-theorem). The source's argument, that (ζ, x) ≠ 1 already gives the inverse ζ^i ↦ {ζ^i, x}, is incomplete (K2SymbolsBrauer/E3); this node uses the corrected argument.

**Hypotheses.**

- E is a nonarchimedean local field; μ(E) is the whole group of roots of unity of E (it is the torsion subgroup of E^×).

**Proof.**

1. Nondegeneracy (T.7: (∀ y, (x, y)_{E,w} = 1) ↔ x ∈ E^{×w}).
2. The image of (ζ, −)_{E,w} is μ_e(E) for some e | w. Then (ζ^e, y) = (ζ, y)^e = 1 for all y, so ζ^e = z^w for some z ∈ E^×; z is a root of unity (z^{w·w} = 1), hence z ∈ μ(E) and z^w = 1, so ζ^e = 1 and w | e: the homomorphism is onto.
3. Choose x with (ζ, x)_{E,w} = ζ. Since w·{ζ, x} = {ζ^w, x} = {1, x} = 0 (bilinearity of the Steinberg symbol, T.2/steinberg-symbol), s_{ζ,x} is well defined, and h_E(i·{ζ, x}) = (ζ, x)^i = ζ^i.
4. Two sections s, s′ satisfy h_E ∘ (s − s′) = 0, so s − s′ takes values in U(E).

**Acceptance.**

- ℚ₂: ζ = −1, x = −1 works, (−1, −1) = −1, so s(−1) = {−1, −1}.
- ℚ₅: ζ = ω(2) (a primitive fourth root of unity), x = 1/5: (ω(2), 1/5)_{ℚ₅,4} = ω(2) by L.3/tame-component, so s(ω(2)^i) = i·{ω(2), 1/5}.
- ℚ₅, non-example to the printed argument: for x₀ with (ω(2), x₀) = ω(2), x = x₀² has (ω(2), x) = −1 ≠ 1, yet ζ^i ↦ {ζ^i, x₀²} sends ζ to an element with h = −1 ≠ ζ; it is not a section.

**Depends on.** this roadmap: `L.3/norm-residue-map`; other roadmaps: `K2SymbolsBrauer:T.7/classical-local-symbols`, `K2SymbolsBrauer:T.2/steinberg-symbol`; libraries: `mathlib:CommGroup.torsion`.

**Sources.**

- `Kbook.2013`, Example III.6.2.3, last paragraph (PDF p. 241): “Since a primitive mth root of unity ζ is not a norm from K, it follows that there is an x ∈ F such that (ζ, x)F ≠ 1. Therefore the norm residue symbol is a split surjection with inverse ζi ↦ {ζi, x}.” — The split surjectivity, proved here with the correction of K2SymbolsBrauer/E3 (the value (ζ, x) must be a generator).
- `Kbook.2013`, Proof of Moore's Theorem III.6.2.4 (PDF p. 242): “Proof. We have seen that the norm residue symbol is a split surjection.” — The split surjection is the first step of Moore's theorem.

### The kernel U(E) of the norm residue map and the canonical sequence

`L.3/moore-kernel` · definition · planet “Kernel of the norm residue map”

With the conventions of L.3/norm-residue-map, U(E) := ker(h_E) ⊆ K_2(E). The sequence 0 → U(E) → K_2(E) →h_E μ(E) → 0 is exact (surjectivity: L.3/norm-residue-split-surjective) and canonical: it involves no uniformiser, no primitive root and no section. A direct-sum decomposition K_2(E) ≅ U(E) ⊕ μ(E) needs a section of h_E, which is a choice (L.3/norm-residue-split-surjective); it becomes canonical only through Moore's theorem with torsion-freeness (L.3/moore-theorem), when K_2(E) = U(E) ⊕ K_2(E)_tors internally. Always w·K_2(E) ⊆ U(E), since μ(E) has exponent w.

**Hypotheses.**

- E is a nonarchimedean local field.

**Proof.**

1. Define U(E) as the kernel of the homomorphism h_E.
2. Exactness on the right is L.3/norm-residue-split-surjective.
3. w·K_2(E) ⊆ U(E): h_E(w·x) = h_E(x)^w = 1.

**API.**

- `mooreKernel` (data): mooreKernel E : AddSubgroup (K_2 E) := ker (normResidueMap E).
- `mem_mooreKernel_iff` (characterisation): x ∈ mooreKernel E ↔ normResidueMap E x = 1.
- `mooreKernel_exact` (structure): The inclusion mooreKernel E → K_2 E and normResidueMap E form a short exact sequence.
- `nsmul_le_mooreKernel` (relation): w • ⊤ ≤ mooreKernel E, for w = Nat.card μ(E).
- `mooreKernel_eq_nsmul` (characterisation): mooreKernel E = w • ⊤ (L.3/moore-theorem).
- `mooreKernel_eq_iInf_nsmul` (characterisation): mooreKernel E = ⨅ m ≥ 1, m • ⊤, the intersection of all multiples (L.3/moore-theorem).
- `mooreKernel_le_range_integers` (relation): mooreKernel E ≤ range (K_2 𝒪 → K_2 E) (L.3/ring-of-integers-subgroup).
- `mooreKernel_charP` (compatibility): If char E = p then mooreKernel E = range (K_2 𝒪 → K_2 E) (L.3/moore-equal-characteristic).

**Unit tests.**

- `mooreKernel_Q2_five` (characterisation): {−1, 5} ∈ mooreKernel ℚ₂, since −x² + 5y² = 1 has the solution x = 2, y = 1; being 2-torsion, {−1, 5} = 0 in K_2(ℚ₂) by Moore's theorem.
- `mooreKernel_Q3` (computation): E = ℚ₃: {3, −1} ∉ mooreKernel (h = −1), while {−1, −1} ∈ mooreKernel (two units at an odd prime), so {−1, −1} = 0 in K_2(ℚ₃).
- `mooreKernel_F2_laurent` (degenerate): E = 𝔽₂((t)): μ(E) = 1, w = 1, mooreKernel E = K_2(E) = K_2(𝔽₂[[t]]).
- `mooreKernel_ne_tame_kernel` (non-example): E = ℚ₂: {−1, −1} lies in the kernel of the tame symbol (the image of K_2(ℤ₂)) but not in mooreKernel; defining U(E) as the tame kernel fails when p | w.
- `mooreKernel_laurent` (compatibility): E = 𝔽_p((t)): mooreKernel E = ker ∂_v, the image of K_2(𝔽_p[[t]]), because μ_{p^∞}(E) = 1.

**Acceptance.**

- The sequence is stated without any choice; the splitting is a separate statement.
- U(E) is the uniquely divisible summand of K-book Theorem III.6.2.4 and the group U₂ of Handbook Theorem 57, once Moore's theorem is proved.

**Used by.**

- L.3/moore-theorem: the uniquely divisible summand, U(E) = w·K_2(E)
- ArithmeticKTheory N.6/tame-and-wild-kernels: on torsion classes the kernel of K_2(F) → K_2(F_v) is the kernel of h_{F_v} (L.7/hilbert-symbol-completion)
- HigherLocalFieldsAndHigherClassFieldTheory HL.1: K_2(E)/U(E) is the topological K_2 of a one-dimensional local field
- L.3/ring-of-integers-subgroup: U(E) is the kernel of h_E restricted to K_2(𝒪)

**Depends on.** this roadmap: `L.3/norm-residue-map`, `L.3/norm-residue-split-surjective`.

**Sources.**

- `Kbook.2013`, Proof of Moore's Theorem III.6.2.4 (PDF p. 242): “A proof that its kernel U is divisible, due to C. Moore, is given in the Appendix to Milnor [131].” — The kernel U of the norm residue symbol, the object of this definition.
- `Weibel.Handbook.I5`, Proof of Theorem 57 (p. 163; PDF p. 25): “Proof The fact that the kernel U2 of the norm residue map is divisible is due to C. Moore, and is given in the Appendix to [40].” — The same group U₂, defined as the kernel of the norm residue map.

### The ring-of-integers subgroup and the tame-symbol quotient

`L.3/local-k2-localisation-sequence` · theorem · planet “Localization sequence for K₂ of a local field”

With the conventions of L.3/norm-residue-map, the sequence 0 → K_2(𝒪) →j K_2(E) →∂ k^× → 0 is exact and canonical, where j is induced by 𝒪 ⊂ E and ∂ is the boundary of the localisation sequence of the discrete valuation ring 𝒪. With the K-book's normalisation of the boundary, ∂ = ∂^{Kb}_v = ∂_v^{−1} on symbols (T.3/localization-boundary), so j(K_2(𝒪)) = ker ∂_v, the tame kernel, and K_2(E)/j(K_2(𝒪)) ≅ k^× is the tame-symbol quotient. The sequence splits canonically (L.2/even-k-field-splitting, i = 1).

**Hypotheses.**

- E is a nonarchimedean local field with valuation ring 𝒪 and finite residue field k.
- Quillen K-groups; in degree two identified with Matsumoto's group (T.1/k2-pi2).

**Proof.**

1. The localisation sequence of the DVR 𝒪 (L.2/dvr-localisation; equivalently ArithmeticKTheory N.2/localisation-sequence-for-a-dedekind-domain for the Dedekind domain 𝒪 with one non-zero prime): K_2(k) → K_2(𝒪) → K_2(E) → K_1(k) → K_1(𝒪) → K_1(E).
2. K_2(k) = 0 for the finite field k (K2SymbolsBrauer T.2/k2-finite-field), so j is injective.
3. K_1(𝒪) = 𝒪^× because SK_1 of the local ring 𝒪 vanishes (KTheoryLowDegrees U.3), and 𝒪^× → E^× = K_1(E) is injective; so ∂ is onto k^× = K_1(k).
4. ∂ is the tame symbol, in the normalisation fixed by T.3/localization-boundary (K-book V.6.6.1); the kernel does not depend on the normalisation.
5. The splitting is L.2/even-k-field-splitting for i = 1: u ↦ {ω(u), π} is a section of ∂_v, and it does not depend on π because K_2(𝒪) has no prime-to-p torsion (L.2/even-k-uniquely-l-divisible).

**Acceptance.**

- E = ℚ_p: 0 → K_2(ℤ_p) → K_2(ℚ_p) → 𝔽_p^× → 0, with ∂_v{u, p} = ū (roadmap normalisation) and ∂^{Kb}(p, u) = ū.
- {−1, −1} ∈ j(K_2(ℤ₂)), both entries being units.
- Injectivity of j comes from K_2(k) = 0, not from Gersten's conjecture in general; surjectivity of ∂ comes from K_1(𝒪) ↪ K_1(E).

**Depends on.** this roadmap: `L.2/dvr-localisation`, `L.2/even-k-field-splitting`, `L.2/even-k-uniquely-l-divisible`; other roadmaps: `ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain`, `K2SymbolsBrauer:T.2/k2-finite-field`, `KTheoryLowDegrees:U.3`, `K2SymbolsBrauer:T.3/localization-boundary`, `K2SymbolsBrauer:T.3/tame-symbol-hom`, `K2SymbolsBrauer:T.1/k2-pi2`; libraries: `mathlib:IsDiscreteValuationRing`.

**Sources.**

- `Kbook.2013`, Corollary V.6.6.2 (PDF p. 418; book p. 410): “Corollary 6.6.2. If R is a semilocal Dedekind domain, K3(F) −∂→ ⊕K2(R/p) is onto, and we obtain the exact sequence 0 → K2(R) → K2(F) −∂→ ⊕p (R/p)× → 1.” — The exact sequence, for the DVR 𝒪 (a semilocal Dedekind domain with one prime).
- `Kbook.2013`, V.6.6.1 (PDF p. 417): “We claim that ∂ is the tame symbol of III.6.3 and that the above continues the sequence of III.6.5.” — The boundary is the (K-book's) tame symbol.
- `Weibel.Handbook.I5`, Proposition 58 (p. 164; PDF p. 26): “There is also a decomposition K2i(E) = K2i(V) ⊕ K2i−1(Fq), and the group K2i(V) is uniquely ℓ-divisible for every prime ℓ ≠ p, i.e., a Z(p)-module.” — The case i = 1: K_2(E) = K_2(V) ⊕ F_q^×, with K_2(V) prime-to-p uniquely divisible.

### U(E) is uniquely ℓ-divisible away from the residue characteristic

`L.3/moore-kernel-prime-to-p` · lemma

With the conventions of L.3/norm-residue-map, for every prime ℓ ≠ p the group U(E) is uniquely ℓ-divisible, in either characteristic; moreover ∂_v induces K_2(E)/ℓ ≅ k^×/ℓ and K_2(E)[ℓ] ≅ k^×[ℓ], and h_E induces K_2(E)/ℓ ≅ μ(E)/ℓ and K_2(E)[ℓ] ≅ μ(E)[ℓ].

**Hypotheses.**

- E is a nonarchimedean local field, ℓ a prime different from p = char k.

**Proof.**

1. K_2(𝒪) is uniquely ℓ-divisible (L.2/even-k-uniquely-l-divisible, i = 1; Handbook Proposition 58), and 0 → K_2(𝒪) → K_2(E) → k^× → 0 is exact (L.3/local-k2-localisation-sequence). Tensoring with ℤ/ℓ and taking ℓ-torsion gives K_2(E)/ℓ ≅ k^×/ℓ and K_2(E)[ℓ] ≅ k^×[ℓ].
2. Both groups have order gcd(ℓ, q − 1), which is #μ(E)/ℓ = #μ(E)[ℓ] because μ(E) is cyclic of order (q − 1)p^a with ℓ ≠ p.
3. h_E : K_2(E)/ℓ → μ(E)/ℓ is onto (L.3/norm-residue-split-surjective), hence bijective; h_E : K_2(E)[ℓ] → μ(E)[ℓ] is onto because a section of h_E maps μ(E)[ℓ] into K_2(E)[ℓ], hence bijective.
4. Snake lemma for multiplication by ℓ on 0 → U(E) → K_2(E) → μ(E) → 0: 0 → U[ℓ] → K_2[ℓ] → μ[ℓ] → U/ℓ → K_2/ℓ → μ/ℓ → 0; the two bijections give U(E)[ℓ] = 0 and U(E)/ℓ = 0.

**Acceptance.**

- ℚ₅, ℓ = 2: K_2(ℚ₅)[2] = {0, {−1, 5}} ≅ μ₄[2], with h{−1, 5} = −1.
- ℚ₅, ℓ = 3: K_2(ℚ₅) is uniquely 3-divisible (gcd(3, 4) = 1).
- The argument uses no information about the wild symbol.

**Depends on.** this roadmap: `L.3/local-k2-localisation-sequence`, `L.3/norm-residue-split-surjective`, `L.3/moore-kernel`, `L.2/even-k-uniquely-l-divisible`; libraries: `tauceti:TauCeti.rootsOfUnityFieldEquivResidueFieldUnits`.

**Sources.**

- `Kbook.2013`, Proposition VI.7.3 (PDF p. 517; book p. 509): “Proposition 7.3. For n > 0 we have Kn(E) ≅ Kn(V) ⊕ Kn−1(Fq), and the groups Kn(V) are Z(p)-modules.” — The prime-to-p unique divisibility of K_2(V), the input of the snake-lemma argument.
- `Kbook.2013`, Proof of Theorem VI.7.2 (PDF p. 516): “By Gabber rigidity (IV.2.10), Un is uniquely ℓ-divisible for all ℓ ≠ p and n > 0.” — The equal-characteristic form of the same input.

### K₂ of a field of characteristic p has no p-torsion

`L.3/k2-no-p-torsion-char-p` · lemma

If F is a field of characteristic p > 0, then K_2(F) has no p-torsion (K-book Theorem III.6.7). Planned in this generality because no layer of the atlas owns it (see restructure); L.3 uses it for F a local field of characteristic p.

**Hypotheses.**

- F is a field of characteristic p > 0.
- Hilbert's Theorem 90 for K_2 for the Artin–Schreier extension F(x)/F(y) is an input cited to Merkurjev–Suslin (gap); the K-book's own treatment of this special case is circular (sourceIssues).

**Proof.**

1. Let x be an indeterminate and y = x^p − x; F(x)/F(y) is cyclic of degree p with σ(x) = x + 1.
2. K_2(F) injects into K_2 F(x) and K_2 F(y) (Application III.6.5.2; K2SymbolsBrauer T.2/rational-function-field and T.4/bass-tate-sequence), and the transfer N : K_2 F(x) → K_2 F(y) is multiplication by p on K_2(F) (projection formula, T.4/milnor-projection-formula and T.4/restriction-transfer-degree).
3. Let u ∈ K_2(F) with p·u = 0. Then N(u) = 0, so by Hilbert's Theorem 90 for K_2 (gap) u = (1 − σ)v for some v ∈ K_2 F(x).
4. Every prime of F[x] is unramified over F[y] (ramification formula, T.3/ramification-formula), and the row ⊕(F[y]/𝔭_y)^× → ⊕(F[x]/𝔭)^× → ⊕(F[x]/𝔭)^× (diagonal, then 1 − σ) is exact; a diagram chase with the surjective tame-symbol maps (T.3/tame-symbol-hom) lets one replace v by v − i_*v₀ with ∂(v) = 0, so v ∈ K_2(F) by the Bass–Tate sequence, and then u = v − σv = 0.

**Acceptance.**

- The statement is about p-torsion only; K_2(𝔽_p(t)) is a large prime-to-p torsion group (Example III.6.7.1).
- For perfect F it also follows from Proposition III.6.4.1 without Hilbert 90 (unique p-divisibility).

**Depends on.** other roadmaps: `K2SymbolsBrauer:T.2/rational-function-field`, `K2SymbolsBrauer:T.4/bass-tate-sequence`, `K2SymbolsBrauer:T.4/milnor-projection-formula`, `K2SymbolsBrauer:T.4/restriction-transfer-degree`, `K2SymbolsBrauer:T.3/ramification-formula`, `K2SymbolsBrauer:T.3/tame-symbol-hom`.

**Sources.**

- `Kbook.2013`, Theorem III.6.7 (PDF p. 246; book p. 238): “Theorem 6.7. If char(F) = p ≠ 0, then the group K2(F) has no p-torsion.” — The statement.
- `Kbook.2013`, Proof of Theorem III.6.7 (PDF p. 246): “Now fix u ∈ K2(F) satisfying up = 1; we shall prove that u = 1. By Hilbert’s Theorem 90 for K2, u = (1 − σ)v = v(σv)−1 for some v ∈ K2F(x).” — The use of Hilbert's Theorem 90 for K_2, the recorded gap.

### K₂ of a local field of characteristic p is p-divisible

`L.3/k2-p-divisible-equal-characteristic` · lemma

If E is a nonarchimedean local field of characteristic p, then K_2(E) = p·K_2(E). The reason is that E has p-degree one: [E : E^p] = p with p-basis {π}, so Ω²_E = 0 and the Bloch–Kato–Gabber isomorphism K^M_2(E)/p ≅ ν(2)_E ⊆ Ω²_E gives K_2(E)/p = 0. The statement fails for fields of larger p-degree.

**Hypotheses.**

- E is a nonarchimedean local field with char E = p (so char k = p as well).
- Ω^•_E are the absolute Kähler differentials (Mathlib's KaehlerDifferential over ℤ, equivalently over 𝔽_p).

**Proof.**

1. E = E^p(π) and [E : E^p] = p: E^p is complete with uniformiser π^p and residue field k^p = k (k is finite, hence perfect); every x ∈ E is Σ_{i ≥ i₀} ω(a_i) π^i with Teichmüller coefficients (Tau Ceti's teichmuller), and ω(a) = ω(a^{1/p})^p ∈ E^p, so grouping the exponents modulo p writes x = Σ_{r=0}^{p−1} c_r π^r with c_r ∈ E^p (the inner series converge because E^p is complete); π has degree p over E^p since v(π) = 1 while v(E^{p×}) = pℤ.
2. Hence Ω¹_E = E·dπ (d kills E^p: d(y^p) = p y^{p−1} dy = 0) and Ω²_E = Λ²Ω¹_E = 0 (K-book III.7.7: a p-basis gives a basis of Ω¹).
3. Bloch–Kato–Gabber (K-book Theorem III.7.7.2, supplied by MotivicEtaleKTheory M.5): dlog induces K^M_2(E)/p ≅ ν(2)_E ⊆ Ω²_E = 0.
4. K^M_2(E) = K_2(E) by Matsumoto (T.2/matsumoto).

**Acceptance.**

- F = 𝔽_p(s, t) (p-degree two): dlog{s, t} = ds/s ∧ dt/t ≠ 0, so {s, t} ∉ p·K_2(F); the p-degree hypothesis is used.
- In characteristic 0 the analogous statement is false: K_2(ℚ₂)/2 ≅ ℤ/2, generated by {−1, −1}.

**Depends on.** other roadmaps: `MotivicEtaleKTheory:M.5`, `K2SymbolsBrauer:T.2/matsumoto`; libraries: `mathlib:KaehlerDifferential`, `tauceti:TauCeti.teichmuller`, `tauceti:TauCeti.henselianLocalRing_integer`.

**Sources.**

- `Kbook.2013`, Theorem III.7.7.2 (PDF p. 259; book p. 251): “Theorem 7.7.2. (Bloch-Kato-Gabber) Let F be a field of characteristic p ≠ 0. Then the dlog map induces an isomorphism for every n ≥ 0: KMn(F)/pKMn(F) ≅ ν(n)F.” — The input identifying K_2(E)/p with a subgroup of Ω²_E.
- `Kbook.2013`, III.7.7 (PDF p. 259): “In fact, if {xi} is a p-basis of F over F p then the symbols dxi form a basis of the F-vector space Ω1F.” — With the p-basis {π}, Ω¹_E is one-dimensional and Ω²_E = 0.
- `Kbook.2013`, VI.7, equicharacteristic local fields (PDF p. 515): “We first dispose of the equi-characteristic case, where E = Fq((t)), V ≅ Fq[[π]] and char(E) = p.” — The shape of E in characteristic p; the node proves the p-degree directly instead of citing the structure theorem.

### U(E) is p-divisible in characteristic zero

`L.3/moore-kernel-p-divisible-mixed-characteristic` · lemma

If char E = 0 (E finite over ℚ_p), then h_E induces K_2(E)/p^ν ≅ μ(E)/p^ν for every ν ≥ 1, and U(E) is p-divisible.

**Hypotheses.**

- E is a finite extension of ℚ_p.
- The degree-two norm residue theorem (Merkurjev–Suslin) is used for every field, as MotivicEtaleKTheory M.5 states it; Tate's local theorem of M.3 is not used, so that no circularity with Moore's theorem can arise.
- The source's own proof of the divisibility (Moore, in the appendix to Milnor's book) was not read; this route replaces it (see gaps).

**Proof.**

1. Norm residue theorem in degree two: K_2(E)/p^ν ≅ H²(E, μ_{p^ν}^{⊗2}) (M.5; Handbook §5.4: 'an isomorphism for all F by the Merkurjev-Suslin theorem').
2. Local duality: H²(E, μ_{p^ν}^{⊗2}) ≅ H⁰(E, μ_{p^ν}) (K-book VI.7, p. 516; ClassFieldTheory Layer 5's local duality), so #K_2(E)/p^ν = #μ_{p^ν}(E) = #μ(E)/p^ν.
3. h_E : K_2(E)/p^ν → μ(E)/p^ν is onto (L.3/norm-residue-split-surjective), hence bijective, the groups being finite of the same order.
4. A section of h_E maps μ(E)[p^ν] into K_2(E)[p^ν], so K_2(E)[p^ν] → μ(E)[p^ν] is onto; the snake lemma for p^ν on 0 → U(E) → K_2(E) → μ(E) → 0 then gives U(E)/p^ν ↪ K_2(E)/p^ν ≅ μ(E)/p^ν, hence U(E)/p^ν = 0.

**Acceptance.**

- ℚ₂: K_2(ℚ₂)/2 ≅ ℤ/2, generated by {−1, −1}.
- ℚ₃: μ_{3^∞}(ℚ₃) = 1, so K_2(ℚ₃) is 3-divisible.
- ℚ_p(ζ_p): K_2/p ≅ μ_p, one-dimensional, although K_2(ℚ_p(ζ_p)) is uncountable.

**Depends on.** this roadmap: `L.3/norm-residue-split-surjective`, `L.3/moore-kernel`, `L.3/norm-residue-map`; other roadmaps: `MotivicEtaleKTheory:M.5`.

**Sources.**

- `Kbook.2013`, VI.7, before Proposition VI.7.3 (PDF p. 516; book p. 508): “By Tate–Poitou duality [128, I.2.3], H2et(E, µ⊗i+1m) is isomorphic to H0et(E, µ⊗im).” — The duality used, at i = 1, m = p^ν.
- `Weibel.Handbook.I5`, §5.4 (p. 155; PDF p. 17): “For i = 1, the second étale Chern class K2(F)/m → H2ét(F, µ⊗2m) is just Tate’s map, described in 4; it is an isomorphism for all F by the Merkurjev-Suslin theorem.” — The degree-two norm residue theorem for every field.
- `Kbook.2013`, Proof of Moore's Theorem III.6.2.4 (PDF p. 242): “A proof that its kernel U is divisible, due to C. Moore, is given in the Appendix to Milnor [131].” — The divisibility this node proves at the prime p in characteristic 0; Moore's proof is cited by the source and was not read.

### Merkurjev's theorem: U(E) has no p-torsion in characteristic zero

`L.3/merkurjev-p-torsion-free` · theorem · planet “Merkurjev's torsion theorem”

If char E = 0 (E finite over ℚ_p), then U(E) has no p-torsion (Merkurjev, 'On the torsion in K_2 of local fields', 1983). Together with L.3/moore-kernel-prime-to-p and L.3/moore-kernel-p-divisible-mixed-characteristic it makes U(E) uniquely divisible. Equivalently: the p-primary torsion of K_2(E) maps injectively, hence (by the section) isomorphically, onto μ_{p^∞}(E) under h_E.

**Hypotheses.**

- E is a finite extension of ℚ_p.
- Cited theorem: the proof is not in any source read (gap).

**Proof.**

1. Cite Merkurjev [K-book ref. 124; Handbook ref. 37], as both the K-book (proof of Theorem III.6.2.4) and the Handbook (proof of Theorem 57) do; no proof is given there.
2. Record the reformulation: U(E)[p] = 0 iff K_2(E)[p] ≅ μ(E)[p] under h_E (snake lemma on 0 → U(E) → K_2(E) → μ(E) → 0 with the section of L.3/norm-residue-split-surjective).

**Acceptance.**

- Consequence for ℚ₂: {−1, −1} is the only element of order two of K_2(ℚ₂), and {−1, 5} = 0.
- Consequence for ℚ_p(ζ_p): K_2[p] ≅ μ_p, generated by {ζ_p, x} for x with (ζ_p, x) = ζ_p.
- The characteristic-p analogue is L.3/k2-no-p-torsion-char-p, where the whole of K_2(E) has no p-torsion.

**Depends on.** this roadmap: `L.3/moore-kernel`, `L.3/norm-residue-split-surjective`.

**Sources.**

- `Kbook.2013`, Proof of Moore's Theorem III.6.2.4 (PDF p. 242): “The fact that U is torsionfree (hence uniquely divisible) was proven by Tate [198] when char(F) = p, and by Merkurjev [124] when char(F) = 0.” — The attribution of the characteristic-zero torsion-freeness to Merkurjev.
- `Weibel.Handbook.I5`, Proof of Theorem 57 (p. 163; PDF p. 25): “The fact that U2 is torsion free (hence uniquely divisible) was proven by Tate [66] when char(F) = p, and by Merkurjev [37] when char(F) = 0.” — The same citation.

### U(E) is uncountable

`L.3/moore-kernel-uncountable` · lemma

For every nonarchimedean local field E, U(E) is uncountable: K_2(E) has the cardinality 2^{ℵ₀} of E (K-book Corollary III.6.3.2, since E contains ℚ(t) in characteristic 0 and 𝔽_p(t₁, t₂) in characteristic p), and K_2(E)/U(E) ≅ μ(E) is finite. In characteristic 0 it also follows from the dlog map to Ω², but not in characteristic p, where Ω²_E = 0 (sourceIssues, Exercise III.6.11).

**Hypotheses.**

- E is a nonarchimedean local field.

**Proof.**

1. E is uncountable and has uncountable transcendence degree over its prime field, so it contains ℚ(t) (characteristic 0) or 𝔽_p(t₁, t₂) (characteristic p).
2. Corollary III.6.3.2: |K_2(E)| = |E|; its proof uses the tame symbol of k(t) (T.3/tame-symbol-hom), Lemma III.6.1.3 (the kernel of K_2(F) → K_2(E) is torsion, from T.4/restriction-transfer-degree and T.2/rational-function-field) and Matsumoto's presentation for the upper bound (T.2/matsumoto).
3. U(E) has finite index w in K_2(E) (L.3/moore-kernel, L.3/norm-residue-split-surjective), so it is uncountable.

**Acceptance.**

- K_2(ℚ_p) and K_2(𝔽_q((t))) are uncountable; their torsion is finite.
- For E = 𝔽_q((t)) the image of K_2(E) → Ω²_E is 0, so the dlog argument gives nothing there.

**Depends on.** this roadmap: `L.3/moore-kernel`, `L.3/norm-residue-split-surjective`; other roadmaps: `K2SymbolsBrauer:T.3/tame-symbol-hom`, `K2SymbolsBrauer:T.2/matsumoto`, `K2SymbolsBrauer:T.4/restriction-transfer-degree`, `K2SymbolsBrauer:T.2/rational-function-field`.

**Sources.**

- `Kbook.2013`, Corollary III.6.3.2 (PDF p. 243; book p. 235): “Corollary 6.3.2. If F contains the rational function field Q(t) or Fp(t1, t2), then K2(F) has the same cardinality as F. In particular, if F is uncountable then so is K2(F).” — The cardinality statement used in both characteristics.

### Moore's theorem

`L.3/moore-theorem` · theorem · planet “Moore's theorem”

Let E be a nonarchimedean local field with w = #μ(E). (a) U(E) = ker h_E is uniquely divisible and uncountable. (b) The torsion subgroup K_2(E)_tors is finite cyclic of order w, h_E restricts to an isomorphism K_2(E)_tors ≅ μ(E), and K_2(E) = U(E) ⊕ K_2(E)_tors as an internal direct sum; this decomposition is canonical. (c) U(E) = w·K_2(E) = ⋂_{m ≥ 1} m·K_2(E), the largest divisible subgroup of K_2(E); hence K_2(E)/⋂_m m·K_2(E) ≅ μ(E). (d) Every section of h_E, in particular every s_{ζ,x} of L.3/norm-residue-split-surjective, equals (h_E|_{K_2(E)_tors})^{−1}; identifying K_2(E)_tors with ℤ/w still needs a choice of generator of μ(E). In characteristic 0 part (a) at the prime p rests on Merkurjev's theorem (cited). The variants with the roots-of-unity term written out are L.3/moore-equal-characteristic and L.3/moore-mixed-characteristic.

**Hypotheses.**

- E is a nonarchimedean local field (either characteristic).
- In characteristic 0, the p-torsion-freeness is L.3/merkurjev-p-torsion-free, a cited theorem (gap).

**Proof.**

1. Divisibility: at ℓ ≠ p, L.3/moore-kernel-prime-to-p; at ℓ = p in characteristic p, K_2(E)/p = 0 (L.3/k2-p-divisible-equal-characteristic) and μ(E)/p = 0, so the snake lemma gives U(E)/p = 0; at ℓ = p in characteristic 0, L.3/moore-kernel-p-divisible-mixed-characteristic.
2. Torsion-freeness: at ℓ ≠ p, L.3/moore-kernel-prime-to-p; at ℓ = p in characteristic p, L.3/k2-no-p-torsion-char-p; at ℓ = p in characteristic 0, L.3/merkurjev-p-torsion-free. Uncountability: L.3/moore-kernel-uncountable.
3. (b): U(E) ∩ K_2(E)_tors = 0, so h_E is injective on the torsion; a section has finite, hence torsion, image, so h_E maps K_2(E)_tors onto μ(E); for x ∈ K_2(E), x − s(h_E x) ∈ U(E).
4. (c): w·K_2(E) = w·U(E) ⊕ w·K_2(E)_tors = U(E); U(E) divisible gives U(E) ⊆ m·K_2(E) for every m, and ⋂_m m·K_2(E) ⊆ w·K_2(E); a divisible subgroup has divisible, hence trivial, image in the finite group μ(E).
5. (d): sections take values in the torsion subgroup, on which h_E is bijective.

**Acceptance.**

- ℚ₂: K_2(ℚ₂) = U ⊕ ℤ/2·{−1, −1} (K-book Example III.6.2.5).
- ℚ_p, p odd: K_2(ℚ_p) = U ⊕ ℤ/(p − 1), generated by {ω(g), p} for a generator g of 𝔽_p^× (h{ω(g), p} = ω(g)^{−1}).
- ℚ₃: the torsion is ℤ/2, generated by {−1, 3} (h{−1, 3} = −1).
- 𝔽_q((t)): the torsion is ℤ/(q − 1), generated by {ω(g), t}.
- (c) is the one-dimensional case of the topological K-group of HL.1: K_2(E)/⋂ m·K_2(E) ≅ μ(E).

**Depends on.** this roadmap: `L.3/moore-kernel`, `L.3/norm-residue-split-surjective`, `L.3/moore-kernel-prime-to-p`, `L.3/k2-no-p-torsion-char-p`, `L.3/k2-p-divisible-equal-characteristic`, `L.3/moore-kernel-p-divisible-mixed-characteristic`, `L.3/merkurjev-p-torsion-free`, `L.3/moore-kernel-uncountable`.

**Sources.**

- `Kbook.2013`, Moore's Theorem III.6.2.4 (PDF p. 241; book p. 233): “Moore’s Theorem 6.2.4. If F is a local field, then K2(F) is the direct sum of a uniquely divisible abelian group U and a finite cyclic group, isomorphic under the norm residue symbol to the group µ = µm of roots of unity in F.” — The theorem, statements (a) and (b).
- `Weibel.Handbook.I5`, Theorem 57 (p. 163; PDF p. 25): “57 Theorem 57: (Moore’s Theorem.) The group K2(E) is the product of a finite group, isomorphic to µ(E), and an uncountable, uniquely divisible abelian group U2.” — The same theorem with uncountability.
- `Fesenko.GTM3.2000`, Part I, §6.1 (p. 62): “K2(F) ≃ Tors K2(F) ⊕ mK2(F), where m = | Tors F∗|, Tors K2(F) ≃ Z/m and mK2(F) is an uncountable uniquely divisible group (Bass, Tate, Moore, Merkur’ev; see for instance [FV, Ch. IX §4]).” — The canonical form (b)–(c): the divisible summand is m·K_2(F) with m = #μ(F).

### K₂ of the ring of integers inside Moore's decomposition

`L.3/ring-of-integers-subgroup` · theorem · planet “K₂ of the ring of integers”

With the conventions of L.3/norm-residue-map and j : K_2(𝒪) ↪ K_2(E) (L.3/local-k2-localisation-sequence): (i) U(E) ⊆ j(K_2(𝒪)) = ker ∂_v; (ii) h_E maps j(K_2(𝒪)) onto μ_{p^∞}(E), giving a canonical exact sequence 0 → U(E) → K_2(𝒪) → μ_{p^∞}(E) → 0; (iii) the (q − 1)-st power symbol h_E^{p^a}, followed by the reduction μ_{q−1}(E) ≅ k^×, is ∂^{Kb}_v, so h_E induces an isomorphism from the tame-symbol quotient K_2(E)/j(K_2(𝒪)) ≅ k^× onto μ(E)/μ_{p^∞}(E) ≅ μ_{q−1}(E); (iv) with Moore's theorem, K_2(𝒪) = U(E) ⊕ K_2(𝒪)_tors with K_2(𝒪)_tors ≅ μ_{p^∞}(E) under h_E. In characteristic p, K_2(𝒪) = U(E).

**Hypotheses.**

- E is a nonarchimedean local field; a is defined by w = (q − 1)p^a.

**Proof.**

1. (i): for x ∈ U(E), h_E(x)^{p^a} = 1; by L.3/tame-component with d = q − 1, h_E^{p^a} = ω(∂_v)^{−1}, so ∂_v x = 1 and x ∈ ker ∂_v = j(K_2(𝒪)) (L.3/local-k2-localisation-sequence).
2. (ii): for x ∈ K_2(𝒪), h_E(x)^{p^a} = ω(∂_v x)^{−1} = 1, so h_E(x) ∈ μ_{p^a}(E) = μ_{p^∞}(E); conversely, for y ∈ μ_{p^∞}(E) pick x with h_E(x) = y (L.3/norm-residue-split-surjective); then ω(∂_v x)^{−1} = y^{p^a} = 1, so x ∈ K_2(𝒪).
3. (iii): L.3/tame-component at d = q − 1; the kernel of K_2(E) → μ(E)/μ_{p^∞}(E) is j(K_2(𝒪)) by (ii).
4. (iv): intersect the decomposition of L.3/moore-theorem with K_2(𝒪), using U(E) ⊆ K_2(𝒪).

**Acceptance.**

- ℚ₂: h maps K_2(ℤ₂) onto μ₂, {−1, −1} ↦ −1; K_2(ℤ₂) = U ⊕ ℤ/2.
- ℚ_p, p odd: μ_{p^∞}(ℚ_p) = 1, so K_2(ℤ_p) = U(ℚ_p), uniquely divisible.
- 𝔽_q((t)): K_2(𝔽_q[[t]]) = U(E) (compare Theorem VI.7.2, where K_2(V) = K_2(F_q) ⊕ U_2 and K_2(F_q) = 0).
- The tame kernel is not U(E) when μ_p ⊆ E: they differ by μ_{p^∞}(E).

**Depends on.** this roadmap: `L.3/local-k2-localisation-sequence`, `L.3/tame-component`, `L.3/norm-residue-split-surjective`, `L.3/moore-kernel`, `L.3/moore-theorem`.

**Sources.**

- `Weibel.Handbook.I5`, Theorem 57 (p. 163; PDF p. 25): “In addition, K2(V) = µp∞(E) × U2 .” — Statement (iv).
- `Kbook.errata`, Correction to p. 558 of GSM 145 (VI.7, line before Proposition 7.1): “K2(V ) ∼= U2 should be K2(V ) ∼= U2 ⊕µp∞(E)” — The author's correction of the K-book's VI.7, agreeing with (iv).

### Moore's theorem in characteristic p

`L.3/moore-equal-characteristic` · theorem

Let E be a nonarchimedean local field of characteristic p (so E ≅ 𝔽_q((π))). Then μ(E) = μ_{q−1}(E) = ω(k^×) and w = q − 1; h_E = ω ∘ ∂^{Kb}_v = ω ∘ ∂_v^{−1}, so the norm residue map is the Teichmüller lift of the K-book's tame symbol; U(E) = ker ∂_v = j(K_2(𝒪)); K_2(E) = j(K_2(𝒪)) ⊕ s(k^×) canonically with s(u) = {ω(u), π}; and K_2(𝒪) ≅ U(E) is uncountable and uniquely divisible, while K_2(E)_tors = s(k^×) ≅ k^× is cyclic of order q − 1. For n = 2 this is K-book Theorem VI.7.2 and Handbook Theorem 56, with U₂ = ker(K_2(𝒪) → K_2(k)) = K_2(𝒪).

**Hypotheses.**

- E is a nonarchimedean local field of characteristic p.

**Proof.**

1. There are no non-trivial p-power roots of unity in characteristic p, so a = 0 and μ(E) = μ_{q−1}(E) (Tau Ceti's rootsOfUnityFieldEquivResidueFieldUnits).
2. L.3/tame-component with d = q − 1 = w gives h_E = ω(∂_v)^{−1}.
3. Hence U(E) = ker ∂_v = j(K_2(𝒪)) (L.3/local-k2-localisation-sequence); the splitting is L.2/even-k-field-splitting for i = 1.
4. Unique divisibility and uncountability of U(E): L.3/moore-theorem.

**Acceptance.**

- 𝔽_p((t)): h{t, a} = a, h{t, t} = h{t, −1} = −1 for p odd.
- 𝔽₂((t)): μ(E) = 1 and K_2(E) = K_2(𝔽₂[[t]]) is uniquely divisible.
- The torsion of K_2(𝔽_q((t))) is the image of k^× under u ↦ {ω(u), t}, not the image of K_2(𝔽_q[[t]]).

**Depends on.** this roadmap: `L.3/moore-theorem`, `L.3/tame-component`, `L.3/local-k2-localisation-sequence`, `L.2/even-k-field-splitting`; libraries: `tauceti:TauCeti.rootsOfUnityFieldEquivResidueFieldUnits`.

**Sources.**

- `Weibel.Handbook.I5`, Theorem 56 (p. 162; PDF p. 24): “Theorem 56 Let V = Fq[[π]] be the ring of integers in the local field E = Fq((π)). For n ≥ 2 there are uncountable, uniquely divisible abelian groups Un so that Kn(V) = Kn(Fq) ⊕ Un, Kn(E) = Kn(V) ⊕ Kn−1(Fq) .” — The case n = 2: K_2(V) = U_2 and K_2(E) = U_2 ⊕ F_q^×.
- `Kbook.2013`, Theorem VI.7.2 (PDF p. 516; book p. 508): “Theorem 7.2. Let V = Fq[[π]] be the ring of integers in the local field E = Fq((π)). For n ≥ 2 there are uncountable, uniquely divisible abelian groups Un and canonical isomorphisms: Kn(E) ≅ Kn(V) ⊕ Kn−1(Fq), Kn(V) ≅ Kn(Fq) ⊕ Un.” — The same, with the canonicity this node proves for n = 2.

### Moore's theorem in characteristic zero

`L.3/moore-mixed-characteristic` · theorem

Let E be a finite extension of ℚ_p with residue field 𝔽_q. Then μ(E) = μ_{q−1}(E) × μ_{p^∞}(E) with p^a = #μ_{p^∞}(E) (a ≥ 1 iff μ_p ⊆ E); K_2(E) = U(E) ⊕ K_2(E)_tors with K_2(E)_tors ≅ μ(E) cyclic of order (q − 1)p^a; K_2(𝒪) = U(E) ⊕ K_2(𝒪)_tors with K_2(𝒪)_tors ≅ μ_{p^∞}(E); and K_2(E) = K_2(𝒪) ⊕ s(k^×). The p-primary torsion is detected by the wild component of h_E, not by the tame symbol. In particular K_2(E) ≅ U₂ ⊕ 𝔽_q^×, as printed in the K-book's VI.7, holds exactly when μ_p ⊄ E; it fails for ℚ₂ and for ℚ₃(ζ₃).

**Hypotheses.**

- E is a finite extension of ℚ_p.
- Part of Moore's theorem here rests on Merkurjev's theorem (cited).

**Proof.**

1. The decomposition of μ(E): LocalFieldsRamification Layer 1 (the prime-to-p part is the Teichmüller image).
2. The torsion and the ring-of-integers statements: L.3/moore-theorem and L.3/ring-of-integers-subgroup.
3. The splitting over K_2(𝒪): L.2/even-k-field-splitting (i = 1).
4. Failure of the printed form: for ℚ₂, {−1, −1} has order 2 while 𝔽₂^× = 1 and U(ℚ₂) is torsion-free.

**Acceptance.**

- ℚ₂: K_2(ℤ₂) = U ⊕ ℤ/2·{−1, −1}.
- ℚ₃(ζ₃): the torsion of K_2 is ℤ/6, its 3-part in K_2(𝒪).
- ℚ_p (p odd): a = 0 and K_2(ℤ_p) = U is uniquely divisible.

**Depends on.** this roadmap: `L.3/moore-theorem`, `L.3/ring-of-integers-subgroup`, `L.3/tame-component`, `L.2/even-k-field-splitting`.

**Sources.**

- `Weibel.Handbook.I5`, Theorem 57 (p. 163; PDF p. 25): “57 Theorem 57: (Moore’s Theorem.) The group K2(E) is the product of a finite group, isomorphic to µ(E), and an uncountable, uniquely divisible abelian group U2. In addition, K2(V) = µp∞(E) × U2 .” — The mixed-characteristic form with the roots-of-unity term μ(E) and μ_{p^∞}(E).
- `Kbook.errata`, Correction to p. 558 of GSM 145 (three lines before VI.7.1): “K2(E) ∼= U2 ⊕µ(E) (not ...⊕F×q )” — The author's correction of the roots-of-unity term in the K-book's VI.7.

## L.4 — Trace constructions

*Coverage: partial.* Targets of the stage text and how they are realised. (1) 'Import the Hochschild/cyclic/THH/TC and cyclotomic-trace constructions from RefinedTraceMethods': requests to RT.1, RT.2 and RT.3; nothing of them is re-planned. (2) 'the nilpotent relative theorem with completion/connectivity hypotheses and the rational relative comparison': imported from RT.3 (request) and applied in L.5 (Theorem D of HM 1997, truncated polynomial algebras). (3) 'Construct the comparison to the classical TR/Frobenius convention used in Hesselholt–Madsen's field/DVR calculations': HM's T(C) of a linear Waldhausen category, TR^n = T(C)^{C_{p^{n−1}}} with R, F, V, μ, the norm–restriction and Tate cofibre sequences, TC(C;p) = hofib(R − F), Connes' operator, π_0 TR^n = W_n (against Mathlib's TruncatedWittVector), the comparison with the genuine and Nikolaus–Scholze TR/TC and with integral TC, and the Tate-cohomology machinery of HM §4. (4) 'verify its input hypotheses': T(k), T(A), T(A|K) are connective (L.4/log-thh-bounded-below), the hypothesis of Nikolaus–Scholze Theorem II.4.10 and Corollary II.4.9. (5) 'prove the localization square': HM Theorem 1.5.6 and Addendum 1.5.7, with the THH versions of Waldhausen's additivity, fibration and resolution theorems and the Dundas–McCarthy/Thomason–Trobaugh inputs of HM §1.3–1.5. All HM results of §1 and §4 are nodes; Remark 1.5.8 (regular schemes) is not used downstream and is not planned.

- Remaining: Supply the cyclotomic structure on T(C) for linear Waldhausen categories (gap).
- Remaining: Prove McCarthy's additivity for Φ = THH^{C_r}, Bökstedt's approximation lemma, Waldhausen's Lemma 1.4.1/Theorem 1.6.4 arguments for Φ, Thomason–Trobaugh 1.9.8 and the 3 × 3 lemma with HM's sign conventions (gap), or replace them by the Blumberg–Mandell localisation theorems for spectral categories.
- Remaining: Supply the Dundas–McCarthy equivalence criterion, Morita invariance and Dundas' dévissage for HM's linear-category THH (gap).
- Remaining: Answers to the requests to RefinedTraceMethods RT.1, RT.2 and RT.3.

### The topological Hochschild T-spectrum T(C) of a linear Waldhausen category

`L.4/thh-of-linear-waldhausen-category` · construction

Let C be a small linear category (enriched in abelian groups) with cofibrations and weak equivalences in Waldhausen's sense. Hesselholt–Madsen's topological Hochschild spectrum T(C) is the symmetric orthogonal T-spectrum (T the circle group) whose (n,V)-th space, for n ≥ 0 and V a finite-dimensional orthogonal T-representation, is T(C)_{n,V} = |THH^{(n)}(N^w_• S^{(n)}_• C; S^V)|. Here S^{(n)}_• C is the n-fold iterated Waldhausen S-construction, N^w_• D ⊂ N_• D is the full simplicial subcategory of the nerve category on the objects N_•(wD), and THH^{(n)}_k(D;X) = hocolim_{(I^{(n)})^{k+1}} G_k(D;X)∘(⊔_n)^{k+1} is Bökstedt's topological Hochschild space of the linear category D formed with the Eilenberg–Mac Lane symmetric spectra of the Hom-groups; it is the space of k-simplices of a cyclic space, and T acts diagonally through Connes' cyclic structure and through S^V, while Σ_n acts diagonally through THH^{(n)} and the permutation of the n simplicial directions. It comes with: (i) a cyclotomic structure, a map of T-spectra r: ρ_p^*(Ẽ ∧ T(C))^{C_p} → T(C) whose underlying C_{p^s}-map is an equivalence for all s ≥ 0; (ii) the cyclotomic trace, induced by the inclusion of the T-fixed 0-simplices |ob N^w_• S^{(n)}_• C ∧ S^{V^T}| → (T(C)_{n,V})^T, a map K(C) → T(C)^T from the Waldhausen K-theory spectrum; (iii) when C is strict symmetric monoidal with bi-exact tensor product, the structure of a monoid in symmetric orthogonal T-spectra, for which the trace is multiplicative. The (0,0)-th space is the cyclic bar construction |N^cy_•(N^w_• C)|. T(C) depends on C together with its weak equivalences through the linear category N^w_• S_• C; it is not an invariant of the Dwyer–Kan localisation of C (see the non-example test).

**Hypotheses.**

- C is small and linear: Hom-sets are abelian groups and composition is bilinear.
- C is a category with cofibrations and weak equivalences (Waldhausen §1.2); for (iii), C is strict symmetric monoidal and ⊗ is bi-exact.
- The cyclotomic structure is the genuine one (RefinedTraceMethods RT.2: 'Define a cyclotomic spectrum by the source's Frobenius maps'); T(C) is regarded in the F-genuine T-stable category, F the family of finite subgroups.

**Proof.**

1. Enrich C in symmetric spectra by Hom_C(c,d)_i = |Hom_C(c,d) ⊗ Z(S^i)|, the Eilenberg–Mac Lane spectrum of the Hom-group (HM §1.2); this is the spectral category model of RefinedTraceMethods RT.2.
2. Form THH^{(n)}_k(D;X) as the homotopy colimit over (I^{(n)})^{k+1} and its cyclic structure; by Connes' theory of cyclic spaces the realisation is a Σ_n × T-space (RT.2: 'Construct THH of spectral categories and E₁-algebras by cyclic realization. Give the S¹-action as coherent data').
3. Apply it to D = N^w_• S^{(n)}_• C (GeneralAlgebraicKTheory K.4:construction for S_•; the nerve category N^w_• is the full simplicial subcategory of N_• C on N_• wC, compatible with S_• by the isomorphism N_• S_• C ≅ S_• N_• C, HM (1.2.1)) and smash with S^V, giving T(C)_{n,V} with the diagonal T- and Σ_n-actions.
4. Construct the cyclotomic structure maps ρ_p^*(T(C)_{n,V})^{C_p} → T(C)_{n,ρ_p^*V^{C_p}} by edgewise subdivision, as for rings in Hesselholt–Madsen 1997 §2; HM state that the resulting orthogonal spectrum has a cyclotomic structure without writing out the verification (recorded gap).
5. Define the trace from the inclusion of T-fixed points of the cyclic space: |X_•|^T = {x ∈ X_0 | s_0(x) = t_1 s_0(x)} contains the 0-simplices given by objects, which assemble to the Waldhausen K-theory spectrum (RefinedTraceMethods RT.3 constructs the trace).
6. For a bi-exact strict symmetric monoidal structure, the Σ_m × Σ_n-equivariant products S^{(m)}_• C ⊗ S^{(n)}_• C → S^{(m+n)}_• C give T(C)_{m,V} ∧ T(C)_{n,W} → T(C)_{m+n,V⊕W} (GeneralAlgebraicKTheory K.7 for the K-theory product).

**API.**

- `TauCeti.HM.thhSpectrum` (constructor): For a small linear Waldhausen category C, the symmetric orthogonal T-spectrum T(C) with T(C)_{n,V} = |THH^{(n)}(N^w_• S^{(n)}_• C; S^V)|.
- `TauCeti.HM.thhSpectrum.map` (functoriality): An exact linear functor f: C → D induces T(f): T(C) → T(D) with T(id) = id and T(g ∘ f) = T(g) ∘ T(f).
- `TauCeti.HM.thhSpectrum.zeroZero` (characterisation): T(C)_{0,0} is the realisation of the cyclic bar construction N^cy_•(N^w_• C).
- `TauCeti.HM.thhSpectrum.cyclotomic` (structure): The cyclotomic structure map r: ρ_p^*(Ẽ ∧ T(C))^{C_p} → T(C), an equivalence of underlying C_{p^s}-spectra for every s ≥ 0.
- `TauCeti.HM.thhSpectrum.trace` (data): The cyclotomic trace K(C) → T(C)^T, natural in exact functors.
- `TauCeti.HM.thhSpectrum.ringOfSymmetricMonoidal` (instance): If C is strict symmetric monoidal with bi-exact ⊗, T(C) is a commutative monoid in symmetric orthogonal T-spectra and the trace is multiplicative.
- `TauCeti.HM.thhSpectrum.natIsoHomotopy` (relation): A natural isomorphism, or a natural transformation through weak equivalences, between exact functors f, g induces a homotopy T(f) ≃ T(g) (Lemmas 1.3.2, 1.3.3 applied to Φ = THH^{C_r}).
- `TauCeti.HM.thhSpectrum.equivProjective` (compatibility): For a ring R, T(P_R) ≃ THH(R) as cyclotomic spectra, THH(R) being RT.2's THH of the E₁-ring HR.

**Unit tests.**

- `TauCeti.HM.thhSpectrum_trivial` (degenerate): For the trivial Waldhausen category (one object, the zero object) T(C) is contractible: axiom (i) of HM §1.3 for Φ = THH^{C_r}.
- `TauCeti.HM.thhSpectrum_Fp` (computation): For C = P_{F_p}: π_* T(C) ≅ π_* THH(F_p) ≅ F_p[σ] with |σ| = 2 (Bökstedt; node KTheoryFiniteLocalFields:L.5/thh-of-perfect-field), in particular π_1 T(P_{F_p}) = 0 and π_2 T(P_{F_p}) = F_p.
- `TauCeti.HM.thhSpectrum_projective_eq_thh` (compatibility): For every ring R, π_0 T(P_R) ≅ R/[R,R] and, for R commutative, π_1 T(P_R) ≅ Ω^1_{R/Z} (the THH of RT.2 in degrees ≤ 1).
- `TauCeti.HM.thhSpectrum_not_localization_invariant` (non-example): For A = Z_p, K = Q_p: T(C^b_q(P_A)) (rational homology isomorphisms as weak equivalences) is not equivalent to T(P_K) = THH(Q_p): π_0(T(C^b_q(P_A));Z/p) = F_p (π_0 T(A|K) = A, node L.5/log-thh-low-degrees), whereas THH(Q_p) is a Q_p-module spectrum, so π_*(THH(Q_p);Z/p) = 0. A definition through the Dwyer–Kan localisation of C^b_q(P_A), which is Morita equivalent to Perf(Q_p), would give the latter.

**Acceptance.**

- For C = P_R (finitely generated projective modules over a ring R, isomorphisms as weak equivalences) T(C) is equivalent as a cyclotomic spectrum to THH(R) of RefinedTraceMethods RT.2, by Morita invariance (Dundas–McCarthy, cited by HM after Definition 1.5.5).
- T(C)_{0,0} = |N^cy_•(N^w_• C)|, the cyclic bar construction.

**Used by.**

- HM Definition 1.5.5: T(A|K) = T(C^b_q(P_A)), T(A) = T(C^b_z(P_A)), T(k) = T(C^b_z(P_A)^q)
- HM §1.1: TR^n(C;p) is the C_{p^{n−1}}-fixed point spectrum of T(C) and R is built from its cyclotomic structure
- HM §2.3 (2.3.2): dlog_n is the composite of det: Σ^∞B Aut(X)_+ → K(C) with the trace
- HM Theorem 1.5.6: the localisation sequence is produced by applying the fibration theorem to Φ(C) = THH(C)^{C_r}
- KTheoryFiniteLocalFields:L.4/k-tc-localization-square: the trace K(C) → T(C)^T gives the vertical maps of the localisation square

**Depends on.** other roadmaps: `RefinedTraceMethods:RT.2`, `RefinedTraceMethods:RT.3`, `GeneralAlgebraicKTheory:K.4:construction/waldhausen-categories-and-S-construction`, `GeneralAlgebraicKTheory:K.7/biexact-pairings-and-products`, `StableHomotopyKTheory:H.5:spectra/omega-spectra-and-eilenberg-maclane`, `StableHomotopyKTheory:H.1/nerve-and-classifying-space`.

**Sources.**

- `HesselholtMadsen.2003`, §1.2, (1.2.2), p. 14: “Let V be a finite-dimensional orthogonal T-representation. We define the (n, V )-th space in the symmetric orthogonal T-spectrum T(C) by (1.2.2) T(C)n,V = | THH(n)(Nw· S(n) · C; SV )|. There are two T-actions on this space: one which comes from the topological Hochschild space, and” — Definition of the (n,V)-th space of T(C) and of its two T-actions.
- `HesselholtMadsen.2003`, §1.2, p. 14: “and one can prove that for fixed n, the object of the T-stable category defined by the orthogonal spectrum V 7→T(C)n,V has a cyclotomic structure. Suppose that C is a strict symmetric monoidal” — The cyclotomic structure is asserted with its construction sketched (edgewise subdivision as in HM 1997 §2).
- `HesselholtMadsen.2003`, §1.2, p. 14: “The space on the left is the (n, V T)-th space of a symmetric orthogonal spectrum, which represents the spectrum K(C) in the stable homotopy category, and the map above defines the cyclotomic trace. Moreover, by a construction similar to that of” — The trace is the inclusion of T-fixed 0-simplices, and K(C) is represented by the symmetric orthogonal spectrum on the left.

### The structure maps of T(C) are F-equivalences in positive levels

`L.4/thh-structure-maps-f-equivalences` · lemma

For a linear Waldhausen category C and all orthogonal T-representations V, W, the spectrum structure maps T(C)_{n,V} → F(S^m ∧ S^W, T(C)_{m+n,W⊕V}) are F-equivalences (they induce weak equivalences on C_r-fixed points for every r ≥ 1) provided n ≥ 1. Consequently the C_r-fixed points of T(C) are computed levelwise from the spaces T(C)_{n,V} with n ≥ 1, as used to define TR^n(C;p) and to apply the fibration theorem to Φ(C) = THH(C)^{C_r}.

**Hypotheses.**

- C a small linear category with cofibrations and weak equivalences.
- n ≥ 1; for n = 0 the statement fails in general (the (0,0)-space is the cyclic bar construction, not an infinite loop space).

**Proof.**

1. Factor the map as T(C)_{n,V} → F(S^m, T(C)_{m+n,V}) → F(S^m, F(S^W, T(C)_{m+n,W⊕V})).
2. Since S^m is C_r-fixed, on C_r-fixed points the first map is THH^{(n)}(N^w_• S^{(n)}_• C; S^V)^{C_r} → Ω^m THH^{(m+n)}(N^w_• S^{(m+n)}_• C; S^V)^{C_r}.
3. By Bökstedt's approximation lemma (cited by HM as [Bökstedt, Th. 1.6] or [Madsen, Lemma 2.3.7]; not read) THH^{(k)} may be replaced by THH, and the claim follows from the square (1.3.6) (node L.4/thh-relative-s-construction-square) applied to Φ(C) = THH(C; S^V)^{C_r}.
4. The second map is a C_r-equivalence by the proof of HM 1997 Proposition 2.4 (cited), completing the proof.

**Acceptance.**

- For C = P_R the lemma says that T(P_R) is a positive F-fibrant (Ω-) T-spectrum, so that T(P_R)^{C_{p^{n−1}}} is computed levelwise; this is the input used after Definition 1.5.5 to identify T(P_A) → T(C^b_z(P_A)) as an F-equivalence.

**Depends on.** this roadmap: `L.4/thh-of-linear-waldhausen-category`, `L.4/thh-relative-s-construction-square`; other roadmaps: `RefinedTraceMethods:RT.2`.

**Sources.**

- `HesselholtMadsen.2003`, Proposition 1.3.8, p. 18: “Proposition 1.3.8. Let C be a linear category with cofibrations and weak equivalences, and let T(C) be the topological Hochschild spectrum. Then for all orthogonal T-representations W and V , the spectrum structure maps T(C)n,V ∼ −→F(Sm ∧SW, T(C)m+n,W ⊕V ) are F-equivalences,” — Statement of the lemma.
- `HesselholtMadsen.2003`, Proof of Proposition 1.3.8, p. 18: “By the approximation lemma, [2, Th. 1.6] or [30, Lemma 2.3.7], we can replace the functor THH(k)(−; −) by the common functor THH(−; −), and the claim now follows from (1.3.6) applied to the functor Φ(C) = THH(C; SV )Cr. Finally,” — The proof cites Bökstedt's approximation lemma and the square (1.3.6).

### The pro-spectrum TR^•(C;p) with restriction, Frobenius, Verschiebung and circle action

`L.4/tr-pro-spectrum` · construction · planet “TR pro-spectrum”

Fix a prime p and a linear Waldhausen category C. For n ≥ 1 put TR^n(C;p) = |ρ_{p^{n−1}}^* T(C)^{C_{p^{n−1}}}|, the C_{p^{n−1}}-fixed point spectrum of T(C) viewed through the root isomorphism ρ_{p^{n−1}}: T ≅ T/C_{p^{n−1}} (so TR^1(C;p) = T(C)). There are maps of spectra F = φ^{−1} ι φ: TR^n → TR^{n−1} (inclusion of fixed points), V = φ^{−1} τ φ: TR^{n−1} → TR^n (the accompanying transfer), μ: T_+ ∧ TR^n → TR^n (the residual circle action) and R: TR^n → TR^{n−1}, the composite of TR^n → |ρ^*(Ẽ ∧ T(C))^{C_{p^{n−1}}}| with the equivalence r_n induced by the cyclotomic structure. The restriction maps R make TR^•(C;p) a pro-spectrum, F and V are maps of pro-spectra, and the cyclotomic trace K(C) → T(C)^T → TR^n(C;p) is a map of pro-spectra from the constant pro-spectrum K(C). If C is strict symmetric monoidal with bi-exact ⊗, TR^•(C;p) is a commutative pro-ring spectrum and R, F and the trace are ring maps. Indexing convention (pinned): the n-th level uses the cyclic group of order p^{n−1}; Hesselholt–Madsen 1997 and Nikolaus–Scholze index the same spectrum by C_{p^n} with n+1 ↔ n.

**Hypotheses.**

- p a prime; C a small linear Waldhausen category.
- For the ring structure: C strict symmetric monoidal with bi-exact tensor product.

**Proof.**

1. Take the genuine fixed points T(C)^{C_{p^{n−1}}} of the T-spectrum of node L.4/thh-of-linear-waldhausen-category and transport the residual T/C_{p^{n−1}}-action along ρ_{p^{n−1}} with the natural isomorphisms φ_r: |ρ_r^*Y| ≅ |Y| (RefinedTraceMethods RT.2: 'Construct restriction, homotopy orbits, homotopy fixed points and Tate constructions').
2. Define F and V from the inclusion ι and transfer τ of fixed points for C_{p^{n−2}} ⊂ C_{p^{n−1}}.
3. Define R using the cofibration sequence E_+ ∧ T → T → Ẽ ∧ T and the equivalence r_{n}: ρ^*_{p^{n−1}}(Ẽ ∧ T(C))^{C_{p^{n−1}}} ≃ ρ^*_{p^{n−2}} T(C)^{C_{p^{n−2}}} obtained from the cyclotomic structure r by iteration.
4. The trace is the composite of K(C) → T(C)^T (node L.4/thh-of-linear-waldhausen-category) with φ^{−1} ι^T_{C_{p^{n−1}}}.
5. Multiplicativity: r is a map of ring T-spectra when C has a bi-exact strict symmetric monoidal product, so R is a ring map; F is the inclusion of fixed points of a ring T-spectrum.

**API.**

- `TauCeti.HM.trSpectrum` (constructor): TR^n(C;p) := |ρ^*_{p^{n−1}} T(C)^{C_{p^{n−1}}}| for n ≥ 1.
- `TauCeti.HM.trSpectrum.one` (simp): TR^1(C;p) = T(C).
- `TauCeti.HM.trSpectrum.restriction` (data): R: TR^n(C;p) → TR^{n−1}(C;p), the structure map of the pro-system.
- `TauCeti.HM.trSpectrum.frobenius` (data): F: TR^n(C;p) → TR^{n−1}(C;p), the inclusion of fixed points.
- `TauCeti.HM.trSpectrum.verschiebung` (data): V: TR^{n−1}(C;p) → TR^n(C;p), the transfer.
- `TauCeti.HM.trSpectrum.circleAction` (structure): μ: T_+ ∧ TR^n(C;p) → TR^n(C;p), commuting with R, F, V up to the root isomorphisms.
- `TauCeti.HM.trSpectrum.frobenius_restriction` (relation): R ∘ F = F ∘ R and R ∘ V = V ∘ R as maps of spectra.
- `TauCeti.HM.trSpectrum.frobenius_verschiebung` (relation): F ∘ V = p on π_*(TR^n(C;p)), as the Weyl-group action on homotopy of fixed points is trivial.
- `TauCeti.HM.trSpectrum.trace` (data): The cyclotomic trace K(C) → TR^•(C;p), a map of pro-spectra, with R ∘ tr = tr and F ∘ tr = tr.
- `TauCeti.HM.trSpectrum.map` (functoriality): An exact functor C → D induces maps TR^n(C;p) → TR^n(D;p) commuting with R, F, V, μ and the trace.
- `TauCeti.HM.trSpectrum.indexShift` (compatibility): TR^n(C;p) is the spectrum written T(C)^{C_{p^{n−1}}} in Hesselholt–Madsen 1997 and X^{C_{p^{n−1}}} in Nikolaus–Scholze; HM 1997's π_0 T(A)^{C_{p^n}} ≅ W_{n+1}(A) becomes π_0 TR^{n+1}(A;p) ≅ W_{n+1}(A).

**Unit tests.**

- `TauCeti.HM.trSpectrum_pi0_Fp` (computation): π_0 TR^2(P_{F_p};p) ≅ W_2(F_p) ≅ Z/p², and R, F: Z/p² → Z/p are both reduction modulo p while V: Z/p → Z/p² is multiplication by p.
- `TauCeti.HM.trSpectrum_one_eq_thh` (degenerate): For n = 1 no fixed points are taken: TR^1(C;p) = T(C), and the trace K(C) → TR^1(C;p) is the Dennis trace K(C) → T(C).
- `TauCeti.HM.trSpectrum_pi0_witt` (compatibility): For C = P_A with A commutative, π_0 TR^n(C;p) ≅ TruncatedWittVector p n A (Mathlib), compatibly with R and TruncatedWittVector.truncate.
- `TauCeti.HM.trSpectrum_R_ne_F` (non-example): R ≠ F on π_0 TR^2(P_Z;p) ≅ W_2(Z): for the Teichmüller element [a]_2, R[a]_2 = a while F[a]_2 = a^p, so for a = 2, p = 3 they differ (2 ≠ 8). A definition with R the inclusion of fixed points would make R = F.

**Acceptance.**

- π_0 TR^n(P_A;p) ≅ W_n(A) for A commutative, with R, F, V inducing restriction, Frobenius and Verschiebung of Witt vectors (node L.4/pi0-tr-is-witt-vectors).
- F ∘ V = p on homotopy groups, and R commutes with F and V.

**Used by.**

- HM §1.1: TR(C;p) = holim_R TR^n(C;p) and TC(C;p) is the fibre of R − F
- HM §3.3, Proposition 3.3.1: the homotopy groups TR^•_*(A|K;p) with R, F, V, d form a log Witt complex
- HM Theorem C: the pro-isomorphism W_•ω^*_{(A,M)} ⊗ S(μ_{p^v}) → TR^•_*(A|K;p,Z/p^v) is a statement about this pro-system
- KTheoryFiniteLocalFields:L.5/tr-of-perfect-field: the TR-groups of perfect fields

**Depends on.** this roadmap: `L.4/thh-of-linear-waldhausen-category`; other roadmaps: `RefinedTraceMethods:RT.2`, `RefinedTraceMethods:RT.3`.

**Sources.**

- `HesselholtMadsen.2003`, §1.1, p. 8: “We define a pro-spectrum TR·(C; p) together with maps of pro-spectra F: TRn(C; p) →TRn−1(C; p), V : TRn−1(C; p) →TRn(C; p), µ: S1 + ∧TRn(C; p) →TRn(C; p). The spectrum TR1(C; p) is the topological Hochschild spectrum of C. The cyclotomic trace is a map of pro-spectra tr: K(C) →TR·(C;” — Statement of the data F, V, μ and the trace as maps of pro-spectra.
- `HesselholtMadsen.2003`, §1.1, p. 9: “We will define a T-spectrum T(C) such that TRn(C; p) = |ρ∗ pn−1T(C)Cpn−1 | with the maps F and V given by the composites F = ϕ−1 pn−2ι Cpn−1 Cpn−2ϕpn−1: |ρ∗” — TR^n is the C_{p^{n−1}}-fixed point spectrum with F and V given by inclusion and transfer.
- `HesselholtMadsen.2003`, §1.1, p. 10: “is then defined as the composite |ρ∗ pn−1T(C)Cpn−1| →|ρ∗ pn−1( ˜E ∧T(C))Cpn−1| rn −→ ∼ |ρ∗ pn−2T(C)Cpn−2|, where the left-hand map is the middle map in the cofibration sequence above. We thus have a natural cofibration sequence of spectra” — Definition of R through the cyclotomic structure.
- `HesselholtMadsen.1997a`, Introduction, Theorem F, PDF p. 3: “Theorem F. For any commutative ring A, π0 THH(A)Cpn ∼= Wn+1(A), the p-typical Witt vectors of length n + 1. The cyclotomic structure of THH(A) induces two maps R, F: THH(A)Cpn →THH(A)Cpn−1. In” — The older indexing: π_0 of the C_{p^n}-fixed points is W_{n+1}(A).

### The norm–restriction cofibre sequence and its map to the Tate cofibre sequence

`L.4/norm-restriction-cofibre-sequence` · lemma

For a linear Waldhausen category C and n ≥ 1 there is a natural cofibration sequence of spectra H_•(C_{p^{n−1}}, T(C)) →N TR^n(C;p) →R TR^{n−1}(C;p) →∂ ΣH_•(C_{p^{n−1}}, T(C)), where H_•(C_{p^{n−1}}, T(C)) = |ρ^*(E_+ ∧ T(C))^{C_{p^{n−1}}}| is the homotopy orbit (group homology) spectrum. The map γ: T(C) → F(E_+, T(C)) induces a map of cofibration sequences from H_•(C_{p^n},T(C)) → TR^{n+1}(C;p) → TR^n(C;p) to the Tate cofibration sequence H_•(C_{p^n},T(C)) →N^h H^•(C_{p^n},T(C)) →R^h Ĥ(C_{p^n},T(C)), which is the identity on homotopy orbits and whose middle maps are Γ: TR^{n+1}(C;p) → H^•(C_{p^n},T(C)) and Γ̂: TR^n(C;p) → Ĥ(C_{p^n},T(C)); all maps commute with the circle actions μ. If C has a bi-exact strict symmetric monoidal product, R, R^h, Γ and Γ̂ are ring maps and the diagram is one of TR^{n+1}(C;p)-module spectra.

**Hypotheses.**

- p a prime, n ≥ 1, C a small linear Waldhausen category; E a free contractible T-CW-complex and Ẽ the cofibre of E_+ → S^0.

**Proof.**

1. Smash the cofibration sequence of T-CW-complexes E_+ → S^0 → Ẽ → ΣE_+ with T(C) and take C_{p^{n−1}}-fixed points (RefinedTraceMethods RT.2: homotopy orbits, homotopy fixed points and Tate constructions with their norm sequence).
2. Identify the right-hand term with TR^{n−1}(C;p) by the equivalence r_n of node L.4/tr-pro-spectrum; the resulting map is R by definition.
3. Apply the same construction to F(E_+, T(C)) to obtain the Tate cofibration sequence; γ induces an isomorphism of homotopy orbit spectra and hence the map of sequences.
4. Ring and module structures: r is a map of ring T-spectra for a bi-exact strict symmetric monoidal C (HM 1997, pp. 71–72, cited).

**Acceptance.**

- For C = P_{F_p} and n = 2 the long exact sequence reads ⋯ → π_q H_•(C_p,T(F_p)) → TR^2_q(F_p;p) → TR^1_q(F_p;p) → ⋯ and in degree 0 gives 0 → π_0 H_•(C_p, T(F_p)) = F_p →V... TR^2_0 = Z/p² →R F_p → 0.
- Γ̂: T(F_p) → Ĥ(C_p, T(F_p)) is an equivalence on connective covers (HM 1997 Proposition 4.3), the prototype of Theorem 5.4.3.

**Depends on.** this roadmap: `L.4/tr-pro-spectrum`; other roadmaps: `RefinedTraceMethods:RT.2`, `StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence`.

**Sources.**

- `HesselholtMadsen.2003`, §1.1, p. 10: “We thus have a natural cofibration sequence of spectra H·(Cpn−1, T(C)) N −→TRn(C; p) R −→TRn−1(C; p) ∂ −→ΣH·(Cpn−1, T(C)). When C has a bi-exact strict symmetric monoidal product, the map r is a map of ring T-spectra, and hence R is a map of ring spectra. The cofibration sequence” — The norm–restriction cofibration sequence and its module structure.
- `HesselholtMadsen.2003`, §1.1, p. 11: “induces a map of cofibration sequences H·(Cpn, T (C)) N −→ TRn+1(C; p) R −→ TRn(C; p) ∂ −→ ΣH·(Cpn, T (C)) yΓ yˆΓ H·(Cpn, T (C)) Nh −→ H·(Cpn, T” — The map to the Tate cofibration sequence with vertical maps Γ and Γ̂.

### TR(C;p) as a homotopy limit and topological cyclic homology TC(C;p) as the fibre of R − F

`L.4/p-typical-tc` · definition · planet “Topological cyclic homology TC(C;p)”

For a linear Waldhausen category C and prime p, TR(C;p) is the preferred homotopy limit holim_R TR^n(C;p), with lifts of F, V and μ; its homotopy groups sit in the Milnor sequence 0 → lim^1_R TR^•_{s+1}(C;p) → TR_s(C;p) → lim_R TR^•_s(C;p) → 0. Topological cyclic homology is TC(C;p) = hofib(R − F: TR(C;p) → TR(C;p)), so that there is a natural cofibration sequence TC(C;p) → TR(C;p) →(R−F) TR(C;p) → ΣTC(C;p). The cyclotomic trace lifts to tr: K(C) → TC(C;p); for C strict symmetric monoidal with bi-exact ⊗, TR(C;p) and TC(C;p) are ring spectra and F and tr are ring maps. With coefficients: TC_q(C;p,Z/m) = π_q(M_m ∧ TC(C;p)) and TC_q(C;p,Z_p) = π_q holim_v (M_{p^v} ∧ TC(C;p)), where M_m is the mod m Moore spectrum; integral, p-adic and finite-coefficient groups are distinct objects related by the Bockstein and Milnor sequences.

**Hypotheses.**

- p a prime; C a small linear Waldhausen category.
- The homotopy limit is the preferred model of HM §1.1 (a homotopy limit of the tower of restriction maps).

**Proof.**

1. Form holim_R over the pro-spectrum of node L.4/tr-pro-spectrum; the Milnor sequence is the lim^1 sequence of a tower of spectra (StableHomotopyKTheory H.6).
2. F commutes with R, hence induces a self-map of TR(C;p); define TC(C;p) as the homotopy fibre of R − F, where R acts on holim_R by the shift.
3. The trace K(C) → TR^n(C;p) is compatible with R and F, hence factors through the fibre.
4. Products: holim and hofib of ring maps between ring spectra (for bi-exact symmetric monoidal C).

**API.**

- `TauCeti.HM.trLimit` (constructor): TR(C;p) := holim_R TR^n(C;p), with the induced F, V and μ.
- `TauCeti.HM.trLimit.milnor` (other): The Milnor short exact sequence 0 → lim^1 TR^•_{s+1} → TR_s → lim TR^•_s → 0.
- `TauCeti.HM.tc` (constructor): TC(C;p) := hofib(R − F: TR(C;p) → TR(C;p)).
- `TauCeti.HM.tc.longExact` (other): The long exact sequence ⋯ → TC_q(C;p) → TR_q(C;p) →(R−F) TR_q(C;p) → TC_{q−1}(C;p) → ⋯.
- `TauCeti.HM.tc.trace` (data): The lifted cyclotomic trace K(C) → TC(C;p), natural in exact functors.
- `TauCeti.HM.tc.map` (functoriality): An exact functor induces TC(C;p) → TC(D;p) compatible with the trace, with map_id and map_comp.
- `TauCeti.HM.tc.ring` (instance): For bi-exact strict symmetric monoidal C, TC(C;p) is a ring spectrum and the trace is multiplicative.
- `TauCeti.HM.tc.coefficients` (other): TC_q(C;p,Z/m) := π_q(M_m ∧ TC(C;p)) and TC_q(C;p,Z_p) := π_q holim_v(M_{p^v} ∧ TC(C;p)), with the Bockstein sequences of StableHomotopyKTheory H.6.
- `TauCeti.HM.tc.equivNS` (compatibility): For bounded-below T(C), TC(C;p) is equivalent to the Nikolaus–Scholze TC(T(C),p) (node L.4/hm-conventions-agree-with-nikolaus-scholze).

**Unit tests.**

- `TauCeti.HM.tc_Fp` (computation): TC_0(P_{F_p};p) ≅ Z_p, TC_{−1}(P_{F_p};p) ≅ Z_p and TC_q(P_{F_p};p) = 0 otherwise.
- `TauCeti.HM.tc_Fpbar` (computation): For k an algebraic closure of F_p, TC(P_k;p) ≃ HZ_p: 1 − F is surjective on W(k), so TC_{−1} = 0.
- `TauCeti.HM.tc_not_connective` (non-example): TC_{−1}(P_{F_p};p) = Z_p ≠ 0 = K_{−1}(F_p): TC(C;p) is not connective and the trace is not an equivalence of spectra; only the connective cover is compared with K-theory (HM 1997 Theorem D).
- `TauCeti.HM.tc_R_minus_F` (characterisation): TC(C;p) is the homotopy equaliser of R and F on the limit TR(C;p): for C = P_{F_p}, R = F on TR_0 = Z_p, so TC_0 = TC_{−1} = Z_p. At a finite level the fibre of R − F: TR^n → TR^{n−1} has π_0 = Z/p^n and π_{−1} = Z/p^{n−1} (R and F both reduce Z/p^n → Z/p^{n−1}), which is not TC.

**Acceptance.**

- For C = P_{F_p}: TC(F_p;p) ≃ HZ_p ∨ Σ^{−1}HZ_p (node L.5/tc-of-perfect-field), so TC_0 = Z_p, TC_{−1} = Z_p and the trace K_0(F_p) = Z → TC_0 = Z_p is the completion map.
- The long exact sequence ⋯ → TC_q(C;p) → TR_q(C;p) →(1−F) TR_q(C;p) → TC_{q−1}(C;p) → ⋯, with R acting as the identity on the limit.

**Used by.**

- HM Addendum 1.5.7: the localisation square maps the K-theory localisation sequence to the TC localisation sequence
- HM Theorem 6.1.6: TC_*(A|K;p,Z/p) is computed from the pro-system TR^•_*(A|K;p,Z/p) and 1 − F
- HM Theorem 6.1.10: the trace K(K) → TC(A|K;p) and its étale version
- KTheoryFiniteLocalFields:L.5/trace-equivalence-finite-witt-algebras: K(A)^_p ≃ TC(A;p)^_p[0,∞)
- KTheoryFiniteLocalFields:L.6: the p-adic K-groups of local fields are read off from TC(A|K;p)

**Depends on.** this roadmap: `L.4/tr-pro-spectrum`; other roadmaps: `StableHomotopyKTheory:H.6/l-adic-completion-milnor-sequence`, `StableHomotopyKTheory:H.6/mod-l-homotopy-and-bockstein-sequence`, `RefinedTraceMethods:RT.2`.

**Sources.**

- `HesselholtMadsen.2003`, §1.1, p. 8: “The pro-spectrum TR·(C; p) has a preferred homotopy limit TR(C; p), and there are preferred lifts to the homotopy limit of the maps F, V and µ. Its homotopy groups are related to those of the pro-system by the Milnor sequence 0 →lim ←− R 1TR· s+1(C; p)” — TR as preferred homotopy limit with the Milnor sequence.
- `HesselholtMadsen.2003`, §1.1, p. 8: “There is a natural cofibration sequence TC(C; p) →TR(C; p) R−F −−−→TR(C; p) →Σ TC(C; p), where TC(C; p) is the topological cyclic homology spectrum of C. The cyclotomic trace has a preferred lift to a map tr: K(C) →TC(C; p), and in the case where C has a bi-exact strict symmetric” — Definition of TC(C;p) as the fibre of R − F and the lifted trace.
- `HesselholtMadsen.2003`, §2.1, p. 31: “We define the homotopy groups of X with Z/m-coefficients by π∗(X, Z/m) = π∗(Mm ∧X), where Mm is the Moore spectrum given by the distinguished triangle S0 m −→S0 ι −→Mm β −→S1, and the homotopy groups” — Homotopy groups with Z/m and Z_p coefficients.

### Connes' operator on the homotopy groups of a T-spectrum

`L.4/connes-operator` · definition

Give the circle T = S(C) the orientation of the complex plane with fundamental class [T] ∈ H_1(T). There is a sum diagram Z/2·η = π^S_1(S^0) ⇄ π^S_1(T_+) ⇄ H_1(T) = Z·[T] with Hurewicz map h and section σ determined by hσ = id and cσ = 0. For a T-spectrum T, Connes' operator is d: π_q(T) →([T]∧−) π_{q+1}(T_+ ∧ T) →(μ_T) π_{q+1}(T), where [T] ∈ π^S_1(T_+) denotes σ[T]. In general dd = dη = ηd; in particular d is a differential when multiplication by η is zero on π_*(T), e.g. when 2 is invertible on π_*(T). For T = HH(A) the Hochschild spectrum, d is Connes' operator B on HH_*(A).

**Hypotheses.**

- T a T-spectrum (an object of the T-stable category).
- For d² = 0: η acts trivially on π_*(T), e.g. 2 invertible.

**Proof.**

1. Construct σ from the stable splitting T_+ ≃ S^0 ∨ S^1 (the sum diagram of HM (2.1.2)).
2. Define d as the composite of exterior multiplication by σ[T] and the action map μ_T.
3. The relation dd = dη = ηd is Hesselholt 1996 Lemma 1.4.2 (as cited by HM); it follows from the structure of π^S_*(T_+) and the Hopf map.
4. Agreement with Connes' B for HH(A): Hesselholt 1996 Proposition 1.4.6 (cited).

**API.**

- `TauCeti.HM.connesOperator` (constructor): d: π_q(T) → π_{q+1}(T), d(x) = μ_*(σ[T] ∧ x).
- `TauCeti.HM.connesOperator.map` (functoriality): d commutes with maps of T-spectra: f_*(dx) = d(f_* x).
- `TauCeti.HM.connesOperator_comp` (relation): d(d(x)) = d(η x) = η d(x).
- `TauCeti.HM.connesOperator_sq_eq_zero` (relation): If η·π_*(T) = 0 (for instance if 2 is invertible on π_*(T)), then d ∘ d = 0.
- `TauCeti.HM.connesOperator_derivation` (relation): For a ring T-spectrum, d(xy) = d(x)y + (−1)^{|x|} x d(y).
- `TauCeti.HM.connesOperator_hochschild` (compatibility): For T = HH(A) (RefinedTraceMethods RT.1), d = Connes' B: HH_q(A) → HH_{q+1}(A); on HH_0 = A it is a ↦ da ∈ HH_1 = Ω^1_A for A commutative.

**Unit tests.**

- `TauCeti.HM.connesOperator_Fp` (computation): On π_*(T(F_p);Z/p): d(ε) = σ, where β(ε) = 1.
- `TauCeti.HM.connesOperator_trivialAction` (degenerate): If T has the trivial T-action (μ_T = c ∧ id with c: T_+ → S^0 the collapse), then d = 0, because c(σ[T]) = 0 by the choice of the section σ.
- `TauCeti.HM.connesOperator_HH_polynomial` (compatibility): For A = Z[x], d(x) = dx ∈ HH_1(Z[x]) ≅ Ω^1_{Z[x]}, matching Mathlib's KaehlerDifferential.D.
- `TauCeti.HM.connesOperator_not_differential_p2` (non-example): For p = 2 and T = TR^n(Z_(2);2), d∘d = η·d ≠ 0, since η = dlog(−1) is nonzero for A = Z_(2) (Hesselholt–Madsen 2004, introduction): this is why the log Witt complex structure needs p odd.

**Acceptance.**

- On π_*(T(F_p);Z/p) = Λ{ε} ⊗ S{σ} one has d(ε) = σ (HM §4.4, HM 1997 §4).
- On TR^n_0(A;p) = W_n(A) for A = Z[x], d[x]_n is the Witt-vector differential of the de Rham–Witt complex.

**Used by.**

- HM §2.3: the homotopy groups TR^n_*(A|K;p) form a differential graded ring with differential d
- HM Proposition 4.4.3: the d²-differential of the Tate spectral sequence is Connes' operator
- HM Theorem 2.4.1: dκ = κ dlog(−p)
- KTheoryFiniteLocalFields:L.5/log-witt-complex: the differential of a log Witt complex realised by TR

**Depends on.** other roadmaps: `RefinedTraceMethods:RT.1`, `RefinedTraceMethods:RT.2`; libraries: `mathlib:KaehlerDifferential.D`.

**Sources.**

- `HesselholtMadsen.2003`, §2.1, (2.1.2), p. 31: “We recall Connes' operator. Let T be the space S(C) of complex numbers of length 1 considered as a group under multiplication. We give T the orientation induced from the standard orientation of the complex plane, and let” — Definition of the orientation used for Connes' operator.
- `HesselholtMadsen.2003`, §2.1, p. 32: “If T = HH(A) is the Hochschild spectrum of a ring A, then this definition agrees with Connes' original definition, [16, Prop. 1.4.6]. We recall from op. cit., Lemma 1.4.2, that, in general, dd = dη = ηd. Hence, d is a differential, provided that multiplication by η is trivial on π∗(T).” — Agreement with Connes' B and the relation dd = dη = ηd.
- `HesselholtMadsen.2004`, Introduction, PDF p. 5: “It appears an interesting problem to formulate and prove the analog of theorem E for p = 2. In this case, the right hand side of the statement is not a Witt complex over A with the definition given here. For (d ◦d)(x) = η · d(x), where η = tr(−1) = d log·(−1). This class is non-zero, for” — For p = 2, d∘d = η·d with η = dlog(−1) nonzero for Z_(2).

### Mod m homotopy of HZ/m-module spectra splits naturally

`L.4/moore-spectrum-splitting-for-hz-modules` · lemma

Let M_m be the mod m Moore spectrum, S^0 →m S^0 →ι M_m →β S^1, and ε ∈ π_1(HZ/m; Z/m) the unique element with β(ε) = 1. For every left HZ/m-module spectrum X there is a natural sum diagram X ⇄ M_m ∧ X ⇄ ΣX, with ι ∧ id: X → M_m ∧ X, β ∧ id: M_m ∧ X → ΣX, s: S^1 ∧ X →(ε∧id) M_m ∧ HZ/m ∧ X →(id∧μ) M_m ∧ X, and r determined by r∘ι = id and r∘s = 0. Hence π_q(X;Z/m) ≅ π_q(X) ⊕ π_{q−1}(X) naturally in HZ/m-module maps.

**Hypotheses.**

- m ≥ 2; X a left module spectrum over the Eilenberg–Mac Lane ring spectrum HZ/m (for example T(A/p) or T(k) for m = p).

**Proof.**

1. β∘s = id by the choice β(ε) = 1 and the unit axiom of the module structure.
2. Hence M_m ∧ X ≃ X ∨ ΣX, and r is the projection complementary to s; naturality follows from the naturality of μ in module maps.
3. The Bockstein sequence of StableHomotopyKTheory H.6 then splits canonically for such X, in contrast to the general case, where the splitting is not natural.

**Acceptance.**

- For X = HZ/p: π_*(HZ/p; Z/p) = Z/p in degrees 0 and 1, spanned by ι(1) and s(1) = ε.
- Non-example: for X = HZ, which is not an HZ/m-module, M_m ∧ HZ = HZ/m is not HZ ∨ ΣHZ.

**Depends on.** other roadmaps: `StableHomotopyKTheory:H.6/mod-l-homotopy-and-bockstein-sequence`, `StableHomotopyKTheory:H.5:spectra/omega-spectra-and-eilenberg-maclane`.

**Sources.**

- `HesselholtMadsen.2003`, §2.1, (2.1.1), p. 31: “Then for left HZ/m-module spectra X, we have a natural sum-diagram (2.1.1) X ι∧id −−−→ ←−−− r Mm ∧X β∧id −−−→ ←−−− s ΣX, where s is the composite S1 ∧X ε∧id −−−→Mm ∧HZ/m ∧X id ∧µ −−−→Mm ∧X, and where r is determined by the requirement that r ◦ι = id and r ◦s = 0. We” — The natural sum diagram for HZ/m-module spectra.

### The homotopy-orbit spectral sequence of W_n(A)-modules

`L.4/tr-homotopy-orbit-spectral-sequence` · lemma

Let C be a linear Waldhausen category with bi-exact strict symmetric monoidal structure whose π_0 TR is described by Witt vectors (C = C^b_q(P_A), C^b_z(P_A) or P_A, A commutative). The homotopy groups hTR^n_*(C;p) = π_* H_•(C_{p^{n−1}}, T(C)) are differential graded modules over TR^n_*(C;p), and there is a natural first-quadrant spectral sequence of W_n(A)-modules E^2_{s,t} = H_s(C_{p^{n−1}}, (F^{n−1})^* π_t T(C)) ⇒ hTR^n_{s+t}(C;p), where π_t T(C) is a W_n(A)-module through the iterated Frobenius F^{n−1}: W_n(A) → A. There are TR^n_*-linear maps F: hTR^n_* → F^* hTR^{n−1}_* and V: F^* hTR^{n−1}_* → hTR^n_* with FdV = d and FV = p.

**Hypotheses.**

- A commutative; C as stated; p a prime.

**Proof.**

1. Filter E by skeleta as a C_{p^{n−1}}-CW-complex; the E^1-term is identified by the transfer equivalence (T ∧ Σ^r C_+)^C ≃ Σ^r T (HM 1997 §4.5).
2. The module structure over T(C)^{C_{p^{n−1}}} is the action map (4.5.1) of HM 1997: T^C ∧ (T ∧ X)^C → (T ∧ T ∧ X)^C → (T ∧ X)^C; under the transfer equivalence it becomes incl ∧ 1, which gives the (F^{n−1})^*-twist.
3. F and V on homotopy orbits are induced by inclusion and transfer; FdV = d and FV = p are proved in Hesselholt 1996 §1 and HM 1997 §5 (cited by HM).

**Acceptance.**

- For C = C^b_q(P_A), in total degree 0 it gives hTR^n_0(A|K;p) ≅ (F^{n−1})^*A (used in Lemma 3.3.3).

**Depends on.** this roadmap: `L.4/norm-restriction-cofibre-sequence`, `L.4/pi0-tr-is-witt-vectors`; other roadmaps: `RefinedTraceMethods:RT.2`.

**Sources.**

- `HesselholtMadsen.2003`, §3.3, (3.3.2), p. 51: “The homotopy groups of the homotopy orbit spectra, hTRn ∗(A|K; p) = π∗(H·(Cpn−1, T(A|K))), are differential graded modules over TRn ∗(A|K; p), and there are TRn ∗(A|K; p)-linear maps F: hTRn ∗(A|K;” — The dg-module structure, F, V on homotopy orbits.
- `HesselholtMadsen.2003`, §3.3, (3.3.2), p. 51: “Moreover, there is a natural spectral sequence of Wn(A)-modules, (3.3.2) E2 s,t = Hs(Cpn−1, (F n−1)∗πtT(A|K)) ⇒hTRn s+t(A|K; p). The reader is referred to [16, §1] and [19, §5]” — The spectral sequence of W_n(A)-modules.
- `HesselholtMadsen.1997a`, §4.5, (4.5.2), PDF p. 35: “is a sequence of Wn+1(A)-modules. Moreover, (4.1.3) is a spectral sequence of Wn+1(A)-modules, (4.5.2) E2 = H∗(Cpn; (F n)∗π∗T(A)) ⇒π∗T(A)hCpn, where F n: Wn+1(A) →A is the iterated Frobenius. Indeed, the identification” — Origin of the W(A)-module structure through the iterated Frobenius.

### π_0 TR^n(A;p) is the ring of p-typical Witt vectors of length n

`L.4/pi0-tr-is-witt-vectors` · comparison

For every commutative ring A and n ≥ 1 there is a natural ring isomorphism I: W_n(A) → π_0 TR^n(A;p) = π_0 T(A)^{C_{p^{n−1}}}, where W_n(A) is Mathlib's TruncatedWittVector p n A, such that RI = IR, FI = IF and VI = IV (R the restriction of Witt vectors, F the Witt vector Frobenius, V the Verschiebung). It is given by I(a_0,…,a_{n−1}) = Σ_i V^i(Δ_{p^{n−1−i}}(a_i)), where Δ_r: A → π_0 T(A)^{C_r} is induced by the diagonal (edgewise subdivision) map; I∘[a]_n = Δ_{p^{n−1}}(a) on Teichmüller representatives. The same holds for π_0 TR^n(A|K;p) = W_n(A) when A is a complete discrete valuation ring (π_0 T(A|K) = A, node L.5/log-thh-low-degrees). In Hesselholt–Madsen 1997 the statement reads π_0 T(A)^{C_{p^n}} ≅ W_{n+1}(A).

**Hypotheses.**

- A commutative and unital; p a prime; n ≥ 1.

**Proof.**

1. Since A is commutative, π_0 THH(A) = A, and on π_0 one has R_r∘Δ_r = id and F_r∘Δ_r = r (HM 1997 Lemma 2.3.2 and (2.3.3)).
2. By induction on n using the norm–restriction sequence (node L.4/norm-restriction-cofibre-sequence) in degree 0, 0 → π_0 T(A)^{C_{p^{n−2}}} →V π_0 T(A)^{C_{p^{n−1}}} →R^{n−1} A → 0 is exact and Δ gives a set-theoretic splitting; this makes I a bijection.
3. RI = IR, FI = IF and VI = IV follow from (2.3.3); the ghost components w_i = R^i F^{n−1−i} satisfy w̄ ∘ I = w.
4. I is a ring map: for A without p-torsion the ghost map is injective (Mathlib WittVector.ghostMap); in general choose a surjection from a p-torsion-free ring and use naturality.
5. Mathlib has F and V only on the untruncated WittVector; on W_n(A) they are imported from CrystallineCohomology CR.4 ('Construct Witt complexes W_nΩ, restriction, Frobenius, Verschiebung … using the existing Witt-vector carrier'), whose degree-zero part is W_n(A).

**Acceptance.**

- A = F_p: π_0 TR^n(F_p;p) ≅ Z/p^n (HM 1997 Proposition 4.4 gives Z/p^{n+1} for C_{p^n}).
- A = Z: π_0 TR^n(Z;p) ≅ W_n(Z), and the ghost map embeds it in Z^n.
- On Teichmüller elements: R[a]_n = [a]_{n−1} and F[a]_n = [a^p]_{n−1}.

**Depends on.** this roadmap: `L.4/norm-restriction-cofibre-sequence`; other roadmaps: `CrystallineCohomology:CR.4`; libraries: `mathlib:TruncatedWittVector`, `mathlib:TruncatedWittVector.truncate`, `mathlib:WittVector.ghostMap`, `mathlib:WittVector.teichmuller`, `mathlib:WittVector.frobenius`, `mathlib:WittVector.verschiebung`.

**Sources.**

- `HesselholtMadsen.1997a`, §2.3, Theorem 2.3, PDF p. 22: “Theorem 2.3. Let A be a commutative ring. Then there is natural isomorphism of rings I: Wn+1(A) →π0T(A)Cpn such that RI = IR, FI = IF and V I = IV . Proof. The” — The natural ring isomorphism W_{n+1}(A) → π_0 T(A)^{C_{p^n}} compatible with R, F, V.
- `HesselholtMadsen.1997a`, Proof of Theorem 2.3, PDF p. 22: “Now an easy induction argument based on proposition 2.3 shows that the sequence 0 →π0T(A)Cpn−1 V −→π0T(A)Cpn Rn −−→π0T(A) →0 is exact, and since ∆pn gives a natural splitting of Rn (as a set map), we may define a bijection” — The inductive exact sequence and the formula for I.

### Hesselholt–Madsen's TR^n, R − F and TC(C;p) against the genuine and Nikolaus–Scholze definitions

`L.4/hm-conventions-agree-with-nikolaus-scholze` · comparison

Let C be a linear Waldhausen category whose T-spectrum T(C) has bounded-below underlying spectrum (for instance node L.4/log-thh-bounded-below). Write X = T(C) as a genuine p-cyclotomic spectrum. Then: (i) TR^n(C;p) = X^{C_{p^{n−1}}}, and HM's TR(C;p) = holim_R TR^n(C;p) is Nikolaus–Scholze's TR(X,p) = lim_R X^{C_{p^m}} (m = n − 1 ≥ 0); (ii) HM's TC(C;p) = hofib(R − F: TR → TR) is equivalent to the Bökstedt–Hsiang–Madsen TC^gen(X,p) = Eq(id, F: TR(X,p) ⇉ TR(X,p)), R acting as the identity on the limit; (iii) consequently, by the comparison theorem imported from RefinedTraceMethods RT.2 (Nikolaus–Scholze Theorem II.4.10), TC(C;p) ≃ TC(X,p) = fib(φ_p^{hC_{p^∞}} − can: X^{hC_{p^∞}} → (X^{tC_p})^{hC_{p^∞}}), compatibly with the trace from K(C); (iv) under these identifications Γ and Γ̂ of node L.4/norm-restriction-cofibre-sequence are the maps X^{C_{p^n}} → X^{hC_{p^n}} and X^{C_{p^{n−1}}} ≃ (Φ^{C_p}X)^{C_{p^{n−1}}} → X^{tC_{p^n}} of Nikolaus–Scholze Lemma II.4.5. The bounded-below hypothesis is part of the statement: the modern fixed-point formula is not asserted for unbounded T(C).

**Hypotheses.**

- p a prime; C a linear Waldhausen category; the underlying spectrum of T(C), and hence (by the cyclotomic structure) every geometric fixed point spectrum Φ^{C_{p^s}}T(C) ≃ T(C), is bounded below.

**Proof.**

1. (i) is the index shift n − 1 = m together with the definition of TR in Nikolaus–Scholze Definition II.4.4.
2. (ii) On holim_R the map induced by R is the shift map, canonically equivalent to the identity; hence the homotopy fibre of R − F is the homotopy equaliser of id and F.
3. (iii) Apply the comparison of RefinedTraceMethods RT.2 ('State bounded-below/completion hypotheses when using the modern fixed-point formula, and prove agreement with the classical genuine-equivariant TR/TC formulation used by local K-theory calculations'), whose model statement is Nikolaus–Scholze Theorem II.4.10; its hypothesis is satisfied by assumption.
4. (iv) Nikolaus–Scholze Lemma II.4.5 and Proposition II.4.6 identify the pullback square X^{C_{p^n}} → (Φ^{C_p}X)^{C_{p^{n−1}}} over X^{hC_{p^n}} → X^{tC_{p^n}}, which is HM's map of cofibration sequences after the identification Φ^{C_p}X ≃ X.

**Acceptance.**

- For C = P_{F_p}: both sides give TC ≃ HZ_p ∨ Σ^{−1}HZ_p.
- For C = C^b_q(P_A), A a complete DVR, the hypothesis holds by node L.4/log-thh-bounded-below, so the Nikolaus–Scholze formula computes HM's TC(A|K;p).

**Depends on.** this roadmap: `L.4/p-typical-tc`, `L.4/norm-restriction-cofibre-sequence`; other roadmaps: `RefinedTraceMethods:RT.2`.

**Sources.**

- `NikolausScholze.2018`, Theorem II.4.10, PDF p. 52: “Theorem II.4.10. Let X be a genuine p-cyclotomic spectrum such that the under-lying spectrum is bounded below. Then there is a canonical fiber sequence TCgen(X, p) →XhCp∞ ϕ hCp∞ p −can −−−−−−−−→(XtCp)hCp∞ In particular we get an equivalence TCgen(X, p) ≃TC(X, p). Proof. By” — The comparison TC^gen(X,p) ≃ TC(X,p) for bounded-below genuine p-cyclotomic X.
- `NikolausScholze.2018`, Definition II.4.4, PDF p. 50: “Definition II.4.4. Let X be a genuine p-cyclotomic spectrum. Define TR(X, p) = lim ←−R XCpn , which has an action of F, and TCgen(X, p) := Eq  TR(X, p) id / F / TR(X, p)  ≃lim ←−R Eq  XCpn R / F / XCpn−1  . To compare this with our definition, we need the” — TR(X,p) = lim_R X^{C_{p^n}} and TC^gen as the equaliser of id and F.
- `HesselholtMadsen.2003`, §1.1, p. 8: “There is a natural cofibration sequence TC(C; p) →TR(C; p) R−F −−−→TR(C; p) →Σ TC(C; p), where TC(C; p) is the topological cyclic homology” — HM's convention TC(C;p) = fibre of R − F.

### Integral and p-typical topological cyclic homology agree after p-completion

`L.4/integral-and-p-typical-tc-agree-after-completion` · comparison

For a cyclotomic spectrum T, the projections TC(T) → TC(T;p) induce an equivalence of TC(T) with the fibre product of the TC(T;p) over T, and TC(T)^_p ≃ TC(T;p)^_p. Hence all p-adic and mod p^v statements about TC(C;p) in this roadmap are statements about the integral TC(T(C)) after p-completion.

**Hypotheses.**

- T a cyclotomic spectrum in the sense of HM 1997 Definition 1.2 (for instance T(C)).

**Proof.**

1. Evaluate the realisations |I_p| ≃ S^1 and |I| ≃ Π'_p |I_p| of the indexing categories (HM 1997 (3.2.1)).
2. Compare the homotopy limits over I and over the I_p, using that the fibres of the relevant maps are profinitely complete (HM 1997 Lemma 3.5 and Corollary 3.5).

**Acceptance.**

- For T = T(F_p): TC(T)^_p ≃ TC(T;p) ≃ HZ_p ∨ Σ^{−1}HZ_p, while for ℓ ≠ p, TC(T;ℓ)^_ℓ ≃ 0 since T(F_p) is p-local.
- Nikolaus–Scholze Remark II.6.10: the mapping-spectrum TC is Goodwillie's integral TC.

**Depends on.** this roadmap: `L.4/p-typical-tc`; other roadmaps: `RefinedTraceMethods:RT.2`, `StableHomotopyKTheory:H.6/l-adic-completion-milnor-sequence`.

**Sources.**

- `HesselholtMadsen.1997a`, §3.1, Theorem 3.1, PDF p. 23: “Theorem 3.1. The projections TC(T) →TC(T; p) induce an equivalence of TC(T) with the fiber product of the TC(T; p)'s over T. Moreover, the functors agree after p-completion, TC(T) ∧ p” — Statement of the comparison.

### T(k), T(A) and T(A|K) are connective, so the modern comparison applies

`L.4/log-thh-bounded-below` · lemma

Let A be a discrete valuation ring with fraction field K and residue field k. The T-spectra T(k), T(A) and T(A|K) of Definition 1.5.5 are connective (π_q = 0 for q < 0), and π_0 T(A|K) ≅ A. Since each is cyclotomic, all geometric fixed points Φ^{C_{p^s}} are connective as well, so the hypotheses of the Nikolaus–Scholze comparison (node L.4/hm-conventions-agree-with-nikolaus-scholze) and of Corollary II.4.9 of Nikolaus–Scholze hold for them.

**Hypotheses.**

- A a discrete valuation ring (for the calculations: complete, of mixed characteristic (0,p), with perfect residue field).

**Proof.**

1. T(k) ≃ T(P_k) and T(A) ≃ T(P_A) as cyclotomic spectra (node L.4/dvr-tr-agrees-with-ring-tr), and THH of a discrete ring is connective (RefinedTraceMethods RT.2).
2. The localisation sequence T(k) →i^! T(A) →j_* T(A|K) → ΣT(k) (node L.4/tr-localization-sequence, n = 1) shows that the cofibre T(A|K) of a map of connective spectra is connective: π_{−1}T(A|K) injects into π_{−2}T(k) = 0 and surjects from π_{−1}T(A) = 0.
3. In degree 0, i^!: π_0 T(k) = k → π_0 T(A) = A is zero (a torsion group to a torsion-free group) and π_{−1}T(k) = 0, so π_0 T(A|K) ≅ A.
4. The cyclotomic structure gives Φ^{C_p}T ≃ T for each of the three spectra, so every Φ^{C_{p^s}} is connective.

**Acceptance.**

- π_0 T(Z_p|Q_p) = Z_p and π_q T(Z_p|Q_p) = 0 for q < 0.
- TR^n_0(A|K;p) = W_n(A) (node L.4/pi0-tr-is-witt-vectors).

**Depends on.** this roadmap: `L.4/tr-localization-sequence`, `L.4/dvr-tr-agrees-with-ring-tr`; other roadmaps: `RefinedTraceMethods:RT.2`; libraries: `mathlib:IsDiscreteValuationRing`.

**Sources.**

- `HesselholtMadsen.2003`, Proof of Proposition 2.3.4, p. 39: “and note that i!: πqT(k) →πqT(A) is zero, if q = 0, 1. Indeed, for q = 0 this is a map from a torsion group to a torsion-free group, and for q = 1 the domain is isomorphic to the group Ω1 k which vanishes since k is a perfect, [19, Lemma 5.5]. This proves the statement” — i^! vanishes in degrees 0 and 1, giving π_0 T(A|K) = A.
- `NikolausScholze.2018`, Theorem II.4.10, PDF p. 52: “Theorem II.4.10. Let X be a genuine p-cyclotomic spectrum such that the under-lying spectrum is bounded below. Then” — The comparison needs a bounded-below underlying spectrum.

### Hesselholt–Madsen's model of Tate cohomology and its cup product

`L.4/tate-cohomology-hm-model` · definition

Let G be a finite group, k a commutative ring, ε: P → k a projective resolution over kG and P̃ the mapping cone of ε (a distinguished triangle P → k → P̃ → ΣP). For a left kG-module M, Ĥ^*(G,M) := H_{−*}((P̃ ⊗ Hom(P,M))^G). The norm map (P ⊗ M)_G → (P ⊗ M)^G and id ⊗ ε^*: (P ⊗ M)^G → (P ⊗ Hom(P,M))^G are quasi-isomorphisms (Lemma 4.1.2), whence natural isomorphisms Ĥ^i(G,M) ≅ H^i(G,M) for i ≥ 1, Ĥ^i(G,M) ≅ H_{−i−1}(G,M) for i ≤ −2 and an exact sequence 0 → Ĥ^{−1} →∂ H_0 →N H^0 → Ĥ^0 → 0; so Ĥ^* agrees with Tate cohomology defined by complete resolutions (Mathlib's tateCohomology). The cup product Ĥ^*(G,M) ⊗ Ĥ^*(G,M') → Ĥ^*(G,M ⊗ M') is induced by chosen chain maps P → P ⊗ P and P̃ ⊗ P̃ → P̃ lifting k ≅ k ⊗ k; it makes Ĥ^*(G,k) a graded-commutative ring and Ĥ^*(G,M) a module over it.

**Hypotheses.**

- G finite; k commutative; P a projective kG-resolution of k (the answer is independent of P up to canonical isomorphism).

**Proof.**

1. Norm isomorphism: reduce to M = kG ⊗ M' by additivity; kG ⊗ M ≅ kG ⊗ ε^*η^*M is induced, so N is an isomorphism (Lemma 4.1.2).
2. Filter the double complex (P ⊗ Hom(P,M))^G by the first factor; the strongly convergent fourth-quadrant spectral sequence reduces the quasi-isomorphism id ⊗ ε^* to finitely generated projective P_s, where it follows from duality DP_s = Hom(P_s,k) (Lemma 4.1.2).
3. The triangle P → k → P̃ gives the comparison with H^i, H_{−i−1} and the four-term sequence (Remark 4.1.4); comparing with a complete resolution P̂ gives the identification with Mathlib's tateCohomology.
4. Chain maps P → P ⊗ P and P̃ ⊗ P̃ → P̃ exist and are unique up to chain homotopy, so the cup product is well defined (Definition 4.1.5).

**API.**

- `TauCeti.HM.tateComplex` (constructor): The complex (P̃ ⊗ Hom(P,M))^G for a projective resolution P of k.
- `TauCeti.HM.tateCohomology` (constructor): Ĥ^n(G,M) := H_{−n}((P̃ ⊗ Hom(P,M))^G).
- `TauCeti.HM.tateCohomology.map` (functoriality): A kG-linear map M → M' induces Ĥ^n(G,M) → Ĥ^n(G,M'), with map_id and map_comp.
- `TauCeti.HM.tateCohomology.isoTateCohomology` (compatibility): Ĥ^n(G,M) ≅ (Mathlib) tateCohomology M n, naturally in M.
- `TauCeti.HM.tateCohomology.isoGroupCohomology` (compatibility): For n ≥ 1, Ĥ^n(G,M) ≅ groupCohomology M n.
- `TauCeti.HM.tateCohomology.lowDegreeExact` (other): 0 → Ĥ^{−1}(G,M) → H_0(G,M) →N H^0(G,M) → Ĥ^0(G,M) → 0 is exact.
- `TauCeti.HM.tateCohomology.cup` (structure): The cup product, making Ĥ^*(G,k) a graded-commutative ring and Ĥ^*(G,M) a graded module.
- `TauCeti.HM.tateCohomology.cup_assoc` (relation): The cup product is associative and unital with unit the class of y_0 ⊗ Nx_0^*.

**Unit tests.**

- `TauCeti.HM.tateCohomology_C3_F3` (computation): For G = C_3 and k = M = F_3: Ĥ^n(C_3,F_3) ≅ F_3 for every n ∈ Z.
- `TauCeti.HM.tateCohomology_trivialGroup` (degenerate): For G the trivial group, Ĥ^n(G,M) = 0 for all n.
- `TauCeti.HM.tateCohomology_eq_mathlib` (compatibility): For G = C_5 and M = Z with trivial action: Ĥ^0 ≅ Z/5 and Ĥ^{−1} = 0, as for Mathlib's tateCohomology and Tau Ceti's H0LinearEquivTrivialIntZModCard.
- `TauCeti.HM.tateCohomology_not_groupHomology` (non-example): Ĥ^0(C_2,Z) = Z/2 while H^0(C_2,Z) = Z and H_0(C_2,Z) = Z: Tate cohomology in degree 0 is neither ordinary cohomology nor homology.

**Acceptance.**

- For G = C_r cyclic and M = k trivial: Ĥ^0(C_r,k) = k/rk and Ĥ^{−1}(C_r,k) = k[r] (the r-torsion).
- Ĥ^*(G,M) = 0 for M induced (M = kG ⊗ M').

**Used by.**

- HM Lemma 4.2.1: the ring Ĥ^*(C,k) for C cyclic of odd order
- HM Lemma 4.3.4: Ê^2_{s,t}(G,T) ≅ Ĥ^s(G,π_t T), identified with this model on E^1
- HM Proposition 4.3.5: the pairing of Tate spectral sequences is the cup product on E^2
- HM Corollary 4.4.2: the Bockstein on Ĥ^*(C_p,F_p) is computed in this model

**Depends on.** libraries: `mathlib:tateCohomology`, `mathlib:groupCohomology`, `tauceti:Rep.FiniteCyclicGroup.periodicIso`.

**Sources.**

- `HesselholtMadsen.2003`, Definition 4.1.1, p. 59: “Definition 4.1.1. Let M be a left kG-module. The Tate cohomology of G with coefficients in M is given by ˆH∗(G, M) = H−∗(( ˜P ⊗Hom(P, M))G).” — The definition of Tate cohomology.
- `HesselholtMadsen.2003`, Remark 4.1.4, p. 61: “Remark 4.1.4. The triangle preceding Definition 4.1.1 and Lemma 4.1.2 gives rise to natural isomorphisms ˆHi(G, M) ∼= ( Hi(G, M) if i ≥1 H−i−1(G, M) if i ≤−1 and to a natural exact sequence 0 →ˆH−1(G, M) ∂ −→H0(G, M) N −→H0(G, M) i −→ˆH0(G, M) →0. Hence, the definition of Tate” — Comparison with ordinary cohomology and homology and the four-term sequence.
- `HesselholtMadsen.2003`, Definition 4.1.5, p. 61: “Definition 4.1.5. The cup product ˆH∗(G, M) ⊗ˆH∗(G, M′) →ˆH∗(G, M ⊗M′) is the map on homology induced by the composite ( ˜P ⊗Hom(P, M))G ⊗( ˜P ⊗Hom(P, M′))G →(” — Definition of the cup product.

### Tate cohomology of a cyclic group of odd order with coefficients killed by its order

`L.4/tate-cohomology-ring-of-odd-cyclic-group` · lemma

Let C be cyclic of odd order r with generator g, and k a commutative ring with r = 0 in k. Then, as a graded k-algebra, Ĥ^*(C,k) = Λ{u} ⊗ S{t^{±1}}, where t and u are the classes of y_0 ⊗ Nx_2^* and y_0 ⊗ Nx_1^* in the standard complex (|t| = 2 in cohomological degree, |u| = 1); the classes 1, ut^{−1} and t^{−1} are represented by y_0 ⊗ Nx_0^*, −Ny_1 ⊗ Nx_0^* and Ny_2 ⊗ Nx_0^*. Moreover the boundary map ∂: Ĥ^{−1}(C,k) → H_0(C,k) takes ut^{−1} to the class of −1 (Addendum 4.2.2).

**Hypotheses.**

- r = |C| odd.
- r = 0 in k (e.g. k = F_p and C = C_{p^n}, p odd).

**Proof.**

1. Use the standard periodic resolution W with dx_s = Nx_{s−1} (s even) and (g−1)x_{s−1} (s odd), and W̃ with the stated differentials.
2. The fourth-quadrant spectral sequence of (W̃ ⊗ DW)^C degenerates, giving k in each degree generated by y_0 ⊗ Nx^*_{−t} and Ny_s ⊗ Nx_0^*.
3. Compute products with explicit diagonal Ψ: W → W ⊗ W and product Φ: W̃ ⊗ W̃ → W̃: for m, n odd the product carries the factor −r(r−1)/2, which is 0 in k because r is odd and r = 0 in k; hence u² = 0.
4. Ny_2 ⊗ Nx_2^* is homologous to the unit, so Ny_2 ⊗ Nx_0^* represents t^{−1}; an explicit null-homotopy shows Ny_1 ⊗ Nx_0^* represents −ut^{−1}.
5. Addendum: trace the class −Ny_1 ⊗ Nx_0^* through the defining composite of ∂ to obtain −1.

**Acceptance.**

- C = C_3, k = F_3: Ĥ^*(C_3,F_3) = Λ{u} ⊗ F_3[t^{±1}], with u² = 0.
- Non-example: C = C_2, k = F_2: the factor −r(r−1)/2 = −1 ≠ 0 and u² = t ≠ 0, so the lemma needs r odd; Ĥ^*(C_2,F_2) = F_2[u^{±1}].

**Depends on.** this roadmap: `L.4/tate-cohomology-hm-model`.

**Sources.**

- `HesselholtMadsen.2003`, Lemma 4.2.1, p. 62: “Lemma 4.2.1. Suppose that the order of C is odd and congruent to zero in k. Then as a graded k-algebra ˆH∗(C, k) = Λ{u} ⊗S{t±1} where t and u are the classes of y0⊗Nx∗ 2 and y0⊗Nx∗ 1, respectively. Moreover, the classes 1, ut−1 and t−1 are represented by the elements y0 ⊗Nx∗ 0, −Ny1” — Statement of the ring structure and representatives.
- `HesselholtMadsen.2003`, Addendum 4.2.2, p. 64: “Addendum 4.2.2. The boundary map ∂: ˆH−1(C, k) →H0(C, k) takes ut−1 to the class of −1. Proof. The boundary” — The boundary of ut^{−1}.

### The multiplicative Tate spectral sequence of a G-spectrum

`L.4/multiplicative-tate-spectral-sequence` · construction · planet “Tate spectral sequence”

For a finite group G, a G-spectrum T and E a free contractible G-CW-complex, the Tate spectrum Ĥ(G,T) = (Ẽ ∧ ΓF(E_+,T))^G carries a filtration X̄_n = ∪_{r+s≤n} X̄_{r,s} by sub-G-CW-spectra obtained from the CW-filtrations of Ẽ and E, whose spectral sequence Ê^*(G,T) ⇒ π_*(Ĥ(G,T)) converges conditionally (Boardman), with Ê^1_{*,t} ≅ (P̃ ⊗ Hom(P, π_t T))^G and hence Ê^2_{s,t} ≅ Ĥ^{−s}(G, π_t T). A pairing T ∧ T' → T'' induces a pairing of spectral sequences which on E^2 is the cup product of node L.4/tate-cohomology-hm-model; for an associative G-ring spectrum T it is a spectral sequence of bigraded rings, and E^2 ≅ Ĥ^*(G, π_*T) as bigraded rings. This spectral sequence is canonically isomorphic from E^2 on to the one obtained from Greenlees' Z-graded filtration of Ẽ (Remark 4.3.6). For T a T-spectrum and G = C_{p^n} ⊂ T, it is a spectral sequence of bigraded π̄_*(T^{C_{p^n}})-algebras.

**Hypotheses.**

- G finite; T a G-spectrum (a G-ring spectrum for multiplicativity); E = S(C^∞) with the standard C-CW-structure when G = C is cyclic.

**Proof.**

1. Define the pairing Ĥ(G,T) ∧ Ĥ(G,T') → Ĥ(G,T ∧ T') by cellular G-equivalences E_+ → E_+ ∧ E_+ and Ẽ ∧ Ẽ → Ẽ, unique up to G-homotopy by obstruction theory ((4.3.3)).
2. Form the double filtration X_{r,s} = Ẽ_r ∧ ΓF(E/E_{−s−1},T) and its homotopy-colimit replacement X̄_{r,s}; the exact couple (4.3.2) gives the spectral sequence, conditionally convergent since ∪X̄_s = X̄ and holim X̄_s^G is contractible.
3. Identify Ê^1 with (P̃ ⊗ Hom(P, π_t T))^G using the canonical map π_*((X ∧ Y)^G) → (π_*(X ∧ Y))^G for X a wedge of free G-cells, Hurewicz and duality (Lemma 4.3.4).
4. Check that the cellular pairing preserves the filtration and induces the cup product on E^1 and E^2 (Proposition 4.3.5).
5. Compare with Greenlees' filtration via the complete resolution P̂ (Remark 4.3.6).

**API.**

- `TauCeti.HM.tateSpectralSequence` (constructor): The spectral sequence Ê^r(G,T) with Ê^2_{s,t} = Ĥ^{−s}(G,π_t T), abutting to π_{s+t}Ĥ(G,T).
- `TauCeti.HM.tateSpectralSequence.E1` (characterisation): Ê^1_{*,t}(G,T) ≅ (P̃ ⊗ Hom(P, π_t T))^G as complexes.
- `TauCeti.HM.tateSpectralSequence.conditionallyConvergent` (other): The spectral sequence converges conditionally in Boardman's sense.
- `TauCeti.HM.tateSpectralSequence.pairing` (structure): A pairing T ∧ T' → T'' induces pairings Ê^r(G,T) ⊗ Ê^r(G,T') → Ê^r(G,T'') satisfying the Leibniz rule d^r(xx') = d^r(x)x' + (−1)^{|x|} x d^r(x').
- `TauCeti.HM.tateSpectralSequence.E2_cup` (compatibility): On E^2 the pairing is the cup product of Ĥ^*(G,−).
- `TauCeti.HM.tateSpectralSequence.map` (functoriality): A G-map T → T' induces a map of spectral sequences, identity maps to identity, composites to composites.
- `TauCeti.HM.tateSpectralSequence.greenlees` (compatibility): The spectral sequence is isomorphic from E^2 on to the one obtained from Greenlees' Z-graded filtration of Ẽ.

**Unit tests.**

- `TauCeti.HM.tateSpectralSequence_Fp` (computation): For T = M_p ∧ T(F_p), G = C_p: Ê^3 = Λ{u_1} ⊗ S{t^{±1}} and π_*(Ĥ(C_p,T(F_p));Z/p) ≅ Λ{u_1} ⊗ S{t^{±1}} (HM 1997 Lemma 4.3).
- `TauCeti.HM.tateSpectralSequence_trivialGroup` (degenerate): For G trivial, Ĥ(G,T) ≃ ∗ and Ê^2 = 0.
- `TauCeti.HM.tateSpectralSequence_EM` (compatibility): For T = Hk with trivial C-action, k = F_p, C = C_p: the spectral sequence collapses at E^2 = Ĥ^{−*}(C_p,F_p), and π_*Ĥ(C_p,HF_p) ≅ Ĥ^{−*}(C_p,F_p).
- `TauCeti.HM.tateSpectrum_ne_fixedPoints` (non-example): For T = HZ with trivial C_p-action, π_0Ĥ(C_p,HZ) = Ĥ^0(C_p,Z) = Z/p, while π_0 of the homotopy fixed points F(E_+,HZ)^{C_p} is H^0(C_p,Z) = Z: a definition omitting the smash with Ẽ gives the homotopy fixed point spectrum, not the Tate spectrum.

**Acceptance.**

- For T = M_p ∧ T(F_p) and G = C_p: Ê^2 = Λ{u_1, ε} ⊗ S{t^{±1}, σ} and the nonzero differentials are generated by d²(ε) = tσ (HM §4.4; HM 1997 Lemma 4.3).
- For T with trivial G-action and π_*T = π_0T = k: Ê^2 = Ĥ^{−*}(G,k) is concentrated on the line t = 0 and the spectral sequence collapses.

**Used by.**

- HM §5: Ê^*(C_{p^n}, T(A|K)) computes π̄_* Ĥ(C_{p^n}, T(A|K)) and hence TR^n(A|K;p,Z/p) in degrees ≥ 0
- HM Appendix A: Ê^*(C_{p^n}, T(k(Π))) for truncated polynomial algebras
- HM 1997 §4: the Tate spectral sequence for T(F_p) and T(k)

**Depends on.** this roadmap: `L.4/tate-cohomology-hm-model`; other roadmaps: `RefinedTraceMethods:RT.2`, `StableHomotopyKTheory:H.6/l-adic-completion-milnor-sequence`, `StableHomotopyKTheory:H.6/mod-l-homotopy-and-bockstein-sequence`.

**Sources.**

- `HesselholtMadsen.2003`, §4.3, Lemma 4.3.4, p. 67: “gives rise to a conditionally convergent spectral sequence ˆE∗(G, T) = E∗( ¯X) ⇒π∗(ˆH(G, T)). Lemma 4.3.4. There is a canonical isomorphism of complexes ˆE1 ∗,t(G, T) ∼= ( ˜P ⊗Hom(P, πtT))G and hence ˆE2 s,t(G, T) ∼= ˆHs(G, πtT). Proof. The inclusions ¯Xr,s” — Conditional convergence and the E^1/E^2 identification.
- `HesselholtMadsen.2003`, Proposition 4.3.5, p. 68: “Proposition 4.3.5. Let T and T ′ be two G-spectra. Then the pairing of Tate spectra (4.3.3) induces a pairing of the associated spectral sequences. On E2-terms, this pairing corresponds to the pairing on Tate cohomology ˆH∗(G, π∗T) ⊗ˆH∗(G, π∗T ′) →ˆH∗(G, π∗(T ∧T ′)) under the” — Multiplicativity with the cup product on E^2.

### The Tate spectral sequence of a T-spectrum is a module over the cellular chains of T/C

`L.4/tate-spectral-sequence-connes-module` · lemma

Let C ⊂ T be finite cyclic and T a T-spectrum. Then Ê^*(C,T) is a spectral sequence of left Λ_C-modules, Λ_C = C_*(T/C;k) with generator x_1 representing the fundamental class. If a ∈ π_*(Ĥ(C,T)) is represented by the infinite cycle z ∈ E^1_{s,t} and x_1·z ∈ E^1_{s+1,t} is nonzero, then x_1·z is an infinite cycle and represents Connes' operator da.

**Hypotheses.**

- C ⊂ T finite cyclic of order r; E = S(C^∞) with its T-action and the C-CW-structure of HM §4.4.

**Proof.**

1. The T-action on E, Ẽ and T induces a filtration-preserving map ω: T/C_+ ∧ X̄^C → X̄^C.
2. On E^1 this is the composite Λ_C ⊗ (W̃ ⊗ Hom(W,π_*T))^C → (W̃ ⊗ Hom(W, π_*T))^C built from the norm, the Λ-module structures x_1·x_s = x_{s+1} (s even), x_1·y_s = −y_{s+1} (s odd) (HM §4.4).
3. Connes' operator is multiplication by the fundamental class followed by the action (node L.4/connes-operator), which gives the second statement.

**Acceptance.**

- In Ê^*(C_p,T(F_p)), x_1·(−Ny_1 ⊗ Nx_0^*) = Ny_2 ⊗ Nx_0^*, which gives d(ε) = σ in homotopy (Corollary 4.4.2).

**Depends on.** this roadmap: `L.4/multiplicative-tate-spectral-sequence`, `L.4/connes-operator`.

**Sources.**

- `HesselholtMadsen.2003`, Proposition 4.4.1, p. 71: “Proposition 4.4.1. Let T be a T-spectrum. Then ˆE∗(C, T) is a spectral sequence of left ΛC-modules. Moreover, if the class a ∈π∗(ˆH(C, T)) is represented by the infinite cycle z ∈E1 s,t, and if x1 ·z ∈E1 s+1,t is nonzero, then x1 ·z is an infinite cycle and represents the class of da” — Statement.

### The d²-differential of the Tate spectral sequence is Connes' operator

`L.4/tate-d2-is-connes-operator` · lemma

Let T be a T-spectrum and C ⊂ T a subgroup whose order r is odd and annihilates π_*(T). Then in Ê^2(C,T) = Ĥ^*(C,Z/r) ⊗ π_*(T) ⇒ π_*(Ĥ(C,T)), d²(γ ⊗ τ) = γt ⊗ dτ, where d is Connes' operator.

**Hypotheses.**

- r = |C| odd and r·π_*(T) = 0 (e.g. T = M_p ∧ T(A|K), C = C_{p^n}, p odd).

**Proof.**

1. In the T-Tate spectral sequence Ê^*(T,T), with E^2 = S{t^{±1}} ⊗ π_*(T), d² is given by the stated formula (Hesselholt 1996 Lemma 1.4.2).
2. The inclusion Ĥ(T,T) → Ĥ(C,T) induces on E^2 the inclusion sending t to the generator t of Lemma 4.2.1 when r is odd and annihilates π_*(T).
3. Every C-spectrum is a module over the sphere C-spectrum, so it suffices that u is a d²-cycle in Ê^*(C,S^0); this holds since π_1(S^0;Z/r) = 0 for r odd.

**Acceptance.**

- For T(F_p) with p odd: d²(ε) = tσ.
- For T = M_p ∧ T(A|K): d²(π_K) = t dlog π_K · π_K and d²(κ) = t dlog(−p)·κ (HM §5.1).

**Depends on.** this roadmap: `L.4/tate-spectral-sequence-connes-module`, `L.4/tate-cohomology-ring-of-odd-cyclic-group`, `L.4/connes-operator`.

**Sources.**

- `HesselholtMadsen.2003`, Proposition 4.4.3, p. 73: “Proposition 4.4.3. Let T be a T-spectrum and let C ⊂T be a subgroup whose order r is odd and annihilates π∗(T). Then the d2-differential in ˆE2(C, T) = ˆH∗(C, Z/r) ⊗π∗(T) ⇒π∗(ˆH(C, T)) is given by d2(γ ⊗τ) = γt ⊗dτ, where d is Connes' operator. Proof. It was proved in [16, Lemma” — Statement of the d²-formula.

### An element chase in a 3 × 3 diagram of cofibration sequences

`L.4/three-by-three-lemma` · lemma

Given a 3 × 3 diagram of cofibration sequences E_{ij} (rows E_{i1} → E_{i2} → E_{i3} → ΣE_{i1} with maps f_{ij}, columns with maps g_{ij}, the bottom-right square anticommuting as usual), and classes e_{ij} ∈ π_*E_{ij} with g_{33}(e_{33}) = Σf_{12}(e_{12}) and f_{33}(e_{33}) = Σg_{21}(e_{21}), the sum f_{21}(e_{21}) + g_{12}(e_{12}) lies in the image of π_*E_{11} → π_*E_{22}.

**Hypotheses.**

- The diagram is a 3 × 3 diagram of distinguished triangles in the stable homotopy category with the sign conventions of HM §2.1 (the square Σ^2 corner carries the sign −1).

**Proof.**

1. Standard verification from the octahedral axiom; HM state the lemma without proof, as a known property of triangulated categories (recorded as a gap for the formaliser: the verification with HM's sign conventions).

**Acceptance.**

- Applied to the smash product of S^0 →p S^0 → M_p → S^1 with the norm–restriction sequence, it shows that the connecting map TR^1_2(A|K;p,Z/p) → hTR^2_1(A|K;p,Z/p) is minus the connecting map of multiplication by p on the short exact sequence 0 → hTR^2_1 → TR^2_1 → TR^1_1 → 0 (proof of Addendum 3.3.9).

**Depends on.** other roadmaps: `StableHomotopyKTheory:H.5:spectra/omega-spectra-and-eilenberg-maclane`, `StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence`.

**Sources.**

- `HesselholtMadsen.2003`, Lemma 3.3.10, p. 58: “Lemma 3.3.10. Given a 3 × 3-diagram of cofibration sequences E11 f11 −−−→ E12 f12 −−−→ E13 f13 −−−→ ΣE11 yg11 yg12” — Statement (diagram).
- `HesselholtMadsen.2003`, Lemma 3.3.10, p. 58: “Then the sum f21(e21) + g12(e12) is in the image of π∗E11 →π∗E22.” — Conclusion of the lemma.

### Φ turns exact simplicial homotopies into homotopies

`L.4/exact-simplicial-homotopy-invariance` · lemma

Let Φ satisfy axioms (i)–(iii) of HM §1.3. An exact simplicial homotopy Δ[1]_• × C_• → D_• between exact simplicial functors f, g: C_• → D_• induces a homotopy Δ[1] × Φ(C_•) → Φ(D_•); hence Φ takes exact simplicial homotopy equivalences to homotopy equivalences. Φ is a functor from categories with cofibrations and weak equivalences to pointed spaces, extended to simplicial objects by Φ(C_•) = |[n] ↦ Φ(C_n)|, satisfying: (i) the trivial category goes to a point; (ii) Φ(C × D) → Φ(C) × Φ(D) is a weak equivalence; (iii) a levelwise weak equivalence of simplicial objects induces a weak equivalence. The case of interest is Φ(C) = THH(C; S^V)^{C_r}.

**Hypotheses.**

- Φ satisfies axioms (i)–(iii) of HM §1.3.
- f, g exact simplicial functors of simplicial categories with cofibrations and weak equivalences.

**Proof.**

1. Δ[1]_k × Φ(C_k) and Δ[1]_k × C_k are coproducts indexed by the set Δ[1]_k, so the universal property gives a natural map Δ[1]_k × Φ(C_k) → Φ(Δ[1]_k × C_k); realise.

**Acceptance.**

- For Φ = ob (Waldhausen's case) this is Waldhausen's lemma that exact simplicial homotopies induce homotopies of K-theory spaces.

**Depends on.** other roadmaps: `GeneralAlgebraicKTheory:K.4:construction/waldhausen-categories-and-S-construction`, `StableHomotopyKTheory:H.2/bisimplicial-realization-lemma`.

**Sources.**

- `HesselholtMadsen.2003`, Lemma 1.3.1, p. 15: “Lemma 1.3.1. An exact simplicial homotopy ∆[1]· × C· →D· induces a homotopy ∆[1] × Φ(C·) →Φ(D·). Hence Φ takes exact simplicial homotopy equivalences to homotopy equivalences.” — Statement.

### Natural transformations through weak equivalences give exact simplicial homotopies on N^w

`L.4/weak-equivalence-transformations-give-exact-homotopies` · lemma

An exact functor f: C → D of categories with cofibrations and weak equivalences induces an exact simplicial functor N^w_• f: N^w_• C → N^w_• D, and a natural transformation through weak equivalences of D between two such functors f and g induces an exact simplicial homotopy between N^w_• f and N^w_• g.

**Hypotheses.**

- C, D categories with cofibrations and weak equivalences; N^w_• the full simplicial subcategory of the nerve category on N_•(wC).

**Proof.**

1. View [1] as a category with cofibrations and weak equivalences whose nonidentity map is a weak equivalence but not a cofibration; the transformation is an exact functor [1] × C → D.
2. The homotopy is the composite Δ[1]_• × N^w_• C → N^w_•[1] × N^w_• C → N^w_•([1] × C) → N^w_• D (note N^w_•[n] is not discrete).

**Acceptance.**

- Applied to the degeneracies of the nerve it gives Lemma 1.3.10 (swallowing) and the identification T(C^b_z(M_k)) ≃ T(M_k).

**Depends on.** other roadmaps: `GeneralAlgebraicKTheory:K.4:construction/waldhausen-categories-and-S-construction`, `StableHomotopyKTheory:H.1/natural-transformations-adjoints-contractibility`.

**Sources.**

- `HesselholtMadsen.2003`, Lemma 1.3.2, p. 16: “Lemma 1.3.2. An exact functor of categories with cofibrations and weak equivalences f: C →D induces an exact simplicial functor Nw· f: Nw· C →Nw· D. A natural transformation through weak equivalences of D between two such functors f and g induces an exact simplicial homotopy” — Statement.

### Adding the isomorphism nerve does not change Φ(S_• C)

`L.4/isomorphism-nerve-degeneracy-equivalence` · lemma

(a) (Waldhausen, Lemma 1.4.1) A natural isomorphism between exact functors f, g: C → D of categories with cofibrations induces an exact simplicial homotopy Δ[1]_• × S_• C → S_• D from S_• f to S_• g. (b) For a category with cofibrations C with iC its isomorphisms, the degeneracies in the nerve direction induce a weak equivalence Φ(S_• C) → Φ(N^i_• S_• C).

**Hypotheses.**

- Φ satisfies axioms (i)–(iii) of HM §1.3; C a category with cofibrations.

**Proof.**

1. (a) is Waldhausen's Lemma 1.4.1 (cited by HM; Waldhausen's paper not read, see GeneralAlgebraicKTheory K.4:construction for the S-construction).
2. (b) The iterated degeneracy s: C = N^i_0 C → N^i_k C has the retraction θ^* with θ(0) = 0, and id ≅ θ^* naturally; by (a), S_• s is an exact simplicial homotopy equivalence; conclude by node L.4/exact-simplicial-homotopy-invariance and axiom (iii).

**Acceptance.**

- For Φ = ob, (b) is the equivalence of iS_• C with its nerve-thickened version used in Waldhausen K-theory.

**Depends on.** this roadmap: `L.4/exact-simplicial-homotopy-invariance`; other roadmaps: `GeneralAlgebraicKTheory:K.4:construction/waldhausen-categories-and-S-construction`.

**Sources.**

- `HesselholtMadsen.2003`, Lemma 1.3.3, p. 16: “Lemma 1.3.3 ([48, Lemma 1.4.1]). Let f, g: C →D be a pair of exact functors of categories with cofibrations. A natural isomorphism from f to g induces an exact simplicial homotopy ∆[1]· × S·C →S·D from S·f to S·g. Corollary 1.3.4. Let C be a” — Part (a), cited from Waldhausen.
- `HesselholtMadsen.2003`, Corollary 1.3.4, p. 16: “Corollary 1.3.4. Let C be a category with cofibrations, and let iC be the subcategory of isomorphisms. Then the map induced from the degeneracies in the nerve direction induces a weak equivalence Φ(S·C) ∼ −→Φ(Ni·S·C). Proof. For” — Part (b).

### Additivity for Φ = THH^{C_r} (McCarthy)

`L.4/thh-additivity-theorem` · theorem

For Φ as in HM §1.3 (in particular Φ(C) = THH(C;S^V)^{C_r}) and E(A,C,B) the category of cofibration sequences A ↣ C ↠ B with A ∈ A, B ∈ B, the following equivalent assertions hold: (1) (s,q): Φ(N^w_• S_• E(A,C,B)) → Φ(N^w_• S_• A) × Φ(N^w_• S_• B) is a weak equivalence; (2) the case A = B = C; (3) t and s ∨ q induce homotopic maps Φ(N^w_• S_• E(C,C,C)) → Φ(N^w_• S_• C); (4) for a cofibration sequence F' ↣ F ↠ F'' of exact functors C → D, F and F' ∨ F'' induce homotopic maps Φ(N^w_• S_• C) → Φ(N^w_• S_• D).

**Hypotheses.**

- A, B ⊂ C subcategories with cofibrations and weak equivalences with exact inclusions; Φ = THH(−;S^V)^{C_r} or a functor with the same properties used in McCarthy's proof.

**Proof.**

1. (1) is McCarthy's additivity theorem for the cyclic nerve (McCarthy, 'The cyclic homology of an exact category', cited by HM); HM state that the proof there 'generalizes mutatis mutandis' to Φ (not read: recorded gap).
2. The equivalence of (1)–(4) is Waldhausen's Proposition 1.3.2 (GeneralAlgebraicKTheory:K.4/waldhausen-additivity-theorem gives the same equivalences for K-theory).

**Acceptance.**

- For Φ = ob the theorem is Waldhausen's additivity theorem (GeneralAlgebraicKTheory:K.4/waldhausen-additivity-theorem).

**Depends on.** this roadmap: `L.4/isomorphism-nerve-degeneracy-equivalence`; other roadmaps: `GeneralAlgebraicKTheory:K.4/waldhausen-additivity-theorem`, `RefinedTraceMethods:RT.2`.

**Sources.**

- `HesselholtMadsen.2003`, Theorem 1.3.5, p. 17: “Theorem 1.3.5 (Additivity theorem). The following equivalent assertions hold: (1) The exact functors s and q induce a weak equivalence Φ(Nw· S·E(A, C, B)) ∼ −→Φ(Nw· S·A) × Φ(Nw· S·B). (2) The exact functors s and q induce a weak equivalence Φ(Nw· S·E(C, C, C)) ∼ −→Φ(Nw· S·C) × Φ(Nw·” — Statement of (1)–(3).
- `HesselholtMadsen.2003`, §1.3, p. 17: “The extension of the additivity theorem to the present situation is due to McCarthy, [34]. Indeed, the proof given there for Φ the cyclic nerve functor generalizes mutatis mutandis to prove the statement (1) below. The equivalence of the four” — Attribution and the proof by reference.

### The relative S-construction square is homotopy cartesian for Φ, and Φ(N^w S C) deloops

`L.4/thh-relative-s-construction-square` · lemma

For an exact functor f: C → D and Waldhausen's relative construction S_•(f: C → D), the square with corners Φ(N^w_• S_• C), Φ(N^w_• S_• S_•(id_C)), Φ(N^w_• S_• D), Φ(N^w_• S_• S_•(f)) is homotopy cartesian and the upper right-hand term has a canonical contraction. Taking D = 0, Φ(N^w_• S_• C) → ΩΦ(N^w_• S_• S_• C) is a weak equivalence.

**Hypotheses.**

- Φ satisfies axioms (i)–(iii) and the additivity theorem (node L.4/thh-additivity-theorem).

**Proof.**

1. As in Waldhausen's proof for K-theory (GeneralAlgebraicKTheory:K.4/relative-S-construction-fibration-and-delooping), using additivity for Φ levelwise in the S-direction and the realisation lemma.

**Acceptance.**

- For Φ = THH^{C_r} this gives the Ω-spectrum property used in Proposition 1.3.8.

**Depends on.** this roadmap: `L.4/thh-additivity-theorem`; other roadmaps: `GeneralAlgebraicKTheory:K.4/relative-S-construction-fibration-and-delooping`, `StableHomotopyKTheory:H.2/bisimplicial-realization-lemma`.

**Sources.**

- `HesselholtMadsen.2003`, §1.3, (1.3.6), p. 18: “is homotopy cartesian, and there is a canonical contraction of the upper right-hand term. In particular, if we let D be the category with one object and one morphism, this shows that the canonical map Φ(Nw· S·C) ∼ −→ΩΦ(Nw· S·S·C) is a weak” — The square (1.3.6) and the delooping.

### Φ(N^{w̄} C) ≃ Φ(N^w C) under the cylinder and saturation axioms

`L.4/cofibration-weak-equivalence-nerve-lemma` · lemma

Suppose C has a cylinder functor and wC satisfies the cylinder axiom and the saturation axiom. Then Φ(N^{w̄}_• C) → Φ(N^w_• C) is a weak equivalence, where w̄C = wC ∩ coC.

**Hypotheses.**

- Cylinder functor with cylinder axiom; saturation of wC; Φ satisfying (i)–(iii).

**Proof.**

1. Consider the bisimplicial category T(C) of pairs (A_q → ⋯ → A_0, A_0 → B_0 → ⋯ → B_p) and its full subcategory T^{w̄,w}(C); there are projections p_1, p_2 to N^{w̄}(C^op)R and N^w(C)L.
2. For fixed q, p_1 is a simplicial homotopy equivalence; for fixed p, p_2 is a simplicial homotopy equivalence with inverse σ, using the cylinder functor to construct t with exact simplicial homotopies σ∘p_2 ≃ t ≃ id (following Waldhausen's Lemma 1.6.3, which requires the proof of Quillen's Theorem A, not only its statement).
3. Compare with T^{w,w}(C) by the inclusion i'; all horizontal maps become weak equivalences after Φ (nodes L.4/exact-simplicial-homotopy-invariance and L.4/weak-equivalence-transformations-give-exact-homotopies).

**Acceptance.**

- For Φ = ob it is Waldhausen's Lemma 1.6.3.

**Depends on.** this roadmap: `L.4/exact-simplicial-homotopy-invariance`, `L.4/weak-equivalence-transformations-give-exact-homotopies`; other roadmaps: `StableHomotopyKTheory:H.2/quillen-theorem-a`, `GeneralAlgebraicKTheory:K.4/waldhausen-localization-fibration-theorem`.

**Sources.**

- `HesselholtMadsen.2003`, Lemma 1.3.9, p. 19: “Lemma 1.3.9. Suppose that C has a cylinder functor, and that wC satisfies the cylinder axiom and the saturation axiom. Then Φ(N ¯w· C) ∼ −→Φ(Nw· C) is a weak equivalence. Here ¯wC = wC ∩co C. Proof. The proof is analogous to the proof of [48, Lemma” — Statement.

### The swallowing lemma

`L.4/swallowing-lemma` · lemma

If vC ⊂ wC are two categories of weak equivalences on a category with cofibrations C, then Φ(N^w_• C) = Φ((N^w C)R) → Φ(N^{v,w} C) is a homotopy equivalence with a canonical homotopy inverse, where N^{v,w}C = N^v_•(N^w_• C).

**Hypotheses.**

- vC ⊂ wC; Φ satisfying (i)–(iii).

**Proof.**

1. For fixed m the iterated degeneracy N^w_• C → N^w_•(N^v_m C) has the retraction given by the iterated face map c_0 → ⋯ → c_m ↦ c_0; the other composite is related to the identity by a natural transformation through arrows of vC ⊂ wC.
2. Conclude by nodes L.4/weak-equivalence-transformations-give-exact-homotopies and L.4/exact-simplicial-homotopy-invariance and axiom (iii).

**Acceptance.**

- Used with v = i, w = z in the resolution theorem and with v ⊂ w in the fibration theorem.

**Depends on.** this roadmap: `L.4/weak-equivalence-transformations-give-exact-homotopies`, `L.4/exact-simplicial-homotopy-invariance`.

**Sources.**

- `HesselholtMadsen.2003`, Lemma 1.3.10, p. 20: “1.3.10 (Swallowing lemma). If vC ⊂wC then Φ(Nw· C) = Φ((NwC)R) ∼ −→Φ(Nv,wC) is a homotopy equivalence with a canonical homotopy inverse. Proof. We claim that for fixed m, the iterated degeneracy in” — Statement.

### Waldhausen's fibration theorem for Φ = THH^{C_r}

`L.4/thh-fibration-theorem` · theorem

Let C be a category with cofibrations with two categories of weak equivalences vC ⊂ wC, and C^w the subcategory with cofibrations of objects A with ∗ → A in wC. Suppose C has a cylinder functor and wC satisfies the cylinder, saturation and extension axioms. Then the square Φ(N^v_• S_• C^w) → Φ(N^w_• S_• C^w), Φ(N^v_• S_• C) → Φ(N^w_• S_• C) is homotopy cartesian and the upper right-hand term has a canonical contraction.

**Hypotheses.**

- Cylinder functor; cylinder, saturation and extension axioms for wC; Φ satisfying (i)–(iii) and additivity (in particular Φ = THH(−;S^V)^{C_r}).

**Proof.**

1. The proof of Waldhausen's Theorem 1.6.4 goes through with Lemmas 1.3.9 and 1.3.10 and additivity for Φ in place of their K-theory versions (HM: 'The proof of [w, Th. 1.6.4] now gives'); compare GeneralAlgebraicKTheory:K.4/waldhausen-localization-fibration-theorem for Φ = ob.

**Acceptance.**

- For Φ = ob it is the Waldhausen localisation theorem K(C^w) → K(C,v) → K(C,w).
- Applied with C = C^b(P_A), v = z, w = q it gives Theorem 1.5.6.

**Depends on.** this roadmap: `L.4/cofibration-weak-equivalence-nerve-lemma`, `L.4/swallowing-lemma`, `L.4/thh-additivity-theorem`, `L.4/thh-relative-s-construction-square`; other roadmaps: `GeneralAlgebraicKTheory:K.4/waldhausen-localization-fibration-theorem`.

**Sources.**

- `HesselholtMadsen.2003`, Theorem 1.3.11, p. 21: “1.3.11 (Fibration theorem). Let C be a category with cofibrations equipped and two categories of weak equivalences vC ⊂wC, and let Cw be the subcategory with cofibrations of C given by the objects A such that ∗→A is in wC. Suppose that C has a cylinder functor, and that wC satisfies” — Statement.

### The resolution theorem for Φ

`L.4/thh-resolution-theorem` · theorem

Let A be an abelian category and E ⊂ A a full additive subcategory closed under extensions and under kernels of epimorphisms between its objects. Then the inclusion E → C^b(E) (complexes concentrated in degree zero) induces a weak equivalence Φ(N^i_• S_• E) → Φ(N^z_• S_• C^b(E)), z the quasi-isomorphisms.

**Hypotheses.**

- E ⊂ A closed under extensions and kernels of epimorphisms in E; C^b(E) with degreewise monomorphisms as cofibrations and quasi-isomorphisms (in A) as weak equivalences, which satisfies the hypotheses of the fibration theorem.

**Proof.**

1. By the fibration theorem (node L.4/thh-fibration-theorem) with v = i, w = z, the right-hand square of HM's diagram is homotopy cartesian and the outer corners are contractible; it remains to show that the left-hand square is homotopy cartesian (following Thomason–Trobaugh Theorem 1.11.7).
2. For complexes concentrated in [a,b], the brutal truncation σ_{≤a} gives an exact equivalence with E(C^a_a, C^b_a, C^b_{a+1}); additivity gives Φ(N^i S C^b_a) ≃ Π_{a≤s≤b} Φ(N^i S E).
3. For acyclic complexes the good truncation and the boundaries B_i give Φ(N^i S C^{bz}_a) ≃ Π_{a≤s<b} Φ(N^i S E).
4. Additivity (4) identifies the inclusion of acyclic complexes with (x_s) ↦ (x_s + x_{s−1}); passing to horizontal fibres and the homotopy colimit over a, b shows the left-hand square is homotopy cartesian.

**Acceptance.**

- For Φ = ob this is the Gillet–Waldhausen theorem K(E) ≃ K(C^b(E)) (GeneralAlgebraicKTheory:K.4/gillet-waldhausen-comparison).

**Depends on.** this roadmap: `L.4/thh-fibration-theorem`, `L.4/thh-additivity-theorem`, `L.4/isomorphism-nerve-degeneracy-equivalence`; other roadmaps: `GeneralAlgebraicKTheory:K.4/gillet-waldhausen-comparison`.

**Sources.**

- `HesselholtMadsen.2003`, Theorem 1.4.1, p. 21: “Theorem 1.4.1. With E as above, the inclusion induces an equivalence Φ(Ni·S·E) ∼ −→Φ(Nz·S·Cb(E)).” — Statement.
- `HesselholtMadsen.2003`, Proof of Theorem 1.4.1, p. 22: “We follow the proof of [46, Th. 1.11.7]. Since the category Cb(E) has a cylinder functor which satisfies the cylinder” — The proof follows Thomason–Trobaugh.

### The Dundas–McCarthy equivalence criterion for THH

`L.4/dundas-mccarthy-equivalence-criterion` · theorem

Let F: C → D be an exact functor of linear categories with cofibrations and weak equivalences such that for all n ≥ 0 the map |ob N^w_• S_• END_n(F)| is a weak equivalence, where END_n(C) is the category of objects of C with n endomorphisms. Then F_*: THH(N^w_• S_• C) → THH(N^w_• S_• D) is an F-equivalence (a weak equivalence on C_r-fixed points for every r ≥ 1).

**Hypotheses.**

- C, D linear categories with cofibrations and weak equivalences; F exact.

**Proof.**

1. Cited by HM from Dundas–McCarthy, 'Topological Hochschild homology of ring functors and exact categories', Proposition 2.3.3 (not read: recorded gap). In the formalisation this is a THH-theoretic statement to be supplied with RefinedTraceMethods RT.2's THH of spectral categories.

**Acceptance.**

- Its hypothesis for F: C^b(M^q_A) → C^b(M_A)^q is verified via Thomason–Trobaugh's approximation theorem and Lemma 1.5.3 (proof of Theorem 1.5.2).

**Depends on.** this roadmap: `L.4/thh-of-linear-waldhausen-category`; other roadmaps: `RefinedTraceMethods:RT.2`, `GeneralAlgebraicKTheory:K.4/waldhausen-approximation-theorem`.

**Sources.**

- `HesselholtMadsen.2003`, Proposition 1.5.1 (cited as [7, Prop. 2.3.3]), p. 24: “Proposition 1.5.1 ([7, Prop. 2.3.3]). Let F: C →D be an exact functor of linear categories with cofibrations and weak equivalences, and suppose that for all n ≥0, the map | ob Nw· S·Endn(F)| is an equivalence. Then F∗: THH(Nw· S·C) ∼ −→THH(Nw· S·D) is an F-equivalence (see Def.” — Statement as used by HM.

### Complexes with I-power-torsion homology are quasi-isomorphic to complexes of I-power-torsion modules

`L.4/torsion-homology-complex-replacement` · lemma

Let A be a commutative noetherian ring, B an A-algebra (not necessarily commutative), I ⊂ A an ideal, and C_* a bounded complex of left B-modules that are finitely generated as A-modules, whose homology is annihilated by a power of I. Then there is a quasi-isomorphism C_* → D_* to a bounded complex of left B-modules that are finitely generated as A-modules and annihilated by a power of I.

**Hypotheses.**

- A commutative noetherian; B an A-algebra; C_* bounded, termwise finitely generated over A; H_*(C) annihilated by I^N for some N.

**Proof.**

1. Choose n such that C_i is killed by a power of I for all i ≥ n. From 0 → Z_n → C_n → B_{n−1} → 0 and 0 → B_{n−1} → Z_{n−1} → H_{n−1} → 0, Z_{n−1} is killed by some I^r; it is finitely generated since A is noetherian.
2. By the Artin–Rees lemma (Mathlib Ideal.exists_pow_inf_eq_pow_smul) there is s ≥ 1 with Z_{n−1} ∩ I^s C_{n−1} ⊂ I^r Z_{n−1} = 0.
3. Define C'' with C''_{n−1} = C_{n−1}/I^s C_{n−1}, C''_{n−2} the pushout of C_{n−2} ← C_{n−1} → C''_{n−1}, and C''_i = C_i otherwise; the kernel complex C' is concentrated in degrees n−1, n−2 with differential injective (Z_{n−1} ∩ I^sC_{n−1} = 0) and surjective (pushout), so C → C'' is a quasi-isomorphism.
4. Now C''_i is killed by a power of I for i ≥ n − 1; induct downwards.

**Acceptance.**

- A = Z_p, B = A, I = (p): the complex Z_p →p Z_p (homology Z/p in degree 0) is quasi-isomorphic to Z/p in degree 0, a complex of p-torsion modules.
- For B = A_n = A⟨x_1,…,x_n⟩ (noncommuting variables) the lemma gives condition 1.9.7.1 of Thomason–Trobaugh in the proof of Theorem 1.5.2.

**Depends on.** libraries: `mathlib:Ideal.exists_pow_inf_eq_pow_smul`, `mathlib:IsNoetherianRing`.

**Sources.**

- `HesselholtMadsen.2003`, Lemma 1.5.3, p. 25: “Lemma 1.5.3. Let A be a commutative noetherian ring, and let B be a not necessarily commutative A-algebra. Let C∗be a bounded complex of left B-modules which as A-modules are finitely generated and suppose that the homology of C∗is annihilated by some power of an ideal I ⊂A. Then” — Statement.
- `HesselholtMadsen.2003`, Proof of Lemma 1.5.3, p. 25: “Hence, by the Artin-Rees lemma, [32, Th. 8.5], we can find s ≥1 such that Zn−1 ∩IsCn−1 ⊂IrZn−1 = 0. We now define C′′ to be the complex with C′′ i =” — Use of Artin–Rees in the proof.

### THH of torsion modules against complexes with torsion homology

`L.4/thh-torsion-complexes-f-equivalence` · theorem

Let A be a discrete valuation ring with fraction field K and M_A the category of finitely generated A-modules. The inclusion C^b(M^q_A) → C^b(M_A)^q of bounded complexes of finitely generated torsion A-modules into bounded complexes of finitely generated A-modules with torsion homology induces an F-equivalence THH(N^z_• S_• C^b(M^q_A)) → THH(N^z_• S_• C^b(M_A)^q).

**Hypotheses.**

- A a discrete valuation ring (noetherian, so Lemma 1.5.3 applies with I the maximal ideal); both categories with degreewise monomorphisms as cofibrations and quasi-isomorphisms as weak equivalences.

**Proof.**

1. By the Dundas–McCarthy criterion (node L.4/dundas-mccarthy-equivalence-criterion) it suffices that |ob N^z_• S_• C^b(M^q_{A,n})| → |ob N^z_• S_• C^b(M_{A,n})^q| is a weak equivalence for every n, where M_{A,n} is the category of A⟨x_1,…,x_n⟩-modules finitely generated over A (END_n of the categories).
2. Both are complicial bi-Waldhausen categories closed under canonical homotopy pushouts and pullbacks; apply Thomason–Trobaugh's approximation theorem 1.9.8 (cited, not read), whose nontrivial condition 1.9.7.1 is Lemma 1.5.3 (node L.4/torsion-homology-complex-replacement) with B = A⟨x_1,…,x_n⟩ and I the maximal ideal.

**Acceptance.**

- Its K-theory analogue (Φ = ob) is Waldhausen approximation (GeneralAlgebraicKTheory:K.4/waldhausen-approximation-theorem).

**Depends on.** this roadmap: `L.4/dundas-mccarthy-equivalence-criterion`, `L.4/torsion-homology-complex-replacement`; other roadmaps: `GeneralAlgebraicKTheory:K.4/waldhausen-approximation-theorem`.

**Sources.**

- `HesselholtMadsen.2003`, Theorem 1.5.2, p. 24: “Theorem 1.5.2. The inclusion functor induces an F-equivalence THH(Nz·S·Cb(Mq A)) ∼ −→THH(Nz·S·Cb(MA)q). Proof. We show that the assumptions of Proposition 1.5.1 are satisfied. The proof relies on” — Statement.
- `HesselholtMadsen.2003`, Proof of Theorem 1.5.2, p. 25: “These conditions are easily verified with the exception of condition 1.9.7.1 which reads: for every object B of Cb(MA,n)q, there exist an object A of Cb(Mq A,n) and a map FA ∼ −→B in zCb(MA,n)q. This follows from Lemma 1.5.3 below.” — The nontrivial condition 1.9.7.1 of Thomason–Trobaugh is Lemma 1.5.3.

### Projective complexes suffice for complexes with torsion homology

`L.4/thh-projective-complexes-f-equivalence` · lemma

For A a discrete valuation ring, the inclusion C^b(P_A)^q → C^b(M_A)^q (bounded complexes of finitely generated projective, resp. finitely generated, A-modules with torsion homology) induces an F-equivalence THH(N^z_• S_• C^b(P_A)^q) → THH(N^z_• S_• C^b(M_A)^q).

**Hypotheses.**

- A regular (a DVR), so that finitely generated modules have finite projective resolutions.

**Proof.**

1. By the Dundas–McCarthy criterion reduce to C^b(P_{A,n})^q → C^b(M_{A,n})^q, P_{A,n} the A⟨x_1,…,x_n⟩-modules that are finitely generated projective over A.
2. Verify condition 1.9.7.1 of Thomason–Trobaugh 1.9.8: a projective resolution ε: P_{*,*} → C_* over A with P_{i,j} finitely generated and bounded (A regular) admits an A⟨x_1,…,x_n⟩-module structure making ε linear (Cartan–Eilenberg XVII Proposition 1.2, cited); the total complex lies in C^b(P_{A,n})^q.

**Acceptance.**

- With Theorem 1.5.2 and dévissage it identifies T(C^b_z(P_A)^q) with T(P_k).

**Depends on.** this roadmap: `L.4/dundas-mccarthy-equivalence-criterion`; other roadmaps: `GeneralAlgebraicKTheory:K.4/waldhausen-approximation-theorem`; libraries: `mathlib:IsDiscreteValuationRing`.

**Sources.**

- `HesselholtMadsen.2003`, Proposition 1.5.4, p. 26: “Proposition 1.5.4. The inclusion functor induces an F-equivalence THH(Nz·S·Cb(PA)q) ∼ −→THH(Nz·S·Cb(MA)q). Proof. Let An and MA,n be as in the proof of Theorem 1.5.2, and let PA,n be the full” — Statement.

### The spectra T(A|K), T(A) and T(k) of a discrete valuation ring

`L.4/thh-of-dvr-with-log-poles` · definition · planet “Topological Hochschild spectrum T(A|K)”

Let A be a discrete valuation ring with fraction field K and residue field k, and P_A the category of finitely generated projective A-modules. Define ring T-spectra T(A|K) = T(C^b_q(P_A)), T(A) = T(C^b_z(P_A)), T(k) = T(C^b_z(P_A)^q), where C^b(P_A) is the category of bounded complexes in P_A with degreewise monomorphisms as cofibrations, z the quasi-isomorphisms, q the maps that become quasi-isomorphisms after − ⊗_A K, and C^b_z(P_A)^q the complexes with torsion homology. TR^n(A|K;p), TR^n(A;p), TR^n(k;p) are the associated C_{p^{n−1}}-fixed point ring spectra, and TC(A|K;p) = TC(C^b_q(P_A);p). T(A|K) is the topological Hochschild spectrum of A with logarithmic poles along the closed point; it is not T(K) (see tests).

**Hypotheses.**

- A a discrete valuation ring (for the calculations that follow: complete, of characteristic (0,p), with perfect residue field k, p odd).

**Proof.**

1. Apply node L.4/thh-of-linear-waldhausen-category to the three linear Waldhausen categories; the tensor product of complexes is bi-exact and strictly symmetric monoidal after the usual strictification, so all three are ring T-spectra.
2. Apply node L.4/tr-pro-spectrum for the TR-spectra and node L.4/p-typical-tc for TC.

**API.**

- `TauCeti.HM.logTHH` (constructor): T(A|K) := T(C^b_q(P_A)), a commutative ring T-spectrum.
- `TauCeti.HM.dvrTHH` (constructor): T(A) := T(C^b_z(P_A)) and T(k) := T(C^b_z(P_A)^q).
- `TauCeti.HM.logTR` (constructor): TR^n(A|K;p) := TR^n(C^b_q(P_A);p).
- `TauCeti.HM.logTC` (constructor): TC(A|K;p) := TC(C^b_q(P_A);p).
- `TauCeti.HM.logTHH.j` (data): j_*: T(A) → T(A|K), induced by the identity functor C^b_z(P_A) → C^b_q(P_A); a ring map.
- `TauCeti.HM.logTHH.pi0` (simp): π_0 T(A|K) ≅ A and TR^n_0(A|K;p) ≅ W_n(A).
- `TauCeti.HM.logTHH.map` (functoriality): A finite extension of DVRs A → B (B the integral closure of A in a finite extension L/K) induces ι_*: T(A|K) → T(B|L), compatible with R, F, V.
- `TauCeti.HM.dvrTHH.equivRing` (compatibility): T(A) ≃ THH(A) and T(k) ≃ THH(k) as cyclotomic spectra (node L.4/dvr-tr-agrees-with-ring-tr).

**Unit tests.**

- `TauCeti.HM.logTHH_Zp_pi0_modp` (computation): For A = Z_p: π_0(T(Z_p|Q_p);Z/p) = F_p and π_1(T(Z_p|Q_p);Z/p) = F_p·dlog p (Theorem B with e_K = 1).
- `TauCeti.HM.logTHH_ne_thh_fraction_field` (non-example): T(Z_p|Q_p) ≄ THH(Q_p): π_*(THH(Q_p);Z/p) = 0 since THH(Q_p) is a Q_p-module, while π_0(T(Z_p|Q_p);Z/p) = F_p.
- `TauCeti.HM.logTHH_ne_thh` (non-example): T(Z_p|Q_p) ≄ T(Z_p): π_1(T(Z_p);Z/p) = 0 for p odd (Lindenstrauss–Madsen: π̄_q T(Z_p) = 0 unless q ≡ −1, 0 mod 2p) while π_1(T(Z_p|Q_p);Z/p) = F_p.
- `TauCeti.HM.logTHH_rational` (compatibility): After rationalisation j_*: π_*T(A) ⊗ Q → π_*T(A|K) ⊗ Q is an isomorphism, and both are HH_*(K) = Ω^*_K (proof of Proposition 2.3.4).
- `TauCeti.HM.logTHH_residue_trivial` (degenerate): T(k) is a T(A)-module through i_*: T(A) → T(k), and its homotopy groups are k-vector spaces: π_*(T(k)) = k[σ] for k perfect.

**Acceptance.**

- π_0 T(A|K) = A (node L.5/log-thh-low-degrees).
- T(A) ≃ T(P_A) = THH(A) and T(k) ≃ T(P_k) = THH(k) (node L.4/dvr-tr-agrees-with-ring-tr).

**Used by.**

- HM Theorem 1.5.6 and Addendum 1.5.7: the localisation sequences in TR and TC
- HM §2: π_* T(A|K) and π̄_* T(A|K) (Theorem B)
- HM §3: TR^•_*(A|K;p) is a log Witt complex; Theorem 3.3.8 in degrees ≤ 2
- HM §§5–6: Theorem C
- KTheoryFiniteLocalFields:L.6: K_*(K;Z/p^v) ≅ TC_*(A|K;p,Z/p^v) in degrees ≥ 1

**Depends on.** this roadmap: `L.4/thh-of-linear-waldhausen-category`, `L.4/tr-pro-spectrum`, `L.4/p-typical-tc`; other roadmaps: `GeneralAlgebraicKTheory:K.4/gillet-waldhausen-comparison`; libraries: `mathlib:IsDiscreteValuationRing`.

**Sources.**

- `HesselholtMadsen.2003`, Definition 1.5.5, p. 27: “Definition 1.5.5. We define ring T-spectra T(A|K) = T(Cb q(PA)), T(A) = T(Cb z(PA)), T(k) = T(Cb z(PA)q) and let TRn(A|K; p), TRn(A; p), and TRn(k; p) be the associated Cpn−1-fixed point ring” — The definition.
- `HesselholtMadsen.2003`, Introduction, p. 3: “and again Waldhausen's approximation theorem allows us to identify the first two terms on the left with the topological cyclic homology of the exact categories Pk and PA. But the third term is different from the topological cyclic homology of PK. We” — The third term is not TC of P_K.

### TR^n(A;p) and TR^n(k;p) of Definition 1.5.5 agree with the usual ones

`L.4/dvr-tr-agrees-with-ring-tr` · lemma

For a discrete valuation ring A with residue field k there are canonical equivalences TR^n(A;p) ≃ TR^n(P_A;p) and TR^n(k;p) ≃ TR^n(P_k;p), compatible with R, F, V and μ, where P_R is the exact category of finitely generated projective R-modules; by Morita invariance these are TR^n of the rings A and k.

**Hypotheses.**

- A a discrete valuation ring with residue field k.

**Proof.**

1. By the resolution theorem (node L.4/thh-resolution-theorem) applied to Φ(C) = THH(C)^{C_r} and Proposition 1.3.8, T(P_A) → T(C^b_z(P_A)) = T(A) is an F-equivalence; similarly T(P_k) = T(M_k) → T(C^b_z(M_k)).
2. By Dundas' dévissage for THH ('K-theory theorems in topological cyclic homology', Theorem 1, cited, not read), T(C^b_z(M_k)) → T(C^b_z(M^q_A)) is an F-equivalence.
3. Theorem 1.5.2 and Proposition 1.5.4 (nodes L.4/thh-torsion-complexes-f-equivalence and L.4/thh-projective-complexes-f-equivalence) give F-equivalences T(C^b_z(M^q_A)) → T(C^b_z(M_A)^q) ← T(C^b_z(P_A)^q) = T(k).
4. Morita invariance (Dundas–McCarthy Proposition 2.1.5, cited) identifies TR^n(P_R;p) with TR^n(R;p) of RefinedTraceMethods RT.2.

**Acceptance.**

- π_* T(k) ≅ π_* THH(k) = k[σ] for k perfect (node L.5/thh-of-perfect-field).
- π_1 T(A) ≅ Ω^1_A.

**Depends on.** this roadmap: `L.4/thh-resolution-theorem`, `L.4/thh-structure-maps-f-equivalences`, `L.4/thh-torsion-complexes-f-equivalence`, `L.4/thh-projective-complexes-f-equivalence`; other roadmaps: `GeneralAlgebraicKTheory:K.3/devissage-theorem`, `RefinedTraceMethods:RT.2`.

**Sources.**

- `HesselholtMadsen.2003`, §1.5, after Definition 1.5.5, p. 27: “We show that the definition of the spectra TRn(A; p) and TRn(k; p) given here agrees with the usual definition. By Morita invariance, [7, Prop. 2.1.5], it suffices to show that there are canonical isomorphisms of spectra TRn(A; p) ≃TRn(PA;” — Statement.
- `HesselholtMadsen.2003`, §1.5, p. 27: “By devisage, [6, Th. 1], the same is true for T(Cb z(Mk)) →T(Cb z(Mq A)). Finally, Theorem 1.5.2 and Proposition 1.5.4 show that the maps induced” — Dévissage for THH is cited from Dundas.

### The localisation sequence TR^n(k;p) → TR^n(A;p) → TR^n(A|K;p)

`L.4/tr-localization-sequence` · theorem · planet “Localisation sequence for TR of a DVR”

For a discrete valuation ring A with fraction field K and residue field k, and all n ≥ 1, there is a natural cofibration sequence of spectra TR^n(k;p) →i^! TR^n(A;p) →j_* TR^n(A|K;p) →∂ ΣTR^n(k;p) whose maps commute with R, F, V and μ. The map j_* is a map of ring spectra; i^! and ∂ are maps of TR^n(A;p)-module spectra, TR^n(k;p) being a TR^n(A;p)-module through i_*: TR^n(A;p) → TR^n(k;p) induced by the reduction. The preferred homotopy limits form a cofibration sequence TR(k;p) → TR(A;p) → TR(A|K;p) → ΣTR(k;p).

**Hypotheses.**

- A a discrete valuation ring (the proof uses only the fibration theorem for C^b(P_A) with v = z ⊂ w = q).

**Proof.**

1. The square T(C^b_z(P_A)^q) → T(C^b_q(P_A)^q), T(C^b_z(P_A)) → T(C^b_q(P_A)) consists of symmetric orthogonal T-spectra; the fibration theorem (node L.4/thh-fibration-theorem) for Φ(C) = THH(C)^{C_r} shows that the square of C_r-fixed points is homotopy cartesian and T(C^b_q(P_A)^q) is contractible.
2. This gives the cofibration sequence T(k)^{C_r} → T(A)^{C_r} → T(A|K)^{C_r} for every r = p^{n−1}, compatible with R, F, V and μ because the square is one of cyclotomic T-spectra.
3. The module structures: the square is a diagram of T(A)-module spectra.
4. Pass to homotopy limits over R.

**Acceptance.**

- n = 1, degree 0: 0 → π_0T(A) = A → π_0 T(A|K) → 0, since i^! is zero on π_0 (torsion to torsion-free) and π_{−1}T(k) = 0.
- n = 1, degree 1: 0 → Ω^1_A → π_1 T(A|K) → k → 0, matching 0 → Ω^1_A → ω^1_{(A,M)} →res k → 0 (Proposition 2.3.4).

**Depends on.** this roadmap: `L.4/thh-of-dvr-with-log-poles`, `L.4/thh-fibration-theorem`, `L.4/dvr-tr-agrees-with-ring-tr`.

**Sources.**

- `HesselholtMadsen.2003`, Theorem 1.5.6, p. 27: “Theorem 1.5.6. For all n ≥1, there is a natural cofibration sequence of spectra TRn(k; p) i! −→TRn(A; p) j∗ −→TRn(A|K; p) ∂ −→Σ TRn(k; p), and all maps in the sequence commute with the maps R, F, V , and µ. The map j∗is a map of ring spectra, and the maps i! and ∂are maps of TRn(A;” — Statement.
- `HesselholtMadsen.2003`, Proof of Theorem 1.5.6, p. 28: “and the fibration Theorem 1.3.11 applied to the functor Φ(C) = THH(C)Cr shows that the corresponding square of Cr-fixed point spectra is homotopy cartesian. It follows that there is natural” — The proof applies the fibration theorem.

### The localisation square: the trace from K-theory localisation to TC localisation

`L.4/k-tc-localization-square` · theorem · planet “Localisation square K → TC”

For a discrete valuation ring A with fraction field K and residue field k there is a natural map of cofibration sequences, all of whose vertical maps are cyclotomic traces and maps of ring spectra, from K(k) →i^! K(A) →j_* K(K) →∂ ΣK(k) to TC(k;p) →i^! TC(A;p) →j_* TC(A|K;p) →∂ ΣTC(k;p). The top row is Quillen's localisation sequence, identified with K(C^b_z(P_A)^q) → K(C^b_z(P_A)) → K(C^b_q(P_A)) by Waldhausen's approximation theorem; the bottom row is TC of the sequence of Theorem 1.5.6. The third bottom term is TC(A|K;p), not TC(K;p).

**Hypotheses.**

- A a discrete valuation ring with fraction field K and residue field k; p a prime.

**Proof.**

1. Waldhausen's fibration theorem for K-theory (GeneralAlgebraicKTheory:K.4/waldhausen-localization-fibration-theorem) gives K(C^b_z(P_A)^q) → K(C^b_z(P_A)) → K(C^b_q(P_A)); approximation (GeneralAlgebraicKTheory:K.4/waldhausen-approximation-theorem) and Gillet–Waldhausen (GeneralAlgebraicKTheory:K.4/gillet-waldhausen-comparison) identify the terms with K(P_k) (by dévissage, GeneralAlgebraicKTheory:K.3/devissage-theorem), K(P_A) and K(P_K); the associated long exact sequence is Quillen's (GeneralAlgebraicKTheory:K.3/abelian-localization-theorem).
2. Apply TC to the sequence of node L.4/tr-localization-sequence: TC commutes with the cofibration sequences of TR^n compatible with R and F (holim and hofib are exact).
3. The cyclotomic trace is natural in exact functors of Waldhausen categories (RefinedTraceMethods RT.3: 'Construct the Dennis/cyclotomic trace from the same K-theory functor and prove its naturality, multiplicativity and compatibility with support/relative fibres'), hence gives the map of sequences; it is multiplicative since the categories are symmetric monoidal with bi-exact ⊗.

**Acceptance.**

- In degree 1: the boundary ∂(dlog x) = v_K(x) ∈ π_0 T(k) = k corresponds to ∂: K_1(K) = K^× → K_0(k) = Z, x ↦ v_K(x) (used in Proposition 2.3.4).
- With Z/p^v coefficients and HM 1997 Theorem D for A and k, the five lemma gives tr: K_i(K;Z/p^v) ≅ TC_i(A|K;p,Z/p^v) for i ≥ 1 (node L.5/trace-isomorphism-for-local-field).

**Depends on.** this roadmap: `L.4/tr-localization-sequence`, `L.4/p-typical-tc`; other roadmaps: `RefinedTraceMethods:RT.3`, `GeneralAlgebraicKTheory:K.4/waldhausen-localization-fibration-theorem`, `GeneralAlgebraicKTheory:K.4/waldhausen-approximation-theorem`, `GeneralAlgebraicKTheory:K.4/gillet-waldhausen-comparison`, `GeneralAlgebraicKTheory:K.3/devissage-theorem`, `GeneralAlgebraicKTheory:K.3/abelian-localization-theorem`.

**Sources.**

- `HesselholtMadsen.2003`, Addendum 1.5.7, p. 28: “Addendum 1.5.7. There is a natural map of cofibration sequences K(k) i! −−−→ K(A) j∗ −−−→ K(K) ∂ −−−→ ΣK(k) ytr ytr” — Statement (with the diagram).
- `HesselholtMadsen.2003`, Introduction, p. 2: “and by Waldhausen's approximation theorem, the terms in this sequence may be identified with the K-theory of the exact categories Pk, PA and PK. The associated long-exact sequence of homotopy groups is the localization sequence of [37], .” — Identification of the top row with the localisation sequence of Quillen.

## L.5 — Witt vectors and residue-characteristic calculations

*Coverage: partial.* Targets and realisation. 'Consume existing Witt-vector algebra': Mathlib's WittVector, TruncatedWittVector, ghost map, Frobenius, Verschiebung and Teichmüller are baseline; the new Witt-vector lemmas of HM §3.1 (ghost-image criterion, V(1) ≡ [−p] and [−1] ≡ −1 for p odd, p-th powers of Teichmüller additive mod p, ρ_n, V_π, the presentation of W_n(A)/p) are nodes. 'Import ordinary de Rham–Witt complexes, Frobenius, Verschiebung and restriction from CR.4 … Do not define a second ordinary de Rham–Witt complex': requested; L.5/log-witt-complex specialises to CR.4's Witt complexes for the trivial log structure. 'own the logarithmic/DVR comparison … with its ramification data and map-level comparison': log differentials of a complete DVR (HM 2.2.2–2.2.6, with e_K, tame and wild base change), log Witt complexes and W_•ω^*_{(A,M)} (3.2.1–3.2.7), its mod p structure with the ramification invariant r(i,e_K) (3.4.1), the canonical map to TR (3.3.1) and the comparisons 3.3.8 and Theorem C. 'THH/TR/TC for perfect fields' (Bökstedt periodicity, HM 1997 Theorems 4.5 and B), 'truncated polynomial rings' (HM A.1.4–A.1.7, Hesselholt 2005 Propositions 7, 8, Theorems 10, 11, 13, HM 1997b Theorem A) and 'the complete DVRs required for local-field K-theory' (HM §§2–6 in mixed characteristic, p odd; Hesselholt 1996 and Geisser–Hesselholt for k[[t]] in equal characteristic). Concrete tests: L.5/relative-k-of-truncated-polynomial-over-perfect-field and L.5/relative-k-of-truncated-polynomial-char-zero (e = 2 is the square-zero comparison with differential forms). Integral, p-adic and mod p^v statements are separate nodes or explicitly labelled. The p = 2 hypothesis: every HM node carries 'p odd'; tests record the failures at p = 2 (V(1) ≢ [−2] mod 2W_3(Z), [−1]_2 ≢ −1, d∘d = ηd in TR of Z_(2)); the Handbook's p = 2 local results (Theorem 61 via Rognes–Weibel) are not trace-theoretic and are left to L.6.

- Remaining: Prove the existence of the log de Rham–Witt complex and W_1ω = ω for log rings (gap and source issue: the two HM papers refer to each other).
- Remaining: Prove the Lindenstrauss–Madsen inputs (π̄_*T(A), π_*(T(A);Z_p), their Proposition 4.3) and Remark 2.4.2 (gaps).
- Remaining: Replace Tsalidis' theorem in Addendum 5.4.4 by Nikolaus–Scholze Corollary II.4.9 with the hypotheses checked (gap).
- Remaining: Split the proofs of Propositions 5.5.4 and 5.5.5 and Theorem 5.5.1 into declaration-sized steps (the degree bookkeeping is recorded in proof steps only).
- Remaining: Supply the continuity results and Kratzer's theorem behind HM 1997 Theorem D, and HM 1997 Theorem 5.1 (gap).
- Remaining: Supply the Galois-cohomology inputs of Theorem 6.1.6 (Serre's residue sequence, Artin–Schreier) and obtain answers to the requests to MotivicEtaleKTheory M.1 and Tau Ceti ProfiniteCohomology layer 9.
- Remaining: Supply TR^n_{q−λ}(k;p) for perfect k (HM 'cyclic polytopes' Proposition 9.1, cited in Hesselholt 2005) and the cyclic-polytope geometry behind HM 1997b Theorem B.
- Remaining: Answers to the requests to RefinedTraceMethods RT.1–RT.3, CrystallineCohomology CR.4 and CR.5:log-algebra.

### A complete DVR with perfect residue field is W(k)[π]/(φ_K(π)) with φ_K Eisenstein

`L.5/complete-dvr-eisenstein-presentation` · lemma

Let A be a complete discrete valuation ring of mixed characteristic (0,p) with perfect residue field k. There is a unique ring homomorphism f: W(k) → A inducing the identity on residue fields, and A is viewed as a W(k)-algebra through f. For a uniformiser π_K, A = W(k)[π_K]/(φ_K(π_K)), where the minimal polynomial is φ_K(x) = x^{e_K} + pθ_K(x) with e_K = |K:K_0| and θ_K ∈ W(k)[x] of degree < e_K with θ_K(0) ∈ W(k)^×; in particular θ_K(π_K) ∈ A^× and −p = π_K^{e_K} θ_K(π_K)^{−1}.

**Hypotheses.**

- A is a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p; e = e_K = |K : K_0| is the absolute ramification index, K_0 the fraction field of W(k); π = π_K a uniformiser; M = A ∩ K^× ⊂ A the canonical prelog structure.

**Proof.**

1. Existence and uniqueness of f: A is p-adically complete and k perfect, so Teichmüller lifts and the universal property of W(k) as the strict p-ring of k give f (Serre, Local Fields II §5 Theorem 4, cited by HM and not read; a Mathlib route is Fontaine's θ: W(A^♭) → A with A^♭ = lim_{x↦x^p} A/p ≅ k for this A).
2. A is finite free over the DVR W(k) (Mathlib WittVector.isDiscreteValuationRing) of rank e_K, generated by π_K; the minimal polynomial of π_K is Eisenstein at p (Mathlib Polynomial.IsEisensteinAt), so φ_K = x^e + pθ_K with θ_K(0) a unit.
3. Evaluate: 0 = φ_K(π_K) gives −p θ_K(π_K) = π_K^e, and θ_K(π_K) ≡ θ_K(0) mod π_K is a unit.

**Acceptance.**

- A = W(k): e = 1, π = p, φ(x) = x − p, θ = −1, −p = p·(−1)^{−1}.
- A = Z_p[ζ_p], p odd: π = ζ_p − 1, e = p − 1, φ(x) = ((x+1)^p − 1)/x, θ(0) = 1.

**Depends on.** libraries: `mathlib:WittVector.isDiscreteValuationRing`, `mathlib:Polynomial.IsEisensteinAt`, `mathlib:WittVector.fontaineTheta`, `mathlib:IsDiscreteValuationRing`, `mathlib:IsAdicComplete`.

**Sources.**

- `HesselholtMadsen.2003`, §2.2, (2.2.1), p. 33: “We recall the structure of A from [40, §5, Th. 4]. Let W(k) be the ring of Witt vectors in k, and let K0 be the quotient field of W(k). There is a unique ring homomorphism f: W(k) →A such that the induced map of residue fields is the identity homomorphism. We will always view A as an” — The structure of A with the unique f: W(k) → A.
- `HesselholtMadsen.2003`, §2.2, (2.2.1), p. 33: “and the minimal polynomial takes the form φK(x) = xeK + pθK(x), where eK = |K :K0| is the ramification index and where θK(x) is a polynomial of degree less that eK such that θK(0) is a unit in W(k). It follows that θK(πK) is a unit and that −p = πeK” — The shape of φ_K and the formula for −p.

### Injectivity of the ghost map and the image criterion in the presence of a Frobenius lift

`L.5/ghost-image-criterion` · lemma

Let R be a ring without p-torsion. Then the ghost map w: W_n(R) → R^n, (a_0,…,a_{n−1}) ↦ (w_0,…,w_{n−1}), w_s = a_0^{p^s} + p a_1^{p^{s−1}} + ⋯ + p^s a_s, is injective. If moreover φ: R → R is a ring endomorphism with φ(a) ≡ a^p mod pR, then (w_0,…,w_{n−1}) ∈ R^n lies in the image of w if and only if w_s ≡ φ(w_{s−1}) mod p^s R for all 0 < s < n. Consequently, for such R, x ∈ W_n(R) lies in pW_n(R) iff w(x)/p (computed in R^n) lies in the image of w. For R = Z[X_α] take φ(X_α) = X_α^p; for R = Z take φ = id.

**Hypotheses.**

- R has no p-torsion; for the image criterion, a Frobenius lift φ exists.

**Proof.**

1. Injectivity: solve w_s = a_0^{p^s} + ⋯ + p^s a_s successively for a_s, using that p^s is a nonzerodivisor.
2. Image criterion (Dwork's lemma): by induction on s, given (a_0,…,a_{s−1}) with the right ghost components, a_s exists iff w_s − Σ_{i<s} p^i a_i^{p^{s−i}} ∈ p^s R; since φ(a^{p^{j}}) ≡ a^{p^{j+1}} mod p^{j+1}, this is equivalent to w_s ≡ φ(w_{s−1}) mod p^s.
3. The last statement follows from injectivity and the torsion-freeness of R^n.

**Acceptance.**

- R = Z, p = 3, n = 2: (1, 4) is a ghost vector (4 ≡ 1 mod 3), (1, 2) is not.
- R = Z: W_2(Z) → Z², (a_0,a_1) ↦ (a_0, a_0^p + p a_1) is injective with image {(w_0,w_1): w_1 ≡ w_0 mod p}.

**Depends on.** libraries: `mathlib:WittVector.ghostMap`, `mathlib:TruncatedWittVector`.

**Sources.**

- `HesselholtMadsen.2003`, §3.1, p. 44: “If R has no p-torsion then the ghost map is injective. If, in addition, there exists a ring endomorphism φ: R →R such that ap ≡φ(a) (mod pR), then a sequence (w0, . . . , wn−1) is in the image if and only if ws ≡φ(ws−1) (mod psR), for all” — The injectivity and the image criterion.

### For p odd, V(1) ≡ [−p]_n and [−1]_n ≡ −1 modulo pW_n(R)

`L.5/verschiebung-one-is-teichmuller-minus-p` · lemma

Let p be odd and R any ring. In W_n(R), V(1) ≡ [−p]_n and [−1]_n ≡ −1 modulo pW_n(R), where [a]_n = (a,0,…,0) is the multiplicative (Teichmüller) representative. Both congruences fail for p = 2 (the first for n ≥ 3, the second for n ≥ 2).

**Hypotheses.**

- p an odd prime; n ≥ 1; R a commutative ring.

**Proof.**

1. By naturality (the elements are images of elements of W_n(Z)) assume R = Z.
2. Ghost components: w([p]_n + V(1)) = p(1, 1 + p^{p−1}, 1 + p^{p²−1}, …); for p odd [−p]_n = −[p]_n since [−1]_n = −1 (second congruence), so it suffices that (1, 1+p^{p−1}, …, 1+p^{p^{n−1}−1}) is a ghost vector.
3. By node L.5/ghost-image-criterion with φ = id on Z this holds iff 1 + p^{p^s−1} ≡ 1 + p^{p^{s−1}−1} mod p^s for 1 < s < n, true for p odd since p^{s−1} − 1 ≥ s; it fails for p = 2, s = 2.
4. The second congruence: for p odd the ghost components of [−1]_n are ((−1)^{p^s})_s = (−1,…,−1) = w(−1), so [−1]_n = −1 in W_n(Z) by injectivity of the ghost map, and hence in every W_n(R).

**Acceptance.**

- p = 3, n = 3: V(1) − [−3]_3 has ghost components (3, 3 + 27, 3 + 3^9) = 3·(1, 10, 1 + 3^8), and (1, 10, 6562) is a ghost vector (10 ≡ 1 mod 3, 6562 ≡ 10 mod 9).
- Non-example p = 2, n = 3: w(V(1) − [−2]_3) = (2, −2, −14), and (1, −1, −7) is not a ghost vector since −7 ≢ −1 mod 4; so V(1) ≢ [−2]_3 mod 2W_3(Z).
- Non-example p = 2, n = 2: w([−1]_2 + 1) = (0, 2) and (0, 1) is not a ghost vector (1 ≢ 0 mod 2); so [−1]_2 ≢ −1 mod 2W_2(Z).

**Depends on.** this roadmap: `L.5/ghost-image-criterion`; libraries: `mathlib:WittVector.teichmuller`, `mathlib:WittVector.verschiebung`, `mathlib:TruncatedWittVector`.

**Sources.**

- `HesselholtMadsen.2003`, Lemma 3.1.1, p. 45: “Lemma 3.1.1. If p is odd then V (1) ≡−pn and −1n ≡−1 modulo pWn(R). Proof. By naturality, we may assume that R = Z. Now, w(pn + V (1)) = p(1, 1 + pp−1, 1 + pp2−1, 1 + pp3−1, . . .), and therefore it is enough to show that the sequence (1, 1 + pp−1, 1 + pp2−1, . . . , 1 + ppn−1−1) is” — Statement and the ghost computation.
- `HesselholtMadsen.2003`, Proof of Lemma 3.1.1, p. 45: “This is true, if p is odd, but fails for p = 2 and s = 2. The second congruence of the statement is proved in” — The failure for p = 2.

### The p-th power of the Teichmüller map is additive modulo p

`L.5/teichmuller-pth-power-additive-mod-p` · lemma

For every ring R and x, y ∈ R: [x+y]_n^p ≡ ([x]_n + [y]_n)^p ≡ [x]_n^p + [y]_n^p modulo pW_n(R). Consequently x ↦ class of [x]_n^p is a ring homomorphism R → W̄_n(R) = W_n(R)/p.

**Hypotheses.**

- R a commutative ring; n ≥ 1.

**Proof.**

1. The right-hand congruence holds in any commutative ring (binomial coefficients).
2. For the left-hand one pass to R = Z[x,y] (ghost map injective, φ(x) = x^p, φ(y) = y^p); the ghost components of [x]^p + [y]^p − [x+y]^p are (x^{p^{s+1}} + y^{p^{s+1}} − (x+y)^{p^{s+1}})_s, divisible by p.
3. By node L.5/ghost-image-criterion one must show (x+y)^{p^{s+1}} ≡ (x^p + y^p)^{p^s} mod p^{s+1}, which follows from (x+y)^p ≡ x^p + y^p mod p and a ≡ b mod p^k ⇒ a^p ≡ b^p mod p^{k+1}.

**Acceptance.**

- R = Z, p = 3, n = 2, x = y = 1: w([2]^3 − 2) = (6, 510) and (2, 170) is a ghost vector (170 ≡ 2 mod 3), so [2]_2^3 ≡ 2 mod 3W_2(Z).
- Non-example without the p-th power: w([2]_2 − 2) = (0, 6), and (0, 2) is not a ghost vector for p = 3 (2 ≢ 0 mod 3), so [2]_2 ≢ [1]_2 + [1]_2 mod 3W_2(Z).

**Depends on.** this roadmap: `L.5/ghost-image-criterion`; libraries: `mathlib:WittVector.teichmuller`, `mathlib:TruncatedWittVector`.

**Sources.**

- `HesselholtMadsen.2003`, Lemma 3.1.2, p. 45: “Lemma 3.1.2. For all x, y ∈R, (x + y)p n ≡(xn + yn)p ≡xp n + yp n modulo pWn(R). Proof. The right-hand congruence is” — Statement.
- `HesselholtMadsen.2003`, §3.1, p. 46: “Now, from Lemma 3.1.2, for every ring R, the map R →¯Wn(R) = Wn(R)/p, which takes x to the class of xp n, is a ring homomorphism. Let A be a complete” — The resulting ring homomorphism R → W_n(R)/p.

### The k-algebra structure ρ_n: k → W_n(A)/p

`L.5/residue-field-to-witt-mod-p` · construction

For A as in node L.5/complete-dvr-eisenstein-presentation, let ρ_n: k → W̄_n(A) = W_n(A)/pW_n(A) send x to the class of [f(x̃)]_n^p, where x̃ ∈ W(k) is any element whose residue class is the unique p-th root x^{1/p} of x. It is a ring homomorphism, and W̄_n(A) is always regarded as a k-algebra through ρ_n; R(ρ_n(x)) = ρ_{n−1}(x) and F(ρ_n(x)) = ρ_{n−1}(x^p).

**Hypotheses.**

- A is a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p; e = e_K = |K : K_0| is the absolute ramification index, K_0 the fraction field of W(k); π = π_K a uniformiser; M = A ∩ K^× ⊂ A the canonical prelog structure.

**Proof.**

1. Well defined: two lifts of x^{1/p} differ by an element of pW(k), and [a + pb]^p ≡ [a]^p mod p by node L.5/teichmuller-pth-power-additive-mod-p applied twice (p-th power additive and [pb]^p ∈ pW_n).
2. Ring map: additivity from node L.5/teichmuller-pth-power-additive-mod-p, multiplicativity from that of the Teichmüller map.
3. R and F commute with the Teichmüller map ([a]_n ↦ [a]_{n−1}, [a]_n ↦ [a^p]_{n−1}).

**API.**

- `TauCeti.WittVector.residueMap` (constructor): ρ_n: k →+* TruncatedWittVector p n A ⧸ p, x ↦ [f(x̃)]_n^p mod p.
- `TauCeti.WittVector.residueMap_restrict` (compatibility): R ∘ ρ_n = ρ_{n−1}.
- `TauCeti.WittVector.residueMap_frobenius` (compatibility): F ∘ ρ_n = ρ_{n−1} ∘ (x ↦ x^p).
- `TauCeti.WittVector.residueMap_independent` (extensionality): ρ_n(x) does not depend on the lift x̃ of x^{1/p}.

**Unit tests.**

- `TauCeti.WittVector.residueMap_one` (degenerate): ρ_n(1) = 1 and ρ_n(0) = 0.
- `TauCeti.WittVector.residueMap_n_one` (computation): For n = 1, ρ_1(x) = f(x̃)^p mod p is the image of x under k → A/p induced by f (the p-th power undoes the p-th root).
- `TauCeti.WittVector.residueMap_Zp` (compatibility): For A = Z_p, W_n(Z_p)/p ≅ W_n(Z_p) ⊗ F_p and ρ_n is the structure map of this F_p-algebra.
- `TauCeti.WittVector.residueMap_not_teichmuller` (non-example): x ↦ [f(x̃)]_n mod p (without the p-th power) is not additive: for A = Z_3, n = 2, [2]_2 ≢ [1]_2 + [1]_2 mod 3 (node L.5/teichmuller-pth-power-additive-mod-p).

**Acceptance.**

- For A = W(F_p) = Z_p, ρ_n is the unique ring map F_p → W_n(Z_p)/p = Z/p ⊗ W_n(Z_p).
- ρ_1: k → A/p is the inclusion of the residue field into A/p = k[π]/(π^e) given by f (x^{1/p} lifted then raised to p).

**Used by.**

- HM Proposition 3.1.5: W̄_n(A) is described as a k-algebra
- HM §5.1: the Tate spectral sequence is a spectral sequence of k-algebras via ρ_{n+1}: k → W̄_{n+1}(A) = π̄_0(T(A|K)^{C_{p^n}})
- HM §3.4: the k-vector space structure on W̄_n ω^1_{(A,M)}

**Depends on.** this roadmap: `L.5/teichmuller-pth-power-additive-mod-p`, `L.5/complete-dvr-eisenstein-presentation`; other roadmaps: `CrystallineCohomology:CR.4`; libraries: `mathlib:PerfectRing`.

**Sources.**

- `HesselholtMadsen.2003`, §3.1, (3.1.3), p. 46: “Hence, we have a ring homomorphism (3.1.3) ρn: k →¯Wn(A) which to x assigns f( g x1/p) p n+pWn(A). Here g x1/p ∈W(k) is any element whose residue class modulo p is the unique p-th root of x. We will always view ¯Wn(A) as a k-algebra via the map ρn. We note” — Definition of ρ_n.
- `HesselholtMadsen.2003`, §3.1, p. 46: “We note that R(ρn(x)) = ρn−1(x), F(ρn(x)) = ρn−1(xp). Let π” — Compatibility with R and F.

### The modified Verschiebung V_π on W_n(A)/p

`L.5/modified-verschiebung` · definition

With A, π = π_K and φ_K(x) = x^e + pθ_K(x) as in node L.5/complete-dvr-eisenstein-presentation, define V_π: W̄_{n−1}(A) → W̄_n(A), V_π(a) = θ_K([π]_n)V(a), where θ_K([π]_n) is the image of θ_K(x) under the k-algebra map k[x] → W̄_n(A), x ↦ class of [π]_n. Then FV_π ≡ 0 mod p, and, modulo p in a log Witt complex, FdV_π(a) = θ_K([π])^p da.

**Hypotheses.**

- A is a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p; e = e_K = |K : K_0| is the absolute ramification index, K_0 the fraction field of W(k); π = π_K a uniformiser; M = A ∩ K^× ⊂ A the canonical prelog structure.
- p odd (so that V(1) ≡ [−p]_n, used with V_π).

**Proof.**

1. θ_K([π]_n) is well defined since W̄_n(A) is a k-algebra through ρ_n (node L.5/residue-field-to-witt-mod-p).
2. FV_π(a) = F(θ_K([π]_n))·FV(a) = F(θ_K([π]_n))·pa ≡ 0 mod p.
3. FdV_π(a) = F(θ_K([π]_n)) FdV(a) + F(dθ_K([π]_n)) FV(a), and FV = p kills the second term modulo p while FdV = d; F(θ_K([π]_n)) = θ_K([π])^p since F acts on ρ by the Frobenius and on [π] by the p-th power.

**API.**

- `TauCeti.WittVector.modVerschiebung` (constructor): V_π(a) := θ_K([π]_n)·V(a) in TruncatedWittVector p n A ⧸ p.
- `TauCeti.WittVector.frobenius_modVerschiebung` (relation): F(V_π(a)) = 0 in W̄_{n−1}(A).
- `TauCeti.WittVector.modVerschiebung_one` (relation): V_π(1) = [π]_n^{e} in W̄_n(A).
- `TauCeti.WittVector.modVerschiebung_iterate` (other): V_π^s(a) = θ_K([π]_n)·V^s(c_s·a) with c_s = Π_{j=1}^{s−1} F^j(θ_K([π]_{n−j})) a unit of W̄_{n−s}(A) (projection formula yV(a) = V(F(y)a)); in particular V_π^s and V^s have the same image up to the unit θ_K([π]_n).

**Unit tests.**

- `TauCeti.WittVector.modVerschiebung_unramified` (computation): For A = Z_p (φ(x) = x − p, θ = −1): V_π = −V, and V_π(1) = [p]_2 in W̄_2(Z_p).
- `TauCeti.WittVector.modVerschiebung_n_one` (degenerate): For n = 1 the target W̄_1(A) = A/p and V_π: W̄_0 = 0 → A/p is zero.
- `TauCeti.WittVector.modVerschiebung_frobenius_zero` (characterisation): F ∘ V_π = 0 on W̄_n(A), as F ∘ V = p = 0 there; V_π and V agree when θ_K([π]) − 1 annihilates the image of V, in particular when θ_K([π]) = 1.
- `TauCeti.WittVector.modVerschiebung_ne_V` (non-example): For A = Z_p, V_π(1) = −V(1) ≠ V(1) in W̄_2(Z_p) ≅ F_p² (p odd): the modified and ordinary Verschiebung differ by the unit θ_K([π]).

**Acceptance.**

- For A = W(k) (θ = −1): V_π = −V and V_π(1) = −V(1) ≡ −[−p] = [p].
- In W̄_n(A): [π]^e = V_π(1) (proof of Proposition 3.1.5).

**Used by.**

- HM Proposition 3.1.5: generators V_π^s([π]^i) of W̄_n(A)
- HM Proposition 3.4.1: the k-basis of W̄_nω^1_{(A,M)}
- HM Remark 6.1.7: the elements dV_π^v([π]^i) in the noncanonical description of TC

**Depends on.** this roadmap: `L.5/residue-field-to-witt-mod-p`, `L.5/verschiebung-one-is-teichmuller-minus-p`; other roadmaps: `CrystallineCohomology:CR.4`.

**Sources.**

- `HesselholtMadsen.2003`, §3.1, (3.1.4), p. 46: “We introduce the modified Verschiebung (3.1.4) Vπ: ¯Wn−1(A) →¯Wn(A), Vπ(a) = θK(πn)V (a), where θK(πn) is the image of θK(x) under the k-algebra map k[x] →¯Wn(A) which to x assigns the class of πn. The composite FVπ is zero” — Definition of V_π.
- `HesselholtMadsen.2003`, §3.1, p. 46: “The composite FVπ is zero modulo p.” — F V_π = 0 mod p.

### Presentation of the k-algebra W_n(A)/p

`L.5/witt-mod-p-of-dvr` · theorem

Let p be odd and A as in node L.5/complete-dvr-eisenstein-presentation. The k-algebra W̄_n(A) = W_n(A)/p is generated by the elements V_π^s([π]^i), 0 ≤ s < n, i ≥ 0, subject to the relations V_π^s([π]^i)·V_π^t([π]^j) = V_π^t([π]^{p^t i + j}) if 0 = s ≤ t < n, = 0 if 0 < s ≤ t < n, and V_π^s([π]^{e+i}) = V_π^{s+1}([π]^{pi}). It is an n e_K-dimensional k-vector space with gr^s_V W̄_n(A) = k{V_π^s([π]^i) | 0 ≤ i < e_K}.

**Hypotheses.**

- A is a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p; e = e_K = |K : K_0| is the absolute ramification index, K_0 the fraction field of W(k); π = π_K a uniformiser; M = A ∩ K^× ⊂ A the canonical prelog structure.
- p odd.

**Proof.**

1. W̄_n(A) is spanned over k by V^s([π]^i): write a = Σ x_i π^i with x_i ∈ W(k) and use V^s([a]) ≡ Σ V^s(ρ_{n−s}(x̄_i)[π]^i) modulo V^{s+1} and V^s(ρ_{n−s}(x̄)[π]^i) = ρ_n(x̄^{1/p^s})V^s([π]^i); replace V by V_π since θ_K([π]) is a unit.
2. First relation: V_π^s(a)·V_π^t(b) = V_π^t(F^tV_π^s(a)·b) for s ≤ t, and F^tV_π^s = 0 for 0 < s ≤ t (node L.5/modified-verschiebung).
3. Second relation: [π]^e = [−p]·[θ_K(π)] ≡ V(1)[θ_K(π)] = V([θ_K(π)]^p) ≡ V(θ_K^{(1)}([π]^p)) = V(1)θ_K([π]) = V_π(1) (nodes L.5/verschiebung-one-is-teichmuller-minus-p and L.5/teichmuller-pth-power-additive-mod-p).
4. No further relations: the sequences 0 → A/p →V^{n−1} W̄_n(A) →R W̄_{n−1}(A) → 0 are exact (W_n(A) is torsion-free), so dim_k W̄_n(A) = n e_K, and the relations already give gr^s of dimension e_K.

**Acceptance.**

- A = Z_p (e = 1): W̄_n(Z_p) has k = F_p-basis V_π^s(1), 0 ≤ s < n, and dimension n.
- A = Z_p[ζ_p]: dim_{F_p} W̄_2(A) = 2(p − 1).

**Depends on.** this roadmap: `L.5/modified-verschiebung`, `L.5/verschiebung-one-is-teichmuller-minus-p`, `L.5/teichmuller-pth-power-additive-mod-p`, `L.5/residue-field-to-witt-mod-p`; libraries: `mathlib:TruncatedWittVector`.

**Sources.**

- `HesselholtMadsen.2003`, Proposition 3.1.5, p. 46: “Proposition 3.1.5. Suppose that p is odd. Then the k-algebra ¯Wn(A) is generated by the elements V s π (πi) with 0 ≤s < n and i ≥0 subject to the relations V s π (πi) · V t π(πj) = ( V t π(πpti+j), if 0 = s ≤t < n, 0, if 0 < s ≤t < n, V s π (πeK+i) = V s+1 π (πpi). Proof. The” — Statement.
- `HesselholtMadsen.2003`, Proof of Proposition 3.1.5, p. 47: “It remains to prove that there are no further relations. The sequences 0 →A/p V n−1 −−−→¯Wn(A) R −→¯Wn−1(A) →0 are exact, since Wn(A) is torsion-free, and show that ¯Wn(A) is an neK-dimensional” — The dimension count.

### The residue sequence 0 → Ω^1_A → ω^1_{(A,M)} → k → 0

`L.5/log-differentials-residue-sequence` · lemma

For A as in L.5 (a complete DVR with canonical prelog structure M = A ∩ K^×) there is a natural short exact sequence of A-modules 0 → Ω^1_A → ω^1_{(A,M)} →res k → 0 with res(a dlog b) = a v_K(b) + m_K, where Ω^1_A is the module of absolute Kähler differentials and ω^1_{(A,M)} the module of absolute log differentials (CrystallineCohomology CR.5:log-algebra). The relative version 0 → Ω^1_{A/W(k)} → ω^1_{(A,M)/W(k)} → k → 0 holds with ω^1_{(A,M)/W(k)} = (Ω^1_{A/W(k)} ⊕ (A ⊗ K^×))/⟨da − a ⊗ a⟩. For a finite extension L/K with B the integral closure of A, res_B ∘ i_* = e_{L/K}·(i ∘ res_A).

**Hypotheses.**

- A is a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p; e = e_K = |K : K_0| is the absolute ramification index, K_0 the fraction field of W(k); π = π_K a uniformiser; M = A ∩ K^× ⊂ A the canonical prelog structure.
- The proof uses only that A is a discrete valuation ring.

**Proof.**

1. res is well defined: for a ∈ M, res(dα(a)) = res(a dlog a) = a v_K(a) ∈ m_K, so the relation dα(a) = α(a)dlog a is respected; res(da) = 0.
2. Exactness in the middle: write b = π^i u with u ∈ A^×, so a dlog b = ia dlog π + a u^{−1} du; if ia ∈ m_K then ia π^{−1} ∈ A and ia dlog π = (iaπ^{−1}) dπ ∈ Ω^1_A.
3. Injectivity of Ω^1_A → ω^1_{(A,M)} and surjectivity of res are immediate from the presentation.
4. Base change: dlog π_K = e_{L/K} dlog π_L + (unit term), so res_B(i_* dlog π_K) = e_{L/K}.

**Acceptance.**

- A = Z_p: Ω^1_{Z_p} is uniquely divisible (Lemma 2.2.4), ω^1_{(Z_p,M)}/p = F_p·dlog p and res(dlog p) = 1.
- For u ∈ A^×: res(dlog u) = 0.

**Depends on.** this roadmap: `L.5/complete-dvr-eisenstein-presentation`; other roadmaps: `CrystallineCohomology:CR.5:log-algebra`; libraries: `mathlib:KaehlerDifferential`, `mathlib:IsDiscreteValuationRing`.

**Sources.**

- `HesselholtMadsen.2003`, Proposition 2.2.2, p. 33: “Proposition 2.2.2. There is a natural short exact sequence 0 →Ω1 A →ω1 (A,M) res −→k →0, where res(ad log b) = avK(b) + mK.” — Statement.
- `HesselholtMadsen.2003`, §2.2, p. 32: “There is a universal example of a derivation of a log ring (R, M) given by the R-module ω1 (R,M) = (Ω1 R ⊕(R ⊗Z Mgp))/⟨dα(a) −α(a) ⊗a | a ∈M⟩,” — Definition of ω^1_{(R,M)} with absolute Ω^1_R.

### ω^1_{(A,M)/W(k)} is cyclic on dlog π_K with annihilator (π_K φ'_K(π_K)) ⊂ pA

`L.5/relative-log-differentials-of-dvr` · lemma

Let π_K ∈ A be a uniformiser with minimal polynomial φ_K over W(k). Then dlog π_K generates the A-module ω^1_{(A,M)/W(k)}, its annihilator is the ideal (φ'_K(π_K)π_K), and p divides φ'_K(π_K)π_K: φ'_K(π_K)π_K = p(π_Kθ'_K(π_K) − e_Kθ_K(π_K)) = (e_K − π_Kθ'_K(π_K)θ_K(π_K)^{−1})π_K^{e_K}. Hence ω^1_{(A,M)/W(k)} ≅ A/(π_Kφ'_K(π_K)), and the annihilator equals pA exactly when p ∤ e_K. (HM print 'This ideal contains p'; the correct statement is that the ideal is contained in pA — see the source issue.)

**Hypotheses.**

- A is a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p; e = e_K = |K : K_0| is the absolute ramification index, K_0 the fraction field of W(k); π = π_K a uniformiser; M = A ∩ K^× ⊂ A the canonical prelog structure.

**Proof.**

1. Every element of K^× is π_K^i u with u ∈ A^×, and dlog(π_K^i u) = i dlog π_K + u^{−1}du; relative to W(k), du = u'(π_K)dπ_K = π_K u'(π_K) dlog π_K since A = W(k)[π_K], so dlog π_K generates.
2. The only relation is d(φ_K(π_K)) = φ'_K(π_K)dπ_K = φ'_K(π_K)π_K dlog π_K = 0.
3. Using π_K^{e} = −pθ_K(π_K) (node L.5/complete-dvr-eisenstein-presentation): π_Kφ'_K(π_K) = eπ_K^e + pπ_Kθ'_K(π_K) = p(π_Kθ'_K(π_K) − eθ_K(π_K)); the second factor is a unit iff p ∤ e, since θ_K(π_K) ∈ A^× and π_Kθ'_K(π_K) ∈ m_K.

**Acceptance.**

- A = Z_p: φ(x) = x − p, annihilator (p), ω^1_{rel} ≅ F_p dlog p.
- A = Z_p[ζ_p] (p odd, e = p − 1 prime to p): the annihilator is (p) and ω^1_{rel} ≅ A/p, of length p − 1.
- Wild case A = Z_p[π], π^p = p (φ(x) = x^p − p, θ = −1, e = p): π φ'(π) = pπ^p = p², so ω^1_{rel} ≅ A/p² and the annihilator (p²) does not contain p.

**Depends on.** this roadmap: `L.5/log-differentials-residue-sequence`, `L.5/complete-dvr-eisenstein-presentation`; libraries: `mathlib:KaehlerDifferential`.

**Sources.**

- `HesselholtMadsen.2003`, Lemma 2.2.3, p. 34: “Lemma 2.2.3. Let πK ∈A be a uniformizer with minimal polynomial φK(x). Then the element d log πK generates the A-module ω1 (A,M)/W (k), and its annihilator is the ideal generated by φ′ K(πK)πK. This ideal contains p. Proof. Since every element of K×” — Statement (with the misprinted last sentence).
- `HesselholtMadsen.2003`, Proof of Corollary 2.2.5, p. 35: “Hence, on the one hand, we have πKφ′ K(πK) = eKπeK K + pπKθ′ K(πK) = (eK −πKθ′ K(πK)θK(πK)−1)πeK K , and on the other hand, d log(−p) = d log(πeK K θK(πK)−1) = (eK −πKθ′ K(πK)θK(πK)−1)d log πK. The” — The factorisation of π_Kφ'_K(π_K) used for the p-torsion.

### The divisible part of ω^i_{(A,M)}

`L.5/log-differentials-divisible-part` · lemma

For all i > 0 there is a natural exact sequence A ⊗_{W(k)} Ω^i_{W(k)} → ω^i_{(A,M)} → ω^i_{(A,M)/W(k)} → 0, and A ⊗_{W(k)} Ω^i_{W(k)} is uniquely divisible. Consequently ω^1_{(A,M)} is the sum of its maximal divisible submodule D (the image of A ⊗ Ω^1_{W(k)}) and the cyclic torsion module ω^1_{(A,M)/W(k)}, and ω^i_{(A,M)} = Λ^i_A D is uniquely divisible for i ≥ 2.

**Hypotheses.**

- A is a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p; e = e_K = |K : K_0| is the absolute ramification index, K_0 the fraction field of W(k); π = π_K a uniformiser; M = A ∩ K^× ⊂ A the canonical prelog structure.

**Proof.**

1. For i = 1 combine the residue sequences of node L.5/log-differentials-residue-sequence (absolute and relative) with the exact sequence A ⊗_{W(k)} Ω^1_{W(k)} → Ω^1_A → Ω^1_{A/W(k)} → 0.
2. Ω^1_{W(k)} ≅ HH_1(W(k)) is uniquely divisible; more generally HH_i(W(k)) is uniquely divisible for i > 0: the coefficient sequence ⋯ → HH_{i+1}(k) → HH_i(W(k)) →p HH_i(W(k)) → HH_i(k) → ⋯ and HH_i(k) = 0 for i > 0 (node L.5/hochschild-homology-of-perfect-field).
3. ω^1 = D + cyclic torsion; for i > 1, ω^i = Λ^i(D + torsion cyclic) = Λ^i D since Λ² of a cyclic module vanishes and D ⊗ torsion = 0 for D divisible.

**Acceptance.**

- A = Z_p: ω^2_{(Z_p,M)} is uniquely divisible, so ω^2/p = 0 and π̄_2 T(Z_p|Q_p) comes only from κ (Theorem B).
- Ω^1_{Z_p} = Z_p ⊗ Ω^1_{Z_p} is a nonzero uniquely divisible group (Z_p has transcendental elements over Q).

**Depends on.** this roadmap: `L.5/log-differentials-residue-sequence`, `L.5/relative-log-differentials-of-dvr`, `L.5/hochschild-homology-of-perfect-field`; other roadmaps: `RefinedTraceMethods:RT.1`; libraries: `mathlib:ExteriorAlgebra`.

**Sources.**

- `HesselholtMadsen.2003`, Lemma 2.2.4, p. 34: “Lemma 2.2.4. For all i > 0, there is a natural exact sequence A ⊗W (k) Ωi W (k) →ωi (A,M) →ωi (A,M)/W (k) →0, and the left-hand group is uniquely divisible. Proof. The stated sequence for i = 1” — Statement.
- `HesselholtMadsen.2003`, Proof of Lemma 2.2.4, p. 34: “We show that the group Ω1 W (k) ∼ −→HH1(W(k)) is a uniquely divisible group” — Unique divisibility via HH of W(k) and of the perfect field k.

### The p-torsion of ω^1_{(A,M)} is A/p · dlog(−p)

`L.5/log-differentials-p-torsion` · lemma

The p-torsion submodule of ω^1_{(A,M)} is _pω^1_{(A,M)} = A/p · dlog(−p), a free A/p-module of rank one; in particular it is an e_K-dimensional k-vector space.

**Hypotheses.**

- A is a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p; e = e_K = |K : K_0| is the absolute ramification index, K_0 the fraction field of W(k); π = π_K a uniformiser; M = A ∩ K^× ⊂ A the canonical prelog structure.

**Proof.**

1. By node L.5/log-differentials-divisible-part, _pω^1_{(A,M)} ≅ _pω^1_{(A,M)/W(k)}.
2. ω^1_{(A,M)/W(k)} = A/(π_Kφ'_K(π_K)) dlog π_K (node L.5/relative-log-differentials-of-dvr) with π_Kφ'_K(π_K) = (e − π_Kθ'_K(π_K)θ_K(π_K)^{−1})π_K^e.
3. dlog(−p) = dlog(π_K^e θ_K(π_K)^{−1}) = (e − π_Kθ'_K(π_K)θ_K(π_K)^{−1}) dlog π_K; since p = −π_K^e θ_K(π_K)^{−1}, the p-torsion of the cyclic module A/(c π^e) dlog π is generated by c dlog π = dlog(−p) and is A/p·dlog(−p).

**Acceptance.**

- A = Z_p: _pω^1 = F_p·dlog(−p) = F_p·dlog p.
- The Bockstein β: π̄_2 T(A|K) ≅ _pπ_1 T(A|K) = _pω^1_{(A,M)} is used to define κ with β(κ) = dlog(−p).

**Depends on.** this roadmap: `L.5/log-differentials-divisible-part`, `L.5/relative-log-differentials-of-dvr`.

**Sources.**

- `HesselholtMadsen.2003`, Corollary 2.2.5, p. 35: “Corollary 2.2.5. The p-torsion submodule of ω1 (A,M) is pω1 (A,M) = A/p · d log(−p). Proof. It follows from” — Statement.

### Log differentials base change exactly along tamely ramified extensions

`L.5/tame-base-change-of-log-differentials` · lemma

Let L/K be finite, B the integral closure of A in L, e_{L/K} = e_L/e_K. The canonical map B ⊗_A ω^1_{(A,M_A)/W(k)} → ω^1_{(B,M_B)/W(k)} is an isomorphism if and only if p ∤ e_{L/K}. (Whereas B ⊗_A Ω^1_{A/W(k)} → Ω^1_{B/W(k)} is an isomorphism iff e_{L/K} = 1.)

**Hypotheses.**

- A is a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p; e = e_K = |K : K_0| is the absolute ramification index, K_0 the fraction field of W(k); π = π_K a uniformiser; M = A ∩ K^× ⊂ A the canonical prelog structure.
- L/K finite; k perfect (so the residue extension is separable).

**Proof.**

1. If e_{L/K} = 1 use the residue sequences and the unramified isomorphism for Ω^1.
2. Reduce to L/K totally ramified; if p ∤ e_{L/K} choose uniformisers with π_K = π_L^{e_{L/K}} (normalise the unit via the Teichmüller splitting of B^× → k^× and extract an e_{L/K}-th root of a principal unit).
3. Then φ_L(x) = φ_K(x^{e_{L/K}}), dlog π_K = e_{L/K} dlog π_L and φ'_L(π_L)π_L = e_{L/K}φ'_K(π_K)π_K, so generators and annihilators correspond since e_{L/K} is a unit.
4. If L/K is wildly ramified the same computation shows the map is not an isomorphism.

**Acceptance.**

- K = Q_p, L = Q_p(p^{1/2}) (p odd, e_{L/K} = 2 prime to p): B ⊗ ω^1_{rel}(Z_p) ≅ ω^1_{rel}(B).
- Non-example: L = Q_p(ζ_{p²}) ⊃ K = Q_p(ζ_p), e_{L/K} = p: the map is not an isomorphism.

**Depends on.** this roadmap: `L.5/relative-log-differentials-of-dvr`, `L.5/log-differentials-residue-sequence`, `L.5/complete-dvr-eisenstein-presentation`.

**Sources.**

- `HesselholtMadsen.2003`, Lemma 2.2.6, p. 36: “Lemma 2.2.6. The canonical map B ⊗A ω1 (A,MA)/W (k) →ω1 (B,MB)/W (k) is an isomorphism if and only if p does not divide eL/K. Proof. Suppose that p does not” — Statement.

### Hochschild homology of a perfect field of characteristic p is concentrated in degree 0

`L.5/hochschild-homology-of-perfect-field` · lemma

For a perfect field k of characteristic p > 0, HH_*(k) = k, concentrated in degree 0 (classical Hochschild homology, computed by the Hochschild complex over ℤ, which for an 𝔽_p-algebra is its Hochschild complex over 𝔽_p; derived Hochschild homology over ℤ differs, HH_*(𝔽_p/ℤ) being a divided-power algebra on a class in degree 2). In particular Ω^1_k = 0 and HH_*(k) ⊗ … vanishes in positive degrees.

**Hypotheses.**

- k a perfect field of characteristic p > 0.

**Proof.**

1. Choose a transcendence basis {X_i} of k over F_p; l = colim_r F_p(X_i^{p^{−r}}) ⊂ k is perfect and k/l is separable algebraic, a filtered colimit of finite étale extensions k_α/l.
2. Étale base change for Hochschild homology (RefinedTraceMethods RT.1): HH_*(k_α) ≅ k_α ⊗_l HH_*(l); HH commutes with filtered colimits, so HH_*(k) ≅ k ⊗_l HH_*(l).
3. By HKR for the smooth F_p-algebras F_p[X_i] and compatibility with localisation and filtered colimits, HH_*(l) ≅ Ω^*_{l/F_p}, which vanishes in positive degrees since l is perfect (dx = d(y^p) = p y^{p−1}dy = 0).

**Acceptance.**

- k = F_p: HH_*(F_p) = F_p.
- Non-example: k = F_p(t) (not perfect): HH_1(k) ⊇ Ω^1_{k/F_p} = k dt ≠ 0.

**Depends on.** other roadmaps: `RefinedTraceMethods:RT.1`; libraries: `mathlib:PerfectRing`, `mathlib:KaehlerDifferential`.

**Sources.**

- `HesselholtMadsen.1997a`, Lemma 4.5, PDF p. 34: “Lemma 4.5. If k is a perfect field of positive characteristic then HH∗(k) = k. Proof. We” — Statement.
- `HesselholtMadsen.1997a`, Proof of Lemma 4.5, PDF p. 35: “Now HH∗(l) = l. Indeed, by [HKR] HH∗(Fp[Xi| i ∈I]) ∼= Ω∗ Fp[Xi| i∈I]/Fp and both sides commute with filtered colimits and localization, so HH∗(l) ∼= Ω∗ l/Fp. Now since l is perfect Ωl/Fp = 0, as dx = d(yp) = pyp−1dy = 0. □ We” — The HKR step and the vanishing of Ω for perfect fields.

### Log Witt complexes over a log ring (R, M)

`L.5/log-witt-complex` · definition

Let p be odd, R a Z_(p)-algebra and (R, M) a log ring (a prelog structure α: M → (R,·)); give W_n(R) the prelog structure M →α R →[−]_n W_n(R). A log Witt complex over (R,M) consists of: (i) a pro-log differential graded ring (E^*_•, M_E) with a map of pro-log rings λ: (W_•(R), M) → (E^0_•, M_E); (ii) a map of pro-log graded rings F: E^*_n → E^*_{n−1} with λF = Fλ, F dlog_n a = dlog_{n−1} a for a ∈ M, and F d[a]_n = [a]_{n−1}^{p−1} d[a]_{n−1} for a ∈ R; (iii) a map of pro-graded E^*_•-modules V: F^*E^*_n → E^*_{n+1} with λV = Vλ, FV = p and FdV = d. Here a pro-log dga is a pro-dga with prelog structure α: M → E^0 and Dlog: M → E^1 with d∘Dlog = 0 and dα(a) = α(a)Dlog a (CrystallineCohomology CR.5:log-algebra). A map of log Witt complexes is a map of pro-log dgas commuting with λ, F and V. For the trivial log structure M = {1} this is the notion of Witt complex of CrystallineCohomology CR.4.

**Hypotheses.**

- p odd; R a Z_(p)-algebra. For p = 2 the definition must be changed: in TR one has d∘d = η·d with η = dlog(−1) ≠ 0 (Hesselholt–Madsen 2004).

**Proof.**

1. Assemble the data from the prelog structures of CR.5:log-algebra and the Witt-vector operators on W_•(R) (CrystallineCohomology CR.4 for F, V, R on truncated Witt vectors); no construction beyond the definition is involved.

**API.**

- `TauCeti.LogWittComplex` (structure): The structure of a log Witt complex over (R,M): (E, λ, F, V) with the axioms (i)–(iii).
- `TauCeti.LogWittComplex.Hom` (structure): Maps of log Witt complexes: maps of pro-log dgas commuting with λ, F, V; they form a category.
- `TauCeti.LogWittComplex.frobenius_dlog` (simp): F(dlog_n a) = dlog_{n−1} a for a ∈ M.
- `TauCeti.LogWittComplex.frobenius_d_teichmuller` (simp): F(d[a]_n) = [a]_{n−1}^{p−1} d[a]_{n−1}.
- `TauCeti.LogWittComplex.frobenius_verschiebung` (simp): F(V(x)) = p x and F(d(V(x))) = d x.
- `TauCeti.LogWittComplex.ofWittComplex` (compatibility): For the trivial log structure M = {1} (or M ⊂ R^×), a log Witt complex is exactly a Witt complex over R in the sense of CR.4 (dlog of units is forced to be u^{−1}du).
- `TauCeti.LogWittComplex.restrictScalars` (functoriality): A map of log rings (R,M) → (R',M') pulls log Witt complexes over (R',M') back to (R,M).

**Unit tests.**

- `TauCeti.LogWittComplex.degreeZero` (degenerate): (W_•(R), M) with E^i = 0 for i > 0, Dlog = 0, F and V the Witt-vector operators, is a log Witt complex (all axioms involving E^1 hold trivially), and the unique map W_•ω^*_{(R,M)} → (W_•(R),M) is the projection onto degree 0.
- `TauCeti.LogWittComplex.ofTrivial` (compatibility): With M = {1}, the category of log Witt complexes over (R,{1}) equals the category of Witt complexes over R of CrystallineCohomology CR.4.
- `TauCeti.LogWittComplex.tr_example` (computation): For A = Z_p with p odd, TR^•_*(Z_p|Q_p;p) is a log Witt complex with dlog_n(p) ∈ TR^n_1 and F dlog_n p = dlog_{n−1} p.
- `TauCeti.LogWittComplex.not_p2` (non-example): For p = 2 and A = Z_(2), TR^•_*(A|A[1/2];2) with its operators is not a log Witt complex in this sense, since d∘d = η·d ≠ 0 (Hesselholt–Madsen 2004, introduction).

**Acceptance.**

- (W_•(R), M) concentrated in degree 0 is a log Witt complex (λ = id).
- TR^•_*(A|K;p) is a log Witt complex over (A,M) for p odd (node L.5/tr-log-dvr-is-log-witt-complex).

**Used by.**

- HM Proposition 3.2.2: the initial object W_•ω^*_{(R,M)}
- HM Proposition 3.3.1: TR^•_*(A|K;p) is a log Witt complex, giving the canonical map from W_•ω^*_{(A,M)}
- HM Lemma 3.2.4: the filtration quotients W_nω/Fil^s are log Witt complexes
- HM §6.1: W_•ω^*_{(A,M)} ⊗ S_{Z/p^v}(μ_{p^v}) with R, F, V acting trivially on the second factor is a log Witt complex

**Depends on.** other roadmaps: `CrystallineCohomology:CR.4`, `CrystallineCohomology:CR.5:log-algebra`; libraries: `mathlib:TruncatedWittVector`, `mathlib:WittVector.teichmuller`.

**Sources.**

- `HesselholtMadsen.2003`, Definition 3.2.1, p. 47: “Definition 3.2.1. A log Witt complex over (R, M) consists of: (i) a pro-log differential graded ring (E∗· , ME) together with a map of pro-log rings λ: (W·(R), M) →(E0· , ME); (ii) a map of pro-log graded rings F: E∗ n →E∗ n−1, such that λF = Fλ and such that Fd logn a = d logn−1 a,” — Definition, (i)–(iii).
- `HesselholtMadsen.2003`, §3.2, p. 47: “We now assume that p is odd and that R is a Z(p)-algebra. Definition 3.2.1. A” — Standing hypotheses of the definition.

### dF = pFd, Vd = pdV and V(x dy) = V(x)dV(y) in any log Witt complex

`L.5/log-witt-complex-derived-relations` · lemma

In every log Witt complex over (R,M): dF = pFd, Vd = pdV and V(x dy) = V(x)dV(y).

**Hypotheses.**

- A log Witt complex (node L.5/log-witt-complex).

**Proof.**

1. V(x dy) = V(x·FdV(y)) = V(x)dV(y) by FdV = d and the projection formula V(x F(z)) = V(x)z.
2. dF(x) = FdVF(x) = Fd(V(1)x) = FdV(1)F(x) + FV(1)F(dx) = d(1)F(x) + pFd(x) = pFd(x).
3. Vd(x) = V(1)dV(x) = d(V(1)V(x)) − dV(1)V(x) = dV(xFV(1)) − V(x d(1)) = pdV(x).

**Acceptance.**

- In W_•ω^*_{(A,M)}: V(dlog a) = V(1) dlog a.
- For the de Rham–Witt complex of F_p: dF = pFd holds with both sides zero in degree 0 → 1 since W_nΩ^1_{F_p} = 0.

**Depends on.** this roadmap: `L.5/log-witt-complex`.

**Sources.**

- `HesselholtMadsen.2003`, §3.2, p. 48: “The following relations are valid in any log Witt complex: dF = pFd, V d = pdV, V (xdy) = V (x)dV (y). Indeed, V (xdy) = V (xFdV (y)) = V (x)dV (y), and dF(x) = FdV F(x) = Fd(V (1)x) = FdV (1)F(x) + FV (1)F(dx) = d(1)F(x) + pFd(x) = pFd(x), V d(x) = V (1)dV (x) = d(V (1)V (x)) −dV” — Statement and proof.

### The de Rham–Witt complex with log poles W_•ω^*_{(R,M)}

`L.5/log-de-rham-witt-complex` · construction · planet “De Rham–Witt complex with log poles”

For p odd and a log ring (R,M) with R a Z_(p)-algebra, the category of log Witt complexes over (R,M) has an initial object W_•ω^*_{(R,M)}, the de Rham–Witt complex with log poles, and the canonical map λ: ω^*_{(W_•(R),M)} → W_•ω^*_{(R,M)} from the log de Rham complex of (W_•(R), M) is surjective; W_•ω^0_{(R,M)} = W_•(R). For M trivial it is the de Rham–Witt complex W_•Ω^*_R of CrystallineCohomology CR.4; there is a natural map W_•Ω^*_R → W_•ω^*_{(R,M)}. For a complete discrete valuation ring A with canonical log structure, W_•ω^*_{(A,M)} is the de Rham–Witt complex of A with log poles at the maximal ideal.

**Hypotheses.**

- p odd; R a Z_(p)-algebra; M → R a prelog structure.

**Proof.**

1. Existence: Freyd's adjoint functor theorem (solution set: log Witt complexes generated by the images of λ, dlog and the operators form a set), as in Hesselholt–Madsen 2004 §1 for the non-log case; HM 2003 give no further detail and HM 2004 refer back to HM 2003 §3 for the log case (recorded gap and source issue).
2. Surjectivity of λ: the sub-pro-dga generated by the images of ω^*_{(W_•(R),M)} is stable under F and V (by F d[a] = [a]^{p−1}d[a], FdV = d and the projection formula) and is therefore a log Witt complex receiving the initial map; so it is everything.
3. Degree 0: (W_•(R), M) is itself a log Witt complex concentrated in degree zero, which forces W_•ω^0 = W_•(R).
4. Trivial log structure: the universal property coincides with that of W_•Ω^*_R (node L.5/log-witt-complex, compatibility item).

**API.**

- `TauCeti.logDeRhamWitt` (constructor): W_•ω^*_{(R,M)}, the initial log Witt complex over (R,M).
- `TauCeti.logDeRhamWitt.lift` (universal-property): For every log Witt complex E over (R,M) the unique map W_•ω^*_{(R,M)} → E of log Witt complexes.
- `TauCeti.logDeRhamWitt.lift_unique` (universal-property): Any two maps of log Witt complexes W_•ω^*_{(R,M)} → E are equal (initiality).
- `TauCeti.logDeRhamWitt.surjective_of_logDeRham` (characterisation): λ: ω^*_{(W_n(R),M)} → W_nω^*_{(R,M)} is surjective for every n.
- `TauCeti.logDeRhamWitt.degreeZero` (simp): W_nω^0_{(R,M)} = W_n(R).
- `TauCeti.logDeRhamWitt.map` (functoriality): A map of log rings (R,M) → (R',M') induces W_•ω^*_{(R,M)} → W_•ω^*_{(R',M')}, functorially.
- `TauCeti.logDeRhamWitt.ofDeRhamWitt` (compatibility): The natural map W_•Ω^*_R → W_•ω^*_{(R,M)} from the ordinary de Rham–Witt complex of CR.4, an isomorphism when M consists of units.
- `TauCeti.logDeRhamWitt.dlog` (data): dlog_n: M → W_nω^1_{(R,M)}, a monoid map to (W_nω^1,+) with d[α(a)]_n = [α(a)]_n dlog_n a.

**Unit tests.**

- `TauCeti.logDeRhamWitt_levelOne` (computation): W_1ω^*_{(R,M)} ≅ ω^*_{(R,M)}; for (Z_p, M) and p odd, W_1ω^1/p ≅ F_p·dlog p.
- `TauCeti.logDeRhamWitt_trivial` (compatibility): For M = {1}: W_•ω^*_{(R,{1})} ≅ W_•Ω^*_R (CrystallineCohomology CR.4), and for R = F_p both are W_•(F_p) = Z/p^• in degree 0.
- `TauCeti.logDeRhamWitt_units` (degenerate): For M = R^× (units only) the log structure adds nothing: W_•ω^*_{(R,R^×)} ≅ W_•Ω^*_R, since dlog u = [u]^{−1}d[u] is forced.
- `TauCeti.logDeRhamWitt_Zp_dim` (computation): For A = Z_p (p odd) and every n ≥ 1, W_nω^1_{(Z_p,M)}/p is an n-dimensional F_p-vector space (Proposition 3.4.1 with e_K = 1).
- `TauCeti.logDeRhamWitt_ne_ordinary` (non-example): For A = Z_p with M = A ∩ Q_p^×: W_1ω^1_{(A,M)}/p = F_p dlog p ≠ 0 = W_1Ω^1_{Z_p}/p (Ω^1_{Z_p} is uniquely divisible), so the log complex differs from CR.4's ordinary complex.

**Acceptance.**

- W_1ω^*_{(R,M)} = ω^*_{(R,M)} (node L.5/log-de-rham-witt-level-one).
- For A = Z_p, p odd: W̄_nω^1_{(Z_p,M)} has F_p-dimension n (node L.5/log-de-rham-witt-dvr-mod-p).

**Used by.**

- HM Proposition 3.3.1: the canonical map W_•ω^*_{(A,M)} → TR^•_*(A|K;p)
- HM Theorem 3.3.8: it is an isomorphism in degrees ≤ 2
- HM Theorem C: W_•ω^*_{(A,M)} ⊗ S_{Z/p^v}(μ_{p^v}) ≅ TR^•_*(A|K;p,Z/p^v) as pro-groups
- HM introduction, the sequence before Theorem A: K_*(K,Z/p^v) is computed from W ω^*_{(A,M)} ⊗ S(μ_{p^v}) and 1 − F
- HigherLocalFieldsAndHigherClassFieldTheory HL.1, HL.2, HL.4: the logarithmic/DVR de Rham–Witt comparison for complete discrete valuation rings requested from L.5

**Depends on.** this roadmap: `L.5/log-witt-complex`, `L.5/log-witt-complex-derived-relations`; other roadmaps: `CrystallineCohomology:CR.4`, `CrystallineCohomology:CR.5:log-algebra`.

**Sources.**

- `HesselholtMadsen.2003`, Proposition 3.2.2, p. 48: “Proposition 3.2.2. The category of log Witt complexes over (R, M) has an initial object W· ω∗ (R,M). Moreover, the canonical map is surjective: λ: ω∗ (W·(R),M) ։ W· ω∗ (R,M). Proof. This is a fairly straightforward application of the Freyd adjoint functor theorem, [29, p. 116]. For a” — Statement and the proof by reference.
- `HesselholtMadsen.2004`, Introduction, PDF p. 4: “The notion of a Witt complex and theorem A above generalize to log-rings; see [9, §3] for details. The universal example is denoted W· Ω∗ (R,M). It generalizes the construction of Hyodo-Kato [12] for” — HM 2004 refer the log case back to HM 2003 §3.

### W_1ω^*_{(R,M)} is the de Rham complex with log poles

`L.5/log-de-rham-witt-level-one` · lemma

The canonical map λ: ω^*_{(R,M)} → W_1ω^*_{(R,M)} is an isomorphism, where ω^*_{(R,M)} = Λ^*_R ω^1_{(R,M)} is the universal log dga with underlying log ring (R,M).

**Hypotheses.**

- p odd; R a Z_(p)-algebra.

**Proof.**

1. HM cite Hesselholt–Madsen 2004 Theorem D (the forgetful functor from Witt complexes to V-complexes without F preserves initial objects), which is proved there for the non-log Witt complexes; the log analogue is asserted without proof (recorded gap).
2. Route: show that ω^*_{(R,M)} extends to a log Witt complex in which level 1 is ω^* (define the higher levels by the initial object and prove that W_1 of the initial object is the initial log dga by checking that ω^*_{(R,M)} with F = V = 0 at level 1 satisfies the axioms restricted to level 1).

**Acceptance.**

- For A = Z_p: W_1ω^1_{(Z_p,M)} = ω^1_{(Z_p,M)}, with W_1ω^1/p = F_p dlog p.

**Depends on.** this roadmap: `L.5/log-de-rham-witt-complex`; other roadmaps: `CrystallineCohomology:CR.5:log-algebra`.

**Sources.**

- `HesselholtMadsen.2003`, Addendum 3.2.3, p. 48: “Addendum 3.2.3. The canonical map is an isomorphism: λ: ω∗ (R,M) ∼ −→W1 ω∗ (R,M). The filtration of a log” — Statement.
- `HesselholtMadsen.2003`, §3.2, p. 48: “Moreover, from [17, Th. D] we have: Addendum 3.2.3. The” — The addendum is taken from HM 2004 Theorem D.

### W_nω/Fil^s ≅ W_sω for the standard filtration

`L.5/standard-filtration-quotient` · lemma

For a log Witt complex E the standard filtration Fil^s E^i_n = V^s E^i_{n−s} + dV^s E^{i−1}_{n−s} ⊂ E^i_n (0 ≤ s < n) consists of differential graded ideals with F(Fil^s) ⊂ Fil^{s−1} and V(Fil^s) ⊂ Fil^{s+1} (not multiplicative in general). For the initial object, restriction induces isomorphisms W_nω^i_{(R,M)}/Fil^s W_nω^i_{(R,M)} ≅ W_sω^i_{(R,M)}.

**Hypotheses.**

- p odd, R a Z_(p)-algebra; s ≤ n.

**Proof.**

1. For fixed n − s the quotients 'W_sω^i = W_nω^i/Fil^s form a log Witt complex over (R,M).
2. Existence of a map to any log Witt complex E: naturality of the filtration and R^{n−s}: E_n/Fil^s → E_s.
3. Uniqueness: ω^i_{(W_s(R),M)} → 'W_sω^i is surjective, by the surjectivity of λ for W_n and of W_n → 'W_s (node L.5/log-de-rham-witt-complex).
4. Hence 'W_•ω is initial, i.e. equals W_•ω.

**Acceptance.**

- s = n − 1: W_nω^i/(V^{n−1}W_1ω^i + dV^{n−1}W_1ω^{i−1}) ≅ W_{n−1}ω^i, used in Proposition 3.2.6.

**Depends on.** this roadmap: `L.5/log-de-rham-witt-complex`, `L.5/log-witt-complex-derived-relations`.

**Sources.**

- `HesselholtMadsen.2003`, §3.2, p. 48: “The filtration of a log Witt complex by the differential graded ideals Fils Ei n = V sEi n−s + dV sEi−1 n−s ⊂Ei n is called the standard filtration. It satisfies F(Fils Ei n) ⊂ Fils−1 Ei n−1, V (Fils” — The standard filtration.
- `HesselholtMadsen.2003`, Lemma 3.2.4, p. 48: “Lemma 3.2.4. The restriction map induces an isomorphism Wn ωi (R,M)/ Fils Wn ωi (R,M) ∼ −→Ws ωi (R,M).” — Statement.

### The derivation F^{n−1}d and the W_n(R)-module hW_nω^i_{(R,M)}

`L.5/homotopy-orbit-de-rham-witt-module` · construction

Define F^{n−1}d: W_n(R) → ω^1_{(R,M)} by F^{n−1}d(a) = a_0^{p^{n−1}−1}da_0 + a_1^{p^{n−2}−1}da_1 + ⋯ + da_{n−1} for a = (a_0,…,a_{n−1}); it is a derivation into (F^{n−1})^*ω^1_{(R,M)} with dF^{n−1} = p^{n−1}F^{n−1}d. The formula a·(ω_1,ω_2) = (F^{n−1}(a)ω_1, F^{n−1}(a)ω_2 − F^{n−1}da·ω_1) makes ω^{i−1} ⊕ ω^i a W_n(R)-module, and hW_nω^i_{(R,M)} is its quotient by the image of (F^{n−1})^*ω^{i−1} → ω^{i−1} ⊕ ω^i, ω ↦ (p^{n−1}ω, −dω). There is a natural exact sequence of W_n(R)-modules (F^{n−1})^* _{p^{n−1}}ω^{i−1} →d (F^{n−1})^*ω^i →ι_2 hW_nω^i →pr_1 (F^{n−1})^*(ω^{i−1}/p^{n−1}) → 0 (Lemma 3.2.5). It is the algebraic model of the homotopy groups of the homotopy orbit spectrum (Lemma 3.3.3).

**Hypotheses.**

- p odd; R a Z_(p)-algebra; n ≥ 1.

**Proof.**

1. F^{n−1}d is a derivation: it is the composite of F^{n−1}: W_n → W_1 with d on the ghost side, checked on the formula (routine).
2. The module axioms for ω^{i−1} ⊕ ω^i follow from the derivation property; the map ω ↦ (p^{n−1}ω, −dω) is W_n(R)-linear by dF^{n−1} = p^{n−1}F^{n−1}d.
3. As an abelian group hW_nω^i is the pushout of ω^i ←d ω^{i−1} →p^{n−1} ω^{i−1}, which gives the exact sequence (Lemma 3.2.5).

**API.**

- `TauCeti.logDeRhamWitt.frobeniusIterD` (constructor): F^{n−1}d: W_n(R) → ω^1_{(R,M)}, the explicit derivation.
- `TauCeti.logDeRhamWitt.frobeniusIterD_derivation` (relation): F^{n−1}d(ab) = F^{n−1}(a)F^{n−1}d(b) + F^{n−1}(b)F^{n−1}d(a).
- `TauCeti.logDeRhamWitt.d_frobeniusIter` (relation): d(F^{n−1}(a)) = p^{n−1}F^{n−1}d(a).
- `TauCeti.logDeRhamWitt.hW` (constructor): hW_nω^i_{(R,M)}, the quotient W_n(R)-module described above.
- `TauCeti.logDeRhamWitt.hW_exact` (other): The exact sequence (F^{n−1})^* _{p^{n−1}}ω^{i−1} → (F^{n−1})^*ω^i → hW_nω^i → (F^{n−1})^*(ω^{i−1}/p^{n−1}) → 0.
- `TauCeti.logDeRhamWitt.hW_map` (functoriality): Natural in maps of log rings.

**Unit tests.**

- `TauCeti.logDeRhamWitt.hW_n_one` (degenerate): For n = 1: p^0 = 1, so hW_1ω^i ≅ ω^i (the pushout identifies ω^{i−1} via ω ↦ (ω, −dω)).
- `TauCeti.logDeRhamWitt.frobeniusIterD_teichmuller` (computation): F^{n−1}d([a]_n) = a^{p^{n−1}−1}da.
- `TauCeti.logDeRhamWitt.frobeniusIterD_V` (computation): F^{n−1}d(V^{n−1}[a]_1) = da (only the last coordinate is nonzero).
- `TauCeti.logDeRhamWitt.hW_Zp_degree_one` (compatibility): For A = Z_p, n = 2, i = 1: hW_2ω^1 is an extension of (F)^*(Z_p/p) by (F)^*ω^1_{(Z_p,M)}, matching hTR^2_1(Z_p|Q_p;p) from the spectral sequence H_s(C_p, π_tT) (node L.5/homotopy-orbit-comparison).
- `TauCeti.logDeRhamWitt.frobeniusIterD_not_additive_naive` (non-example): The naive map a ↦ d(a_0) is additive but is not a derivation of W_n(R) into (F^{n−1})^*ω^1 for n ≥ 2: it fails the twisted Leibniz rule that F^{n−1}d satisfies (over ℤ[x] with p = 3 the two sides are 2x dx and 2x^3 dx), and the correction terms a_i^{p^{n−1−i}−1} da_i are needed.

**Acceptance.**

- For i = 0: hW_nω^0 = (F^{n−1})^*R.
- For i = 1 and R = A: 0 → (F^{n−1})^*ω^1 → hW_nω^1 → (F^{n−1})^*(A/p^{n−1}) → 0, matching the homotopy-orbit spectral sequence.

**Used by.**

- HM Proposition 3.2.6: N: hW_nω^i → W_nω^i, N(ω_1,ω_2) = dV^{n−1}λ(ω_1) + V^{n−1}λ(ω_2), has image Fil^{n−1}
- HM Lemma 3.3.3: hW_nω^i_{(A,M)} ≅ hTR^n_i(A|K;p) for i ≤ 1, and a presentation for i = 2
- HM Corollary 3.2.7: unique divisibility of W_nω^i for i ≥ 2

**Depends on.** this roadmap: `L.5/log-de-rham-witt-complex`; other roadmaps: `CrystallineCohomology:CR.5:log-algebra`; libraries: `mathlib:TruncatedWittVector`.

**Sources.**

- `HesselholtMadsen.2003`, §3.2, p. 49: “We define a map F n−1d: Wn(R) →ω1 (R,M) by the formula F n−1d(a) = apn−1−1 0 da0 + apn−2−1 1 da1 + · · · + dan−1, where a = (a0, . . . , an−1). One easily verifies that F n−1d is a derivation of Wn(R) into the Wn(R)-module (F n−1)∗ω1 (R,M) and that the following relation holds: dF” — Definition of F^{n−1}d and of hW_nω^i.
- `HesselholtMadsen.2003`, Lemma 3.2.5, p. 50: “Lemma 3.2.5. There is a natural exact sequence of Wn(R)-modules (F n−1)∗ pn−1ωi−1 (R,M) d −→(F n−1)∗ωi (R,M) ι2 −→hWn ωi (R,M) pr1 −→(F n−1)∗(ωi−1 (R,M)/pn−1) →0. Proof. Indeed, as an abelian group,” — The exact sequence.

### The kernel of the restriction W_nω^i → W_{n−1}ω^i

`L.5/kernel-of-restriction` · lemma

For any log ring (R,M) there is a natural exact sequence of W_n(R)-modules hW_nω^i_{(R,M)} →N W_nω^i_{(R,M)} →R W_{n−1}ω^i_{(R,M)} → 0 with N(ω_1,ω_2) = dV^{n−1}λ(ω_1) + V^{n−1}λ(ω_2).

**Hypotheses.**

- p odd; R a Z_(p)-algebra.

**Proof.**

1. λ(F^{n−1}da) = F^{n−1}dλ(a) for a ∈ W_n(R) (Definition 3.2.1), so N is W_n(R)-linear.
2. The image of N is Fil^{n−1}W_nω^i, and W_nω^i/Fil^{n−1} ≅ W_{n−1}ω^i by node L.5/standard-filtration-quotient.

**Acceptance.**

- i = 0: 0 → (F^{n−1})^*R →V^{n−1} W_n(R) →R W_{n−1}(R) → 0 (exact on the left too).

**Depends on.** this roadmap: `L.5/homotopy-orbit-de-rham-witt-module`, `L.5/standard-filtration-quotient`.

**Sources.**

- `HesselholtMadsen.2003`, Proposition 3.2.6, p. 50: “Proposition 3.2.6. For any log ring (R, M), there is a natural exact sequence of Wn(R)-modules, hWn ωi (R,M) N −→Wn ωi (R,M) R −→Wn−1 ωi (R,M) →0, where N(ω1, ω2) = dV n−1λ(ω1) + V n−1λ(ω2). Proof.” — Statement.

### W_nω^i_{(A,M)} is uniquely divisible for i ≥ 2

`L.5/log-de-rham-witt-dvr-divisible` · lemma

Let A be a complete discrete valuation ring of mixed characteristic (0,p) with perfect residue field and canonical log structure. Then W_nω^i_{(A,M)} is uniquely divisible for all n ≥ 1 and i ≥ 2.

**Hypotheses.**

- A is a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p; e = e_K = |K : K_0| is the absolute ramification index, K_0 the fraction field of W(k); π = π_K a uniformiser; M = A ∩ K^× ⊂ A the canonical prelog structure.
- p odd.

**Proof.**

1. ω^i_{(A,M)} is uniquely divisible for i ≥ 2 (node L.5/log-differentials-divisible-part), hence so is hW_nω^i for i ≥ 3, and induction on n with node L.5/kernel-of-restriction gives the claim for i ≥ 3.
2. hW_nω^2 is the sum of a uniquely divisible group and ω^1/p^{n−1}, so W_nω^2 is the sum of a uniquely divisible group and a finitely generated torsion W(k)-module; it suffices that W̄_nω^2 = 0.
3. Inductively it suffices that dV^{n−1}: ω̄^1 → W̄_nω^2 vanishes; ω̄^1 is spanned by π^i dlog π (0 ≤ i < e), and the relation [π]^e_n = V_π(1) in W̄_n(A) (node L.5/witt-mod-p-of-dvr) shows V^{n−1}(π^i dlog π) = V^{n−1}([π]^i) dlog_n π is zero or a combination of [π^j]_n dlog_n π, which have vanishing differential.

**Acceptance.**

- For A = Z_p: W_nω^2_{(Z_p,M)} ⊗ Z/p = 0 for all n.

**Depends on.** this roadmap: `L.5/log-differentials-divisible-part`, `L.5/kernel-of-restriction`, `L.5/witt-mod-p-of-dvr`, `L.5/homotopy-orbit-de-rham-witt-module`.

**Sources.**

- `HesselholtMadsen.2003`, Corollary 3.2.7, p. 50: “Corollary 3.2.7. Let A be a complete discrete valuation ring of mixed characteristic (0, p) with perfect residue field, and let α: M →A be the canonical log structure. Then for all n ≥1 and i ≥2, Wn ωi (A,M) is a uniquely divisible group. Proof. Lemma 2.2.4” — Statement.

### The structure of W_nω^*_{(A,M)} modulo p

`L.5/log-de-rham-witt-dvr-mod-p` · theorem

Let p be odd and A as above with uniformiser π, and r = r(i,e_K) = v_p(i − pe_K/(p−1)). The differential graded k-algebra E^* = W̄_nω^*_{(A,M)} = W_nω^*_{(A,M)}/p is concentrated in degrees 0 and 1, and: (i) a k-basis of E^1_n is given by V_π^s([π]^i dlog π) for 0 ≤ i < e_K and 0 ≤ s ≤ r, and dV_π^s([π]^i) for 0 ≤ i < e_K and r < s < n; moreover V_π^s([π]^i dlog π) = 0 if s > r, dV_π^s([π]^i) = 0 if s < r, and dV_π^r([π]^i) = p^{−r}(i − pe_K/(p−1))·V_π^r([π]^i dlog π); (ii) the E^0_n-module structure on E^1_n is given by the explicit product formulas of HM Proposition 3.4.1(ii). In particular dim_k E^1_n = n e_K.

**Hypotheses.**

- A is a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p; e = e_K = |K : K_0| is the absolute ramification index, K_0 the fraction field of W(k); π = π_K a uniformiser; M = A ∩ K^× ⊂ A the canonical prelog structure.
- p odd.

**Proof.**

1. E_n^* is generated as a graded k-vector space by monomials in V_π^s([π]^i), dV_π^s([π]^i), V_π^s([π]^i dlog π), dV_π^s([π]^i dlog π) (nodes L.5/witt-mod-p-of-dvr, L.5/log-de-rham-witt-complex).
2. E^q_n = 0 for q ≥ 2: this follows from Theorem 3.3.8 and Corollary 3.2.7 (nodes L.5/log-de-rham-witt-tr-low-degrees, L.5/log-de-rham-witt-dvr-divisible); in particular the degree-two generators vanish.
3. For s ≤ r, p^{−s}(i + pe_K(p^s − 1)/(p−1)) is an integer and iterating the second relation of Proposition 3.1.5 gives V_π^s([π]^i) = [π]^{p^{−s}(i + pe_K(p^s−1)/(p−1))}; hence dV_π^s([π]^i) = 0 for s < r and the stated relation at s = r; V_π d = 0 gives the vanishing for s > r.
4. (ii) is obtained by differentiating the relations of Proposition 3.1.5.
5. There are no further relations: E^1_n has dimension n e_K, which HM deduce from the dimension of TR^n_1(A|K;p,Z/p) computed in Proposition 6.1.1 through Theorem 3.3.8 (node L.5/tr-mod-p-dimension); no algebraic proof is given.

**Acceptance.**

- A = Z_p (e = 1), i = 0: r = v_p(−p/(p−1)) = 1; E^1_n has basis dlog π, V_π(dlog π) and dV_π^s(1) for 1 < s < n, of dimension n; and dV_π(1) = p^{−1}(−p/(p−1))V_π(dlog π) = −(p−1)^{−1}V_π(dlog π) = V_π(dlog π) in k = F_p.
- n = 1: E^1_1 = ω^1_{(A,M)}/p = k{[π]^i dlog π | 0 ≤ i < e} (s = 0 ≤ r always).

**Depends on.** this roadmap: `L.5/witt-mod-p-of-dvr`, `L.5/log-de-rham-witt-complex`, `L.5/log-de-rham-witt-dvr-divisible`, `L.5/log-de-rham-witt-tr-low-degrees`, `L.5/tr-mod-p-dimension`, `L.5/modified-verschiebung`.

**Sources.**

- `HesselholtMadsen.2003`, Proposition 3.4.1, p. 58: “Proposition 3.4.1. The differential graded k-algebra E∗= ¯Wn ω∗ (A,M) is concentrated in degrees 0 and 1 and satisfies: (i) A k-basis for E1 n is given by the elements V s π (πid log π), where 0 ≤i < eK and 0 ≤s ≤r, and dV s π (πi), where 0 ≤i < eK and r < s < n. Moreover, V s π (πid” — Statement (i).
- `HesselholtMadsen.2003`, Proof of Proposition 3.4.1, p. 59: “We prove in Proposition 6.1.1 below that this is indeed the case, and hence there can be no further relations. 4. Tate cohomology and the Tate” — The absence of further relations rests on Proposition 6.1.1.

### The log structure maps α_n and dlog_n on TR^n(A|K;p)

`L.5/tr-log-structure-maps` · construction

Let C = C^b_q(P_A). Define α_n: M → TR^n_0(A|K;p) as the composite of M = A ∩ K^× ⊂ A with the multiplicative map a ↦ [a]_n: A → TR^n_0(A|K;p) induced by the 0-simplex (A →a A) of |N^cy_•(N^q_• C)| followed by the equivalence D_r∘Δ_r onto the C_r-fixed points (r = p^{n−1}). Define dlog_n: M → TR^n_1(A|K;p) as the composite of M → π_1BM →det π_1K(C) with the cyclotomic trace, where Aut(A) = A ∩ K^× = M is the monoid of self-weak-equivalences of the complex A in degree 0 and det: Σ^∞B Aut(X) → K(C) (the stable splitting Σ^∞B_+ ≃ S^0 ∨ Σ^∞B removes the basepoint issue). Explicitly dlog_n a is represented by the loop in |N^cy(N^q C)| traced by the 1-simplex with vertical maps a and horizontal identities; dlog_1 a ∈ π_1T(A|K) maps to v_K(a) under ∂: π_1T(A|K) → π_0T(k) = k.

**Hypotheses.**

- A is a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p; e = e_K; π = π_K a uniformiser with minimal polynomial φ_K(x) = x^e + pθ_K(x); M = A ∩ K^× the canonical prelog structure.

**Proof.**

1. α_n: the Teichmüller-type map A → π_0 of the cyclic bar construction followed by the edgewise subdivision equivalence (Bökstedt–Hsiang–Madsen §1 for Δ_r and D_r; node L.4/pi0-tr-is-witt-vectors identifies it with the Teichmüller map A → W_n(A)).
2. det: the inclusion of Aut(X) as a full subcategory of wC gives B Aut(X) → |N_• wC| = K(C)_0; stabilise and split off S^0.
3. Compose with the trace K(C) → TR^n(C;p) (node L.4/tr-pro-spectrum).
4. The boundary formula is the commutativity of the right-hand square of the localisation square (node L.4/k-tc-localization-square): ∂(dlog a) = ∂_K(a) = v_K(a) for the K-theory boundary K_1(K) → K_0(k).

**API.**

- `TauCeti.HM.logTR.alpha` (constructor): α_n: M →* TR^n_0(A|K;p), a ↦ [a]_n.
- `TauCeti.HM.logTR.dlog` (constructor): dlog_n: M → TR^n_1(A|K;p), the trace of the determinant class of a ∈ Aut(A).
- `TauCeti.HM.logTR.dlog_mul` (simp): dlog_n(ab) = dlog_n a + dlog_n b.
- `TauCeti.HM.logTR.frobenius_dlog` (simp): F(dlog_n a) = dlog_{n−1} a and R(dlog_n a) = dlog_{n−1} a.
- `TauCeti.HM.logTR.boundary_dlog` (characterisation): ∂(dlog_1 a) = v_K(a) ∈ π_0T(k) = k under the localisation boundary.
- `TauCeti.HM.logTR.alpha_eq_teichmuller` (compatibility): Under π_0TR^n(A|K;p) ≅ W_n(A), α_n(a) is the Teichmüller representative [a]_n (Mathlib WittVector.teichmuller, truncated).

**Unit tests.**

- `TauCeti.HM.logTR.boundary_dlog_uniformizer` (computation): ∂(dlog_1 π_K) = 1 and ∂(dlog_1 u) = 0 for units u.
- `TauCeti.HM.logTR.dlog_one` (degenerate): dlog_n(1) = 0.
- `TauCeti.HM.logTR.dlog_unit` (compatibility): For u ∈ A^×, dlog_1(u) = u^{−1}du under Ω^1_A = π_1T(A) ⊂ π_1T(A|K).
- `TauCeti.HM.logTR.dlog_not_in_A` (non-example): dlog_1 π_K is not in the image of π_1T(A) = Ω^1_A → π_1T(A|K): its boundary is 1 ≠ 0.

**Acceptance.**

- dlog_n is a monoid map M → (TR^n_1, +) and F dlog_n a = dlog_{n−1} a (immediate from the definitions, Proposition 3.3.1).
- For u ∈ A^×, dlog_1 u = u^{−1}du in π_1T(A|K) ⊃ Ω^1_A.

**Used by.**

- HM Proposition 2.3.1: (TR^n_*(A|K;p), M) is a log dga with α_n and dlog_n
- HM Proposition 2.3.4: the canonical map ω^1_{(A,M)} → π_1T(A|K) uses dlog_1
- HM §6.1: the Bott element b maps to dlog_•ζ under the Bockstein

**Depends on.** this roadmap: `L.4/thh-of-dvr-with-log-poles`, `L.4/tr-pro-spectrum`, `L.4/pi0-tr-is-witt-vectors`, `L.4/k-tc-localization-square`; other roadmaps: `CrystallineCohomology:CR.5:log-algebra`, `GeneralAlgebraicKTheory:K.4:construction/waldhausen-categories-and-S-construction`.

**Sources.**

- `HesselholtMadsen.2003`, §2.3, (2.3.2), p. 37: “We define αn as the composite of the inclusion M = A ∩K×֒ →A and the multiplicative map n: A →TRn 0(A|K; p). This, we recall, is the map of components induced from the composite A i −→|N cy · (Nq·C)|” — Definition of α_n.
- `HesselholtMadsen.2003`, §2.3, p. 37: “In general, if C is a category with cofibrations and weak equivalences and if X is an object of C, there is a natural map in the stable category g det: Σ∞B Aut(X) →K(C), where Aut(X) is the monoid of” — The determinant map used for dlog_n.
- `HesselholtMadsen.2003`, §2.3, p. 37: “we define d logn to be the composite of this map and the cyclotomic trace. Spelling out” — dlog_n as the trace of the determinant class.

### dα_n(a) = α_n(a) dlog_n a

`L.5/dlog-relation` · lemma

For all a ∈ M, dα_n(a) = α_n(a)·dlog_n(a) in TR^n_1(A|K;p), where d is Connes' operator.

**Hypotheses.**

- A is a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p; e = e_K; π = π_K a uniformiser with minimal polynomial φ_K(x) = x^e + pθ_K(x); M = A ∩ K^× the canonical prelog structure.

**Proof.**

1. Reduce to the homotopy commutativity of a diagram T_+ ∧ M_+ → |N^cy(N^q C)| ∧ |N^cy(N^q C)| → |N^cy(N^q C)|, checked for each a ∈ M separately since M is discrete.
2. Both composites restricted to T × {a} are loops given by explicit 1-simplices based at A →a A; the two 2-simplices displayed in HM's proof give homotopies through based loops between them.

**Acceptance.**

- For u ∈ A^× this is d[u] = [u]·dlog u, i.e. dlog u = u^{−1}du.

**Depends on.** this roadmap: `L.5/tr-log-structure-maps`, `L.4/connes-operator`.

**Sources.**

- `HesselholtMadsen.2003`, Lemma 2.3.3, p. 38: “Lemma 2.3.3. For all a ∈M, dαn(a) = αn(a)d logn a. Proof.” — Statement.

### (TR^n_*(A|K;p), M) is a log differential graded ring for p odd or n = 1

`L.5/tr-log-dvr-is-log-dga` · lemma

For p odd or n = 1, the homotopy groups TR^n_*(A|K;p), with Connes' operator d, the product induced by the ring structure, and α_n, dlog_n, form a log differential graded ring whose underlying log ring is (W_n(A), M).

**Hypotheses.**

- A is a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p; e = e_K; π = π_K a uniformiser with minimal polynomial φ_K(x) = x^e + pθ_K(x); M = A ∩ K^× the canonical prelog structure.
- p odd, or n = 1 (for p = 2, n ≥ 2 the graded ring is not a dga: d∘d = η·d).

**Proof.**

1. TR^n_*(A|K;p) is a graded-commutative dga with differential Connes' operator (Hesselholt 1996 §1, cited): d is a derivation for the ring T-spectrum structure and dd = dη vanishes as η acts trivially when p is odd (node L.4/connes-operator).
2. α_n and dlog_n are monoid maps (node L.5/tr-log-structure-maps) and d∘dlog_n = 0 because dlog_n is the trace of a class coming from the T-fixed points.
3. dα_n(a) = α_n(a)dlog_n a is node L.5/dlog-relation.

**Acceptance.**

- For n = 1: (π_*T(A|K), M) is a log dga receiving the canonical map ω^*_{(A,M)} → π_*T(A|K).

**Depends on.** this roadmap: `L.5/tr-log-structure-maps`, `L.5/dlog-relation`, `L.4/connes-operator`, `L.4/pi0-tr-is-witt-vectors`.

**Sources.**

- `HesselholtMadsen.2003`, Proposition 2.3.1, p. 37: “Proposition 2.3.1. The homotopy groups (TRn ∗(A|K; p), M) form a log differential graded ring, if p is odd or n = 1. The homotopy groups TRn ∗(A|K; p) form a graded-commutative” — Statement.

### Lindenstrauss–Madsen: the p-adic homotopy of THH of a complete DVR

`L.5/thh-of-dvr-p-adic` · theorem

For A as in L.5 (the residue field need not be finite) and m > 0: π_{2m}(T(A);Z_p) = 0 and π_{2m−1}(T(A);Z_p) ≅ A/(mφ'_K(π_K)), a torsion group of bounded exponent. Consequently, for m > 0, π_{2m}T(A) is uniquely divisible and π_{2m−1}T(A) is the sum of a uniquely divisible group and π_{2m−1}(T(A);Z_p).

**Hypotheses.**

- A is a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p; e = e_K; π = π_K a uniformiser with minimal polynomial φ_K(x) = x^e + pθ_K(x); M = A ∩ K^× the canonical prelog structure.
- Integral, p-adic and mod p statements are distinct: the isomorphism is noncanonical and concerns Z_p-coefficients.

**Proof.**

1. Cited by HM from Lindenstrauss–Madsen, 'Topological Hochschild homology of number rings', Th. 5.1 (Trans. AMS 352, 2000; not read — recorded gap); HM note that finiteness of k is not needed, the Bockstein spectral sequence converging strongly by LM Propositions 5.3, 5.4 and Boardman Th. 7.1.
2. The integral consequences follow from the Milnor and Bockstein sequences (StableHomotopyKTheory H.6), π_*T(A) ⊗ Q ≅ HH_*(K) and bounded exponent.

**Acceptance.**

- A = Z_p: π_{2m−1}(T(Z_p);Z_p) ≅ Z_p/(m) = Z/p^{v_p(m)}; in particular π_{2p−1}(T(Z_p);Z_p) ≅ Z/p and π_1(T(Z_p);Z_p) = 0 (Bökstedt's calculation of THH(Z_p)).

**Depends on.** this roadmap: `L.4/dvr-tr-agrees-with-ring-tr`, `L.5/complete-dvr-eisenstein-presentation`; other roadmaps: `StableHomotopyKTheory:H.6/l-adic-completion-milnor-sequence`, `StableHomotopyKTheory:H.6/mod-l-homotopy-and-bockstein-sequence`.

**Sources.**

- `HesselholtMadsen.2003`, Proof of Proposition 2.3.4, p. 40: “The structure of the p-adic homotopy groups π∗(T(A), Zp) is known from [27, Th. 5.1]. (The assumption that the residue field is finite is not needed. For op. cit., Propositions 5.3 and 5.4 and [1, Th. 7.1] show that the Bockstein spectral sequence” — Citation of Lindenstrauss–Madsen and the hypotheses.
- `HesselholtMadsen.2003`, Proof of Proposition 2.3.4, p. 40: “The result is that for m > 0, π2m(T(A), Zp) vanishes and π2m−1(T(A), Zp) is isomorphic to A/(mφ′ K(πK)). The latter is a torsion group of bounded exponent. It follows that for m > 0, π2mT(A) is a” — The statement used.

### Lindenstrauss–Madsen: π_*(T(A);Z/p) as a graded k-algebra

`L.5/thh-of-dvr-mod-p` · theorem

Let B = A/p ⊗ Λ{α_1} ⊗ S{α_2} (|α_i| = i), C ⊂ B the subalgebra generated by the a α_1^ε α_2^m with a ∈ m_K/pA or ε = 1 or p | m, and I ⊂ C the ideal generated by a α_1 α_2^{m−1} with a ∈ m_K^{e−1}/pA and p ∤ m. Then π̄_*T(A) ≅ B if p | e_K and ≅ C/I if p ∤ e_K. dim_k π̄_qT(A) = e_K for all q if p | e_K; if p ∤ e_K it is e_K for q ≡ −1, 0 mod 2p and e_K − 1 otherwise. The reduction i_*: π̄_*T(A) → π̄_*T(k) is induced by the k-algebra map B → Λ{ε} ⊗ S{σ} given by A/p → k in degree 0, α_1 ↦ 0 and α_2 ↦ a unit times σ.

**Hypotheses.**

- A is a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p; e = e_K; π = π_K a uniformiser with minimal polynomial φ_K(x) = x^e + pθ_K(x); M = A ∩ K^× the canonical prelog structure.

**Proof.**

1. Cited by HM from Lindenstrauss–Madsen Theorems 4.4 and 4.6 (not read — recorded gap); the statement about i_* is from the proof there.

**Acceptance.**

- A = Z_p (e = 1, p ∤ e): π̄_qT(Z_p) = F_p for q ≡ −1, 0 mod 2p and 0 otherwise; in particular π̄_1T(Z_p) = 0 for p odd.

**Depends on.** this roadmap: `L.4/dvr-tr-agrees-with-ring-tr`, `L.5/complete-dvr-eisenstein-presentation`, `L.5/thh-of-perfect-field`.

**Sources.**

- `HesselholtMadsen.2003`, §2.4, p. 40: “The proof of Theorem B is based on the calculation in [27, Ths. 4.4, 4.6] of the graded k-algebra ¯π∗T(A) = π∗(T(A), Z/p). The result, which we now recall, depends on whether p divides eK or not. We” — Citation of LM Theorems 4.4, 4.6.
- `HesselholtMadsen.2003`, §2.4, p. 40: “We consider the graded k-algebra B = A/p ⊗Λ{α1} ⊗S{α2} with the generators in the indicated degrees. Let C ⊂B be the subalgebra generated by all elements aαε 1αm 2 for which a ∈mK/pA or ε = 1 or p divides m, and let I ⊂C be the ideal generated by all elements aα1αm−1 2 for which a” — The algebras B, C and the ideal I.

### ω^q_{(A,M)} ≅ π_qT(A|K) for q ≤ 2, rationally in all degrees

`L.5/log-thh-low-degrees` · theorem

The canonical map ω^q_{(A,M)} → π_qT(A|K) of log dgas is an isomorphism for q ≤ 2 and a rational isomorphism for all q ≥ 0. In particular π_0T(A|K) = A, 0 → Ω^1_A → π_1T(A|K) → k → 0 is exact, and π_2T(A|K) is uniquely divisible.

**Hypotheses.**

- A is a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p; e = e_K; π = π_K a uniformiser with minimal polynomial φ_K(x) = x^e + pθ_K(x); M = A ∩ K^× the canonical prelog structure.

**Proof.**

1. In the localisation sequence T(k) → T(A) → T(A|K) (node L.4/tr-localization-sequence with n = 1), i^!: π_qT(k) → π_qT(A) vanishes for q = 0 (torsion into torsion-free) and q = 1 (π_1T(k) ≅ Ω^1_k = 0, k perfect: node L.5/hochschild-homology-of-perfect-field); this gives q = 0.
2. q = 1: compare 0 → π_1T(A) → π_1T(A|K) → π_0T(k) → 0 with the residue sequence 0 → Ω^1_A → ω^1_{(A,M)} → k → 0 (node L.5/log-differentials-residue-sequence); the right square commutes since ∂(dlog x) = v_K(x) (node L.5/tr-log-structure-maps); five lemma.
3. Rationally: π_*T(k) is torsion, so j_* ⊗ Q is an isomorphism; linearisation π_*T(A) ⊗ Q ≅ HH_*(A) ⊗ Q = HH_*(K) and HKR for K (a filtered colimit of smooth Q-algebras) give Ω^*_K = ω^*_{(A,M)} ⊗ Q.
4. q = 2: π_2T(A) is uniquely divisible (node L.5/thh-of-dvr-p-adic) and π_1T(k) = 0, so π_2T(A|K) is uniquely divisible; with the rational statement and unique divisibility of ω^2 (node L.5/log-differentials-divisible-part) this gives q = 2.

**Acceptance.**

- A = Z_p: π_1T(Z_p|Q_p) is an extension of F_p by the uniquely divisible Ω^1_{Z_p}, with π_1(T(Z_p|Q_p);Z/p) ⊇ F_p·dlog p.
- π_0T(A|K) = A.

**Depends on.** this roadmap: `L.4/tr-localization-sequence`, `L.5/tr-log-dvr-is-log-dga`, `L.5/log-differentials-residue-sequence`, `L.5/log-differentials-divisible-part`, `L.5/hochschild-homology-of-perfect-field`, `L.5/thh-of-dvr-p-adic`, `L.5/tr-log-structure-maps`; other roadmaps: `RefinedTraceMethods:RT.1`.

**Sources.**

- `HesselholtMadsen.2003`, Proposition 2.3.4, p. 39: “Proposition 2.3.4. The canonical map ωq (A,M) →πqT(A|K) is an isomorphism, for q ≤2, and a rational isomorphism, for all q ≥0. Proof. We” — Statement.

### Theorem B: π_*(T(A|K);Z/p) = ω^*_{(A,M)} ⊗ S_{Z/p}{κ}

`L.5/log-thh-mod-p` · theorem · planet “Hesselholt–Madsen Theorem B”

Let κ ∈ π̄_2T(A|K) = π_2(T(A|K);Z/p) be the unique class whose integral Bockstein is dlog(−p) ∈ _pπ_1T(A|K) = _pω^1_{(A,M)} (the Bockstein π̄_2 → _pπ_1 is an isomorphism since π_2T(A|K) is uniquely divisible). There is a natural isomorphism of log differential graded rings ω^*_{(A,M)} ⊗_Z S_{Z/p}{κ} → π̄_*T(A|K) with dκ = uκ dlog(−p) for a unit u ∈ F_p^× independent of K; u = 1 is node L.5/kappa-differential (HM Remark 5.3.3), so that dκ = κ dlog(−p) as HM state. In particular dim_k π̄_qT(A|K) = e_K for every q ≥ 0, and κ ∈ π̄_2T(Z_p|Q_p) is the image of the class for K_0 = Q_p.

**Hypotheses.**

- A is a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p; e = e_K; π = π_K a uniformiser with minimal polynomial φ_K(x) = x^e + pθ_K(x); M = A ∩ K^× the canonical prelog structure.
- Mod p statement: the integral groups π_qT(A|K), q ≥ 3, are not determined here (HM: 'We do not know a natural description of the higher homotopy groups').

**Proof.**

1. Case p | e_K: the map is an isomorphism in degrees ≤ 1 (node L.5/log-thh-low-degrees); it suffices that multiplication by κ is an isomorphism π̄_q → π̄_{q+2}. Show j_*: π̄_2T(A) → π̄_2T(A|K) is an isomorphism by comparing Bocksteins onto _pΩ^1_A → _pω^1_{(A,M)}, a monomorphism of e_K-dimensional k-vector spaces; then a generator κ̃ of π̄_2T(A) lifts κ, and multiplication by κ̃ on the localisation sequence is an isomorphism on π̄_*T(k) and π̄_*T(A) (node L.5/thh-of-dvr-mod-p), hence on π̄_*T(A|K) (five lemma).
2. Case p ∤ e_K: choose L/K totally ramified with p | e_{L/K} making ω^*_{(A,M_A)} ⊗ S{κ} → ω^*_{(B,M_B)} ⊗ S{κ} injective (e.g. L = K[π_L]/(π_L^{e_{L/K}} + π_K(π_L + 1))); so the map for A is injective; a dimension count in the localisation sequence with dim π̄_qT(A) from node L.5/thh-of-dvr-mod-p shows dim π̄_qT(A|K) ∈ {e, e+1} and equality e holds iff i^!: π̄_{2ps−1}T(k) → π̄_{2ps−1}T(A) is nonzero, shown by exhibiting π_K^{e−1}α_1α_2^{ps−1} in the image of i^! (and reducing the unramified case to a tame extension).
3. dκ = uκ dlog(−p) with u ∈ F_p^×: in particular dκ lies in the image of the left-hand side; reduce to K = Q_p, where in the diagram with ∂: π̄_*T(Z_p|Q_p) → π̄_{*−1}T(F_p) and d, both horizontal maps and d on T(F_p) are isomorphisms. The value u = 1 is proved in node L.5/kappa-differential and is kept out of this node to keep the dependency graph acyclic.

**Acceptance.**

- A = Z_p: π̄_qT(Z_p|Q_p) ≅ F_p for every q ≥ 0, with basis κ^j (q = 2j) and κ^j dlog p (q = 2j+1); compare π̄_1T(Z_p) = 0 for p odd.
- dim_k π̄_qT(A|K) = e_K in every degree q ≥ 0 (the rank of ω^0/p = A/p and of ω^1/p).

**Depends on.** this roadmap: `L.5/log-thh-low-degrees`, `L.5/thh-of-dvr-mod-p`, `L.5/log-differentials-p-torsion`, `L.5/tame-base-change-of-log-differentials`, `L.5/relative-log-differentials-of-dvr`, `L.4/tr-localization-sequence`, `L.4/moore-spectrum-splitting-for-hz-modules`; other roadmaps: `StableHomotopyKTheory:H.6/mod-l-homotopy-and-bockstein-sequence`.

**Sources.**

- `HesselholtMadsen.2003`, Theorem 2.4.1 (= Theorem B), p. 41: “Theorem 2.4.1. There is a natural isomorphism of log differential graded rings ω∗ (A,M) ⊗Z SZ/p{κ} ∼ −→¯π∗T(A|K), where dκ = κd log(−p). Proof. It is clear that there is” — Statement.
- `HesselholtMadsen.2003`, §2.4, p. 41: “Since the group π2T(A|K) is uniquely divisible, by Proposition 2.3.4, the integral Bockstein induces an isomorphism β: ¯π2T(A|K) ∼ −→pπ1T(A|K). We define κ ∈¯π2T(A|K) to be the class which corresponds to the generator d log(−p)” — Definition of κ through the Bockstein.

### π_*(T(A|K);Z_p): odd groups A/(mπ_Kφ'_K(π_K)), even groups zero

`L.5/log-thh-p-adic` · theorem

For m > 0 there is a noncanonical isomorphism π_{2m−1}(T(A|K);Z_p) ≅ A/(mπ_Kφ'_K(π_K)), and π_{2m}(T(A|K);Z_p) = 0. (p-completed statement; noncanonical; no functorial description is known.)

**Hypotheses.**

- A is a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p; e = e_K; π = π_K a uniformiser with minimal polynomial φ_K(x) = x^e + pθ_K(x); M = A ∩ K^× the canonical prelog structure.

**Proof.**

1. HM state that 'an argument similar to [Lindenstrauss–Madsen, §5]' proves it, and give no proof; it is recorded as a gap. A route: the Bockstein spectral sequence of π̄_*T(A|K) from Theorem B with dκ = κ dlog(−p), as in LM §5 for T(A).

**Acceptance.**

- A = Z_p: π_{2m−1}(T(Z_p|Q_p);Z_p) ≅ Z_p/(mp) = Z/p^{1+v_p(m)}; π_1(T(Z_p|Q_p);Z_p) ≅ Z/p (generated by dlog p modulo divisible part).

**Depends on.** this roadmap: `L.5/log-thh-mod-p`, `L.5/thh-of-dvr-p-adic`; other roadmaps: `StableHomotopyKTheory:H.6/l-adic-completion-milnor-sequence`.

**Sources.**

- `HesselholtMadsen.2003`, Remark 2.4.2, p. 43: “Remark 2.4.2. An argument similar to [27, §5] shows that for m > 0, there exists a noncanonical isomorphism π2m−1(T(A|K), Zp) ∼= A/(mπKφ′ K(πK)) and that π2m(T(A|K), Zp) vanishes. It would be” — Statement (without proof).

### Tame Galois descent for π_*(T(A|K);Z/p)

`L.5/log-thh-tame-descent` · theorem

Let L/K be a finite tamely ramified Galois extension with group G_{L/K} and B the integral closure of A in L. Then the canonical map induces an isomorphism π̄_*T(A|K) → π̄_* H^•(G_{L/K}, T(B|L)). (Descent fails in general, e.g. for Q_p(μ_{p^n})/Q_p with n > 1.)

**Hypotheses.**

- A is a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p; e = e_K; π = π_K a uniformiser with minimal polynomial φ_K(x) = x^e + pθ_K(x); M = A ∩ K^× the canonical prelog structure.
- L/K tamely ramified Galois (p ∤ e_{L/K}).

**Proof.**

1. It suffices that each G-module π̄_tT(B|L) is isomorphic to B/p; then Noether's theorem (B ≅ A[G_{L/K}] iff L/K tame; Fröhlich I.3 Th. 3, cited) makes the homotopy fixed point spectral sequence E^2 = H^{−s}(G, π̄_tT(B|L)) collapse onto the invariants.
2. By Theorem B, κ^i: π̄_ε T(B|L) ≅ π̄_{2i+ε}T(B|L); π̄_0 = B/p and π̄_1 = ω^1_{(B,M_B)}/p = B/p·dlog π_K by nodes L.5/relative-log-differentials-of-dvr and L.5/tame-base-change-of-log-differentials.

**Acceptance.**

- For L = K(μ_p) (tame of degree dividing p − 1) this reduces Theorems 5.4.3 and 6.1.6 to the case μ_p ⊂ K.

**Depends on.** this roadmap: `L.5/log-thh-mod-p`, `L.5/tame-base-change-of-log-differentials`, `L.5/relative-log-differentials-of-dvr`, `L.4/thh-of-dvr-with-log-poles`; other roadmaps: `RefinedTraceMethods:RT.2`.

**Sources.**

- `HesselholtMadsen.2003`, Theorem 2.4.3, p. 44: “Theorem 2.4.3. Let L/K be a finite and tamely ramified Galois extension. Then the canonical map induces an isomorphism ¯π∗T(A|K) ∼ −→¯π∗H ·(GL/K, T(B| L)). Proof. It will suffice to show that for all” — Statement.

### TR^•_*(A|K;p) is a log Witt complex over (A,M) for p odd

`L.5/tr-log-dvr-is-log-witt-complex` · lemma

For p odd, the pro-system TR^•_*(A|K;p) with the restriction maps, Connes' operator, the product, α_•, dlog_•, and F and V induced by inclusion and transfer of fixed points, is a log Witt complex over (A,M). Hence there is a canonical map of log Witt complexes W_•ω^*_{(A,M)} → TR^•_*(A|K;p).

**Hypotheses.**

- A is a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p; e = e_K; π = π_K a uniformiser with minimal polynomial φ_K(x) = x^e + pθ_K(x); M = A ∩ K^× the canonical prelog structure.
- p odd (HM's standing hypothesis p > 2); the p = 2 case is not covered by these sources.

**Proof.**

1. (TR^n_*(A|K;p), M) is a log dga with underlying log ring (W_n(A),M) (nodes L.5/tr-log-dvr-is-log-dga, L.4/pi0-tr-is-witt-vectors).
2. F dlog_n a = dlog_{n−1} a is immediate from the definitions of F and dlog_n (node L.5/tr-log-structure-maps).
3. FV = p, FdV = d and F d[a]_n = [a]_{n−1}^{p−1}d[a]_{n−1}: HM 1997 Lemma 3.3 and Hesselholt 1996 Lemmas 1.5.1 (F_rδV_r = δ + (r−1)η, which is δ for r = p odd) and 1.5.6 (F_rδx = x^{r−1}dx), cited.
4. Initiality of W_•ω^*_{(A,M)} (node L.5/log-de-rham-witt-complex) gives the map.

**Acceptance.**

- For n = 1 the map is ω^*_{(A,M)} → π_*T(A|K) of node L.5/log-thh-low-degrees.
- Non-example p = 2: F dV = d + η by Hesselholt 1996 Lemma 1.5.1 with r = 2, so the relation FdV = d fails.

**Depends on.** this roadmap: `L.5/tr-log-dvr-is-log-dga`, `L.5/tr-log-structure-maps`, `L.5/log-witt-complex`, `L.5/log-de-rham-witt-complex`, `L.4/tr-pro-spectrum`.

**Sources.**

- `HesselholtMadsen.2003`, Proposition 3.3.1, p. 51: “Proposition 3.3.1. The homotopy groups TR· ∗(A|K; p) form a log Witt complex over (A, M), provided that p is odd. In particular, there is a canonical map W· ω∗ (A,M) →TR· ∗(A|K; p). Proof. We recall” — Statement.
- `Hesselholt.1996`, Lemma 1.5.1, PDF p. 12: “Lemma 1.5.1. Let A be a ring. Then FrδVr = δ + (r −1)η. Proof. We” — The relation F_rδV_r = δ + (r−1)η, giving FdV = d for r = p odd.

### hW_nω^i_{(A,M)} computes the homotopy orbits in degrees ≤ 2

`L.5/homotopy-orbit-comparison` · lemma

The map hW_nω^i_{(A,M)} → hTR^n_i(A|K;p) = π_iH_•(C_{p^{n−1}},T(A|K)), (ω_1,ω_2) ↦ dV^{n−1}ι(ω_1) + V^{n−1}ι(ω_2) (ι: ω^i → π_iT(A|K) the canonical map), is a map of W_n(A)-modules. It is an isomorphism for i ≤ 1, and for i = 2 there is an exact sequence (F^{n−1})^*(A/p^{n−1}) → hW_nω^2_{(A,M)} → hTR^n_2(A|K;p) → 0, the left map a ↦ (da, 0). The same proof gives hW_nΩ^1_R ≅ π_1H_•(C_{p^{n−1}},T(R)) for any Z_(p)-algebra R (Remark 3.3.4).

**Hypotheses.**

- A is a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p; e = e_K; π = π_K a uniformiser with minimal polynomial φ_K(x) = x^e + pθ_K(x); M = A ∩ K^× the canonical prelog structure.
- p odd (HM's standing hypothesis p > 2); the p = 2 case is not covered by these sources.

**Proof.**

1. W_n(A)-linearity: a·dV^{n−1}ι(ω_1) = dV^{n−1}ι(F^{n−1}a·ω_1) − V^{n−1}ι(F^{n−1}da·ω_1) and a·V^{n−1}ι(ω_2) = V^{n−1}ι(F^{n−1}a·ω_2) by the projection formula.
2. Since ι is an isomorphism in degrees ≤ 2 (node L.5/log-thh-low-degrees), the homotopy-orbit spectral sequence (node L.4/tr-homotopy-orbit-spectral-sequence) gives (F^{n−1})^*A ≅ hTR^n_0 and 0 → (F^{n−1})^*ω^1 → hTR^n_1 → (F^{n−1})^*(A/p^{n−1}) → 0.
3. Compare with the exact sequence of node L.5/homotopy-orbit-de-rham-witt-module: the right-hand map is H_0(C_{p^{n−1}},A) → H_1(C_{p^{n−1}},A), multiplication by the fundamental class, an epimorphism with kernel p^{n−1}A.
4. i = 2: the same argument in total degree ≤ 3, using d² = Connes (node L.4/tate-d2-is-connes-operator's homotopy-orbit analogue, HM Proposition 4.4.3).

**Acceptance.**

- n = 1: hW_1ω^i = ω^i ≅ π_iT(A|K) for i ≤ 1.

**Depends on.** this roadmap: `L.5/homotopy-orbit-de-rham-witt-module`, `L.4/tr-homotopy-orbit-spectral-sequence`, `L.5/log-thh-low-degrees`, `L.5/tr-log-dvr-is-log-witt-complex`, `L.4/tate-d2-is-connes-operator`.

**Sources.**

- `HesselholtMadsen.2003`, Lemma 3.3.3, p. 51: “Lemma 3.3.3. Let ι: ωi (A,M) →πiT(A|K) be the canonical map. Then the map hWn ωi (A,M) → hTRn i (A|K; p), (ω1, ω2) 7→” — Statement.
- `HesselholtMadsen.2003`, Remark 3.3.4, p. 52: “Remark 3.3.4. For i ≤1, the proof above does not use the fact that A is a discrete valuation ring beyond the definition of T(A|K). In effect, the same proof gives an isomorphism hWn Ω1 R ∼ −→π1H·(Cpn−1, T(R)), for any” — The extension to Z_(p)-algebras.

### F: hTR^n_2(A|K;p,Z_p) → hTR^{n−1}_2 is onto with kernel generated by p^{n−2}[dlog π_K]_n

`L.5/frobenius-on-homotopy-orbits` · lemma

The exact sequence (F^{n−1})^*(A/p^{n−1}) →d (F^{n−1})^*(ω^1_{(A,M)}/p^{n−1}) → hTR^n_2(A|K;p,Z_p) → 0 of W_n(A)-modules holds (ω^2 uniquely divisible), and F: hTR^n_2(A|K;p,Z_p) → hTR^{n−1}_2(A|K;p,Z_p) is a surjection whose kernel is generated by p^{n−2}[dlog π_K]_n, [dlog π_K]_n the class of dlog π_K.

**Hypotheses.**

- A is a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p; e = e_K; π = π_K a uniformiser with minimal polynomial φ_K(x) = x^e + pθ_K(x); M = A ∩ K^× the canonical prelog structure.
- p odd (HM's standing hypothesis p > 2); the p = 2 case is not covered by these sources.
- n ≥ 2.

**Proof.**

1. Surjectivity and the kernel as a quotient of the cokernel of d: (F^{n−1})^*(p^{n−2}A/p^{n−1}A) → (F^{n−1})^*(p^{n−2}ω^1/p^{n−1}ω^1).
2. Reduce to P = W(k)[x] with prelog structure N_0 → P, i ↦ x^i, mapping onto (A,M) by x ↦ π_K: p^iω^1_{(P,N_0)} ↠ p^iω^1_{(A,M)}.
3. The W_n(P)-module (F^{n−1})^*(p^{n−2}ω^1_P/p^{n−1}) is generated by p^{n−2}dlog x and p^{n−2}x^{p^i}dlog x (0 ≤ i < n−1), and the latter are in the image of d: p^{n−2}x^{p^i}dlog x = p^{n−2−i}d(x^{p^i}).

**Acceptance.**

- n = 2: the kernel of F: hTR^2_2 → hTR^1_2 = 0 … is generated by [dlog π_K]_2 (p^0 = 1).

**Depends on.** this roadmap: `L.5/homotopy-orbit-comparison`, `L.5/log-differentials-divisible-part`, `L.4/tr-homotopy-orbit-spectral-sequence`.

**Sources.**

- `HesselholtMadsen.2003`, Lemma 3.3.5, p. 53: “Lemma 3.3.5. The map of Wn(A)-modules F: hTRn 2(A|K; p, Zp) →hTRn−1 2 (A|K; p, Zp) is a surjection whose kernel is generated by pn−2[d log πK]n. Proof. The” — Statement.

### Theorem 3.3.8 and Proposition 3.3.6 for n ≤ 3, without Lemma 5.6.1

`L.5/log-de-rham-witt-tr-level-two` · lemma

For n ≤ 3: the sequences 0 → hTR^n_i(A|K;p) → TR^n_i(A|K;p) → TR^{n−1}_i(A|K;p) → 0 are exact for i ≤ 1, TR^n_2(A|K;p) and TR^n_2(A;p) are uniquely divisible, and W_nω^q_{(A,M)} → TR^n_q(A|K;p) is an isomorphism for q ≤ 2. This is the part of Proposition 3.3.6, Addendum 3.3.7 and Theorem 3.3.8 that HM prove without Lemma 5.6.1; it is the input to Addendum 3.3.9 and hence to the Tate spectral sequence computations of §5.

**Hypotheses.**

- A is a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p; e = e_K; π = π_K a uniformiser with minimal polynomial φ_K(x) = x^e + pθ_K(x); M = A ∩ K^× the canonical prelog structure.
- p odd (HM's standing hypothesis p > 2); the p = 2 case is not covered by these sources.
- n ≤ 3.

**Proof.**

1. n = 1: nodes L.5/log-thh-low-degrees and L.5/thh-of-dvr-p-adic.
2. n = 2: ∂_{K,2}: TR^1_3(A|K;p,Z_p) → hTR^2_2(A|K;p,Z_p) is onto by comparison with ∂_k: TR^1_2(k;p) ↠ hTR^2_1(k;p) (node L.5/tr-of-perfect-field) and TR^1_2(A;p,Z_p) = 0 (node L.5/thh-of-dvr-p-adic), using that the target is an A/p = W_2(A)/(VW_2(A) + pW_2(A))-module generated by [dlog π_K]_2 and that W_2(A)^× → (W_2(A)/I)^× is onto (I-adic = p-adic topology).
3. n = 3: the induction step of Proposition 3.3.6 needs F: TR^2_3(A|K;p,Z_p) → TR^1_3(A|K;p,Z_p) onto only through the case m − 1 = 2, which HM state is not needed for n ≤ 3; with node L.5/frobenius-on-homotopy-orbits this closes the induction.
4. Then run the inductions of Addendum 3.3.7 and Theorem 3.3.8 up to n = 3 (nodes L.5/kernel-of-restriction, L.5/homotopy-orbit-comparison, L.5/log-de-rham-witt-dvr-divisible).

**Acceptance.**

- n = 2, q = 1: 0 → hW_2ω^1 → W_2ω^1 → W_1ω^1 → 0 is identified with 0 → hTR^2_1 → TR^2_1 → TR^1_1 → 0, the diagram used in Addendum 3.3.9.

**Depends on.** this roadmap: `L.5/log-thh-low-degrees`, `L.5/thh-of-dvr-p-adic`, `L.5/tr-of-perfect-field`, `L.5/frobenius-on-homotopy-orbits`, `L.5/homotopy-orbit-comparison`, `L.5/kernel-of-restriction`, `L.5/log-de-rham-witt-dvr-divisible`, `L.5/log-differentials-divisible-part`, `L.4/norm-restriction-cofibre-sequence`.

**Sources.**

- `HesselholtMadsen.2003`, Remark after Theorem 3.3.8, p. 56: “In the proof of Proposition 3.3.6, Addendum 3.3.7, and Theorem 3.3.8 above for n > 3 we have used Lemma 5.6.1 below. However, the lemma is not needed to prove these statements for n ≤3. In particular, the proof of the following result does not use Lemma 5.6.1. Addendum 3.3.9. The” — The results for n ≤ 3 do not use Lemma 5.6.1.

### 0 → hTR^n_i → TR^n_i → TR^{n−1}_i → 0 for i ≤ 1, and TR^n_2(A|K;p) is uniquely divisible

`L.5/norm-restriction-exact-low-degrees` · lemma

The sequences 0 → hTR^n_i(A|K;p) →N TR^n_i(A|K;p) →R TR^{n−1}_i(A|K;p) → 0 are exact for i ≤ 1, and TR^n_2(A|K;p) is uniquely divisible, for all n ≥ 1.

**Hypotheses.**

- A is a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p; e = e_K; π = π_K a uniformiser with minimal polynomial φ_K(x) = x^e + pθ_K(x); M = A ∩ K^× the canonical prelog structure.
- p odd (HM's standing hypothesis p > 2); the p = 2 case is not covered by these sources.

**Proof.**

1. i = 0 is HM 1997 Proposition 3.3 (cited; compare node L.4/pi0-tr-is-witt-vectors); for i = 1 exactness is injectivity of N, which follows once TR^{n−1}_2(A|K;p) is uniquely divisible, the maximal uniquely divisible subgroups forming an exact sequence since F^{n−1}∘N is injective there.
2. Show by induction on m that TR^m_2(A|K;p,Z_p) = 0. m = 1: nodes L.5/log-thh-low-degrees and L.5/log-differentials-divisible-part.
3. Induction step: ∂_{K,m}: TR^{m−1}_3(A|K;p,Z_p) → hTR^m_2(A|K;p,Z_p) is surjective. For m = 2 compare with ∂_k: TR^1_2(k;p) ↠ hTR^2_1(k;p) (HM 1997 Theorem 5.5, cited) and with TR^1_2(A;p,Z_p) = 0 (LM); the target is an A/p-module via W_2(A)/(V + p) ≅ A/p generated by [dlog π_K]_2, and units of W_2(A) (the I-adic and p-adic topologies agree) show [dlog π_K]_2 is in the image.
4. For m > 2 use F-compatibility, node L.5/frobenius-on-homotopy-orbits (kernel generated by p^{m−2}[dlog π_K]_m) and node L.5/frobenius-surjective-odd-degrees (F surjective on odd TR), and invert 1 + p^{m−2}x in the p-adically complete W_m(A).

**Acceptance.**

- n = 1: TR^1_2 = π_2T(A|K) uniquely divisible (node L.5/log-thh-low-degrees).
- For n ≤ 3 the proof does not use Lemma 5.6.1 (HM remark after Theorem 3.3.8).

**Depends on.** this roadmap: `L.5/log-de-rham-witt-tr-level-two`, `L.5/homotopy-orbit-comparison`, `L.5/frobenius-on-homotopy-orbits`, `L.5/log-thh-low-degrees`, `L.5/log-differentials-divisible-part`, `L.5/tr-of-perfect-field`, `L.5/thh-of-dvr-p-adic`, `L.5/frobenius-surjective-odd-degrees`, `L.4/norm-restriction-cofibre-sequence`.

**Sources.**

- `HesselholtMadsen.2003`, Proposition 3.3.6, p. 53: “Proposition 3.3.6. The sequences 0 →hTRn i (A|K; p) N −→TRn i (A|K; p) R −→TRn−1 i (A|K; p) →0 are exact for i ≤1, and TRn 2(A|K; p) is uniquely divisible. Proof. The statement for i = 0 is [19,” — Statement.

### TR^n_2(A;p) is uniquely divisible

`L.5/tr2-of-dvr-divisible` · lemma

For every n ≥ 1, TR^n_2(A;p) is uniquely divisible, i.e. TR^n_2(A;p,Z_p) = 0.

**Hypotheses.**

- A is a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p; e = e_K; π = π_K a uniformiser with minimal polynomial φ_K(x) = x^e + pθ_K(x); M = A ∩ K^× the canonical prelog structure.
- p odd (HM's standing hypothesis p > 2); the p = 2 case is not covered by these sources.

**Proof.**

1. Induction on n; n = 1 is the unique divisibility of π_2T(A) (node L.5/thh-of-dvr-p-adic).
2. Since TR^n_2(A|K;p,Z_p) = 0 (node L.5/norm-restriction-exact-low-degrees), the localisation sequence gives TR^n_3(A|K;p,Z_p) →δ_n TR^n_2(k;p) → TR^n_2(A;p,Z_p) → 0, and it suffices that δ_n is onto.
3. F on TR^n_3(A|K) is onto (node L.5/frobenius-surjective-odd-degrees); F on TR_2(k) is onto with kernel the image of V (HM 1997 Theorem 5.5, node L.5/tr-of-perfect-field); the square with V commutes, so induction closes.

**Acceptance.**

- n = 1: π_2(T(Z_p);Z_p) = 0 (Bökstedt, LM).

**Depends on.** this roadmap: `L.5/norm-restriction-exact-low-degrees`, `L.5/thh-of-dvr-p-adic`, `L.5/tr-of-perfect-field`, `L.5/frobenius-surjective-odd-degrees`, `L.4/tr-localization-sequence`.

**Sources.**

- `HesselholtMadsen.2003`, Addendum 3.3.7, p. 55: “Addendum 3.3.7. The group TRn 2(A; p) is uniquely divisible for all n. Proof. It suffices” — Statement.

### W_nω^q_{(A,M)} ≅ TR^n_q(A|K;p) for q ≤ 2, rationally in all degrees

`L.5/log-de-rham-witt-tr-low-degrees` · theorem

For p odd the canonical map W_nω^q_{(A,M)} → TR^n_q(A|K;p) (node L.5/tr-log-dvr-is-log-witt-complex) is an isomorphism for q ≤ 2 and a rational isomorphism for all q ≥ 0, for every n ≥ 1. These are integral statements.

**Hypotheses.**

- A is a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p; e = e_K; π = π_K a uniformiser with minimal polynomial φ_K(x) = x^e + pθ_K(x); M = A ∩ K^× the canonical prelog structure.
- p odd (HM's standing hypothesis p > 2); the p = 2 case is not covered by these sources.

**Proof.**

1. Induction on n from node L.5/log-thh-low-degrees (n = 1).
2. Compare hW_nω^q → W_nω^q →R W_{n−1}ω^q → 0 (node L.5/kernel-of-restriction) with 0 → hTR^n_q → TR^n_q → TR^{n−1}_q → 0 (node L.5/norm-restriction-exact-low-degrees; exact for q ≤ 1 and modulo torsion for all q).
3. q ≤ 1: the left vertical map is an isomorphism (node L.5/homotopy-orbit-comparison); five lemma.
4. q = 2: the left vertical map is onto with torsion kernel, and the middle and right groups are divisible (nodes L.5/log-de-rham-witt-dvr-divisible, L.5/norm-restriction-exact-low-degrees).

**Acceptance.**

- q = 0: W_n(A) ≅ TR^n_0(A|K;p).
- q = 1, A = Z_p: W_nω^1_{(Z_p,M)} ≅ TR^n_1(Z_p|Q_p;p), whose reduction mod p is n-dimensional over F_p.

**Depends on.** this roadmap: `L.5/log-thh-low-degrees`, `L.5/kernel-of-restriction`, `L.5/norm-restriction-exact-low-degrees`, `L.5/homotopy-orbit-comparison`, `L.5/log-de-rham-witt-dvr-divisible`, `L.5/tr-log-dvr-is-log-witt-complex`.

**Sources.**

- `HesselholtMadsen.2003`, Theorem 3.3.8, p. 56: “Theorem 3.3.8. The canonical map Wn ωq (A,M) →TRn q (A|K; p) is an isomorphism, for q ≤2, and a rational isomorphism, for all q ≥0. Proof. The proof” — Statement.

### The connecting map of the norm–restriction sequence sends κ to dV(1) − V(dlog(−p))

`L.5/connecting-map-of-kappa` · lemma

The connecting homomorphism ∂: TR^1_2(A|K;p,Z/p) → hTR^2_1(A|K;p,Z/p) maps κ to dV(1) − V(dlog(−p)). This does not use Lemma 5.6.1.

**Hypotheses.**

- A is a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p; e = e_K; π = π_K a uniformiser with minimal polynomial φ_K(x) = x^e + pθ_K(x); M = A ∩ K^× the canonical prelog structure.
- p odd (HM's standing hypothesis p > 2); the p = 2 case is not covered by these sources.

**Proof.**

1. Apply the 3 × 3 lemma (node L.4/three-by-three-lemma) to the smash product of S^0 →p S^0 → M_p → S^1 with the norm–restriction sequence: since TR_2 is uniquely divisible and TR_0 torsion-free, ∂ is minus the connecting map of multiplication by p on 0 → hTR^2_1 → TR^2_1 → TR^1_1 → 0.
2. By Theorem 3.3.8 for n = 2 this is 0 → hW_2ω^1 → W_2ω^1 → W_1ω^1 → 0 (node L.5/log-de-rham-witt-tr-level-two). The Bockstein sends κ to dlog(−p) = R(dlog_2(−p)).
3. Compute p dlog_2(−p): from −[−p]_2 + V(1) = p(1 + p^{p−2}V(1)) (ghost components) differentiate and multiply to get p dlog_2(−p) = V(dlog(−p)) − dV(1).

**Acceptance.**

- For A = Z_p: ∂κ = dV(1) − V(dlog p) in hTR^2_1(Z_p|Q_p;p,Z/p).
- Used in Lemma 5.3.2 to show i_*(κ̃) = σ.

**Depends on.** this roadmap: `L.4/three-by-three-lemma`, `L.5/log-de-rham-witt-tr-level-two`, `L.5/log-differentials-p-torsion`, `L.5/ghost-image-criterion`, `L.4/norm-restriction-cofibre-sequence`; other roadmaps: `StableHomotopyKTheory:H.6/mod-l-homotopy-and-bockstein-sequence`.

**Sources.**

- `HesselholtMadsen.2003`, Addendum 3.3.9, p. 56: “Addendum 3.3.9. The connecting homomorphism ∂: TR1 2(A|K; p, Z/p) →hTR2 1(A|K; p, Z/p) maps κ to dV (1) −V (d log(−p)).” — Statement.
- `HesselholtMadsen.2003`, Proof of Addendum 3.3.9, p. 57: “This shows that pd log2(−p) = V (d log(−p)) −dV (1) as desired.” — The final computation.

### The polynomial u_K with u_K(π_K)^{p−1} = θ_K(π_K), and dlog ζ

`L.5/lubin-tate-unit-polynomial` · lemma

Suppose μ_p ⊂ K. A choice of generator ζ ∈ μ_p and of uniformiser π_K determines a polynomial u_K(x) ∈ W(k)[x] of degree < e_K with u_K(π_K)^{p−1} = θ_K(π_K), and in ω^1_{(A,M)}, dlog ζ = −π_K^{e_K/(p−1)} u_K(π_K)^{−1} dlog(−p). For a finite totally ramified L/K with inclusion ι: A → B, ι(u_K(π_K)) = (−θ_{L/K}(π_L))^{−e_K/(p−1)} u_L(π_L) (Addendum 5.2.2).

**Hypotheses.**

- A is a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p; e = e_K; π = π_K a uniformiser with minimal polynomial φ_K(x) = x^e + pθ_K(x); M = A ∩ K^× the canonical prelog structure.
- p odd.
- μ_p ⊂ K (so p − 1 divides e_K).

**Proof.**

1. Let f(x) = px + x^p and g(x) = (1+x)^p − 1; there is a unique power series φ(x) ≡ x mod x² with f(φ(x)) = φ(g(x)) (Lubin–Tate, as in Serre's 'Local class field theory' §3 Prop. 3, cited); then φ(ζ − 1) is a (p−1)-st root of −p. Define u_K(π_K) = π_K^{e_K/(p−1)}φ(ζ − 1)^{−1}, of degree < e_K.
2. dφ(ζ−1) = φ(ζ−1) dlog φ(ζ−1) = −π_K^{e/(p−1)}u_K(π_K)^{−1} dlog(−p), using that dlog(−p) is p-torsion (node L.5/log-differentials-p-torsion) so (p−1)^{−1} = −1.
3. It remains that dφ(ζ−1) = dlog ζ; reduce to K = Q_p(μ_p), π_K = ζ − 1, where ω^1 is killed by π_K^{p−1}; this amounts to φ(x) ≡ log(1+x) mod x^p, which follows from uniqueness and log(1 + g(x)) = p log(1+x) = f(log(1+x)) in Z_p[x]/(x^p).
4. Addendum: compare ι(φ(ζ−1)) = φ(ζ−1) written in π_K and in π_L, using ι(π_K) = −θ_{L/K}(π_L)^{−1}π_L^{e_{L/K}}.

**Acceptance.**

- K = Q_p(μ_p), π = ζ − 1: e = p − 1, u_K(π) = π·φ(π)^{−1} ≡ 1 mod π (φ(x) ≡ x).
- dlog ζ is p-torsion and nonzero in ω^1_{(A,M)}.

**Depends on.** this roadmap: `L.5/log-differentials-p-torsion`, `L.5/complete-dvr-eisenstein-presentation`, `L.5/log-differentials-residue-sequence`.

**Sources.**

- `HesselholtMadsen.2003`, Lemma 5.2.1, p. 75: “Lemma 5.2.1. Suppose that µp ⊂K. Then a choice of a generator ζ ∈µp and a uniformizer πK ∈A determines a polynomial uK(x) ∈W(k)[x] of degree < eK such that uK(πK)p−1 = θK(πK). Moreover, in ω1 (A,M), d log ζ = −πeK/(p−1) K uK(πK)−1d log(−p). Proof. Consider the power” — Statement.
- `HesselholtMadsen.2003`, Addendum 5.2.2, p. 75: “Addendum 5.2.2. Let L/K be a finite and totally ramified extension. Then the inclusion of valuation rings, ι: A →B, maps ι(uK(πK)) =” — Base change of u_K.

### π̄_*T(A|K) = Λ{dlog π_K} ⊗ S{α_K, π_K}/(π_K^{e_K}) with dα_K = e_Kα_K dlog π_K

`L.5/log-thh-mod-p-alpha-presentation` · lemma

Suppose μ_p ⊂ K and put α_K = u_K(π_K)^{−1}κ. As a differential graded k-algebra, π̄_*T(A|K) = Λ{dlog π_K} ⊗ S{α_K, π_K}/(π_K^{e_K}) with dπ_K = π_K dlog π_K and dα_K = e_K α_K dlog π_K. For L/K finite totally ramified, ι_*(π_K) = −θ_{L/K}(π_L)^{−1}π_L^{e_{L/K}}, ι_*(dlog π_K) = e_{L/K} dlog π_L − dlog θ_{L/K}(π_L) and ι_*(α_K) = (−θ_{L/K}(π_L))^{e_K/(p−1)} α_L ((5.2.5)); the analogous formulas (5.2.7) hold on Ê^2 with the symbols {a,r,d}_K = (pa − d)e_K/(p−1) + r.

**Hypotheses.**

- A is a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p; e = e_K; π = π_K a uniformiser with minimal polynomial φ_K(x) = x^e + pθ_K(x); M = A ∩ K^× the canonical prelog structure.
- p odd.
- μ_p ⊂ K (or K = K_0 with u_{K_0} = 1).

**Proof.**

1. By Theorem B with dκ = κ dlog(−p) (nodes L.5/log-thh-mod-p and L.5/kappa-differential) and Lemma 2.2.3, π̄_*T(A|K) = Λ{dlog π} ⊗ S{κ, π}/(π^e).
2. Differentiate −p = π^e θ_K(π)^{−1}: dlog(−p) = e dlog π − dlog θ_K(π); with θ_K(π) = u_K(π)^{p−1} (node L.5/lubin-tate-unit-polynomial), dα_K = −α_K dlog u_K(π) + α_K(e dlog π − (p−1) dlog u_K(π)) = eα_K dlog π.
3. The base-change formulas follow from the definitions of θ_{L/K} and Addendum 5.2.2.

**Acceptance.**

- If p | e_K then dα_K = 0, so α_K is a d²-cycle in the Tate spectral sequence.

**Depends on.** this roadmap: `L.5/log-thh-mod-p`, `L.5/kappa-differential`, `L.5/lubin-tate-unit-polynomial`, `L.5/relative-log-differentials-of-dvr`.

**Sources.**

- `HesselholtMadsen.2003`, Proposition 5.2.3, p. 76: “Proposition 5.2.3. As a differential graded k-algebra ¯π∗T(A|K) = Λ{d log πK} ⊗S{αK, πK}/(πeK K ) with dπK = πKd log πK and dαK = eKαKd log πK. Proof. It” — Statement.

### The Bott elements b_n ∈ TR^n_2(A|K;p,Z/p) and b_1 = −π_K^{e/(p−1)}α_K

`L.5/bott-element-in-tr` · construction

Suppose μ_{p^v} ⊂ K, p odd. The Bott element b_ζ ∈ π_2(Σ^∞Bμ_{p^v+};Z/p^v) is the class whose Bockstein is ζ ∈ _{p^v}π_1(Σ^∞Bμ_{p^v+}) ≅ μ_{p^v}; its image under the ring maps Σ^∞Bμ_{p^v+} →det K(K) →tr TR^n(A|K;p) is b_n = b_{n,ζ} ∈ TR^n_2(A|K;p,Z/p^v). Its Bockstein is β(b_n) = dlog_n ζ (which characterises it once TR^n_2(A|K;p) is known to be uniquely divisible, node L.5/norm-restriction-exact-low-degrees), and it satisfies R(b_n) = b_{n−1}, F(b_n) = b_{n−1}, and gives the ring map S_{Z/p^v}(μ_{p^v}) → TR^•_*(A|K;p,Z/p^v), ζ ↦ b_ζ. For v = 1: b_1 = −π_K^{e_K/(p−1)}α_K ((5.2.4)); b^{p−1} is the image of v_1 ∈ π̄_{2p−2}(S^0) under the unit map, independent of ζ.

**Hypotheses.**

- A is a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p; e = e_K; π = π_K a uniformiser with minimal polynomial φ_K(x) = x^e + pθ_K(x); M = A ∩ K^× the canonical prelog structure.
- p odd.
- μ_{p^v} ⊂ K; ζ a generator of μ_{p^v}.

**Proof.**

1. Bott element: for p odd the Bockstein π_2(Σ^∞Bμ_{p^v+};Z/p^v) → _{p^v}π_1 is an isomorphism onto μ_{p^v} (StableHomotopyKTheory H.6; the Bott element of K-theory with coefficients is KTheoryFiniteLocalFields L.1/bott-element).
2. det: Σ^∞Bμ_{p^v+} → K(K) from μ_{p^v} ⊂ K^× = GL_1(K); trace to TR^n (node L.4/tr-pro-spectrum).
3. β(b_n) = dlog_n ζ by naturality of the Bockstein and the definition of dlog_n (node L.5/tr-log-structure-maps); R(b_n) = b_{n−1} and F(b_n) = b_{n−1} because the trace is compatible with R and F.
4. For n = 1: β(b_1) = dlog ζ = −π^{e/(p−1)}u_K(π)^{−1}dlog(−p) = β(−π^{e/(p−1)}α_K) (node L.5/lubin-tate-unit-polynomial).

**API.**

- `TauCeti.HM.bottTR` (constructor): b_{n,ζ} := tr(det(b_ζ)) ∈ TR^n_2(A|K;p,Z/p^v).
- `TauCeti.HM.bottTR_bockstein` (characterisation): β(b_{n,ζ}) = dlog_n ζ; b_{n,ζ} is the unique class with this Bockstein because TR^n_2(A|K;p) is uniquely divisible (node L.5/norm-restriction-exact-low-degrees).
- `TauCeti.HM.bottTR_restriction` (simp): R(b_n) = b_{n−1} and F(b_n) = b_{n−1}.
- `TauCeti.HM.bottTR_mul` (relation): b_{ζζ'} = b_ζ + b_{ζ'}; the map μ_{p^v} → TR^n_2(A|K;p,Z/p^v) is a homomorphism (p odd).
- `TauCeti.HM.bottTR_pow` (relation): b^{p−1} = ℓ_*(v_1), independent of ζ (v = 1).
- `TauCeti.HM.bottTR_one` (compatibility): For n = 1, v = 1: b_1 = −π_K^{e_K/(p−1)}α_K.

**Unit tests.**

- `TauCeti.HM.bottTR_Qp_zeta_p` (computation): For K = Q_p(ζ_p), π = ζ_p − 1 (e = p − 1): b_1 = −π·α_K in π̄_2T(A|K).
- `TauCeti.HM.bottTR_trivial_root` (degenerate): b_{n,1} = 0 (ζ = 1 has Bockstein 0).
- `TauCeti.HM.bottTR_kernel` (compatibility): b_ζ is the trace of the K-theory Bott element β_ζ ∈ K_2(K;Z/p^v) of KTheoryFiniteLocalFields L.1/bott-element.
- `TauCeti.HM.bottTR_not_integral` (non-example): b_n is a mod p^v class: there is no integral lift, since TR^n_2(A|K;p) is uniquely divisible while β(b_n) = dlog_nζ ≠ 0.

**Acceptance.**

- b_1 = −π_K^{e_K/(p−1)}α_K in π̄_2T(A|K).
- b_n for n > 1 is 'not well understood' (HM); its image in Ê^* is determined only through F^{n−1}(b_n) = b_1 (Lemma 6.1.2).

**Used by.**

- HM Theorem C: the map W_•ω^* ⊗ S_{Z/p^v}(μ_{p^v}) → TR^•_*(A|K;p,Z/p^v) sends ζ to b_ζ
- HM Lemma 6.1.2: multiplication by b_n on the standard basis of Ê^∞
- HM Remark 6.1.7: the noncanonical description of TC_*(A|K;p,Z/p) in terms of b^s
- KTheoryFiniteLocalFields:L.6: the Bott element in K_2(K;Z/p^v) and the periodicity K_{2s+ε}(K;Z/p) ≅ K_ε ⊗ μ_p^{⊗s} for μ_p ⊂ K

**Depends on.** this roadmap: `L.5/tr-log-structure-maps`, `L.5/lubin-tate-unit-polynomial`, `L.5/log-thh-mod-p-alpha-presentation`, `L.5/log-thh-low-degrees`, `L.1/bott-element`, `L.4/tr-pro-spectrum`; other roadmaps: `StableHomotopyKTheory:H.6/mod-l-homotopy-and-bockstein-sequence`.

**Sources.**

- `HesselholtMadsen.2003`, §5.2, p. 76: “We recall the Bott element. Since p is odd, the Bockstein is an isomorphism, ¯π2(Σ∞Bµp+) ∼ −→pπ1(Σ∞Bµp+) ∼ ←−µp, and by definition, the Bott element b = bζ is the class on the left which corresponds to the chosen generator ζ on the right. The spectrum Σ∞Bµp+ is a ring spectrum and” — Definition of the Bott element and b_n.
- `HesselholtMadsen.2003`, §5.2, (5.2.4), p. 77: “shows that (5.2.4) b1 = −πeK/(p−1) K αK. The elements bn for n > 1, however, are not well understood. Let L/K” — b_1 = −π^{e/(p−1)}α_K.

### The reduction ρ_*: π̄_*T(A) → π̄_*T(A/p) and i_*(κ̃) = σ

`L.5/reduction-mod-p-of-thh-dvr` · lemma

Let κ̃ ∈ π̄_2T(A) be the class with Bockstein dlog(−p) = −((e/p)π^{e−1} + θ'_K(π))θ_K(π)^{−1}dπ, so j_*(κ̃) = κ. (a) If v_p(e_K) > 0, ρ_*: π̄_*T(A) → π̄_*T(A/p) is the inclusion of differential graded k-algebras Λ{dπ} ⊗ S{π, κ̃}/(π^e) → Λ{dπ̄, ε} ⊗ S{σ, π̄}/(π̄^e) ⊗ Γ{c̄_2} taking π to π̄ and κ̃ to σ − θ_K(π̄)^{−1}c̄_2 − ε·((e/p)π̄^{e−1} + θ'_K(π̄))θ_K(π̄)^{−1}dπ̄ (Proposition 5.3.1). (b) The reduction i_*: π̄_*T(A) → π̄_*T(k) maps κ̃ to σ (Lemma 5.3.2).

**Hypotheses.**

- A is a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p; e = e_K; π = π_K a uniformiser with minimal polynomial φ_K(x) = x^e + pθ_K(x); M = A ∩ K^× the canonical prelog structure.
- p odd.
- (a) needs p | e_K.

**Proof.**

1. (a) Only ρ_*(κ̃) needs proof. The diagram of Bockstein triangles for T(A) → T(A/p), the lower one split (node L.4/moore-spectrum-splitting-for-hz-modules), gives ρ_*(κ̃) = ε·(Σ T(ρ))_*β_*(κ̃) + i_*r_*(M_p ∧ T(ρ))_*(κ̃); the first term is computed from the Bockstein of κ̃.
2. Linearisation: under π_*T(A/p) → π_*HH(A/p) the class r_*ρ_*(κ̃) maps to −θ_K(π̄)^{−1}c̄_2 (the Bockstein of c_2 in HH(A) is ((e/p)π^{e−1} + θ'_K(π))dπ); then Lindenstrauss–Madsen Proposition 4.3 (cited) shows the class is λσ − θ_K(π̄)^{−1}c̄_2 with λ ∈ F_p^×, and (b) gives λ = 1. Here π̄_*T(A/p) is node L.5/thh-of-truncated-polynomial-algebra.
3. (b) By Addendum 3.3.9 (node L.5/connecting-map-of-kappa) ∂_{A|K}(κ) = dV(1) − V(dlog(−p)); hence ∂_k(i_*κ̃) = dV(1) since Ω^1_k = 0, and it suffices that ∂_k(σ) = dV(1), i.e. ∂_k(ε) = −V(1) (d anticommutes with ∂ by the conventions of §2.1).
4. ∂_k(ε) = −V(1): Γ̂(ε) is represented by ut^{−1} (node L.5/tate-perfect-field-generators) and Addendum 4.2.2 (node L.4/tate-cohomology-ring-of-odd-cyclic-group) gives its boundary −V(1).

**Acceptance.**

- For A = Z_p (e = 1, p ∤ e) only (b) applies: i_*(κ̃) = σ in π̄_2T(F_p) = F_p σ.
- The formula in (a) makes ρ_* injective in degree 2 when p | e.

**Depends on.** this roadmap: `L.5/thh-of-dvr-mod-p`, `L.5/thh-of-truncated-polynomial-algebra`, `L.5/connecting-map-of-kappa`, `L.5/tate-perfect-field-generators`, `L.4/tate-cohomology-ring-of-odd-cyclic-group`, `L.4/moore-spectrum-splitting-for-hz-modules`, `L.5/log-differentials-p-torsion`.

**Sources.**

- `HesselholtMadsen.2003`, Proposition 5.3.1, p. 78: “Proposition 5.3.1. If vp(eK) > 0 the map ρ∗: ¯π∗T(A) →¯π∗T(A/p) may be identified with the inclusion of differential graded k-algebras ρ∗: Λ{dπK} ⊗S{πK, ˜κ}/(πeK K )֒ →Λ{d¯πK, ε} ⊗S{σ, ¯πK}/(¯πeK K )” — Statement (a).
- `HesselholtMadsen.2003`, Lemma 5.3.2, p. 80: “Lemma 5.3.2. The reduction i∗: ¯π∗T(A) →¯π∗T(k) maps ˜κ to” — Statement (b).

### dκ = κ dlog(−p) (the unit u of Theorem B is 1)

`L.5/kappa-differential` · lemma

In π̄_*T(A), dκ̃ = −θ'_K(π_K)θ_K(π_K)^{−1}dπ_K·κ̃; consequently dκ = κ dlog(−p) in π̄_*T(A|K), i.e. the unit u ∈ F_p^× of node L.5/log-thh-mod-p equals 1.

**Hypotheses.**

- A is a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p; e = e_K; π = π_K a uniformiser with minimal polynomial φ_K(x) = x^e + pθ_K(x); M = A ∩ K^× the canonical prelog structure.
- p odd.

**Proof.**

1. For p | e_K: apply ρ_* (node L.5/reduction-mod-p-of-thh-dvr (a)), which is injective, and compute d of the image with the differential of node L.5/thh-of-truncated-polynomial-algebra (dπ̄ = c_1, dc_2^{[d+1]} = −(e/p)π̄^{e−1}c_1c_2^{[d]}σ, dσ = 0, dε = σ).
2. Apply j_*: d(κ) = κ(e dlog π − dlog θ_K(π)) = κ dlog(−p).
3. For general K the unit u is independent of K (it is determined over K_0 = Q_p, node L.5/log-thh-mod-p), so reduce to a K with p | e_K containing Q_p.

**Acceptance.**

- For K = Q_p: dκ = κ dlog(−p) = κ dlog p in π̄_3T(Z_p|Q_p).

**Depends on.** this roadmap: `L.5/reduction-mod-p-of-thh-dvr`, `L.5/thh-of-truncated-polynomial-algebra`, `L.5/log-thh-mod-p`.

**Sources.**

- `HesselholtMadsen.2003`, Remark 5.3.3, p. 81: “Remark 5.3.3. It follows from Propositions 5.3.1 and A.1.4 that in ¯π∗T(A), d˜κ = −θ′ K(πK)θK(πK)−1dπK · ˜κ. This implies that dκ = κd log(−p) in ¯π∗T(A|K) as stated in Theorem 2.4.1. We construct a” — Statement.

### The Tate spectral sequence of T(k) and the representatives of Γ̂_k(ε), Γ̂_k(σ)

`L.5/tate-perfect-field-generators` · lemma

Let k be perfect of odd characteristic p. Then π_*(T(k);Z/p) = Λ{ε} ⊗ S{σ} with β(ε) = 1 and d(ε) = σ, and Ê^2(C_p, M_p ∧ T(k)) = Λ{u_1, ε} ⊗ S{t^{±1}, σ} ⇒ π_*(Ĥ(C_p,T(k));Z/p) with nonzero differentials multiplicatively generated by d²(ε) = tσ. Under Γ̂_k: T(k) → Ĥ(C_p,T(k)) the classes ε and σ are represented by the infinite cycles ut^{−1} and t^{−1}.

**Hypotheses.**

- k a perfect field of odd characteristic p.

**Proof.**

1. π̄_*T(k): node L.5/thh-of-perfect-field.
2. d²(ε) = tσ by node L.4/tate-d2-is-connes-operator; E^3 = Λ{u_1} ⊗ S{t^{±1}} (HM 1997 Lemma 4.3).
3. Γ̂_k is T-equivariant and commutes with the Bockstein; in the model of Lemma 4.2.1 the Bockstein takes −Ny_1 ⊗ Nx_0^* to y_0 ⊗ Nx_0^*, so ut^{−1} represents the class with Bockstein 1, i.e. Γ̂(ε); and x_1·(−Ny_1 ⊗ Nx_0^*) = Ny_2 ⊗ Nx_0^* represents t^{−1} = Γ̂(σ) by node L.4/tate-spectral-sequence-connes-module.

**Acceptance.**

- For k = F_p, Γ̂: T(F_p) → Ĥ(C_p,T(F_p)) is an equivalence of connective covers (HM 1997 Proposition 4.3).

**Depends on.** this roadmap: `L.5/thh-of-perfect-field`, `L.4/tate-d2-is-connes-operator`, `L.4/tate-spectral-sequence-connes-module`, `L.4/tate-cohomology-ring-of-odd-cyclic-group`, `L.4/norm-restriction-cofibre-sequence`.

**Sources.**

- `HesselholtMadsen.2003`, §4.4, p. 72: “Let k be a perfect field of odd characteristic p and let T(k) be the topological Hochschild spectrum of k. Then as a differential graded k-algebra, π∗(T(k), Z/p) = Λ{ε} ⊗S{σ} with the classes ε ∈π1(T(k), Z/p) and σ ∈π2(T(k), Z/p) characterized by β(ε) = 1 and d(ε) = σ. The Tate” — π̄_*T(k) and the Tate spectral sequence.
- `HesselholtMadsen.2003`, Corollary 4.4.2, p. 72: “Corollary 4.4.2. The image of the classes ε and σ under the map induced from ˆΓk: T(k) →ˆH(Cp, T(k)) are represented by the infinite cycles ut−1 and t−1,” — Representatives of Γ̂(ε), Γ̂(σ).

### dlog π_K is an infinite cycle representing Γ̂(dlog_n π_K)

`L.5/tate-infinite-cycle-dlog` · lemma

For all K and n, the element dlog π_K ∈ Ê^2(C_{p^n}, T(A|K)) is an infinite cycle and represents Γ̂_{A|K}(dlog_n π_K).

**Hypotheses.**

- A is a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p; e = e_K; π = π_K a uniformiser with minimal polynomial φ_K(x) = x^e + pθ_K(x); M = A ∩ K^× the canonical prelog structure.
- p odd.

**Proof.**

1. In the homotopy fixed point spectral sequence for H^•(C_{p^n},T(A|K)), dlog π_K is an infinite cycle representing Γ(dlog_{n+1}π_K): composing Γ with the edge homomorphism gives F^n, and F^n(dlog_{n+1}π_K) = dlog π_K (node L.5/tr-log-structure-maps).
2. R^h induces the inclusion on E^2, and R^hΓ = Γ̂R (node L.4/norm-restriction-cofibre-sequence); dlog π_K is not a boundary.

**Acceptance.**

- n = 1: Γ̂(dlog π_K) ∈ π̄_1Ĥ(C_p,T(A|K)) is represented by dlog π_K in filtration 0.

**Depends on.** this roadmap: `L.4/multiplicative-tate-spectral-sequence`, `L.4/norm-restriction-cofibre-sequence`, `L.5/tr-log-structure-maps`, `L.5/log-thh-mod-p-alpha-presentation`.

**Sources.**

- `HesselholtMadsen.2003`, Proposition 5.3.4, p. 81: “Proposition 5.3.4. For all K, the element d log πK ∈ˆE2(Cpn, T(A|K)) is an infinite cycle and represents the homotopy class ˆΓA|K(d logn πK). Proof. We consider the” — Statement.

### π_K^{p^n} and −τ_Kα_K represent Γ̂([π_K]_n) and Γ̂([π_K]_n^{e/p^n}) when n < v_p(e_K)

`L.5/tate-infinite-cycles-uniformizer` · lemma

Suppose μ_p ⊂ K and n < v_p(e_K). Then π_K^{p^n} and −τ_Kα_K are infinite cycles in Ê^2(C_{p^n}, T(A|K)) representing Γ̂_{A|K}([π_K]_n) and Γ̂_{A|K}([π_K]_n^{e_K/p^n}) (Proposition 5.3.6); the same holds for π_K^{p^n} and −τ_Aα_A in Ê^2(C_{p^n}, T(A)) with α_A = u_K^{(−n)}(π_K)^{−1}κ̃, τ_A = u_K^{(−n)}(π_K)^p t (Lemma 5.3.5).

**Hypotheses.**

- A is a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p; e = e_K; π = π_K a uniformiser with minimal polynomial φ_K(x) = x^e + pθ_K(x); M = A ∩ K^× the canonical prelog structure.
- p odd.
- μ_p ⊂ K; n < v_p(e_K).

**Proof.**

1. Compare with T(A/p) via ρ: by Addendum A.1.6 (node L.5/tate-spectral-sequence-truncated), Ê^3(C_{p^n},T(A/p)) = Λ{u_n, dπ} ⊗ S{t^{±1}, π^p}/(π^e) ⊗ Γ{c̄_2} = Ê^∞, and Ê^3(C_{p^n},T(A)) = Λ{u_n, π^{p−1}dπ} ⊗ S{τ_A^{±1}, α_A, π^p}/(π^e).
2. ρ_* on E^2 (node L.5/reduction-mod-p-of-thh-dvr) sends τ_Aα_A to −tc̄_2 plus a d²-boundary, and Ê^3(T(A)) → Ê^3(T(A/p)) is injective; the low-filtration part of E^∞ also injects.
3. By Proposition A.1.7 (node L.5/tate-image-of-uniformizer-truncated), Γ̂_{A/p}([π]_n) and Γ̂_{A/p}([π]_n^{e/p^n}) are represented by π^{p^n} and tc̄_2; this gives Lemma 5.3.5.
4. Proposition 5.3.6: j_* maps these infinite cycles to π_K^{p^n}, −τ_Kα_K; −τ_Kα_K is not a d³-boundary because j_* is an isomorphism on the relevant E³_{1,0} and E³_{−2,2}.

**Acceptance.**

- n = 0 < v_p(e): π_K and −τ_Kα_K represent Γ̂([π]_1) = Γ̂(π) and Γ̂(π^e) in Ê(C_p,T(A|K)), giving the multiplicative extension (π_K^p)^{e/p} = −τ_Kα_K.

**Depends on.** this roadmap: `L.5/reduction-mod-p-of-thh-dvr`, `L.5/tate-spectral-sequence-truncated`, `L.5/tate-image-of-uniformizer-truncated`, `L.5/log-thh-mod-p-alpha-presentation`, `L.4/multiplicative-tate-spectral-sequence`.

**Sources.**

- `HesselholtMadsen.2003`, Lemma 5.3.5, p. 82: “Lemma 5.3.5. Suppose that µp ⊂K and let n < vp(eK). Then the elements πpn K and −τAαA of ˆE2(Cpn, T(A)) are infinite cycles and represent the homotopy classes ˆΓA(πKn) and ˆΓA(πKeK/pn n ),” — Statement for T(A).
- `HesselholtMadsen.2003`, Proposition 5.3.6, p. 83: “Proposition 5.3.6. Suppose that µp ⊂K and let n < vp(eK). Then the elements πpn K and −τKαK of ˆE2(Cpn, T(A|K)) are infinite cycles and represent the homotopy classes ˆΓA|K(πKn) and ˆΓA|K(πKeK/pn n” — Statement for T(A|K).

### −tκ^p and (−tκ)^{p^n} represent ℓ_*(v_1) and V(1)

`L.5/tate-infinite-cycles-v1` · lemma

The elements −tκ^p and (−tκ)^{p^n} of Ê^2(C_{p^n}, T(A|K)) are infinite cycles which, if not boundaries, represent ℓ_*(v_1) (ℓ the unit map S^0 → Ĥ(C_{p^n},T(A|K)), v_1 ∈ π̄_{2p−2}(S^0)) and V(1), respectively. If μ_p ⊂ K, ℓ_*(v_1) = Γ̂(b_n)^{p−1}.

**Hypotheses.**

- A is a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p; e = e_K; π = π_K a uniformiser with minimal polynomial φ_K(x) = x^e + pθ_K(x); M = A ∩ K^× the canonical prelog structure.
- p odd.

**Proof.**

1. Both elements come from Ê^2(C_{p^n},T(W(k)|K_0)), so it suffices to treat one K; take μ_p ⊂ K with v_p(e_K) > n.
2. Γ̂(b_n) is represented by −π^{e/(p−1)}α_K (b_n = R(b_{n+1}), F^n(b_{n+1}) = b_1, (5.2.4)); with Proposition 5.3.6, α_K is an infinite cycle, and the (p−1)-st powers give −τ_Kα_K^p = −tκ^p representing Γ̂(b_n^{p−1}) = ℓ_*(v_1) (node L.5/bott-element-in-tr).
3. V(1) = θ_K([π]_n)^{−1}[π]_n^{e} in W̄_n(A) (nodes L.5/verschiebung-one-is-teichmuller-minus-p, L.5/witt-mod-p-of-dvr) gives V(1) = Γ̂(θ_K([π]))^{−1}Γ̂([π]^{e/p^n})^{p^n}, represented by (−t κ)^{p^n}.

**Acceptance.**

- For n = 1 and K = K_0: t κ^p is an infinite cycle; it must be hit by d^{2p+1}(u_1) since v_1 acts as zero on the generalized Eilenberg–Mac Lane spectrum Ĥ(C_p,T(W|K_0)) (proof of Proposition 5.4.2).

**Depends on.** this roadmap: `L.5/tate-infinite-cycles-uniformizer`, `L.5/bott-element-in-tr`, `L.5/verschiebung-one-is-teichmuller-minus-p`, `L.5/witt-mod-p-of-dvr`, `L.4/multiplicative-tate-spectral-sequence`.

**Sources.**

- `HesselholtMadsen.2003`, Addendum 5.3.7, p. 83: “Addendum 5.3.7. The elements −tκp and (−tκ)pn of ˆE2(Cpn, T(A|K)) are infinite cycles which, if not boundaries, represent the homotopy classes ℓ∗(v1) and V (1), respectively. Proof. The elements −tκp” — Statement.

### Coefficients of a logarithmic derivative in characteristic p satisfy a_{pi} = a_i^p

`L.5/log-derivative-frobenius-lemma` · lemma

Let k be a field of characteristic p > 0 and f(x) ∈ k[[x]] with f(0) ≠ 0, and write f'(x)x/f(x) = a_1x + a_2x² + ⋯. Then a_{pi} = a_i^p for all i ≥ 1.

**Hypotheses.**

- k a field of characteristic p; f a power series with nonzero constant term.

**Proof.**

1. It suffices to treat polynomials with f(0) ∈ k^× (the coefficients a_i depend on finitely many coefficients of f).
2. Pass to a splitting field, where f is a product of linear factors; the logarithmic derivative converts products to sums, and the property is preserved under sums since (a + b)^p = a^p + b^p.
3. For f(x) = 1 − cx: xf'/f = −cx/(1 − cx) = −Σ_{i≥1} c^i x^i, so a_i = −c^i and a_{pi} = −c^{pi} = (−c^i)^p for p odd; for p = 2, −1 = 1.

**Acceptance.**

- k = F_3, f(x) = 1 + x: xf'/f = x − x² + x³ − ⋯, a_i = (−1)^{i+1}, and a_3 = 1 = a_1^3.
- k = F_3, f(x) = 1 + x²: xf'/f = 2x² − 2x⁴ + 2x⁶ − ⋯, so a_2 = 2 and a_6 = 2 = a_2^3 in F_3.

**Depends on.** libraries: `mathlib:PerfectRing`.

**Sources.**

- `HesselholtMadsen.2003`, Lemma 5.4.1, p. 84: “Lemma 5.4.1. Let k be a field of characteristic p > 0, let f(x) be a power series over k with nonzero constant term, and let f ′(x)x f(x) = a1x + a2x2 + . . . be the logarithmic derivative. Then api = ap i , for all i ≥1. Proof.” — Statement.

### The differentials of Ê^*(C_p, T(A|K))

`L.5/tate-spectral-sequence-first-level` · lemma

Suppose μ_p ⊂ K or K = K_0. Ê^*(C_{p^n}, T(A|K)) denotes the Tate spectral sequence of node L.4/multiplicative-tate-spectral-sequence for M_p ∧ T(A|K), a spectral sequence of bigraded k-algebras via ρ_{n+1}: k → W̄_{n+1}(A); when μ_p ⊂ K or K = K_0 its E^2-term is Λ{u_n, dlog π_K} ⊗ S{π_K, α_K, τ_K^{±1}}/(π_K^{e_K}) with α_K = u_K^{(−n)}(π_K)^{−1}κ and τ_K = u_K^{(−n)}(π_K)^p t (u_{K_0} = 1). Up to a unit, the nonzero differentials in Ê^2(C_p, T(A|K)) are generated by d²(τ_K^aπ_K^rα_K^d) = τ_K dlog π_K·τ_K^aπ_K^rα_K^d if v_p{a,r,d}_K = 0, and d^{2p+1}(u_1) = (τ_Kα_K)^pτ_K, together with dlog π_K being an infinite cycle.

**Hypotheses.**

- A is a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p; e = e_K; π = π_K a uniformiser with minimal polynomial φ_K(x) = x^e + pθ_K(x); M = A ∩ K^× the canonical prelog structure.
- p odd.
- μ_p ⊂ K or K = K_0.

**Proof.**

1. d² from node L.4/tate-d2-is-connes-operator and node L.5/log-thh-mod-p-alpha-presentation.
2. K = K_0: Ê^3 = Λ{u_1, dlog(−p)} ⊗ S{t^{±1}, κ^p}; compare with the T-Tate spectral sequence to see t, κ^p, dlog(−p) survive to E^{2p+1}; d^{2p+1}u_1 = t^{p+1}κ^p up to a unit, since otherwise tκ^p would represent −v_1 (node L.5/tate-infinite-cycles-v1), but v_1 acts trivially on the Eilenberg–Mac Lane module spectrum Ĥ(C_p,T(W|K_0)).
3. μ_p ⊂ K, v_p(e_K) > 1: π^p and τ_Kα_K are infinite cycles (node L.5/tate-infinite-cycles-uniformizer), t is one by the first case, hence τ_K and α_K are.
4. General μ_p ⊂ K: embed Ê^q(C_p,T(A|K)) into Ê^q(C_p,T(B|L)) for L/K totally ramified with e_{L/K} = p² and θ_{L/K}(x) = x − 1, using (5.2.7) and node L.5/log-derivative-frobenius-lemma; this map is injective, so the differentials are as in the previous case.

**Acceptance.**

- For K = Q_p (K_0 = Q_p): E^∞ = Λ{dlog(−p)} ⊗ S{t^{±1}, κ^p}/(… ) with d^{2p+1}(u_1) = t^{p+1}κ^p up to a unit.

**Depends on.** this roadmap: `L.4/tate-d2-is-connes-operator`, `L.5/log-thh-mod-p-alpha-presentation`, `L.5/tate-infinite-cycles-uniformizer`, `L.5/tate-infinite-cycles-v1`, `L.5/log-derivative-frobenius-lemma`, `L.5/tate-infinite-cycle-dlog`, `L.4/multiplicative-tate-spectral-sequence`.

**Sources.**

- `HesselholtMadsen.2003`, Proposition 5.4.2, p. 84: “Proposition 5.4.2. Suppose either µp ⊂K or K = K0. Then, up to a unit, the nonzero differentials in the spectral sequence ˆE2(Cp, T(A|K)) are generated from d2(τ a Kπr Kαd K) = τK d log πK · τ a Kπr Kαd K, if vp{a, r, d}K = 0, d2p+1(u1) = (τKαK)pτK and from” — Statement.

### Γ̂: π̄_iT(A|K) ≅ π̄_iĤ(C_p, T(A|K)) for i ≥ 0

`L.5/gamma-hat-mod-p-isomorphism` · theorem

For every K as in L.5 and every i ≥ 0, Γ̂_{A|K}: π_i(T(A|K);Z/p) → π_i(Ĥ(C_p, T(A|K));Z/p) is an isomorphism. (A mod p statement in nonnegative degrees; the Tate spectrum has nonzero groups in negative degrees.)

**Hypotheses.**

- A is a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p; e = e_K; π = π_K a uniformiser with minimal polynomial φ_K(x) = x^e + pθ_K(x); M = A ∩ K^× the canonical prelog structure.
- p odd.

**Proof.**

1. Reduce to μ_p ⊂ K: for L = K(μ_p), G_{L/K} has order prime to p, and tame descent (node L.5/log-thh-tame-descent) together with the Tate spectral sequence identify both sides with G_{L/K}-invariants of the corresponding groups for L.
2. If μ_p ⊂ K and v_p(e_K) > 1, or K = K_0: E^∞ = Λ{dlog π} ⊗ S{π^p, α_K, τ_K^{±1}}/(π^e, α_K^p) with the multiplicative extension (π^p)^{e/p} = −τ_Kα_K (node L.5/tate-infinite-cycles-uniformizer), so π̄_*Ĥ(C_p,T(A|K)) = Λ{Γ̂(dlog π)} ⊗ S{Γ̂(π), τ̃^{±1}}/(Γ̂(π)^e); both sides are abstractly isomorphic in degrees ≥ 0 and Γ̂ is an isomorphism in degrees 0, 1.
3. It remains that Γ̂: π̄_2T(W|K_0) → π̄_2Ĥ(C_p,T(W|K_0)) is an isomorphism: compare Bocksteins π̄_2 → π̄_1 on both sides (one-dimensional k-vector spaces).
4. General μ_p ⊂ K: choose L/K with v_p(e_L) > 1 and π̄_*T(A|K) → π̄_*T(B|L) injective; then Γ̂_{A|K} is injective, hence bijective by dimension (node L.5/tate-spectral-sequence-first-level).

**Acceptance.**

- For A = Z_p: π̄_iĤ(C_p,T(Z_p|Q_p)) ≅ F_p for every i ≥ 0 (Theorem B gives π̄_iT(Z_p|Q_p) = F_p).

**Depends on.** this roadmap: `L.5/tate-spectral-sequence-first-level`, `L.5/log-thh-tame-descent`, `L.5/tate-infinite-cycles-uniformizer`, `L.5/tate-infinite-cycle-dlog`, `L.5/log-thh-mod-p`, `L.4/norm-restriction-cofibre-sequence`.

**Sources.**

- `HesselholtMadsen.2003`, Theorem 5.4.3, p. 86: “Theorem 5.4.3. For all K, and for i ≥0, the map ˆΓA|K: ¯πiT(A|K) ∼ −→¯πi ˆH(Cp, T(A|K)) is an isomorphism. Proof. If we” — Statement.

### Γ̂ and Γ are isomorphisms with Z/p^v coefficients in degrees ≥ 0 at all levels

`L.5/gamma-hat-all-levels` · theorem

For all K, all n, v ≥ 1 and all i ≥ 0 the maps Γ̂_{A|K}: π_i(T(A|K)^{C_{p^{n−1}}};Z/p^v) → π_i(Ĥ(C_{p^n},T(A|K));Z/p^v) and Γ_{A|K}: π_i(T(A|K)^{C_{p^n}};Z/p^v) → π_i(H^•(C_{p^n},T(A|K));Z/p^v) are isomorphisms.

**Hypotheses.**

- A is a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p; e = e_K; π = π_K a uniformiser with minimal polynomial φ_K(x) = x^e + pθ_K(x); M = A ∩ K^× the canonical prelog structure.
- p odd.

**Proof.**

1. v = 1: from n = 1 (node L.5/gamma-hat-mod-p-isomorphism) by Tsalidis' theorem (Topology 37, 1998, 'Topological Hochschild homology and the homotopy descent problem'; cited, not read — recorded gap). Tsalidis' theorem is the connectivity version of Nikolaus–Scholze Corollary II.4.9 (read), which gives the same conclusion for p-completed homotopy in degrees ≥ k from the case of C_p for bounded-below genuine cyclotomic spectra; T(A|K) is bounded below (node L.4/log-thh-bounded-below).
2. General v: induction on the Bockstein sequences for Z/p → Z/p^v → Z/p^{v−1} and the five lemma.

**Acceptance.**

- For n = 1, v = 1 it is node L.5/gamma-hat-mod-p-isomorphism.

**Depends on.** this roadmap: `L.5/gamma-hat-mod-p-isomorphism`, `L.4/log-thh-bounded-below`, `L.4/hm-conventions-agree-with-nikolaus-scholze`; other roadmaps: `RefinedTraceMethods:RT.2`, `StableHomotopyKTheory:H.6/mod-l-homotopy-and-bockstein-sequence`.

**Sources.**

- `HesselholtMadsen.2003`, Addendum 5.4.4, p. 87: “Addendum 5.4.4. For all K, for all n, v ≥1, and for all i ≥0, the maps ˆΓA|K: πi(T(A|K)Cpn−1 , Z/pv) ∼ −→ πi(ˆH(Cpn, T(A|K)), Z/pv), ΓA|K: πi(T(A|K)Cpn , Z/pv) ∼ −→ πi(H ·(Cpn, T(A|K)), Z/pv), are” — Statement.
- `HesselholtMadsen.2003`, Proof of Addendum 5.4.4, p. 87: “If v = 1 this follows from Theorem 5.4.3 and the main theorem of [47], and the general case follows by easy induction based on the Bockstein” — Reliance on Tsalidis.
- `NikolausScholze.2018`, Corollary II.4.9, PDF p. 52: “Corollary II.4.9. Let X be a genuine Cpn-equivariant spectrum, and assume that for any Y ∈{X, ΦCpX, . . . , ΦCpn−1X}, the spectrum Y is bounded below, and the map (Y Cp)∧ p →(Y hCp)∧ p induces an isomorphism on πi for all i ≥k. Then the map (XCpn )∧ p →(XhCpn )∧ p induces an” — The modern replacement for Tsalidis' theorem.

### The Tate spectral sequence of T(W(k)|K_0)

`L.5/tate-spectral-sequence-unramified` · lemma

Let T = T(W(k)|K_0). In Ê^2(C_{p^n},T) = Λ{u_n, dlog(−p)} ⊗ S{t^{±1}, κ} the higher differentials are multiplicatively generated by d^{2(p^{v+1}−1)/(p−1)}(t^{p^{v−1}}) = λ_v(tκ)^{(p^{v+1}−1)/(p−1)−1} t dlog(−p)·t^{p^{v−1}} for 1 ≤ v < n and d^{2(p^{n+1}−1)/(p−1)−1}(u_n) = μ_n(tκ)^{(p^{n+1}−1)/(p−1)−1}t, with λ_v, μ_n ∈ F_p^×, and by tκ^p and dlog(−p) being infinite cycles; the infinite cycles (−tκ)^{p^{s+1}}dlog(−p) (1 ≤ s < n) represent dV^{n−s}(1).

**Hypotheses.**

- k perfect of odd characteristic p; T = T(W(k)|K_0).

**Proof.**

1. Induction on n, similar to Bökstedt–Madsen's computation for T(W(k)) (Astérisque 226, cited); n = 1 is node L.5/tate-spectral-sequence-first-level.
2. v_1^m ≠ 0 in π̄_*Ĥ(C_{p^n},T) iff m < (p^n − 1)/(p − 1), computed on π̄_*H^•(C_{p^{n−1}},T) through node L.5/gamma-hat-all-levels.
3. Determine the differentials on the p-powers of t by comparison with level n − 1 and the degree argument recorded in HM's proof; the unit on u_n is forced since v_1^{(p^n−1)/(p−1)} = 0.

**Acceptance.**

- n = 1 recovers d^{2p+1}(u_1) = μ_1(tκ)^p t.

**Depends on.** this roadmap: `L.5/tate-spectral-sequence-first-level`, `L.5/gamma-hat-all-levels`, `L.5/tate-infinite-cycles-v1`, `L.4/multiplicative-tate-spectral-sequence`.

**Sources.**

- `HesselholtMadsen.2003`, Proposition 5.5.4, p. 89: “Proposition 5.5.4. Let T = T(W(k)|K0). In the spectral sequence ˆE2(Cpn, T) = Λ{un, d log(−p)} ⊗S{t±1, κ} ⇒¯π∗(ˆH(Cpn, T)), the higher differentials are multiplicatively generated from d2( pv+1−1 p−1 )(tpv−1) = λv · (tκ) pv+1−1 p−1 −1td log(−p) · tpv−1, 1 ≤v < n, d2( pn+1−1 p−1” — Statement.

### The Tate spectral sequence when n < v_p(e_K)

`L.5/tate-spectral-sequence-deeply-ramified` · lemma

If μ_p ⊂ K and n < v_p(e_K), the nonzero differentials in Ê^*(C_{p^n}, T(A|K)) are multiplicatively generated by d^{2(p^{v+1}−1)/(p−1)}(π_K^{p^v}) = −λ_v(tκ)^{(p^{v+1}−1)/(p−1)−1} t dlog π_K·π_K^{p^v} for 0 ≤ v < n and d^{2(p^{n+1}−1)/(p−1)−1}(u_n) = μ_n(tκ)^{(p^{n+1}−1)/(p−1)−1}t, and by τ_K, α_K and dlog π_K being infinite cycles.

**Hypotheses.**

- A is a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p; e = e_K; π = π_K a uniformiser with minimal polynomial φ_K(x) = x^e + pθ_K(x); M = A ∩ K^× the canonical prelog structure.
- p odd.
- μ_p ⊂ K; n < v_p(e_K).

**Proof.**

1. τ_Kα_K and τ_Kα_K^p are infinite cycles (nodes L.5/tate-infinite-cycles-uniformizer, L.5/tate-infinite-cycles-v1), so α_K and τ_K are (derivation argument); dlog π_K by node L.5/tate-infinite-cycle-dlog.
2. If u_K'(0) is a unit: express t^{p^{v−1}} = u_K^{(v−n)}(π^{p^v})^{−1}τ_K^{p^{v−1}} and read d^r(π^{p^v}) off d^r(t^{p^{v−1}}) from node L.5/tate-spectral-sequence-unramified, using node L.5/log-derivative-frobenius-lemma.
3. General case: the pointed monoid Π = {0,1,π,π²,…} gives ρ_K: T(W(k)|K_0) ∧ |N^cy(Π)| → T(A|K) (as in node L.5/thh-of-pointed-monoid-algebra); the spectral sequence for the source splits over the summands N^cy(Π; p^v), and comparison with an auxiliary K (with u_K'(0) a unit) where the result is known determines its differentials; Ê^*(C_{p^n},T(A|K)) is a module over it.

**Acceptance.**

- v = 0: d²(π_K) = −λ_0 t dlog π_K·π_K, the Connes-operator differential dπ = π dlog π.

**Depends on.** this roadmap: `L.5/tate-infinite-cycles-uniformizer`, `L.5/tate-infinite-cycles-v1`, `L.5/tate-infinite-cycle-dlog`, `L.5/tate-spectral-sequence-unramified`, `L.5/log-derivative-frobenius-lemma`, `L.5/thh-of-pointed-monoid-algebra`.

**Sources.**

- `HesselholtMadsen.2003`, Proposition 5.5.5, p. 92: “Proposition 5.5.5. If µp ⊂K and if n < vp(eK), the nonzero differentials in the spectral sequence ˆE∗(Cpn, T(A|K)) are multiplicatively generated from d2( pv+1−1 p−1 )(πpv K ) = −λv · (tκ) pv+1−1 p−1 −1t d log πK · πpv K , 0 ≤v < n, d2(” — Statement.

### The E^r-terms of Ê^*(C_{p^n}, T(A|K)) given the differentials

`L.5/tate-spectral-sequence-e-r-terms` · lemma

Suppose μ_p ⊂ K or K = K_0 and that the differentials of Theorem 5.5.1 hold for K. Then for 0 ≤ s < n and 2(p^s − 1)/(p − 1) < q ≤ 2(p^{s+1} − 1)/(p − 1), Ê^q is the sum over 1 ≤ v ≤ s − 1 of Λ{u_n} ⊗ k{τ_K^aπ_K^rα_K^d dlog π_K | v_p{a,r,d}_K = v, d < (p^{v+1}−1)/(p−1) − 1} and Λ{u_n, dlog π_K} ⊗ k{τ_K^aπ_K^rα_K^d | v_p{a,r,d}_K ≥ s}; and Ê^∞ is the sum over 1 ≤ v ≤ n − 1 of Λ{u_n} ⊗ k{τ^aπ^rα^d dlog π | v_p{a,r,d} = v, d < (p^{v+1}−1)/(p−1) − 1} and Λ{dlog π} ⊗ k{τ^aπ^rα^d | v_p{a,r,d} ≥ n, d < (p^{n+1}−1)/(p−1) − 1}, with 0 ≤ r < e_K, d ∈ N_0, a ∈ Z.

**Hypotheses.**

- A is a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p; e = e_K; π = π_K a uniformiser with minimal polynomial φ_K(x) = x^e + pθ_K(x); M = A ∩ K^× the canonical prelog structure.
- p odd.
- μ_p ⊂ K or K = K_0; the differentials of Theorem 5.5.1 for K.

**Proof.**

1. Induction on s: d^{2(p^{s+1}−1)/(p−1)} maps the summand with v_p{a,r,d} = s isomorphically onto the dlog-summand with d ≥ (p^{s+1}−1)/(p−1) − 1, since {a + (p^{s+1}−1)/(p−1), r, d + (p^{s+1}−1)/(p−1) − 1} = {a,r,d} + p^{s+1}/(p−1).
2. Finally d^{2(p^{n+1}−1)/(p−1)−1}(u_n) = μ(τα)^{(p^{n+1}−1)/(p−1)−1}τ cancels the u_n-summand against the part with d ≥ (p^{n+1}−1)/(p−1) − 1.

**Acceptance.**

- n = 1: Ê^∞ = Λ{dlog π} ⊗ k{τ^aπ^rα^d | v_p{a,r,d} ≥ 1, d < p}.

**Depends on.** this roadmap: `L.5/log-thh-mod-p-alpha-presentation`, `L.4/multiplicative-tate-spectral-sequence`.

**Sources.**

- `HesselholtMadsen.2003`, Lemma 5.5.3, p. 88: “Lemma 5.5.3. Suppose µp ⊂K or K = K0, and assume that Theorem 5.5.1 is true for K. Let ˆEq = ˆEq(Cpn, T(A|K)). Then for 0 ≤s < n and 2(ps −1)/(p −1) < q ≤2(ps+1 −1)/(p −1), ˆEq = s−1 M v=1 Λ{un} ⊗k n” — Statement.

### The differentials of Ê^*(C_{p^n}, T(A|K))

`L.5/tate-spectral-sequence-differentials` · theorem

Suppose μ_p ⊂ K or K = K_0. Ê^*(C_{p^n}, T(A|K)) denotes the Tate spectral sequence of node L.4/multiplicative-tate-spectral-sequence for M_p ∧ T(A|K), a spectral sequence of bigraded k-algebras via ρ_{n+1}: k → W̄_{n+1}(A); when μ_p ⊂ K or K = K_0 its E^2-term is Λ{u_n, dlog π_K} ⊗ S{π_K, α_K, τ_K^{±1}}/(π_K^{e_K}) with α_K = u_K^{(−n)}(π_K)^{−1}κ and τ_K = u_K^{(−n)}(π_K)^p t (u_{K_0} = 1). Its nonzero differentials are multiplicatively generated by d^{2(p^{v+1}−1)/(p−1)}(τ_K^aπ_K^rα_K^d) = λ·(τ_Kα_K)^{(p^{v+1}−1)/(p−1)−1}τ_K dlog π_K·τ_K^aπ_K^rα_K^d with v = v_p{a,r,d}_K, {a,r,d}_K = (pa − d)e_K/(p−1) + r, and d^{2(p^{n+1}−1)/(p−1)−1}(u_n) = μ·(τ_Kα_K)^{(p^{n+1}−1)/(p−1)−1}τ_K, where λ, μ ∈ (A/p)^×, and by dlog π_K being an infinite cycle. HM's Remark 5.5.2 states λ = −λ_v p^{−v}{a,r,d}_K u_K^{(v−n)}(π_K^{p^v})^{−p} and μ = μ_n u_K(π_K^{p^n})^{−p} with λ_v, μ_n ∈ F_p^× independent of K.

**Hypotheses.**

- A is a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p; e = e_K; π = π_K a uniformiser with minimal polynomial φ_K(x) = x^e + pθ_K(x); M = A ∩ K^× the canonical prelog structure.
- p odd.
- μ_p ⊂ K or K = K_0.

**Proof.**

1. Induction on q; q = 2 by nodes L.4/tate-d2-is-connes-operator and L.5/log-thh-mod-p-alpha-presentation.
2. For 2(p^s−1)/(p−1) < q ≤ 2(p^{s+1}−1)/(p−1), s < n: by node L.5/tate-spectral-sequence-e-r-terms only d^q(τ^aπ^rα^d) with v_p{a,r,d} ≥ s must be found; choose L = K[π_L]/(π_L^{e_{L/K}} + π_K θ_{L/K}(π_L)) with e_{L/K} = p^{n+1}, θ_{L/K}(x) = x − 1, so n < v_p(e_L) and ι_*: Ê^q_{*,t}(K) → Ê^q_{*,t}(L) is injective for t ≥ q − 1 ((5.2.7), node L.5/log-derivative-frobenius-lemma).
3. The differentials for L are known (node L.5/tate-spectral-sequence-deeply-ramified); pull them back along ι_*.
4. The differential on u_n comes from node L.5/tate-spectral-sequence-unramified; all further differentials vanish for degree reasons.

**Acceptance.**

- n = 1 is node L.5/tate-spectral-sequence-first-level.
- The E^∞-term's 'standard basis' has n e_K elements in each total degree q ≥ 0 (node L.5/tr-mod-p-dimension).

**Depends on.** this roadmap: `L.5/tate-spectral-sequence-e-r-terms`, `L.5/tate-spectral-sequence-deeply-ramified`, `L.5/tate-spectral-sequence-unramified`, `L.5/log-derivative-frobenius-lemma`, `L.5/log-thh-mod-p-alpha-presentation`, `L.4/tate-d2-is-connes-operator`.

**Sources.**

- `HesselholtMadsen.2003`, Theorem 5.5.1, p. 87: “Theorem 5.5.1. Suppose either µp ⊂K or K = K0. Then the nonzero differentials in the spectral sequence ˆE2(Cpn, T(A|K)) = Λ{un, d log πK} ⊗S{πK, αK, τ ±1 K }/(πeK K ) ⇒ ¯π∗(ˆH(Cpn, T(A|K))) are multiplicatively generated from d2( pv+1−1 p−1 )(τ a Kπr Kαd K) =” — Statement.
- `HesselholtMadsen.2003`, Remark 5.5.2, p. 87: “Remark 5.5.2. We show that the units λ and µ above are given by λ = −λv · p−v{a, r, d}K · u(v−n) K (πpv K )−p, µ = µn · uK(πpn K )−p, where λv and µn are units in Fp independent of K. The proof of” — The units λ and μ.

### F: TR^n_{2i+1}(A|K;p) → TR^{n−1}_{2i+1}(A|K;p) is surjective

`L.5/frobenius-surjective-odd-degrees` · lemma

For all i ≥ 0 and n ≥ 2, the Frobenius induces a surjection F: TR^n_{2i+1}(A|K;p) → TR^{n−1}_{2i+1}(A|K;p) (integral groups).

**Hypotheses.**

- A is a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p; e = e_K; π = π_K a uniformiser with minimal polynomial φ_K(x) = x^e + pθ_K(x); M = A ∩ K^× the canonical prelog structure.
- p odd.

**Proof.**

1. For i > 0, TR^n_i(A|K;p) is the sum of a uniquely divisible group and a p-torsion group of bounded height (true for n = 1 by node L.5/log-thh-low-degrees and Remark 2.4.2, node L.5/log-thh-p-adic; inductively by the norm–restriction sequence and node L.4/tr-homotopy-orbit-spectral-sequence); since FV = p, F is onto on the divisible parts, so it suffices to prove the p-completed statement.
2. By node L.5/gamma-hat-all-levels it suffices that γ_n: π_{2i+1}(H^•(T,T(A|K));Z_p) → π_{2i+1}(H^•(C_{p^n},T(A|K));Z_p) is onto.
3. Both homotopy fixed point spectral sequences converge strongly; π_*(T(A|K);Z_p) is concentrated in odd degrees apart from π_0 (node L.5/log-thh-p-adic), so differentials of E^r(T) originate on t = 0, and γ_{n*} is onto on E^r_{s,t} for s even, t > 0; only these contribute to odd total degree.

**Acceptance.**

- i = 0: F: TR^n_1(A|K;p) → TR^{n−1}_1(A|K;p) is onto; under Theorem 3.3.8 this is F: W_nω^1 → W_{n−1}ω^1.

**Depends on.** this roadmap: `L.5/gamma-hat-all-levels`, `L.5/log-thh-p-adic`, `L.5/log-thh-low-degrees`, `L.4/tr-homotopy-orbit-spectral-sequence`, `L.4/norm-restriction-cofibre-sequence`; other roadmaps: `StableHomotopyKTheory:H.6/l-adic-completion-milnor-sequence`.

**Sources.**

- `HesselholtMadsen.2003`, Lemma 5.6.1, p. 95: “Lemma 5.6.1. For all i ≥0, the Frobenius induces a surjection, F: TRn 2i+1(A|K; p) ։ TRn−1 2i+1(A|K; p). Proof. For i > 0, the group TRn i” — Statement.

### dim_k TR^n_q(A|K;p,Z/p) = n e_K

`L.5/tr-mod-p-dimension` · lemma

If μ_p ⊂ K or K = K_0, then TR^n_q(A|K;p,Z/p) is an n e_K-dimensional k-vector space for every q ≥ 0.

**Hypotheses.**

- A is a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p; e = e_K; π = π_K a uniformiser with minimal polynomial φ_K(x) = x^e + pθ_K(x); M = A ∩ K^× the canonical prelog structure.
- p odd.
- μ_p ⊂ K or K = K_0.

**Proof.**

1. By node L.5/gamma-hat-all-levels, TR^n_q(A|K;p,Z/p) ≅ π̄_qĤ(C_{p^n},T(A|K)) for q ≥ 0, computed by the standard basis of Ê^∞ (nodes L.5/tate-spectral-sequence-differentials, L.5/tate-spectral-sequence-e-r-terms).
2. In total degree q = 2m + ε a standard basis element has d − a = m and {a,r,d}_K = de_K + r − pe_Km/(p−1); the conditions become: for each 1 ≤ v ≤ n, de_K + r ≡ pe_Km/(p−1) mod p^v and (p^v−1)/(p−1) − 1)e_K ≤ de_K + r < ((p^v−1)/(p−1) − 1)e_K + p^v e_K; for each v there are exactly e_K pairs (d,r).

**Acceptance.**

- K = K_0 (e = 1), n = 1: TR^1_q(W(k)|K_0;p,Z/p) is one-dimensional, agreeing with Theorem B.

**Depends on.** this roadmap: `L.5/gamma-hat-all-levels`, `L.5/tate-spectral-sequence-differentials`, `L.5/tate-spectral-sequence-e-r-terms`.

**Sources.**

- `HesselholtMadsen.2003`, Proposition 6.1.1, p. 97: “Proposition 6.1.1. If µp ⊂K or if K = K0 then TRn q (A|K; p, Z/p) is an neK-dimensional k-vector space, for all q ≥0. Proof. We fix a total degree q” — Statement.

### Multiplication by the Bott element on the standard basis

`L.5/bott-multiplication-standard-basis` · lemma

If ξ ∈ π_*(Ĥ(C_{p^n},T(A|K))) is represented in Ê^∞ by u_n^ε τ_K^a π_K^r α_K^d (dlog π_K)^δ, then b_n·ξ is represented by ±u_n^ε τ_K^{a+a'} π_K^{r'} α_K^{d+a'+1} (dlog π_K)^δ, where r + e_K/(p−1) = a'e_K + r' with 0 ≤ r' < e_K; multiplication by b_n preserves the symbol {a,r,d}_K, and b_n^q is represented by ±τ_K^{q_1}π_K^{q_0e_K/(p−1)}α_K^{q_1+q} for q = q_1(p−1) + q_0, 0 ≤ q_0 < p − 1.

**Hypotheses.**

- A is a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p; e = e_K; π = π_K a uniformiser with minimal polynomial φ_K(x) = x^e + pθ_K(x); M = A ∩ K^× the canonical prelog structure.
- p odd.
- μ_p ⊂ K.

**Proof.**

1. Reduce to n = 1: F^{n−1} and V^{n−1} on Ê^3 are isomorphisms for s even and odd respectively and commute with Bott multiplication (F^{n−1}b_n = b_1).
2. If v_p(e_K) > 1: use the multiplicative extension π^e = −τ_Kα_K and b_1 = −π^{e/(p−1)}α_K (nodes L.5/tate-infinite-cycles-uniformizer, L.5/bott-element-in-tr).
3. In general embed into Ê^3(C_p,T(B|L)) for L/K with v_p(e_L) > 1 and injective ι_*.

**Acceptance.**

- For e_K = p − 1 (K = Q_p(μ_p)): b_1·π^r = ±τ^{a'}π^{r'}α^{a'+1} with r + 1 = a'(p−1) + r'.

**Depends on.** this roadmap: `L.5/bott-element-in-tr`, `L.5/tate-infinite-cycles-uniformizer`, `L.5/tate-spectral-sequence-differentials`, `L.5/log-thh-mod-p-alpha-presentation`.

**Sources.**

- `HesselholtMadsen.2003`, Lemma 6.1.2, p. 97: “Lemma 6.1.2. Suppose that the class ξ ∈π∗(ˆH(Cpn, T(A|K))) is represented in ˆE∞(Cpn, T(A|K)) by the element uε nτ a Kπr Kαd K(d log πK)δ. Then the product bn · ξ is represented by ±uε nτ a+a′ K πr′ Kαd+a′+1 K (d log πK)δ, where r + eK/(p −1) = a′eK + r′ and 0 ≤r′ <” — Statement.

### Which standard basis elements lie in the image of W_nω^* ⊗ S(μ_p)

`L.5/image-of-log-de-rham-witt` · lemma

An element of the standard basis of Ê^∞(C_{p^n},T(A|K)) represents a homotopy class in the image of W_nω^*_{(A,M)} ⊗ S_{Z/p}(μ_p) → TR^n_*(A|K;p,Z/p) → π̄_*Ĥ(C_{p^n},T(A|K)) if and only if {a,r,d}_K ≥ 0.

**Hypotheses.**

- A is a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p; e = e_K; π = π_K a uniformiser with minimal polynomial φ_K(x) = x^e + pθ_K(x); M = A ∩ K^× the canonical prelog structure.
- p odd.
- μ_p ⊂ K.

**Proof.**

1. In degrees 0 and 1 the map is an isomorphism (nodes L.5/log-de-rham-witt-tr-low-degrees and L.5/gamma-hat-all-levels), and there {a,r,d} ≥ 0 automatically since a = d.
2. Show that multiplication by b^q maps degree-ε classes onto the span of the basis elements with {a,r,a+q} ≥ 0: writing r − qe/(p−1) = −a_0e + r_0, the condition is a_0 ≤ a and b^q·τ^{a−a_0}π^{r_0}α^{a−a_0} = ±τ^aπ^rα^{a+q} (node L.5/bott-multiplication-standard-basis); similarly for the other basis elements.

**Acceptance.**

- Elements with {a,r,d} < 0 exist in positive total degree, so the map is not surjective at finite level n; only the pro-system is isomorphic (Theorem 6.1.4).

**Depends on.** this roadmap: `L.5/bott-multiplication-standard-basis`, `L.5/log-de-rham-witt-tr-low-degrees`, `L.5/gamma-hat-all-levels`, `L.5/bott-element-in-tr`.

**Sources.**

- `HesselholtMadsen.2003`, Lemma 6.1.3, p. 98: “Lemma 6.1.3. An element of the standard basis of ˆE∞(Cpn, T(A|K)) represents a homotopy class in the image of the composite Wn ω∗ (A,M) ⊗SZ/p(µp) →TRn ∗(A|K; p, Z/p) →¯π∗ˆH(Cpn, T(A|K)) if and only if {a, r, d}K ≥0. Proof. The map of the statement” — Statement.

### Theorem 6.1.4: W_•ω^*_{(A,M)} ⊗ S_{Z/p}(μ_p) ≅ TR^•_*(A|K;p,Z/p) as pro-groups

`L.5/log-de-rham-witt-tr-mod-p` · theorem

Suppose μ_p ⊂ K. The canonical map W_•ω^*_{(A,M)} ⊗ S_{Z/p}(μ_p) → TR^•_*(A|K;p,Z/p) is a pro-isomorphism: for every degree q there is N ≥ 1 (any N with p(q+1)e_K/(p−1) < p^N) such that for all n and 0 ≤ s < n − N the map on gr^s of the standard filtration Fil^sE_n = V^sE_{n−s} + dV^sE_{n−s} is an isomorphism in degree q.

**Hypotheses.**

- A is a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p; e = e_K; π = π_K a uniformiser with minimal polynomial φ_K(x) = x^e + pθ_K(x); M = A ∩ K^× the canonical prelog structure.
- p odd.
- μ_p ⊂ K. The statement is about pro-abelian groups; it is not a levelwise isomorphism.

**Proof.**

1. The map preserves the standard filtration, which has length n at level n; structure maps of the pro-systems preserve it; so gr^s isomorphisms for s < n − N give a pro-isomorphism.
2. Degrees 0 and 1 are known (node L.5/log-de-rham-witt-tr-low-degrees); it suffices that multiplication by b^q: gr^sTR^n_ε → gr^sTR^n_{2q+ε} is an isomorphism for s < n − N.
3. Surjectivity: by node L.5/image-of-log-de-rham-witt every standard basis element with v_p{a,r,d} ≥ N has {a,r,d} ≥ −pqe/(p−1) + r > −p^N, hence ≥ 0; the summands with v < N lie in filtration ≥ n − N since V^s(u_{n−s}…) = u_n… and d(u_n…) = … (node L.4/tate-spectral-sequence-connes-module).
4. Injectivity: for v ≥ N the constraint 0 ≤ d < (p^{v+1}−1)/(p−1) − 1 is implied by {a,r,d} < e(p^{v+1}−1)/(p−1), as p^v > p(q+1)e/(p−1) − r.

**Acceptance.**

- n = 1, q ≤ 1: W_1ω^q ≅ TR^1_q(A|K;p,Z/p) (Theorem B in degrees ≤ 1).
- The dimension count: both sides of gr^s have dimension e_K (node L.5/tr-mod-p-dimension, Proposition 3.4.1).

**Depends on.** this roadmap: `L.5/image-of-log-de-rham-witt`, `L.5/bott-multiplication-standard-basis`, `L.5/log-de-rham-witt-tr-low-degrees`, `L.5/tr-mod-p-dimension`, `L.5/standard-filtration-quotient`, `L.4/tate-spectral-sequence-connes-module`, `L.5/bott-element-in-tr`.

**Sources.**

- `HesselholtMadsen.2003`, Theorem 6.1.4, p. 99: “Theorem 6.1.4. Suppose K contains the p-th roots of unity. Then the canonical map is a pro-isomorphism: W· ω∗ (A,M) ⊗SZ/p(µp) ∼ −→TR· ∗(A|K; p, Z/p). Proof. Let E∗· denote the pro-system on either” — Statement.
- `HesselholtMadsen.2003`, Proof of Theorem 6.1.4, p. 99: “We claim that any N ≥1 with p(q + 1)eK/(p −1) < pN will do. For surjectivity we use Lemma” — The explicit N.

### Theorem C: W_•ω^*_{(A,M)} ⊗ S_{Z/p^v}(μ_{p^v}) ≅ TR^•_*(A|K;p,Z/p^v)

`L.5/log-de-rham-witt-tr-mod-pv` · theorem · planet “Hesselholt–Madsen Theorem C”

Let p be odd and suppose μ_{p^v} ⊂ K. The canonical map of log Witt complexes W_•ω^*_{(A,M)} ⊗_Z S_{Z/p^v}(μ_{p^v}) → TR^•_*(A|K;p,Z/p^v), sending ζ ∈ μ_{p^v} (in degree 2) to the Bott element b_ζ and with R, F, V acting trivially and d as zero on the second factor, is a pro-isomorphism. This is a finite-coefficient statement about pro-abelian groups; for v > 1 the structure of the groups is not known explicitly (HM).

**Hypotheses.**

- A is a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p; e = e_K; π = π_K a uniformiser with minimal polynomial φ_K(x) = x^e + pθ_K(x); M = A ∩ K^× the canonical prelog structure.
- p odd.
- μ_{p^v} ⊂ K.

**Proof.**

1. Induction on v; v = 1 is node L.5/log-de-rham-witt-tr-mod-p.
2. Write q = 2s + ε and compare the coefficient sequences W_•ω^ε ⊗ μ_{p^{v−1}}^{⊗s} → W_•ω^ε ⊗ μ_{p^v}^{⊗s} → W_•ω^ε ⊗ μ_p^{⊗s} with TR_q(Z/p^{v−1}) → TR_q(Z/p^v) → TR_q(Z/p), exact in the middle; the outer vertical maps are pro-isomorphisms by induction, so it suffices that the top row is short exact (pro), and one may take s = 0.
3. ε = 0: W_n(A) is torsion-free. ε = 1: the left map is injective because W_•(A) ⊗ μ_p → W_•ω^1 ⊗ Z/p^{v−1} is zero: it sends x ⊗ ζ to x dlog_•ζ, and dlog_•ζ is divisible by p^{v−1} since ζ has a p^{v−1}-st root in K.

**Acceptance.**

- v = 1, n = 1: ω^*_{(A,M)} ⊗ S_{Z/p}(μ_p) ≅ π̄_*T(A|K) (Theorem B with κ replaced by the Bott element: b_1 = −π^{e/(p−1)}α_K).
- For K = Q_p(μ_{p^v}), both sides in degree 2 are pro-isomorphic to W_•(A)/p^v ⊗ μ_{p^v} ⊕ (W_•ω^2/p^v = 0).

**Depends on.** this roadmap: `L.5/log-de-rham-witt-tr-mod-p`, `L.5/bott-element-in-tr`, `L.5/log-de-rham-witt-complex`, `L.5/tr-log-dvr-is-log-witt-complex`; other roadmaps: `StableHomotopyKTheory:H.6/mod-l-homotopy-and-bockstein-sequence`.

**Sources.**

- `HesselholtMadsen.2003`, Introduction, Theorem C, p. 5: “Theorem C. Suppose that µpv ⊂K. Then the canonical map W· ω∗ (A,M) ⊗Z SZ/pv(µpv) ∼ −→TR· ∗(A|K; p, Z/pv) is a pro-isomorphism. We explain the structure of the” — Statement.
- `HesselholtMadsen.2003`, Proof of Theorem C, p. 100: “The proof is by induction on v; the basic case v = 1 is Theorem 6.1.4. In the induction step, we write q = 2s + ε with” — The induction on v.

### W_•(A) ⊗ μ_{p^v} ≅ _{p^v}W_•ω^1_{(A,M)} as pro-groups

`L.5/roots-of-unity-torsion-in-log-drw` · lemma

If μ_{p^v} ⊂ K, the map W_•(A) ⊗ μ_{p^v} → _{p^v}W_•ω^1_{(A,M)}, x ⊗ ζ ↦ x dlog_•ζ, is a pro-isomorphism. (A purely algebraic statement proved in HM only through Theorem C; HM ask for an algebraic proof.)

**Hypotheses.**

- A is a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p; e = e_K; π = π_K a uniformiser with minimal polynomial φ_K(x) = x^e + pθ_K(x); M = A ∩ K^× the canonical prelog structure.
- p odd.
- μ_{p^v} ⊂ K.

**Proof.**

1. Compare the Bockstein sequence 0 → TR_2/p^v → TR_2(Z/p^v) → _{p^v}TR_1 → 0 with Theorem C (node L.5/log-de-rham-witt-tr-mod-pv) in degree 2 and Theorem 3.3.8 (TR_2 uniquely divisible, TR_1 = W_•ω^1): the degree-2 part W_•(A) ⊗ μ_{p^v} of the left side of Theorem C maps isomorphically onto _{p^v}W_•ω^1 via the Bockstein, which sends b_ζ to dlog_•ζ.

**Acceptance.**

- n = 1, v = 1: A/p ⊗ μ_p ≅ _pω^1_{(A,M)} = A/p·dlog(−p) (Corollary 2.2.5), consistent with dlog ζ = −π^{e/(p−1)}u_K(π)^{−1}dlog(−p) (the factor π^{e/(p−1)} shows the level-1 map is not an isomorphism, only the pro-system is).

**Depends on.** this roadmap: `L.5/log-de-rham-witt-tr-mod-pv`, `L.5/log-de-rham-witt-tr-low-degrees`, `L.5/bott-element-in-tr`; other roadmaps: `StableHomotopyKTheory:H.6/mod-l-homotopy-and-bockstein-sequence`.

**Sources.**

- `HesselholtMadsen.2003`, Remark 6.1.5, p. 101: “Remark 6.1.5. It follows from Theorem C that if µpv ⊂K, the map W·(A) ⊗µpv ∼ −→pvW· ω1 (A,M), which takes x ⊗ζ to xd log· ζ, is a pro-isomorphism. It would be desirable to have an algebraic proof of this fact. Theorem 6.1.6. There are” — Statement and the request for an algebraic proof.

### TC_*(A|K;p,Z/p) in terms of Galois cohomology

`L.5/tc-of-log-dvr-mod-p` · theorem · planet “TC of a local field with log poles”

For p odd there are natural isomorphisms, for s ≥ 0: TC_{2s}(A|K;p,Z/p) ≅ H^0(K, μ_p^{⊗s}) ⊕ H^2(K, μ_p^{⊗(s+1)}) and TC_{2s+1}(A|K;p,Z/p) ≅ H^1(K, μ_p^{⊗(s+1)}). Here H^i(K,−) is continuous Galois cohomology of the absolute Galois group of K. The degree-zero summand Z/p = TC_0(A;p,Z/p) is split off naturally by TC_0(A|K;p,Z/p) → TR_0(A|K;p,Z/p)^F = Z/p. (Finite-coefficient statement, v = 1; K is complete with perfect, not necessarily finite, residue field.)

**Hypotheses.**

- A is a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p; e = e_K; π = π_K a uniformiser with minimal polynomial φ_K(x) = x^e + pθ_K(x); M = A ∩ K^× the canonical prelog structure.
- p odd.

**Proof.**

1. Reduce to μ_p ⊂ K: K(μ_p)/K is tame, so by tame descent (node L.5/log-thh-tame-descent) TC_*(A|K;p,Z/p) ≅ TC_*(A(μ_p)|K(μ_p);p,Z/p)^{Gal}, and similarly for Galois cohomology (order prime to p).
2. For μ_p ⊂ K, Theorem 6.1.4 (node L.5/log-de-rham-witt-tr-mod-p) gives TC_ε(A|K;p,Z/p) ⊗ μ_p^{⊗s} ≅ TC_{2s+ε}(A|K;p,Z/p) (multiplication by b^s commutes with R and F), so only degrees 0 and 1 matter.
3. Degree 1: the trace K^×/K^{×p} = K_1(K;Z/p) → TC_1(A|K;p,Z/p) is an isomorphism (node L.5/trace-isomorphism-for-local-field), and Kummer theory gives K^×/K^{×p} ≅ H^1(K,μ_p) (Tau Ceti's Kummer map is injective; surjectivity is requested from the Tau Ceti ProfiniteCohomology Hilbert 90 layer).
4. Degree 0: the localisation square gives 0 → TC_0(A;p,Z/p) → TC_0(A|K;p,Z/p) → TC_{−1}(k;p,Z/p) → 0; the left term is Z/p = K_0(A;Z/p) (node L.5/trace-equivalence-finite-witt-algebras) and has the natural retraction to TR_0^F = Z/p.
5. TC_{−1}(k;p,Z/p) = W(k)_F/pW(k)_F ≅ k_φ = coker(1 − φ: k → k) (node L.5/tc-of-perfect-field), and k_φ ≅ H^1(k,Z/p) (Artin–Schreier and the normal basis theorem) ≅ H^2(K,μ_p) by Serre's exact sequence 0 → H^2(k,μ_p) → H^2(K,μ_p) → H^1(k,Z/p) → 0 with H^2(k,μ_p) = 0 for k perfect of characteristic p (Serre, Local Fields, cited; Galois inputs requested, see gaps).

**Acceptance.**

- K = Q_p (p odd), s = 0: TC_0 ≅ Z/p ⊕ Z/p and TC_1 ≅ Q_p^×/Q_p^{×p} ≅ (Z/p)²; whereas K_0(Q_p;Z/p) = Z/p, so the trace is not an isomorphism in degree 0.
- K = Q_p (p odd), s = 1: TC_2 ≅ H^0(Q_p,μ_p) ⊕ H^2(Q_p,μ_p^{⊗2}) = 0, since μ_p ⊄ Q_p and H^2(Q_p,μ_p^{⊗2}) ≅ H^0(Q_p,μ_p^{⊗−1})^∨ = 0 by local duality; this matches K_2(Q_p;Z/p) = K_2(Q_p)/p ⊕ _pK_1(Q_p) = 0.

**Depends on.** this roadmap: `L.5/log-de-rham-witt-tr-mod-p`, `L.5/log-thh-tame-descent`, `L.5/trace-isomorphism-for-local-field`, `L.5/trace-equivalence-finite-witt-algebras`, `L.5/tc-of-perfect-field`, `L.5/bott-element-in-tr`, `L.4/k-tc-localization-square`, `L.4/p-typical-tc`; other roadmaps: `MotivicEtaleKTheory:M.1`; libraries: `tauceti:TauCeti.kummerClassMap_injective`.

**Sources.**

- `HesselholtMadsen.2003`, Theorem 6.1.6, p. 101: “Theorem 6.1.6. There are natural isomorphisms, for s ≥0: TC2s(A|K; p, Z/p) ∼= H0(K, µ⊗s p ) ⊕H2(K, µ⊗(s+1) p ), TC2s+1(A|K; p, Z/p) ∼= H1(K, µ⊗(s+1) p ). Proof. Since the extension K(µp)/K is tamely” — Statement.
- `HesselholtMadsen.2003`, Proof of Theorem 6.1.6, p. 101: “In degree one, the cyclotomic trace induces an isomorphism K×/K×p = K1(K, Z/p) ∼ −→TC1(A|K; p, Z/p), and by Kummer theory, the left-hand side is H1(K, µp), [40, p. 155].” — Degree one by the trace and Kummer theory.

### Bökstedt periodicity: π_*T(k) = k[σ] for a perfect field k

`L.5/thh-of-perfect-field` · theorem · planet “Bökstedt periodicity”

For a perfect field k of characteristic p > 0, π_*T(k) ≅ S_k{σ} = k[σ] with |σ| = 2 (integral homotopy groups; T(k) = THH(k) is a generalized Eilenberg–Mac Lane spectrum), and π_*(T(k);Z/p) = Λ{ε} ⊗ S{σ} with β(ε) = 1 and Connes' operator d(ε) = σ. For k = F_p this is Bökstedt's theorem π_*T(F_p) = S_{F_p}{σ}.

**Hypotheses.**

- k a perfect field of characteristic p > 0.

**Proof.**

1. k = F_p: HM 1997 §4.2 (Theorem 4.2, attributed to Breen and Bökstedt) computes π_*T(F_p) = S{σ}; T(R) is a retract of HR ∧ T(R), hence a generalized Eilenberg–Mac Lane spectrum.
2. General perfect k: HH_*(k) = k (node L.5/hochschild-homology-of-perfect-field); the Bökstedt spectral sequence gives E^2(k) ≅ k ⊗ E^2(F_p) and E^∞(k) ≅ k ⊗ E^∞(F_p), so π_*T(k) ≅ k ⊗ π_*T(F_p) (HM 1997 Corollary 4.5).
3. Mod p: the Bockstein sequence (StableHomotopyKTheory H.6) with π_odd T(k) = 0 gives Λ{ε} ⊗ S{σ}; d(ε) = σ is HM 1997 §4 / HM 2003 §4.4.

**Acceptance.**

- π_2T(F_p) = F_pσ, π_1T(F_p) = 0, π_1(T(F_p);Z/p) = F_pε.
- Non-example: for k = F_p(t) (not perfect), π_1T(k) ⊇ Ω^1_{k/F_p} ≠ 0.

**Depends on.** this roadmap: `L.5/hochschild-homology-of-perfect-field`, `L.4/dvr-tr-agrees-with-ring-tr`, `L.4/connes-operator`; other roadmaps: `RefinedTraceMethods:RT.2`, `StableHomotopyKTheory:H.6/mod-l-homotopy-and-bockstein-sequence`.

**Sources.**

- `HesselholtMadsen.1997a`, §4.2, Theorem 4.2, PDF p. 30: “Theorem 4.2. ([Br], [B]) π∗T(Fp) = SFp{σ}. □ The above calculation shows that T(Fp) is a wedge of Eilenberg-MacLane spectra. But this is also clear from the beginning because the composition T(R) ≃S0 ∧T(R) →HR ∧T(R) →T(R) ∧T(R) µ −→T(R) is homotopic” — π_*T(F_p) = S_{F_p}{σ} and the Eilenberg–Mac Lane property.
- `HesselholtMadsen.1997a`, Corollary 4.5, PDF p. 35: “Corollary 4.5. π∗T(k) ∼= k ⊗π∗T(Fp). Proof. We consider the” — Extension to perfect fields.

### TR of a perfect field: π_*T(k)^{C_{p^n}} = W_{n+1}(k)[σ_n]

`L.5/tr-of-perfect-field` · theorem

For a perfect field k of characteristic p: π_*TR^{n+1}(k;p) = π_*T(k)^{C_{p^n}} ≅ S_{W_{n+1}(k)}{σ_n} with |σ_n| = 2, F(σ_n) = σ_{n−1}, V(σ_{n−1}) = pσ_n and R(σ_n) = pλ_nσ_{n−1}, λ_n ∈ W_n(F_p)^× = (Z/p^n)^× (HM 1997 indexing). In particular TR^n_q(k;p) = 0 for q odd, TR_*(k;p) = holim_R = W(k) concentrated in degree 0, F: TR^n_2(k;p) → TR^{n−1}_2(k;p) is surjective with kernel V(TR^{n−1}_2(k;p)), and ∂: TR^1_2(k;p) → hTR^2_1(k;p) is surjective (HM 1997 Theorem 5.5 as cited by HM 2003).

**Hypotheses.**

- k a perfect field of characteristic p > 0.

**Proof.**

1. n = 0 is node L.5/thh-of-perfect-field; for k = F_p, π_*T(F_p)^{C_{p^n}} = S_{Z/p^{n+1}}{σ_n} (HM 1997 Proposition 4.4) by the Tate spectral sequence and Γ̂ being an equivalence of connective covers.
2. Induction on n with the norm–restriction sequence (node L.4/norm-restriction-cofibre-sequence) tensored with W = W_{n+1}(k) over W_{n+1}(F_p): the comparison map is an isomorphism on TR^n by induction and on homotopy orbits by the W_{n+1}(k)-module spectral sequence (node L.4/tr-homotopy-orbit-spectral-sequence), since W_{n+1}(k) ⊗_{W_{n+1}(F_p)} (F^n)^* π_*T(F_p) ≅ (F^n)^*π_*T(k) (Frobenius of k bijective, p generates the maximal ideal).
3. The relations for R, F, V come from the F_p case; R(σ_n) = pλ_nσ_{n−1} forces σ to die in the limit over R.

**Acceptance.**

- k = F_p, n = 1: π_*T(F_p)^{C_p} = Z/p²[σ_1]; π_0 = W_2(F_p) = Z/p² (node L.4/pi0-tr-is-witt-vectors).
- TR_0(k;p) = W(k) and TR_q(k;p) = 0 for q ≠ 0.

**Depends on.** this roadmap: `L.5/thh-of-perfect-field`, `L.4/norm-restriction-cofibre-sequence`, `L.4/tr-homotopy-orbit-spectral-sequence`, `L.4/pi0-tr-is-witt-vectors`, `L.4/multiplicative-tate-spectral-sequence`; libraries: `mathlib:TruncatedWittVector`, `mathlib:PerfectRing`.

**Sources.**

- `HesselholtMadsen.1997a`, Theorem 4.5, PDF p. 36: “Theorem 4.5. For any perfect field k of positive characteristic p, π∗T(k)Cpn ∼= SWn+1(k){σn}, deg σn = 2, and F(σn) = σn−1, V (σn−1) = pσn and R(σn) = pλnσn−1 where λn ∈Wn(Fp) = Z/pn is a unit.” — Statement.
- `HesselholtMadsen.1997a`, Proposition 4.4, PDF p. 34: “Proposition 4.4. The integral homotopy groups of the fixed point spectra T(Fp)Cpn is a copy of Z/pn+1 in each positive even degree, π∗T(Fp)Cpn = SZ/pn+1{σn}, where deg σn = 2. Moreover, F(σn) = σn−1,” — The case k = F_p.

### TC of a perfect field: TC(k;p) ≃ HZ_p ∨ Σ^{−1}H coker(F − 1)

`L.5/tc-of-perfect-field` · theorem

For a perfect field k of characteristic p, TC(k;p) is the generalized Eilenberg–Mac Lane spectrum HZ_p ∨ Σ^{−1}H(coker(F − 1: W(k) → W(k))); i.e. TC_0(k;p) = ker(1 − F) = W(F_p) = Z_p, TC_{−1}(k;p) = W(k)_F := coker(1 − F), and TC_q(k;p) = 0 otherwise. With Z/p coefficients TC_{−1}(k;p,Z/p) = W(k)_F/p ≅ k_φ = coker(1 − φ: k → k). For k finite coker(F − 1) = Z_p; for k algebraically closed it vanishes.

**Hypotheses.**

- k a perfect field of characteristic p > 0.

**Proof.**

1. TR(k;p) = HW(k) by node L.5/tr-of-perfect-field, with F the Witt vector Frobenius (Mathlib WittVector.frobenius); the fibre sequence TC → TR →(1−F) TR (node L.4/p-typical-tc) gives 0 → TC_0 → W(k) →(1−F) W(k) → TC_{−1} → 0.
2. ker(1 − F) = W(k^{φ=1}) = W(F_p) = Z_p (Mathlib WittVector.equiv); TC(F_p) is Eilenberg–Mac Lane and TC(k) is a TC(F_p)-module, hence also Eilenberg–Mac Lane.
3. Mod p: W(k)_F/p ≅ coker(1 − φ on k) since W(k)/p = k and F reduces to φ; F − 1 is surjective on W(k) for k algebraically closed (Lang/Artin–Schreier on each Witt component).

**Acceptance.**

- k = F_p: TC(F_p;p) ≃ HZ_p ∨ Σ^{−1}HZ_p.
- k = F_q: TC_{−1}(F_q;p) ≅ Z_p, and TC_{−1}(F_q;p,Z/p) ≅ (F_q)_φ ≅ F_p.
- k = F̄_p: TC(k;p) ≃ HZ_p.

**Depends on.** this roadmap: `L.5/tr-of-perfect-field`, `L.4/p-typical-tc`; libraries: `mathlib:WittVector.frobenius`, `mathlib:WittVector.equiv`, `mathlib:PerfectRing`.

**Sources.**

- `HesselholtMadsen.1997a`, Introduction, Theorem B, PDF p. 2: “Theorem B. Topological cyclic homology of a perfect field k of positive characteristic is the generalized Eilenberg-MacLane spectrum TC(k) = HZp ∨Σ−1H(coker(F −1)). It follows” — Statement.
- `HesselholtMadsen.1997a`, Proof of Theorem B, PDF p. 36: “Proof of theorem B. Theorem 4.5 shows that TR(k) = HW(k), with the notation of (3.1.1). Moreover, F: TR(k) →TR(k) corresponds to the Frobenius on Witt vectors, and hence we obtain an exact sequence 0 →TC0(k) →W(k) 1−F −−−→W(k) →TC−1(k) →0. When k =” — The fibre sequence with 1 − F.
- `HesselholtMadsen.2003`, Proof of Theorem 6.1.6, p. 102: “Finally, since k is perfect, the restriction induces a natural isomorphism TC−1(k; p, Z/p) = W(k)F /pW(k)F ∼ −→kϕ.” — TC_{−1}(k;p,Z/p) ≅ k_φ.

### HM 1997 Theorem D: K(A)^_p ≃ TC(A;p)^_p[0,∞) for finite W(k)-algebras

`L.5/trace-equivalence-finite-witt-algebras` · theorem

Let k be a perfect field of characteristic p and A a W(k)-algebra finitely generated as a W(k)-module. Then the cyclotomic trace induces K(A)^_p ≃ TC(A;p)^_p[0,∞) (connective cover of the p-completion). Equivalently tr: K_i(A;Z/p^v) → TC_i(A;p,Z/p^v) is an isomorphism for i ≥ 0 and all v ≥ 1. It applies to A = k, to A = O_K for K/K_0 finite, and to all finite quotients of these.

**Hypotheses.**

- k perfect of characteristic p; A finite over W(k) (as a module).
- p-completed and finite-coefficient statement in degrees ≥ 0; integral groups and negative degrees are not compared (TC_{−1}(k;p) ≠ 0 = K_{−1}(k)).

**Proof.**

1. (i) K^top(A)^_p ≃ TC^top(A)^_p[0,∞), where (−)^top = holim_i (−)(A/p^i): each A/p^i → (A/p^i)/rad is a surjection with nilpotent kernel onto a finite product of matrix algebras over finite-dimensional division algebras over perfect fields, so McCarthy's theorem (RefinedTraceMethods RT.3) reduces to the semisimple case (HM 1997 Lemma B.3), where Morita invariance and K(k')^_p ≃ HZ_p ≃ TC(k';p)[0,∞) (node L.5/tc-of-perfect-field; K(k')^_p ≃ HZ_p by Quillen for finite fields, KTheoryFiniteLocalFields L.1, and by Kratzer for general perfect fields, cited) give the claim.
2. (ii) TC^top(A)^_p ≃ TC(A)^_p: HM 1997 §5 (Theorem 5.1, not decomposed further here).
3. (iii) K^top(A)^_p ≃ K(A)^_p: continuity of K-theory after Suslin–Yufryakov (HM 1997 Appendix B, cited; recorded gap).

**Acceptance.**

- A = k: K(k)^_p ≃ HZ_p ≃ TC(k;p)[0,∞).
- A = Z_p: K_1(Z_p;Z_p) = (Z_p^×)^_p = 1 + pZ_p ≅ Z_p (p odd) ≅ TC_1(Z_p;p).

**Depends on.** this roadmap: `L.5/tc-of-perfect-field`, `L.4/p-typical-tc`, `L.4/dvr-tr-agrees-with-ring-tr`, `L.1/quillen-k-groups`; other roadmaps: `RefinedTraceMethods:RT.3`, `StableHomotopyKTheory:H.6/l-adic-completion-milnor-sequence`.

**Sources.**

- `HesselholtMadsen.1997a`, Introduction, Theorem D, PDF p. 2: “Theorem D. For the rings of theorem C, K(A) ∧ p ≃TC(A) ∧ p [0, ∞). It is fair” — Statement.
- `HesselholtMadsen.1997a`, Introduction, Theorem C, PDF p. 2: “Theorem C. Suppose that A is a W(k)-algebra which is finitely generated as a W(k)-module. Then Ktop(A) ∧ p ≃TCtop(A) ∧ p [0, ∞) (i) TCtop(A) ∧ p ≃TC(A) ∧ p , (ii) Ktop(A) ∧ p ≃K(A) ∧ p . (iii) The first part of this result follows from the two previous theorems. The second part is” — The three steps (i)–(iii).

### tr: K_i(K;Z/p^v) ≅ TC_i(A|K;p,Z/p^v) for i ≥ 1

`L.5/trace-isomorphism-for-local-field` · theorem

Let A be a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p. For all v ≥ 1 and i ≥ 1 the cyclotomic trace induces an isomorphism tr: K_i(K;Z/p^v) → TC_i(A|K;p,Z/p^v). In degree 0 it is injective but not surjective in general.

**Hypotheses.**

- A as stated (p may be any prime for this step; HM's subsequent calculations need p odd).
- Finite-coefficient statement; K_i(K) integrally is not compared.

**Proof.**

1. The localisation square (node L.4/k-tc-localization-square) maps the long exact sequence ⋯ → K_i(k) → K_i(A) → K_i(K) → K_{i−1}(k) → ⋯ to the TC sequence, with Z/p^v coefficients.
2. By node L.5/trace-equivalence-finite-witt-algebras (A and k are finite W(k)-algebras) the traces for k and A are isomorphisms in degrees ≥ 0 with Z/p^v coefficients.
3. Five lemma: for i ≥ 1 the maps at K_i(k), K_i(A), K_{i−1}(k), K_{i−1}(A) are isomorphisms, so tr on K_i(K;Z/p^v) is.

**Acceptance.**

- i = 1: K^×/K^{×p} ≅ TC_1(A|K;p,Z/p) (used in Theorem 6.1.6).
- Non-example i = 0, K = Q_p (p odd): K_0(Q_p;Z/p) = Z/p but TC_0(Z_p|Q_p;p,Z/p) ≅ Z/p ⊕ Z/p (node L.5/tc-of-log-dvr-mod-p), because TC_{−1}(F_p;p,Z/p) = F_p ≠ 0 = K_{−1}(F_p;Z/p).

**Used by.**

- KTheoryFiniteLocalFields:L.6: Theorem A of HM: K_*(K;Z/p^v) is computed as TC_*(A|K;p,Z/p^v)
- HM Theorem 6.1.10: comparison with étale K-theory

**Depends on.** this roadmap: `L.4/k-tc-localization-square`, `L.5/trace-equivalence-finite-witt-algebras`; other roadmaps: `StableHomotopyKTheory:H.6/mod-l-homotopy-and-bockstein-sequence`.

**Sources.**

- `HesselholtMadsen.2003`, Introduction, p. 3: “By [19, Th. D], the first two vertical maps from the left induce isomorphisms of homotopy groups with Z/pv-coefficients in degrees ≥0. It follows that the remaining two vertical maps induce isomorphisms of homotopy groups with Z/pv-coefficients in degrees ≥1, tr: Ki(K, Z/pv) ∼” — The deduction of the trace isomorphism in degrees ≥ 1.

### THH of a pointed monoid algebra

`L.5/thh-of-pointed-monoid-algebra` · theorem

For a ring A (more generally an FSP L) and a pointed monoid Π, with A(Π) = A[Π]/A{0} the pointed monoid algebra, the composite T(A) ∧ |N^cy(Π)| → T(A(Π)) ∧ T(A(Π)) →μ T(A(Π)) is an F-equivalence of T-spectra (an equivalence of cyclotomic spectra), where N^cy(Π) is the cyclic bar construction of Π. For A, Π commutative it is multiplicative and induces an isomorphism of differential graded rings on homotopy.

**Hypotheses.**

- A a ring (or an FSP); Π a pointed monoid.

**Proof.**

1. HM 1997 Theorem 6.1 (read in statement; the proof defines the map levelwise on the Bökstedt construction and checks it is an F-equivalence using the approximation lemma) and Hesselholt 2005 Proposition 3; the map is induced by Π → P_{A(Π)}, π ↦ multiplication by π (HM 2003 §A.1).

**Acceptance.**

- Π = {0,1}: T(A) ∧ S^0 ≃ T(A).
- Π = Π_e = {0,1,π,…,π^{e−1}}: T(k[π]/(π^e)) ≃ T(k) ∧ |N^cy(Π_e)|.

**Depends on.** this roadmap: `L.4/thh-of-linear-waldhausen-category`; other roadmaps: `RefinedTraceMethods:RT.2`; libraries: `mathlib:MonoidAlgebra`.

**Sources.**

- `HesselholtMadsen.1997a`, §6, Theorem 6.1, PDF p. 43: “Theorem 6.1. Let L be an FSP and Π a pointed monoid. Then there is a natural equivalence of cyclotomic spectra T(L[Π]) ≃G T(L) ∧|N cy ∧(Π)|. Here the smash” — Statement.
- `Hesselholt.2005`, §3.5, Proposition 3, PDF p. 11: “Proposition 3 Let A be a ring and Π a pointed monoid. Then the composite T(A) ∧Ncy(Π) φ∧ι →T  A(Π)  ∧Ncy(A(Π)) µ→T  A(Π)  is an F -equivalence of T-spectra. Before we give the proof, we mention” — The F-equivalence as a composite.

### The T-homotopy type of the cyclic bar construction of Π_e

`L.5/cyclic-bar-construction-of-truncated-monoid` · theorem

Let Π_e = {0,1,x,…,x^{e−1}} (x^e = 0). The cyclic bar construction splits as N^cy(Π_e) = ⋁_{s≥0} N^cy(Π_e; s), N^cy(Π_e;0) = S^0, and for s ≥ 1, with d = [(s−1)/e] and λ_d = C(1) ⊕ ⋯ ⊕ C(d): there is a canonical exact triangle of pointed T-spaces S^{λ_d} ∧ T/C_{s/e+} →(id∧pr) S^{λ_d} ∧ T/C_{s+} → N^cy(Π_e; s) → S^{λ_d} ∧ T/C_{s/e+}[−1], the outer terms being a point if e ∤ s. Equivalently (HM 1997b Theorem B): S^1_+ ∧_{C_s} (Δ^{s−1}/C_s·Δ^{s−e}) ≃ S^1_+ ∧_{C_s} S^{λ_d} if de < s < (d+1)e, and ≃ S^1_+ ∧_{C_s}(C_e ∗ S^{λ_d}) if s = (d+1)e.

**Hypotheses.**

- e ≥ 1; s ≥ 1.

**Proof.**

1. N^cy(Π_e; s) ≅ T_+ ∧_{C_s}(Δ^{s−1}/C_s·Δ^{s−e}) (cyclic theory: quotient of the cyclic standard (s−1)-simplex).
2. Project the regular cyclic polytope P_{s,d} ⊂ C^{λ_d} (vertices the group elements) and use that 0 ∉ Q_{s,d} and ∂P_{s,d} ⊂ Q_{s,d} for de < s < (d+1)e (HM 1997b Theorem 3.1.2, with proofs of Arnold, Totaro and Boij) to build θ_{s,e}; show S^1_+ ∧_{C_s} θ_{s,e} is an equivalence by the equivariant Whitehead theorem and a homology computation based on the Buenos Aires cyclic homology group (HM 1997b §3; read only in outline — recorded gap for the polytope geometry).

**Acceptance.**

- e = 1 (Π_1 = {0,1}): N^cy(Π_1; s) = ∗ for s ≥ 1.
- s < e: d = 0 and N^cy(Π_e;s) ≃ T/C_{s+} (the torus orbit of the simplex).

**Depends on.** this roadmap: `L.5/thh-of-pointed-monoid-algebra`; other roadmaps: `StableHomotopyKTheory:H.1/nerve-and-classifying-space`.

**Sources.**

- `Hesselholt.2005`, §3.6, Theorem 5, PDF p. 17: “Theorem 5 There is a canonical exact triangle of pointed T-spaces Sλd ∧T|Ci|e+ id ∧pr →Sλd ∧T|Ci+ →Ncy(Πe, i) ∂→Sλd ∧T|Ci|e+[−1] , where d = [(i −1)|e] and where the right and left-hand terms are understood to be a point, if e does not divide i. We sketch the” — Statement of the triangle.
- `HesselholtMadsen.1997b`, Introduction, Theorem B, PDF p. 3: “Theorem B. There are S 1-equivariant equivalences S 1 + ∧Cs (∆s−1/Cs · ∆s−n) ￿S 1 ￿S 1 + ∧Cs S Vd if dn < s < (d + 1)n S 1 + ∧Cs (Cn ∗S Vd ) if s = (d + 1)n given by the maps S 1 + ∧Cs θs,n. We” — The equivalence via cyclic polytopes.

### HH_*(k[x]/(x^e)) = k(Π) ⊗ Λ{c_1} ⊗ Γ{c_2} when e = 0 in k

`L.5/hochschild-homology-of-truncated-polynomial-algebra` · lemma

Let k be a commutative ring in which e = 0, and k(Π) = k[x]/(x^e). The resolution R_*(k(Π)) = k(Π)^e ⊗ Λ{c_1} ⊗ Γ{c_2}, δ(c_1) = x ⊗ 1 − 1 ⊗ x, δ(c_2^{[d]}) = ((x^e ⊗ 1 − 1 ⊗ x^e)/(x ⊗ 1 − 1 ⊗ x))·c_1c_2^{[d−1]} (Guccione–Guccione–Redondo–Solotar–Villamayor) gives an isomorphism of differential graded k-algebras k(Π) ⊗ Λ{c_1} ⊗ Γ{c_2} ≅ H̃_*(|N^cy(Π)|;k) ≅ HH_*(k[x]/(x^e)), with Connes' differential dπ = c_1 and dc_2^{[d]} = 0 (|c_1| = 1, |c_2| = 2, Γ the divided power algebra).

**Hypotheses.**

- k commutative with e·1 = 0 in k (for k a field of characteristic p: p | e).

**Proof.**

1. The normalised standard complex N_*(k(Π)) resolves k(Π) over k(Π)^e and the Künneth isomorphism identifies k(Π) ⊗_{k(Π)^e} N_* with C̃_*(|N^cy(Π)|;k); hence Tor^{k(Π)^e}_*(k(Π),k(Π)) ≅ H̃_*(|N^cy(Π)|;k).
2. Compute with the small resolution R_*; the explicit augmentation-preserving chain map g: R_* → N_* (HM (A.1.3)) is multiplicative up to homotopy; when e = 0 in k the induced differential on k(Π) ⊗_{k(Π)^e} R_* vanishes (the factor (x^e ⊗ 1 − 1 ⊗ x^e)/(x ⊗ 1 − 1 ⊗ x) becomes e x^{e−1} = 0).
3. Connes' differential by the standard formula (Hesselholt 1996 Proposition 1.4.6, cited) gives dπ = c_1, dc_2^{[d]} = 0.

**Acceptance.**

- e = p, k = F_p: HH_1(F_p[x]/(x^p)) ≅ k(Π)c_1 = Ω^1_{F_p[x]/(x^p)} is free of rank one (dim p) since d(x^p) = p x^{p−1}dx = 0.
- HH_2(F_p[x]/(x^p)) ≅ k(Π)c_2, of dimension p.
- Non-example (e ≠ 0 in k): for k = Q, HH_1(Q[x]/(x^e)) = Ω^1 = Q[x]/(x^e)dx/(e x^{e−1}dx) has dimension e − 1, not e.

**Depends on.** this roadmap: `L.4/connes-operator`; other roadmaps: `RefinedTraceMethods:RT.1`; libraries: `mathlib:DividedPowerAlgebra`, `mathlib:ExteriorAlgebra`.

**Sources.**

- `HesselholtMadsen.2003`, Appendix A, (A.1.3), p. 106: “Hence, if e annihilates k, we have an isomorphism of differential graded k-algebras (A.1.3) k(Π) ⊗Λ{c1} ⊗Γ{c2} ∼ −→˜H∗(|N cy · (Π)|; k), where dπ = c1 and dc[d] 2 = 0. The value of the differential is readily verified” — Statement.
- `HesselholtMadsen.2003`, Appendix A, p. 106: “To evaluate this, we consider instead the resolution R∗(k(Π)) ε −→k(Π) of [14], R∗(k(Π)) = k(Π)e ⊗Λ{c1} ⊗Γ{c2}, δ(c1) = π ⊗1 −1 ⊗π, δ(c[d] 2 ) = πe” — The resolution R_*(k(Π)) of [BACH].

### π_*T(k[π]/(π^e)) for p | e

`L.5/thh-of-truncated-polynomial-algebra` · theorem

Let k be a perfect field of characteristic p > 0 and suppose p | e. There is a canonical isomorphism of differential graded k-algebras S{σ} ⊗ k(Π) ⊗ Λ{c_1} ⊗ Γ{c_2} → π_*T(k(Π)), k(Π) = k[π]/(π^e), with dπ = c_1 and d(c_2^{[d+1]}) = −(e/p)π^{e−1}c_1c_2^{[d]}σ. (The isomorphism of graded algebras holds without condition on e when phrased with H̃_*(|N^cy(Π)|;k); the differential needs p | e.) This is π_*T(A/p) for A with e_K = e.

**Hypotheses.**

- k perfect of characteristic p; p | e.

**Proof.**

1. T(k) ∧ |N^cy(Π)| ≃ T(k(Π)) (node L.5/thh-of-pointed-monoid-algebra); the skeletal spectral sequence π_tT(k) ⊗ H̃_s(|N^cy(Π)|;k) collapses since H(k) → T(k) splits T(k) ∧ − multiplicatively, giving π_*T(k) ⊗ H̃_*(|N^cy(Π)|;k) ≅ π_*T(k(Π)) as graded algebras (not as dgas).
2. H̃_*(|N^cy(Π)|;k) by node L.5/hochschild-homology-of-truncated-polynomial-algebra and π_*T(k) = S{σ} by node L.5/thh-of-perfect-field.
3. The differential on c_2^{[d+1]}: use the summand N^cy(Π; s), s = (d+1)e, with its triangle (node L.5/cyclic-bar-construction-of-truncated-monoid); compute ∂_*(c_2^{[d+1]}) = −y_1z_{2d} via Bocksteins (the top Bockstein takes c_2^{[d+1]} to (e/p)π^{e−1}c_1c_2^{[d]}); reduce to d on π_*(T(k) ∧ Σ^{2d+1}M_e), where d(ε·1) = (e/p)σ.

**Acceptance.**

- e = p, k = F_p, degree 2: π_2T(F_p[π]/(π^p)) has k-basis σπ^i, π^i c_2 (0 ≤ i < p), dimension 2p.
- d(c_2) = −(e/p)π^{e−1}c_1σ ≠ 0 when e/p is prime to p, although c_2 is a d-cycle in HH.

**Depends on.** this roadmap: `L.5/thh-of-pointed-monoid-algebra`, `L.5/hochschild-homology-of-truncated-polynomial-algebra`, `L.5/thh-of-perfect-field`, `L.5/cyclic-bar-construction-of-truncated-monoid`, `L.4/connes-operator`; other roadmaps: `StableHomotopyKTheory:H.6/mod-l-homotopy-and-bockstein-sequence`.

**Sources.**

- `HesselholtMadsen.2003`, Proposition A.1.4, p. 106: “Proposition A.1.4. Let k be a perfect field of characteristic p > 0 and suppose p divides e. Then there is a canonical isomorphism of differential graded k-algebras S{σ} ⊗k(Π) ⊗Λ{c1} ⊗Γ{c2} ∼ −→π∗T(k(Π)), where dπ = c1 and d(c[d+1] 2 ) =” — Statement.

### The Tate spectral sequence of T(k[π]/(π^e))

`L.5/tate-spectral-sequence-truncated` · lemma

For k perfect of odd characteristic p and p | e, the nonzero differentials in Ê^2(C_{p^n},T(k(Π))) = Λ{u_n, c_1, ε} ⊗ S{t^{±1}, σ, π}/(π^e) ⊗ Γ{c_2} ⇒ π̄_*Ĥ(C_{p^n},T(k(Π))) are generated by d²ε = tσ, d²π = tc_1 and d²c_2^{[d+1]} = −(e/p)tπ^{e−1}c_1c_2^{[d]}σ; all higher differentials vanish, and Ê^3 = Λ{u_n, dπ} ⊗ S{t^{±1}, π^p}/(π^e) ⊗ Γ{c̄_2} = Ê^∞ (in the notation of Lemma 5.3.5).

**Hypotheses.**

- k perfect, p odd, p | e.

**Proof.**

1. d² by node L.4/tate-d2-is-connes-operator and node L.5/thh-of-truncated-polynomial-algebra.
2. Higher differentials vanish: the decomposition N^cy(Π) = ⋁ N^cy(Π; s) splits the spectral sequence, and for s = de + r the E^3-term of the s-th summand lies on two adjacent lines, so all further differentials vanish for degree reasons.

**Acceptance.**

- The d²-homology of the summand s < e is Λ{u_n} ⊗ S{t^{±1}} ⊗ k{π^s} for p | s and zero otherwise.

**Depends on.** this roadmap: `L.5/thh-of-truncated-polynomial-algebra`, `L.4/tate-d2-is-connes-operator`, `L.4/multiplicative-tate-spectral-sequence`, `L.5/cyclic-bar-construction-of-truncated-monoid`.

**Sources.**

- `HesselholtMadsen.2003`, Addendum A.1.6, p. 109: “Addendum A.1.6. The nonzero differentials in the spectral sequence ˆE2(Cpn, T(k(Π))) = Λ{un, c1, ε} ⊗S{t±1, σ, π}/(πe) ⊗Γ{c2} ⇒ ¯π∗(ˆH(Cpn, T(k(Π)))) are generated from d2ε = tσ, d2π = tc1, and d2c[d+1] 2 =” — Statement.

### Γ̂([π]_n) and Γ̂([π]_n^{e/p^n}) for k[π]/(π^e)

`L.5/tate-image-of-uniformizer-truncated` · lemma

Let n ≤ v_p(e). The images of [π]_n and [π]_n^{e/p^n} under Γ̂: π̄_*(T(k(Π))^{C_{p^{n−1}}}) → π̄_*Ĥ(C_{p^n}, T(k(Π))) are represented by the infinite cycles π^{p^n} and tc_2 if v_p(e) > n, and by π^{p^n} and −(e/p^n)u_1π^{e−1}c_1 if v_p(e) = n.

**Hypotheses.**

- k perfect of odd characteristic p; n ≤ v_p(e).

**Proof.**

1. Only the summand |N^cy(Π,e)| matters; compare with the linearisation l: T(k) → HH(k) = Hk, for which the spectral sequence collapses at E^2 and the map of E^∞-terms is injective.
2. Use the T-homeomorphism D: |sd_{p^n}N^cy(Π,e)| ≅ |N^cy(Π,e)| (Bökstedt–Hsiang–Madsen §1) to put a C_{p^n}-CW-structure on the summand, and the cellular model C_* of the triangle (node L.5/cyclic-bar-construction-of-truncated-monoid) in which α_*((x_1,0)) and α_*(N(0,x_1)) represent π^{e−1}c_1 and −c_2.
3. In the total complex (P̃ ⊗ Hom(P,C_*))^{C_{p^n}} an explicit boundary relates l_*Γ̂([π]^{e/p^n}) = y_0 ⊗ Nx_0^* ⊗ (x_0,0) to −tc_2 and (e/p^n)u_nπ^{e−1}c_1, neither of which is a boundary.

**Acceptance.**

- n = 0 (v_p(e) > 0): Γ̂([π]_0) is not defined (n ≥ 1); for n = 1 < v_p(e), Γ̂([π]_1^{e/p}) is represented by tc_2.

**Depends on.** this roadmap: `L.5/tate-spectral-sequence-truncated`, `L.5/cyclic-bar-construction-of-truncated-monoid`, `L.4/norm-restriction-cofibre-sequence`, `L.4/tate-cohomology-ring-of-odd-cyclic-group`.

**Sources.**

- `HesselholtMadsen.2003`, Proposition A.1.7, p. 109: “Proposition A.1.7. Let n ≤vp(e). The images of πn and πe/pn n by the map ˆΓ: ¯π∗(T(k(Π))Cpn−1 ) →¯π∗(ˆH(Cpn, T(k(Π)))) are represented in the spectral sequence ˆE∗(Cpn, T(k(Π))) by the infinite cycles πpn and tc2, if vp(e) > n, and by πpn and −(e/pn)u1πe−1c1, if vp(e) = n. Proof. The” — Statement.

### Relative TC of A[x]/(x^e) in terms of twisted TR of A

`L.5/relative-tc-of-truncated-polynomial-algebra` · theorem

Let e = p^v e' with e' prime to p and A an F_p-algebra. There is a natural long exact sequence ⋯ → Π_{r≥v+1} Π_{j∈e'I_p} lim_R TR^{r−v}_{q−1−λ_d}(A;p) →(e'V^v) Π_{r≥1} Π_{j∈I_p} lim_R TR^r_{q−1−λ_d}(A;p) → TC_q(A[x]/(x^e),(x);p) →∂ Π_{r≥v+1} Π_{j∈e'I_p} lim_R TR^{r−v}_{q−2−λ_d}(A;p) → ⋯, where d = [(p^{r−1}j − 1)/e], λ_d = C(1) ⊕ ⋯ ⊕ C(d), and TR^n_{q−λ}(A;p) = [S^q ∧ T/C_{p^{n−1}+}, T(A) ∧ S^λ]_T; the limits are attained and the products are finite in each degree. The analogous sequence with Z/p^v coefficients holds for every ring A.

**Hypotheses.**

- A an F_p-algebra (for integral groups); any ring for Z/p^v coefficients; e = p^v e', p ∤ e'.

**Proof.**

1. From the pointed monoid F-equivalence and the triangles of node L.5/cyclic-bar-construction-of-truncated-monoid, the relative T-spectrum T(A[x]/(x^e),(x)) sits in the triangle ⋁_{i∈eN} T(A) ∧ S^{λ_d} ∧ T/C_{i/e+} → ⋁_{i∈N} T(A) ∧ S^{λ_d} ∧ T/C_{i+} → T(A[x]/(x^e),(x)).
2. Rewrite C_{p^{n−1}}-fixed points by p-adic valuation of i and Lemma 9 (V^mι_* + dV^mι_*: π_q(T) ⊕ π_{q−1}(T) ≅ π_q(ρ^*(T ∧ T/C_{j+})^{C_{p^m}}) for j ∈ I_p); the map induced by pr is V^v and e'V^v on the summands (Hesselholt–Madsen, 'cyclic polytopes', Lemma 8.1).
3. Pass to the Frobenius pro-system: the top-line summands are Mittag-Leffler zero, F = p resp. id on the two kinds of summands, giving (3.20) and its limit (3.21); R − id is a split surjection, and TC_q is its kernel.

**Acceptance.**

- For A = k perfect, the TR-groups are TR^n_{q−λ}(k;p) = W_r(k) for q = 2m with ℓ_{n−r} ≤ m < ℓ_{n−1−r} and 0 for q odd (HM 1997b Proposition 9.1 as recalled in Hesselholt 2005 §3.12), which gives the perfect-field calculation.

**Depends on.** this roadmap: `L.5/thh-of-pointed-monoid-algebra`, `L.5/cyclic-bar-construction-of-truncated-monoid`, `L.4/p-typical-tc`, `L.4/tr-pro-spectrum`, `L.4/norm-restriction-cofibre-sequence`; other roadmaps: `StableHomotopyKTheory:H.6/l-adic-completion-milnor-sequence`.

**Sources.**

- `Hesselholt.2005`, §3.10, Proposition 8, PDF p. 24: “Proposition 8 Let e = pve′ with e′ prime to p, and let A be an Fp-algebra. Then there is a natural long-exact sequence of abelian groups ··· → j∈e′Ip lim R TRr−v q−1−λd(A; p) e′Vv → j∈Ip lim R TRr q−1−λd(A; p) → TCq ” — Statement.
- `Hesselholt.2005`, §3.10, Lemma 9, PDF p. 26: “Lemma 9 Let T be a T-spectrum, let j ∈Ip, and letι: Cj|Cj →T|Cj be the canonical inclusion. Then the map Vmι∗+ dVmι∗: πq(T) ⊕πq−1(T) →πq  ρ∗ pm(T ∧T|Cj+)Cpm is an isomorphism. The wedge” — The key splitting lemma.

### TR^n_{*−λ}(A;p) of a regular F_p-algebra in terms of de Rham–Witt forms

`L.5/twisted-tr-of-regular-fp-algebra` · theorem

Let A be a regular F_p-algebra (a filtered colimit of smooth algebras over a perfect field, by Popescu) and λ a finite-dimensional complex T-representation; put ℓ_s = dim_C(λ^{C_{p^s}}) for s ≥ 0 and ℓ_s = ∞ for s < 0. The pairing W_nΩ^*_A ⊗_{W_n(k)} TR^n_{*−λ}(k;p) → TR^n_{*−λ}(A;p) induces an isomorphism of graded abelian groups ⊕_{ℓ_{n−r} ≤ m < ℓ_{n−1−r}} W_rΩ^*_A[−2m] → TR^n_{*−λ}(A;p). For λ = 0 this is TR^n_q(A;p) ≅ ⊕_{m≥0} W_nΩ^{q−2m}_A (Hesselholt 1996 Theorem B for smooth A over perfect k).

**Hypotheses.**

- A a regular noetherian F_p-algebra (Popescu); W_•Ω^*_A the de Rham–Witt complex of Bloch–Deligne–Illusie (CrystallineCohomology CR.4).

**Proof.**

1. Both sides commute with filtered colimits; by Popescu reduce to A smooth over a perfect field k; both sides satisfy étale base change W_n(A') ⊗_{W_n(A)} (−); by a covering argument reduce to polynomial algebras (Hesselholt–Madsen 'cyclic polytopes' Lemma 2.2.8, cited).
2. Induction A → A[t]: Proposition 12 (unique decomposition of TR^n_{q−λ}(A[t];p), proved as Hesselholt–Madsen 2004 Theorem C via the pointed monoid {0,1,t,t²,…} and Lemma 9) and the corresponding decomposition of W_nΩ_{A[t]} (Hesselholt 2005 Theorem 6 = Hesselholt–Madsen 2004 Theorem B) match summand by summand.
3. The base case A = k: TR^n_{q−λ}(k;p) = W_r(k) in degree 2m with ℓ_{n−r} ≤ m < ℓ_{n−1−r} (Hesselholt–Madsen 'cyclic polytopes' Proposition 9.1, cited).

**Acceptance.**

- λ = 0, A = k perfect: TR^n_{2m}(k;p) ≅ W_n(k) for all m ≥ 0, matching node L.5/tr-of-perfect-field.
- λ = 0, A = k[t]: TR^n_1(k[t];p) ⊇ W_nΩ^1_{k[t]}, the p-typical curves of Hesselholt 1996.

**Depends on.** this roadmap: `L.5/relative-tc-of-truncated-polynomial-algebra`, `L.5/tr-of-smooth-fp-algebra`, `L.5/tr-of-perfect-field`; other roadmaps: `CrystallineCohomology:CR.4`.

**Sources.**

- `Hesselholt.2005`, §3.12, Theorem 11, PDF p. 30: “Theorem 11 Let A be a regular Fp-algebra, and let λ be a finite dimensional complex T-representation. Then the pairing (3.23) induces an isomorphism of graded abelian groups  ℓn−r≤m<ℓn−1−r WrΩ∗ A[−2m] ∼ →TRn ∗−λ(A; p) . Proof The domain” — Statement.
- `Hesselholt.2005`, §3.12, Proposition 12, PDF p. 30: “Proposition 12 Let λ be a finite dimensional orthogonal T-representation, and let A be a Z(p)-algebra. Then every element ω(n) ∈TRn q−λ(A[t]; p) can be written uniquely as a” — The decomposition for A[t].

### K-theory of truncated polynomial algebras over a perfect field (Hesselholt–Madsen)

`L.5/relative-k-of-truncated-polynomial-over-perfect-field` · theorem · planet “K-theory of truncated polynomial algebras”

Let k be a perfect field of characteristic p > 0 and n ≥ 1. Then K_{2m−1}(k[x]/(x^n),(x)) ≅ W_{mn}(k)/V_nW_m(k) and K_{2m}(k[x]/(x^n),(x)) = 0 for m ≥ 1, where W_m(k) = (1 + xk[[x]])^×/(1 + x^{m+1}k[[x]])^× is the ring of big Witt vectors of length m and V_n: W_m(k) → W_{mn}(k), f(x) ↦ f(x^n). Here K(A,(x)) = hofib(K(A) → K(A/(x))) (GeneralAlgebraicKTheory K.5) and 0 → K_*(k[x]/(x^n),(x)) → K_*(k[x]/(x^n)) → K_*(k) → 0 is split exact. These are integral statements (the groups are p-primary torsion). The big Witt vectors are HabiroRings HR.4's W_S(k) for the truncation set S = {1,…,m} (not its W_m = W_{T_m}, the divisors of m).

**Hypotheses.**

- k a perfect field of characteristic p > 0; n ≥ 1.

**Proof.**

1. (x) is nilpotent, so McCarthy's theorem (RefinedTraceMethods RT.3) gives K(k[x]/(x^n),(x))^_p ≃ TC(k[x]/(x^n),(x);p)^_p; rationally K_* ⊗ Q ≅ HC_{*−1} ⊗ Q (Goodwillie, RT.3) vanishes since HH_*(k) = k is annihilated by p; for primes ℓ ≠ p the ℓ-adic TC vanishes (proof of Hesselholt 2005 Theorem 13); the arithmetic square gives K ≃ TC integrally.
2. Evaluate TC(k[x]/(x^n),(x);p) by node L.5/relative-tc-of-truncated-polynomial-algebra with TR^r_{q−λ}(k;p) = W_r(k) in even degrees (HM 1997b Theorem 4.2.10): TC_{2m−1} is the cokernel of the injective e'V^v on ⊕ W_s(k) and TC_{2m} = 0.
3. Identify with big Witt vectors: W_{mn}(k) ≅ ⊕_{d ≤ mn, p∤d} W_{s(mn,d)}(k) (p-typical factors) and V_n = e'V^v on the factors (Hesselholt 2005 §3.1).

**Acceptance.**

- m = 1, n = 2: K_1(k[ε],(ε)) ≅ W_2(k)/V_2W_1(k) ≅ k ≅ (1 + εk)^×.
- k = F_p, n = 2, m = 2: K_3(F_p[ε],(ε)) ≅ W_4(F_p)/V_2W_2(F_p) ≅ (Z/p)² for p ≥ 5, Z/9 for p = 3 and (Z/2)² for p = 2 (computed with the p-typical decomposition; agrees with HM 1997 Theorem E and Evens–Friedlander for p ≥ 5).
- K_2(k[x]/(x^n),(x)) = 0 for k perfect (in particular K_2(F_p[ε],(ε)) = 0).

**Depends on.** this roadmap: `L.5/relative-tc-of-truncated-polynomial-algebra`, `L.5/tr-of-perfect-field`, `L.5/hochschild-homology-of-perfect-field`; other roadmaps: `RefinedTraceMethods:RT.3`, `GeneralAlgebraicKTheory:K.5/relative-K-theory-and-excision-boundary`, `HabiroRings:HR.4/truncated-big-witt-vectors`, `StableHomotopyKTheory:H.6/l-adic-completion-milnor-sequence`; libraries: `mathlib:PowerSeries`.

**Sources.**

- `HesselholtMadsen.1997b`, Introduction, Theorem A, PDF p. 2: “Theorem A. Let k be a perfect field of positive characteristic. Then K2m−1(k[x]/(x n), (x)) ∼= Wmn(k)/VnWm(k) and the groups in even degrees are zero. The” — Statement.
- `HesselholtMadsen.1997b`, Introduction, PDF p. 1: “The result is best expressed in terms of big Witt vectors. Let Wm(k) denote the big Witt vectors in k of length m, i.e. the multiplicative group Wm(k) = (1 + xk[[x]])×/(1 + x m+1k[[x]])×, and recall the Verschiebung map Vn: Wm(k) →Wmn(k) given by the” — Big Witt vectors and V_n.

### K-theory of A[x]/(x^e) for regular F_p-algebras A

`L.5/relative-k-of-truncated-polynomial-regular-fp` · theorem

Let A be a regular noetherian F_p-algebra and e = p^v e' with p ∤ e'. There is a natural long exact sequence ⋯ → ⊕_{m≥1} ⊕_{j∈e'I_p} W_{s−v}Ω^{q−2m}_A →(e'V^v) ⊕_{m≥1} ⊕_{j∈I_p} W_sΩ^{q−2m}_A → K_{q−1}(A[x]/(x^e),(x)) →∂ ⊕_{m≥1} ⊕_{j∈e'I_p} W_{s−v}Ω^{q−1−2m}_A → ⋯, where s = s(m,j) is the unique integer with p^{s−1}j ≤ me < p^s j. In particular the relative groups are p-primary torsion.

**Hypotheses.**

- A regular noetherian F_p-algebra; e = p^v e'.

**Proof.**

1. Rationally the groups vanish (Goodwillie with Proposition 7, since HH_*(A) is killed by p); ℓ-adically for ℓ ≠ p the TR-groups are p-groups of bounded exponent, so vanish ℓ-adically; the arithmetic square (Bousfield) makes the trace an integral isomorphism K_q(A[x]/(x^e),(x)) ≅ TC_q(A[x]/(x^e),(x);p).
2. Evaluate TC by nodes L.5/relative-tc-of-truncated-polynomial-algebra and L.5/twisted-tr-of-regular-fp-algebra; V^v on TR induces V^v on de Rham–Witt forms since the isomorphism of Theorem 11 is induced by the pairing (3.23).

**Acceptance.**

- A = k perfect: Ω^{>0}_k = 0 and the sequence reduces to node L.5/relative-k-of-truncated-polynomial-over-perfect-field.
- A = k[t] (k perfect): gives NK_{q−1}(k[x]/(x^e)) via the fundamental theorem (Hesselholt 2005 Corollary 14).

**Depends on.** this roadmap: `L.5/relative-tc-of-truncated-polynomial-algebra`, `L.5/twisted-tr-of-regular-fp-algebra`, `L.5/relative-cyclic-homology-of-truncated-polynomial-algebra`; other roadmaps: `RefinedTraceMethods:RT.3`, `GeneralAlgebraicKTheory:K.5/relative-K-theory-and-excision-boundary`, `CrystallineCohomology:CR.4`, `StableHomotopyKTheory:H.6/l-adic-completion-milnor-sequence`.

**Sources.**

- `Hesselholt.2005`, §3.13, Theorem 13, PDF p. 33: “Theorem 13 Suppose that A is a regular noetherian ring and an Fp-algebra, and write e = pve′ with e′ not divisible by p. Then there is a natural long-exact sequence of abelian groups ··· →  m≥1  j∈e′Ip Ws−vΩq−2m A” — Statement.

### Rational relative cyclic homology of A[x]/(x^e)

`L.5/relative-cyclic-homology-of-truncated-polynomial-algebra` · lemma

For every ring A there is a natural isomorphism ⊕_{i ∈ N ∖ eN} HH_{q−2d}(A) ⊗ Q → HC_q(A[x]/(x^e),(x)) ⊗ Q, where d = [(i − 1)/e].

**Hypotheses.**

- A any ring; rational coefficients.

**Proof.**

1. H(A) ∧ N^cy(Π_e) ≃ H(A[x]/(x^e)) as T-spectra; the triangles of node L.5/cyclic-bar-construction-of-truncated-monoid give an exact triangle of T-spectra and hence of T-homotopy orbit spectra, whose homotopy is HC.
2. H_q(T, H(A) ∧ S^{λ_d} ∧ T/C_{i+}) ≅ H_q(C_i, H(A) ∧ S^{λ_d}); rationally higher group homology of C_i vanishes and C_i acts trivially (the action extends to T), giving HH_{t−2d}(A) ⊗ Q.
3. Rationally the map induced by pr is an isomorphism onto the summands with i ∈ eN; the remaining summands give the formula.

**Acceptance.**

- e = 2, A = Q, q = 1: the summands are i = 1 (HH_1(Q) = 0) and i ≥ 3 odd (HH_{1−2d} with d ≥ 1, zero), so HC_1(Q[ε],(ε)) = 0, matching K_2(Q[ε],(ε)) = Ω^1_Q = 0.
- e = 2, A = Q: HC_0(Q[ε],(ε)) ≅ HH_0(Q) = Q (i = 1), matching K_1(Q[ε],(ε)) = Q.

**Depends on.** this roadmap: `L.5/cyclic-bar-construction-of-truncated-monoid`, `L.5/thh-of-pointed-monoid-algebra`; other roadmaps: `RefinedTraceMethods:RT.1`.

**Sources.**

- `Hesselholt.2005`, §3.9, Proposition 7, PDF p. 22: “Proposition 7 There is a natural isomorphism, valid for all rings A,  i∈N re N HHq−2d(A) ⊗Q ∼ →HCq  A[x]|(xe), (x)  ⊗Q , where d = [(i −1)|e]. Proof We recall that the composite H(A) ∧Ncy(Πe) →H ” — Statement.

### Characteristic zero: K_{q−1}(A[x]/(x^e),(x)) ≅ ⊕_{m≥1}(Ω^{q−2m}_A)^{e−1}

`L.5/relative-k-of-truncated-polynomial-char-zero` · theorem

Let A be a regular noetherian ring and a Q-algebra. There is a natural isomorphism of abelian groups ⊕_{m≥1}(Ω^{q−2m}_A)^{e−1} → K_{q−1}(A[x]/(x^e),(x)), Ω^*_A the absolute de Rham complex; the relative K-groups are uniquely divisible, and the spectrum K(A[x]/(x^e),(x)) is a product of Eilenberg–Mac Lane spectra. For e = 2 (the square-zero extension A[ε] = A ⊕ Aε): K_{q−1}(A[ε],(ε)) ≅ ⊕_{m≥1} Ω^{q−2m}_A; e.g. K_1(A[ε],(ε)) ≅ A and K_2(A[ε],(ε)) ≅ Ω^1_A (van der Kallen for q = 3, e = 2). This is the characteristic-zero square-zero comparison with differential forms.

**Hypotheses.**

- A regular noetherian (hence, by Popescu, a filtered colimit of smooth Q-algebras) and a Q-algebra.

**Proof.**

1. p-adically for every p: K_q(A[x]/(x^e),(x);Z_p) ≅ TC_q(A[x]/(x^e),(x);p,Z_p) (McCarthy, RefinedTraceMethods RT.3) vanishes, since by node L.5/relative-tc-of-truncated-polynomial-algebra it is built from TR^n_{q−λ}(A;p,Z/p^v), which vanish because THH_*(A;Z/p^v) are A-modules killed by p^v and A is a Q-algebra.
2. The arithmetic square (Bousfield, cited in Hesselholt 2005) then makes K(A[x]/(x^e),(x)) → K(A[x]/(x^e),(x))_Q an equivalence; Goodwillie's theorem (RT.3) identifies K_q ≅ HC^−_q ≅ HC_{q−1} of the relative situation, uniquely divisible.
3. Compute K_{q−1} ≅ HC_{q−2}(A[x]/(x^e),(x)) by node L.5/relative-cyclic-homology-of-truncated-polynomial-algebra: ⊕_{i ∉ eN} HH_{q−2−2[(i−1)/e]}(A); the e − 1 indices i with (m−1)e < i < me have [(i−1)/e] = m − 1, which gives ⊕_{m≥1}(HH_{q−2m}(A))^{e−1}.
4. HH_*(A) ≅ Ω^*_A by HKR for smooth Q-algebras and Popescu (RefinedTraceMethods RT.1).

**Acceptance.**

- A = Q, e = 2: K_1(Q[ε],(ε)) ≅ Q, K_2(Q[ε],(ε)) ≅ Ω^1_Q = 0, K_3(Q[ε],(ε)) ≅ Ω^2_Q ⊕ Ω^0_Q = Q.
- A = Q(t), e = 2: K_2(Q(t)[ε],(ε)) ≅ Ω^1_{Q(t)} = Q(t)dt ≠ 0.
- A = Q, e = 3: K_1(Q[x]/(x^3),(x)) ≅ Q² ≅ (1 + xQ[x]/(x^3))^× (via the logarithm).
- Non-example: over a perfect field of characteristic p the same groups are p-primary torsion (node L.5/relative-k-of-truncated-polynomial-over-perfect-field): K_1(F_p[ε],(ε)) ≅ F_p is not uniquely divisible.

**Depends on.** this roadmap: `L.5/relative-cyclic-homology-of-truncated-polynomial-algebra`, `L.5/relative-tc-of-truncated-polynomial-algebra`; other roadmaps: `RefinedTraceMethods:RT.1`, `RefinedTraceMethods:RT.3`, `GeneralAlgebraicKTheory:K.5/relative-K-theory-and-excision-boundary`, `StableHomotopyKTheory:H.6/l-adic-completion-milnor-sequence`; libraries: `mathlib:KaehlerDifferential`, `mathlib:DualNumber`.

**Sources.**

- `Hesselholt.2005`, §3.11, Theorem 10, PDF p. 28: “Theorem 10 Suppose that A is a regular noetherian ring and a Q-algebra. Then there is a natural isomorphism of abelian groups Kq−1  A[x]|(xe), (x)  ∼ ←  m≥1  Ωq−2m A e−1 , where the superscript e −1 indicates” — Statement.
- `Hesselholt.2005`, §3.1, PDF p. 2: “For e = 2 and q = 3, this was first obtained by van der Kallen [56].” — The square-zero case e = 2.

### TR of smooth and regular F_p-algebras is the de Rham–Witt complex

`L.5/tr-of-smooth-fp-algebra` · theorem

Let k be a perfect field of characteristic p and A a smooth k-algebra. The canonical map of Witt complexes extends to an isomorphism W_nΩ^*_A ⊗_{W_n(k)} S_{W_n(k)}{σ_n} → π_*T(A)^{C_{p^{n−1}}} = TR^n_*(A;p), |σ_n| = 2, with F(σ_n) = σ_{n−1}, V(σ_n) = pσ_{n+1}, R(σ_n) = pλ_nσ_{n−1}; hence WΩ^*_A ≅ TR_*(A;p) = holim_R (Hesselholt 1996 Theorems B and C). By Popescu and filtered colimits the same holds for every regular noetherian F_p-algebra, in particular for the complete discrete valuation ring k[[t]] of an equal-characteristic local field.

**Hypotheses.**

- A smooth over a perfect field of characteristic p; or A regular noetherian F_p-algebra (Popescu).
- W_•Ω^*_A is the Bloch–Deligne–Illusie de Rham–Witt complex (CrystallineCohomology CR.4).

**Proof.**

1. TR^•_*(A;p) is a Witt complex (Hesselholt 1996 §1), giving I: W_nΩ^*_A → TR^n_*(A;p).
2. For polynomial algebras compute TR explicitly (Hesselholt 1996 §2, via the pointed monoid N and Lemma 9 of Hesselholt 2005) and compare with Illusie's basis; general smooth A by étale base change and a covering argument.
3. In the limit over R, σ dies since R(σ_n) = pλ_nσ_{n−1}.
4. Regular A: both sides commute with filtered colimits (Geisser–Hesselholt 2006 introduction).

**Acceptance.**

- A = k: TR^n_*(k;p) = W_n(k)[σ_n] (node L.5/tr-of-perfect-field).
- A = k[[t]]: TR_1(k[[t]];p) ≅ WΩ^1_{k[[t]]}.

**Depends on.** this roadmap: `L.5/tr-of-perfect-field`, `L.5/thh-of-pointed-monoid-algebra`, `L.4/tr-pro-spectrum`; other roadmaps: `CrystallineCohomology:CR.4`.

**Sources.**

- `Hesselholt.1996`, Introduction, Theorem B, PDF p. 2: “Theorem B. Suppose that A is a smooth k-algebra. Then the map I extends to an isomorphism I: WnΩ∗ A ⊗Wn(k) SWn{σn} →π∗TH(A)Cpn−1, deg σn = 2. Moreover, F(σn) = σn−1, V (σn) = pσn+1 and R(σn) = pλnσn−1, where λn is a unit of” — Statement.
- `Hesselholt.1996`, Introduction, Theorem C, PDF p. 2: “Theorem C. If A is a smooth k-algebra, then WΩ∗ A ∼= TR∗(A; p) ∼=” — The limit.
- `GeisserHesselholt.2006`, Introduction, PDF p. 3: “This implies that the results of [5] and [6], which were proved originally for smooth Fp-algebras, are valid, more generally, for regular Fpalgebras.” — Extension to regular F_p-algebras by Popescu.

### TC of regular F_p-algebras: the sequence TC_q → WΩ^q →(1−F) WΩ^q

`L.5/tc-of-regular-fp-algebra` · theorem

For A a regular noetherian F_p-algebra there is a natural long exact sequence ⋯ → TC_q(A;p) → WΩ^q_A →(1−F) WΩ^q_A → TC_{q−1}(A;p) → ⋯ (and its relative version for an ideal I, as used by Geisser–Hesselholt for complete regular local rings). Applied to A = k[[t]] it gives the TC-groups of the complete DVR of an equal-characteristic local field.

**Hypotheses.**

- A regular noetherian F_p-algebra.

**Proof.**

1. Geisser–Hesselholt 2006 (introduction) state the sequence as a consequence of their earlier results for smooth F_p-algebras (Geisser–Hesselholt, 'Topological cyclic homology of schemes', and 'The de Rham–Witt complex and p-adic vanishing cycles', cited) extended to regular algebras by Popescu.
2. Its derivation within this packet: TR_q(A;p) ≅ WΩ^q_A with F the de Rham–Witt Frobenius (node L.5/tr-of-smooth-fp-algebra), inserted into the long exact sequence of node L.4/p-typical-tc (R acts as the identity on the limit); the vanishing of the lim^1-terms of the Milnor sequence for TR is part of the cited results and is recorded with the gap on Geisser–Hesselholt's earlier papers.

**Acceptance.**

- A = k perfect: TC_0 = W(k)^{F=1} = Z_p and TC_{−1} = W(k)_F (node L.5/tc-of-perfect-field).
- A = F_p[[t]], q = 1: TC_1 is an extension of ker(1 − F on WΩ^1) by coker(1 − F on WΩ^2) = 0.

**Depends on.** this roadmap: `L.5/tr-of-smooth-fp-algebra`, `L.4/p-typical-tc`; other roadmaps: `CrystallineCohomology:CR.4`, `StableHomotopyKTheory:H.6/l-adic-completion-milnor-sequence`.

**Sources.**

- `GeisserHesselholt.2006`, Introduction, PDF p. 3: “This implies that the results of [5] and [6], which were proved originally for smooth Fp-algebras, are valid, more generally, for regular Fpalgebras. Hence, there is a natural long-exact sequence · · · →TCq(R, I; p) →WΩq (R,I) 1−F −−→WΩq (R,I) →TCq−1(R, I; p) →· · · where WΩq (R,I)” — The long exact sequence with 1 − F on WΩ.

## L.6 — Local higher K-groups

*Coverage: partial.* Every target of the stage text is realised. 'Local-field descriptions in Handbook I.5 §5.6' (the author copy's §5.6 Local Fields, items 56–67, pp. 162–167): Theorem 56 → equal-characteristic-integral-structure; Theorem 57 (Moore) is L.3's; Proposition 58 is L.2's; 59 → completed-k-theory and completion-exact-sequence; Warning 60 → the comparison nodes; Theorem 61 → completed-k-groups-of-p-adic-fields, finite-coefficient-lichtenbaum-quillen, even-integral-k-groups; Remark 62 → the odd comparison; Corollary 63 → k3-torsion-free-lattice; Examples 64–66 concern number fields and belong to L.7/ArithmeticKTheory (not planned here); Theorem 67 → hm-theorem-d. 'Combine localisation, trace calculations and M's étale comparison': ring-of-integers-versus-field (localisation), hm-etale-comparison and hm-theorem-a (L.5's trace calculations), finite-coefficient-lichtenbaum-quillen (M.7, all p). Rank [L:ℚ_p] of K_{2j−1}(L;ℤ_p), j ≥ 2, and its torsion by the Galois cohomology H^0(L, ℚ_p/ℤ_p(j)) inside H^1(L, ℤ_p(j)): p-adic-w-invariant, h1-of-tate-twists, odd-completed-k-groups-are-h1, completed-k-groups-of-p-adic-fields, with the ℚ_p cases in p-adic-w-invariant-of-q-p and completed-k-groups-of-q-p. Even groups' p-primary finite components by twist and duality: local-duality-for-tate-twists (H²(L, ℤ_p(i+1)) ≅ H⁰(L, ℤ/p^ν(−i))^∨, w_{−i} = w_i), even-completed-k-groups-are-h2, even-integral-k-groups. Divisible components of the integral groups: maximal-divisible-subgroup, divisible-subgroup-criterion, even-integral-k-groups, even-k-groups-tate-module, divisible-rank-relation, k3-torsion-free-lattice, uniquely-divisible-summand. No finite generation transferred to K_n(L): uniquely-divisible-summand and the comparison nodes. Exact comparison maps with kernels and cokernels (the handoff table's 'integral divisible subgroup, finite torsion quotient, derived p-completion and H1/H2 comparison'): even- and odd-integral-to-completed-comparison, discrete-coefficient-k-groups, odd- and even-completed-k-groups-are-h1/h2. Equal characteristic with its own de Rham–Witt argument: power-series-de-rham-witt, geisser-hesselholt-regular-local, equal-characteristic-relative-k-theory, equal-characteristic-completed-k-groups, equal-characteristic-unique-p-divisibility, equal-characteristic-integral-structure. Consumers: PadicHodgeRegulators D.3 (completed-k3-of-unramified-fields; restructure entry on ownership); D.4 consumes L.6 through L.7's global-to-local map; ArithmeticKTheory N.6/divisible-subgroup-and-the-wild-kernel uses, through L.7, that the maps K_{2i}(F) → K_{2i}(F_v) land in groups whose quotient by the divisible part is the finite group ℤ/w_i(F_v) (even-integral-k-groups) and N.6/tame-and-wild-kernels uses Moore's theorem (L.3).

- Remaining: Obtain Tate, 'Relations between K2 and Galois cohomology' (Handbook ref. [66]) and decompose the uncountability of K^M_n(𝔽_q((t))), n ≥ 3 (gap), or supply another proof.
- Remaining: Obtain Dwyer–Mitchell and Thomason's calculation of the p-adic homotopy type of K^ét of a p-adic field and decompose the equivalences of L.6/hm-theorem-d, including the valuation-ring form (gap).
- Remaining: Resolve the requests to MotivicEtaleKTheory M.1, M.4, M.5, M.6, M.7, M.8, ArithmeticGaloisDuality R02.1, CrystallineCohomology CR.4, RefinedTraceMethods RT.4:topological and Tau Ceti ClassFieldTheory Layer 5 / LocalFieldsRamification Layer 1, replacing the stage prerequisites by node ids once those blueprints exist.
- Remaining: Assign an owner to the Geisser–Levine theorem (gap) and to cd_p ≤ 2 for complete discretely valued fields with perfect infinite residue field (gap).
- Remaining: Decide whether the natural splitting in Hesselholt–Madsen's Theorem A for v > 1 is needed anywhere; if so, find its argument (gap).
- Remaining: Rognes–Weibel's proof for p = 2 (K-book [161, 3.7], Handbook [51]) was not read; the p = 2 case rests on M.7's Quillen–Lichtenbaum statement for fields of 2-cohomological dimension 2.
- Remaining: Route Examples VI.7.6–7.8 of the K-book (Handbook 64–66), which are local–global, to L.7 (restructure entry).

### The maximal divisible subgroup Div(A) of an abelian group

`L.6/maximal-divisible-subgroup` · definition

For an abelian group A, Div(A) is the subgroup generated by all divisible subgroups of A. It is itself divisible, it is the largest divisible subgroup of A, and A/Div(A) is reduced (has no nonzero divisible subgroup). Div(A) is a direct summand: A = Div(A) ⊕ C for some subgroup C, necessarily C ≅ A/Div(A), but C is not unique. A homomorphism f: A → B maps Div(A) into Div(B), Div(A ⊕ B) = Div(A) ⊕ Div(B), and Div(A) ⊆ ⋂_{m ≥ 1} mA. For A = K_{2i}(L) of a p-adic field this is the subgroup D_i of the K-book, and for A = K_{2i−1}(L)/torsion it is the part of T_i invisible to p-adic completion.

**Hypotheses.**

- A is any abelian group; no finiteness is assumed.
- The complement C is chosen: every statement that uses a splitting A = Div(A) ⊕ C says that C is non-canonical.

**Proof.**

1. Define Div(A) as the supremum in the lattice of additive subgroups of the subgroups D with DivisibleBy D ℤ (Mathlib's DivisibleBy).
2. A sum of divisible subgroups is divisible: an element of D_1 + ⋯ + D_k is a sum of elements each divisible by n inside its D_j; so Div(A) is divisible and maximal.
3. Div(A) is an injective ℤ-module (Mathlib AddCommGrpCat.injective_of_divisible), so the inclusion Div(A) → A splits: A = Div(A) ⊕ C with C ≅ A/Div(A).
4. A/Div(A) is reduced: the preimage of a divisible subgroup of A/Div(A) is an extension of a divisible group by the divisible group Div(A), hence divisible, hence contained in Div(A).
5. f(Div A) is divisible, hence contained in Div(B); Div(A) = n·Div(A) ⊆ nA for every n.

**API.**

- `TauCeti.AddCommGroup.maxDivisible` (data): Div(A) as an additive subgroup of A: the supremum of the divisible subgroups.
- `TauCeti.AddCommGroup.mem_maxDivisible_iff` (characterisation): x ∈ Div(A) if and only if x lies in some divisible subgroup of A.
- `TauCeti.AddCommGroup.maxDivisible.divisibleBy` (instance): DivisibleBy (Div A) ℤ.
- `TauCeti.AddCommGroup.le_maxDivisible` (universal-property): Every divisible subgroup D ≤ A satisfies D ≤ Div(A).
- `TauCeti.AddCommGroup.exists_isCompl_maxDivisible` (structure): There is a subgroup C with Div(A) ⊕ C = A (internal direct sum); C ≅ A/Div(A); no choice of C is canonical.
- `TauCeti.AddCommGroup.maxDivisible_quotient_eq_bot` (characterisation): Div(A/Div(A)) = 0.
- `TauCeti.AddCommGroup.map_maxDivisible_le` (functoriality): f(Div A) ≤ Div(B) for f: A →+ B; Div(A ⊕ B) = Div(A) ⊕ Div(B).
- `TauCeti.AddCommGroup.maxDivisible_le_iInf` (relation): Div(A) ≤ ⋂_{m ≥ 1} mA, with equality when A is torsion-free or when A = D ⊕ F with D divisible and F of finite exponent.
- `TauCeti.AddCommGroup.maxDivisible_structure` (other): Div(A) ≅ ℚ^{(κ)} ⊕ ⨁_ℓ (ℤ/ℓ^∞)^{(λ_ℓ)} for cardinals κ, λ_ℓ; if A is uniquely ℓ-divisible for all ℓ ≠ p then only ℓ = p occurs.

**Unit tests.**

- `TauCeti.AddCommGroup.maxDivisible_ratCircle_prod` (computation): For A = ℚ/ℤ × ℤ/6 × ℤ, Div(A) = ℚ/ℤ × 0 × 0 and A/Div(A) ≅ ℤ/6 × ℤ.
- `TauCeti.AddCommGroup.maxDivisible_finite` (degenerate): If A is finite then Div(A) = 0; in particular Div(0) = 0.
- `TauCeti.AddCommGroup.maxDivisible_eq_top_iff` (compatibility): Div(A) = A if and only if A carries Mathlib's DivisibleBy A ℤ structure (A is divisible).
- `TauCeti.AddCommGroup.maxDivisible_int_ne_smul` (non-example): Div(ℤ) = 0 while wℤ ≠ 0 for every w ≥ 1: the description Div(A) = w·A of L.6/divisible-subgroup-criterion needs that criterion's hypothesis and is not a definition.
- `TauCeti.AddCommGroup.maxDivisible_padicInt` (non-example): Div(ℤ_p) = 0 although the quotient ℤ_p/ℤ_(p) is uniquely divisible: Div is not preserved by quotients.

**Acceptance.**

- Div(A) = A exactly when A is divisible; Div(A) = 0 when A is finite, and Div(ℤ_p) = 0.
- For A = K_{2i}(L), L/ℚ_p finite, Div(A) = w_i(L)·A (L.6/even-integral-k-groups).

**Used by.**

- K-book Proposition VI.7.3: D_i = w_i(E)K_{2i}(E) is the divisible component of K_{2i}(E) and K_{2i}(E) ≅ D_i ⊕ ℤ/w_i(E)
- Handbook I.5, Theorem 61: 'each K2i(V) is the direct sum of a uniquely divisible group, a divisible p-group and a subgroup isomorphic to Z/w_i^(p)(E)'
- K-book proof of Theorem VI.7.4 and Remark VI.7.3.1: the Tate module of D_{i−1} is one of the two torsion-free summands of K_{2i−1}(V; ℤ_p)
- L.6/odd-integral-to-completed-comparison: the kernel of K_{2i−1}(L) → K_{2i−1}(L; ℤ_p) contains Div(K_{2i−1}(L))
- ArithmeticKTheory N.6/divisible-subgroup: N.6 uses the different subgroup ⋂_m mA; the API item TauCeti.AddCommGroup.maxDivisible_le_iInf records Div(A) ⊆ ⋂_m mA and L.6/even-integral-k-groups the equality for the groups of this layer

**Depends on.** libraries: `mathlib:DivisibleBy`, `mathlib:AddCommGrpCat.injective_of_divisible`.

**Sources.**

- `Kbook.2013`, Proof of Theorem VI.1.6 (PDF p. 475; book p. 467): “Since a divisible abelian group is the direct sum of a uniquely divisible group and a divisible torsion group, a divisible torsion group is the sum of its Sylow subgroups, and an ℓ-primary divisible group is a direct sum of copies of Z/ℓ∞” — The structure of divisible groups that the API item TauCeti.AddCommGroup.maxDivisible_structure records.
- `Kbook.2013`, Proposition VI.7.3 and its proof (PDF p. 517; book p. 509): “Setting m = m′wi(E), it follows that the subgroup Di = wi(E)K2i(E) of K2i(E) is a divisible group. Thus K2i(E) ≅ Di ⊕ Z/wi(E)” — The divisible component D_i of the even K-groups, the principal use of Div in this layer.

### The p-adic Tate module T_p(A) of an abelian group

`L.6/p-adic-tate-module` · definition

For an abelian group A and a prime p, T_p(A) = lim_ν A[p^ν] is the inverse limit of the p^ν-torsion subgroups A[p^ν] (Mathlib's AddSubgroup.torsionBy) along the maps A[p^{ν+1}] → A[p^ν], x ↦ px. It is a torsion-free ℤ_p-module, canonically Hom(ℤ/p^∞, A) = Hom(ℚ_p/ℤ_p, A), functorial and left exact in A. T_p(A) = 0 when the p-primary torsion of A has finite exponent, T_p((ℚ_p/ℤ_p)^λ) ≅ ℤ_p^λ for finite λ (for infinite λ, T_p(⊕_λ ℚ_p/ℤ_p) is the p-adic completion of ⊕_λ ℤ_p), and T_p(A) is not the p-adic completion lim_ν A/p^ν.

**Hypotheses.**

- A is any abelian group and p a prime.

**Proof.**

1. Define T_p(A) as the limit of the tower (A[p^ν], ×p); its ℤ_p-module structure is the limit of the ℤ/p^ν-module structures.
2. Torsion-freeness: if p·(x_ν) = 0 then p·x_{ν+1} = x_ν = 0 for all ν.
3. Hom(ℤ/p^∞, A) = lim_ν Hom(ℤ/p^ν, A) = lim_ν A[p^ν], because ℤ/p^∞ = colim_ν ℤ/p^ν.
4. If p^N kills the p-primary torsion then every compatible sequence (x_ν) has x_ν = p^N x_{ν+N} = 0.

**API.**

- `TauCeti.AddCommGroup.pTateModule` (data): T_p(A) = lim_ν A[p^ν] as a ℤ_p-module.
- `TauCeti.AddCommGroup.pTateModule.equivHom` (equivalence): T_p(A) ≃ Hom(ℚ_p/ℤ_p, A), naturally in A.
- `TauCeti.AddCommGroup.pTateModule.map` (functoriality): A homomorphism A → B induces T_p(A) → T_p(B), with map_id and map_comp; T_p is left exact.
- `TauCeti.AddCommGroup.pTateModule.noZeroSMulDivisors` (instance): T_p(A) is a torsion-free ℤ_p-module.
- `TauCeti.AddCommGroup.pTateModule_eq_zero_of_exponent` (simp): If p^N kills A[p^∞] then T_p(A) = 0.
- `TauCeti.AddCommGroup.pTateModule_padicCircle_pow` (example): T_p((ℚ_p/ℤ_p)^λ) ≅ ℤ_p^λ for finite λ.
- `TauCeti.AddCommGroup.pTateModule_maxDivisible` (relation): If A[p^∞] = Div(A)[p^∞] ⊕ F with F of finite exponent, T_p(Div A) → T_p(A) is an isomorphism.

**Unit tests.**

- `TauCeti.AddCommGroup.pTateModule_padicCircle` (computation): T_p(ℚ_p/ℤ_p) ≅ ℤ_p as ℤ_p-modules, and T_p((ℚ_p/ℤ_p)^2 × ℤ/p^5) ≅ ℤ_p².
- `TauCeti.AddCommGroup.pTateModule_of_finite` (degenerate): If A is finite, or more generally if p^N A[p^∞] = 0, then T_p(A) = 0.
- `TauCeti.AddCommGroup.pTateModule_units_complex` (compatibility): T_p(ℂ^×) ≅ ℤ_p, the p-adic Tate module of μ_{p^∞}(ℂ) that Mathlib's cyclotomic character acts on.
- `TauCeti.AddCommGroup.pTateModule_int` (non-example): T_p(ℤ) = 0 while lim_ν ℤ/p^ν = ℤ_p: the Tate module is not the p-adic completion.

**Acceptance.**

- T_p(ℚ_p/ℤ_p) ≅ ℤ_p and T_p(ℤ) = 0 while lim_ν ℤ/p^ν = ℤ_p.
- T_p(K_{2i}(L)) ≅ ℤ_p^{λ_i} for L/ℚ_p finite (L.6/even-integral-k-groups).

**Used by.**

- K-book IV.2.9 and Handbook 59: K_n(R; ℤ_ℓ) is an extension of the Tate module of K_{n−1}(R) by the completion of K_n(R)
- K-book proof of Theorem VI.7.4: 'the Tate module of D_{i−1}' is a summand of K_{2i−1}(V; ℤ_p)
- Handbook proof of Theorem 61: 'Since the Tate module of any abelian group is torsion free, and K2i(E; Zp) is finite, we see that the Tate module of K2i−1(E) vanishes'
- L.6/odd-integral-to-completed-comparison: the cokernel of K_{2i−1}(L) → K_{2i−1}(L; ℤ_p) surjects onto T_p(K_{2i−2}(L))

**Depends on.** libraries: `mathlib:AddSubgroup.torsionBy`, `mathlib:PadicInt`.

**Sources.**

- `Kbook.2013`, IV.2.9 (PDF p. 290; book p. 282): “(The (ℓ-primary) Tate module of an abelian group A is the inverse limit of the groups Hom(Z/ℓν, A).)” — The definition.
- `Weibel.Handbook.I5`, Completed K-theory 59 (p. 164; PDF p. 26): “(The Tate module of an abelian group A is the inverse limit of the groups Hom(Z/ℓν, A).)” — The same definition in the survey.

### Completed K-groups: the completion and Tate-module exact sequence

`L.6/completion-exact-sequence` · lemma

Let R be a ring, p a prime and n ∈ ℤ, and suppose that K_{n+1}(R; ℤ/p^ν) and K_n(R; ℤ/p^ν) are finite for every ν. Then the completion map factors as K_n(R) → lim_ν K_n(R)/p^ν ↪ K_n(R; ℤ_p), and there is a natural exact sequence 0 → lim_ν K_n(R)/p^ν → K_n(R; ℤ_p) → T_p(K_{n−1}(R)) → 0. The kernel of κ: K_n(R) → K_n(R; ℤ_p) is ⋂_ν p^ν K_n(R). If moreover K_n(R) and K_{n−1}(R) are finitely generated, κ induces K_n(R) ⊗ ℤ_p ≅ K_n(R; ℤ_p).

**Hypotheses.**

- R a ring, p a prime, n ∈ ℤ.
- Finiteness of the finite-coefficient groups in degrees n and n + 1 for all ν; for the fields of this layer it holds in every degree by L.6/finite-coefficient-lichtenbaum-quillen.

**Proof.**

1. Milnor sequence of L.1/completed-k-theory: lim¹_ν K_{n+1}(R; ℤ/p^ν) = 0 because the groups are finite (Mittag-Leffler), so K_n(R; ℤ_p) = lim_ν K_n(R; ℤ/p^ν) (StableHomotopyKTheory:H.6/l-adic-completion-milnor-sequence).
2. Apply lim_ν to the universal coefficient sequences 0 → K_n(R)/p^ν → K_n(R; ℤ/p^ν) → K_{n−1}(R)[p^ν] → 0 of L.1/k-theory-mod-m, which are compatible with reduction (multiplication by p on the right-hand terms). The tower K_n(R)/p^ν has surjective transition maps, so lim¹ of it vanishes and the limit sequence 0 → lim K_n(R)/p^ν → lim K_n(R; ℤ/p^ν) → lim K_{n−1}(R)[p^ν] → 0 is exact; the right-hand term is T_p(K_{n−1}(R)) (L.6/p-adic-tate-module).
3. The kernel of K_n(R) → lim_ν K_n(R)/p^ν is ⋂_ν p^ν K_n(R), and the second map is injective.
4. For finitely generated groups the Tate module of K_{n−1}(R) vanishes and lim_ν K_n(R)/p^ν = K_n(R) ⊗ ℤ_p.

**Acceptance.**

- For R = 𝔽_q and p ≠ char 𝔽_q, n = 2i − 1: K_{2i−1}(𝔽_q; ℤ_p) ≅ ℤ/(q^i − 1)_p.
- For R = ℂ, n = 2, ℓ = p: lim_ν K_2(ℂ)/p^ν = 0 and T_p(K_1(ℂ)) = ℤ_p, so K_2(ℂ; ℤ_p) ≅ ℤ_p (the finiteness holds: K_*(ℂ; ℤ/p^ν) is ℤ/p^ν in even degrees and 0 in odd degrees).

**Depends on.** this roadmap: `L.1/completed-k-theory`, `L.6/p-adic-tate-module`, `L.1/k-theory-mod-m`; other roadmaps: `StableHomotopyKTheory:H.6/l-adic-completion-milnor-sequence`.

**Sources.**

- `Kbook.2013`, IV.2.9 (PDF p. 290; book p. 282): “πn(E; Zℓ) is an extension of the Tate module of πn−1(E) by the ℓ-adic completion of πn(E).” — The exact sequence, under the finiteness hypothesis stated just before it in the source.
- `Weibel.Handbook.I5`, Completed K-theory 59 (p. 164; PDF p. 26): “If the groups Kn(R; Z/ℓν) are finite, then Kn(R; Zℓ) is an extension of the Tate module of Kn−1(R) by the ℓ-adic completion of Kn(R).” — The same statement for K-theory; the finitely generated case follows in the source.

### A criterion identifying the divisible subgroup with w·A

`L.6/divisible-subgroup-criterion` · lemma

Let A be an abelian group and w ≥ 1 an integer such that for every positive multiple m of w the reduction A/mA → A/wA is bijective (equivalently mA = wA). Then wA is divisible and wA = Div(A); consequently A = Div(A) ⊕ C for a subgroup C ≅ A/wA (non-canonical). If A/wA is cyclic of order w then C ≅ ℤ/w, the torsion subgroup of A/Div(A) is all of A/Div(A), and ⋂_{m ≥ 1} mA = Div(A).

**Hypotheses.**

- A any abelian group, w ≥ 1, and mA = wA for all m ∈ wℤ_{>0}.

**Proof.**

1. For n ≥ 1, (nw)A = wA gives n(wA) = wA: every element of wA is divisible by n inside wA, so wA is divisible.
2. Any divisible subgroup D satisfies D = wD ⊆ wA, so wA = Div(A) (L.6/maximal-divisible-subgroup).
3. Div(A) is a direct summand with complement ≅ A/Div(A) = A/wA (L.6/maximal-divisible-subgroup).
4. ⋂_m mA ⊆ ⋂_{w|m} mA = wA = Div(A) ⊆ ⋂_m mA.

**Acceptance.**

- A = ℚ ⊕ ℤ/6 with w = 6: 6A = ℚ = Div(A) and A/6A ≅ ℤ/6.
- A = ℤ fails the hypothesis (ℤ/12 → ℤ/6 is not bijective) and indeed Div(ℤ) = 0 ≠ 6ℤ.
- Applied to K_{2i}(L) with w = w_i(L) in L.6/even-integral-k-groups.

**Depends on.** this roadmap: `L.6/maximal-divisible-subgroup`.

**Sources.**

- `Kbook.2013`, Proof of Proposition VI.7.3 (PDF p. 517; book p. 509): “Setting m = m′wi(E), it follows that the subgroup Di = wi(E)K2i(E) of K2i(E) is a divisible group.” — The argument, stated for K_{2i}(E); the node isolates it as a lemma on abelian groups.

### Torsion-free ℤ_(p)-modules with finite reduction mod p

`L.6/torsion-free-lattice-lemma` · lemma

Let T be a torsion-free abelian group that is uniquely ℓ-divisible for every prime ℓ ≠ p (a torsion-free ℤ_(p)-module), and suppose T/pT is finite of 𝔽_p-dimension t. Then: (a) T/p^νT ≅ (ℤ/p^ν)^t for all ν and T^∧ := lim_ν T/p^νT ≅ ℤ_p^t; (b) the kernel of T → T^∧ is ⋂_ν p^νT = Div(T), a ℚ-vector space and a direct summand of T; (c) if x_1, …, x_t ∈ T reduce to a basis of T/pT, then P = ℤ_(p)x_1 + ⋯ + ℤ_(p)x_t is free of rank t over ℤ_(p), P ∩ Div(T) = 0, P ⊗ ℤ_p → T^∧ is an isomorphism, and T/(P ⊕ Div(T)) is a ℚ-vector space; (d) T^∧/image(T) is a ℚ-vector space. In general neither T = P ⊕ (complement) nor T = Div(T) ⊕ P holds.

**Hypotheses.**

- T torsion-free, uniquely ℓ-divisible for ℓ ≠ p, with dim_{𝔽_p} T/pT = t < ∞.

**Proof.**

1. (a) Multiplication by p^k induces T/pT ≅ p^kT/p^{k+1}T (T torsion-free), so #T/p^νT = p^{νt}; lifts of a basis of T/pT generate T/p^νT (p is nilpotent on it), so T/p^νT ≅ (ℤ/p^ν)^t and the limit is ℤ_p^t.
2. (b) If x ∈ ⋂ p^νT then x = p^ν y_ν with unique y_ν and y_ν = p y_{ν+1}; the subgroup generated by the y_ν is p-divisible and, T being a ℤ_(p)-module, divisible: so ⋂ p^νT ⊆ Div(T) ⊆ ⋂ p^νT (L.6/maximal-divisible-subgroup). A torsion-free divisible group is a ℚ-vector space.
3. (c) The images of x_i in T^∧ reduce to a basis of T^∧/p, hence form a ℤ_p-basis (Nakayama over the local ring ℤ_p); so the x_i are ℤ_(p)-independent in T/Div(T) and P ⊗ ℤ_p ≅ T^∧. With R = T/Div(T): R = P + pR, so R/P is p-divisible; if px ∈ P for x ∈ R then x ∈ T^∧ ∩ p^{−1}P = P; ℓ-divisibility and ℓ-torsion-freeness for ℓ ≠ p are inherited. So R/P is uniquely divisible.
4. (d) With R ⊂ T^∧ as in (c): T^∧ = R + p^νT^∧ for all ν and R ∩ pT^∧ = pR, which give p-divisibility and p-torsion-freeness of T^∧/R; the ℓ ≠ p statements are inherited.
5. Non-splitting: ℤ_(p) ⊂ ℤ_p with quotient ℚ_p/ℚ (T = ℤ_p viewed with t = 1 has Div = 0 and T/P uniquely divisible, but ℤ_p has no p-divisible elements, so the extension 0 → ℤ_(p) → ℤ_p → ℤ_p/ℤ_(p) → 0 does not split).

**Acceptance.**

- T = ℤ_(p)^t ⊕ ℚ: Div(T) = ℚ, P = ℤ_(p)^t and T^∧ = ℤ_p^t.
- T = ℤ_p (as an abstract group, t = 1): Div(T) = 0, T/ℤ_(p) ≅ ℚ_p/ℚ uniquely divisible, and T is not ℤ_(p) ⊕ (anything).

**Depends on.** this roadmap: `L.6/maximal-divisible-subgroup`; libraries: `mathlib:PadicInt`.

**Sources.**

- `Kbook.2013`, Warning VI.7.5 (PDF p. 518; book p. 510): “the extension 0 →Z(p) →Zp →Zp/Z(p) →0 doesn’t split, because there are no p-divisible elements in Zp, yet Zp/Z(p) ∼= Qp/Q is a uniquely divisible abelian group.” — The non-splitting that limits part (c).
- `Weibel.Handbook.I5`, Corollary 63 and its proof (p. 166; PDF p. 28): “Proof Combine 61 with Moore’s Theorem 57 and 58.” — The source's one-line proof of Corollary 63; this lemma is the abelian-group input it leaves implicit.

### The p-adic w-invariants of a p-adic field are finite, with the cyclotomic formula

`L.6/p-adic-w-invariant` · lemma

Let L be a finite extension of ℚ_p and i ∈ ℤ with i ≠ 0. Then W_i^{(p)}(L) = H^0(L, ℚ_p/ℤ_p(i)) is finite cyclic, of order w_i^{(p)}(L), given as follows. For p odd let r = [L(ζ_p) : L], a divisor of p − 1, and p^a = #μ_{p^∞}(L(ζ_p)), so 1 ≤ a < ∞: w_i^{(p)}(L) = p^{a+v_p(i)} if r | i and 1 otherwise. For p = 2 let 2^a = #μ_{2^∞}(L(√−1)), so 2 ≤ a < ∞: w_i^{(2)}(L) = 2^{a+v_2(i)} if √−1 ∈ L; 2 if √−1 ∉ L and i is odd; and, for i even and √−1 ∉ L, 2^{a+v_2(i)} or 2^{a+v_2(i)−1} according as L is exceptional or not. (The relations w_{−i} = w_i and w_1^{(p)}(L) = #μ_{p^∞}(L) are API items of ArithmeticKTheory N.4's w-invariant.)

**Hypotheses.**

- L is a finite extension of ℚ_p of degree d = [L : ℚ_p], with valuation ring V = 𝒪_L, residue field 𝔽_q (q = p^f) and ramification index e, so d = ef; p is any prime unless a hypothesis restricts it.
- Tate twists are MotivicEtaleKTheory M.1's Galois modules: ℤ/p^ν(i) = μ_{p^ν}^{⊗i}, ℤ_p(i) = lim_ν ℤ/p^ν(i) and ℚ_p/ℤ_p(i) = colim_ν ℤ/p^ν(i), for i ∈ ℤ, with the reduction maps ℤ/p^{ν+1}(i) → ℤ/p^ν(i) and the inclusions ℤ/p^ν(i) ⊂ ℤ/p^{ν+1}(i); H^j(L, M) is continuous cohomology of G_L = Gal(L^sep/L) (Mathlib continuousCohomology), and H^j(L, ℤ_p(i)) means the continuous cohomology of the compact module ℤ_p(i), equal to lim_ν H^j(L, ℤ/p^ν(i)) (ArithmeticGaloisDuality R02.1).
- i ≠ 0 (W_0^{(p)}(L) = ℚ_p/ℤ_p is infinite).
- 'Exceptional' is ArithmeticKTheory N.4's notion: Gal(L(ζ_{2^ν})/L) is not cyclic for all large ν.

**Proof.**

1. Finiteness of a: L(ζ_p) (resp. L(√−1)) is a finite extension of ℚ_p, and the roots of unity of a p-adic field form a finite group (LocalFieldsRamification Layer 1, requested); so a < ∞. That a ≥ 1 (resp. a ≥ 2) holds by the definition of L(ζ_p) (resp. L(√−1)).
2. The formula is ArithmeticKTheory:N.4/computing-w-from-the-cyclotomic-character for p odd and ArithmeticKTheory:N.4/two-primary-w-invariant for p = 2 (with ArithmeticKTheory:N.4/exceptional-fields-at-two), applied to F = L and ℓ = p; since a < ∞ the values are finite.
3. Cyclicity: a finite subgroup of μ(L^sep) (ArithmeticKTheory:N.4/the-w-invariant, API isCyclic).

**Acceptance.**

- ℚ_3(ζ_3): r = 1, a = 1, so w_i^{(3)} = 3^{1+v_3(i)} for every i ≠ 0.
- An unramified L/ℚ_p with p ≥ 5 has r = p − 1, so w_2^{(p)}(L) = 1 (L.6/completed-k3-of-unramified-fields).
- ℚ_p: see L.6/p-adic-w-invariant-of-q-p.

**Depends on.** other roadmaps: `ArithmeticKTheory:N.4/the-w-invariant`, `ArithmeticKTheory:N.4/computing-w-from-the-cyclotomic-character`, `ArithmeticKTheory:N.4/two-primary-w-invariant`, `ArithmeticKTheory:N.4/exceptional-fields-at-two`; libraries: `mathlib:cyclotomicCharacter`, `mathlib:IsCyclotomicExtension`, `mathlib:IsNonarchimedeanLocalField`.

**Sources.**

- `Kbook.2013`, Proposition VI.2.2 (PDF pp. 478–479; book pp. 470–471): “Let a ≤∞be maximal such that F(ζℓ) contains a primitive ℓath root of unity and set r = [F(ζℓ) : F]. If i = cℓb, where ℓ∤c, then the numbers w(ℓ) i = w(ℓ) i (F) are ℓa+b if r | i, and 1 otherwise.” — The formula at odd primes, applied to F = L and ℓ = p.
- `Weibel.Handbook.I5`, §5.6, before Theorem 61 (p. 165; PDF p. 27): “Write wi for the numbers wi = w(p) i (E), which were described in 23.” — The p-adic w-invariants that index the completed K-groups.

### w_i(L) is q^i − 1 times the p-adic w-invariant

`L.6/w-invariant-prime-to-p-factor` · lemma

Let L be a finite extension of ℚ_p with residue field 𝔽_q and i ≥ 1. Then w_i(L) = (q^i − 1)·w_i^{(p)}(L): the prime-to-p part of W_i(L) is W_i(𝔽_q) ≅ ℤ/(q^i − 1) and its p-part is W_i^{(p)}(L).

**Hypotheses.**

- L is a finite extension of ℚ_p of degree d = [L : ℚ_p], with valuation ring V = 𝒪_L, residue field 𝔽_q (q = p^f) and ramification index e, so d = ef; p is any prime unless a hypothesis restricts it.
- w_i^{(p)}(L) = #W_i^{(p)}(L) with W_i^{(p)}(L) = H^0(L, ℚ_p/ℤ_p(i)) (ArithmeticKTheory N.4's w-invariant), and w_i(L) = #W_i(L) = (q^i − 1)·w_i^{(p)}(L) (L.6/p-adic-w-invariant).
- i ≥ 1.

**Proof.**

1. For ℓ ≠ p, w_i^{(ℓ)}(L) = (q^i − 1)_ℓ (KTheoryFiniteLocalFields:L.2/w-invariant-local-field).
2. w_i(L) = ∏_ℓ w_i^{(ℓ)}(L) (ArithmeticKTheory:N.4/the-w-invariant, API wInvariant_eq_prod_primary); q^i − 1 is prime to p, and w_i^{(p)}(L) is finite (L.6/p-adic-w-invariant).

**Acceptance.**

- ℚ_3, i = 2: w_2(ℚ_3) = 8·3 = 24; ℚ_5, i = 2: w_2(ℚ_5) = 24·1 = 24; ℚ_2, i = 2: w_2(ℚ_2) = 3·8 = 24 = w_2(ℚ).

**Depends on.** this roadmap: `L.2/w-invariant-local-field`, `L.6/p-adic-w-invariant`; other roadmaps: `ArithmeticKTheory:N.4/the-w-invariant`.

**Sources.**

- `Kbook.2013`, Example VI.2.3.1 (PDF p. 479; book p. 471): “Let E be a local field, finite over Qp and with residue field Fq. Then wi(E) is wi(Fq) = qi −1 times a power of p.” — The statement.

### The p-adic w-invariants of ℚ_p

`L.6/p-adic-w-invariant-of-q-p` · lemma

For p odd and i ≠ 0, w_i^{(p)}(ℚ_p) = p^{1+v_p(i)} if (p − 1) | i and 1 otherwise. For p = 2 and i ≠ 0, w_i^{(2)}(ℚ_2) = 2 if i is odd and 2^{2+v_2(i)} if i is even.

**Hypotheses.**

- p a prime, i ≠ 0.

**Proof.**

1. p odd: ℚ_p(ζ_p)/ℚ_p is totally ramified of degree p − 1 (the p-th cyclotomic polynomial is Eisenstein at p after x ↦ x + 1), so r = p − 1; ℚ_p(ζ_p) contains no primitive p²-th root of unity, since ℚ_p(ζ_{p²}) has ramification index p(p − 1) > p − 1, so a = 1. Apply L.6/p-adic-w-invariant.
2. p = 2: ℚ_2(√−1) = ℚ_2(ζ_4) does not contain ζ_8 (ℚ_2(ζ_8) has degree 4), so a = 2; ℚ_2 is exceptional because the 2-adic cyclotomic character of G_{ℚ_2} is onto ℤ_2^× ≅ {±1} × ℤ_2, which is not procyclic (ArithmeticKTheory:N.4/exceptional-fields-at-two); apply L.6/p-adic-w-invariant.
3. Direct check for i = 2: W_2^{(p)}(ℚ_p) = {x ∈ ℚ_p/ℤ_p : (u² − 1)x = 0 for all u ∈ ℤ_p^×}; min_u v_p(u² − 1) is 1 for p = 3 (u = 2), 0 for p ≥ 5 (u a primitive root), and 3 for p = 2 (u = 3).

**Acceptance.**

- ℚ_3: w_1^{(3)} = 1, w_2^{(3)} = 3, w_3^{(3)} = 1, w_6^{(3)} = 9.
- ℚ_5: w_2^{(5)} = 1, w_4^{(5)} = 5, w_{20}^{(5)} = 25.
- ℚ_2: w_1^{(2)} = 2, w_2^{(2)} = 8, w_3^{(2)} = 2, w_4^{(2)} = 16.

**Depends on.** this roadmap: `L.6/p-adic-w-invariant`; other roadmaps: `ArithmeticKTheory:N.4/exceptional-fields-at-two`; libraries: `mathlib:IsCyclotomicExtension`.

**Sources.**

- `Kbook.2013`, Example VI.2.3.1 (PDF p. 479; book p. 471): “(The precise power of p is given in Exercise EVI.2.3 2.3 when E = Qp.)” — The source leaves the values for ℚ_p as an exercise; the node records them.
- `Kbook.2013`, Proposition VI.2.2 (PDF pp. 478–479; book pp. 470–471): “Let a ≤∞be maximal such that F(ζℓ) contains a primitive ℓath root of unity and set r = [F(ζℓ) : F].” — The invariants a and r computed here for F = ℚ_p.

### H⁰ of the Tate twists of a p-adic field

`L.6/h0-of-tate-twists` · lemma

Let L/ℚ_p be finite, i ≠ 0 and ν ≥ 1. Then H^0(L, ℤ/p^ν(i)) = W_i^{(p)}(L)[p^ν] is cyclic of order gcd(p^ν, w_i^{(p)}(L)); H^0(L, ℤ_p(i)) = 0 and H^0(L, ℚ_p(i)) = 0. For p^ν ≥ w_i^{(p)}(L) the map H^0(L, ℤ/p^ν(i)) → H^0(L, ℤ/p^{ν+1}(i)) induced by the inclusion of twists is the identity of ℤ/w_i^{(p)}(L), and the map H^0(L, ℤ/p^{ν+1}(i)) → H^0(L, ℤ/p^ν(i)) induced by reduction is multiplication by p on ℤ/w_i^{(p)}(L). Hence colim_ν H^0(L, ℤ/p^ν(i)) = W_i^{(p)}(L) and lim_ν H^0(L, ℤ/p^ν(i)) = 0.

**Hypotheses.**

- L is a finite extension of ℚ_p of degree d = [L : ℚ_p], with valuation ring V = 𝒪_L, residue field 𝔽_q (q = p^f) and ramification index e, so d = ef; p is any prime unless a hypothesis restricts it.
- Tate twists are MotivicEtaleKTheory M.1's Galois modules: ℤ/p^ν(i) = μ_{p^ν}^{⊗i}, ℤ_p(i) = lim_ν ℤ/p^ν(i) and ℚ_p/ℤ_p(i) = colim_ν ℤ/p^ν(i), for i ∈ ℤ, with the reduction maps ℤ/p^{ν+1}(i) → ℤ/p^ν(i) and the inclusions ℤ/p^ν(i) ⊂ ℤ/p^{ν+1}(i); H^j(L, M) is continuous cohomology of G_L = Gal(L^sep/L) (Mathlib continuousCohomology), and H^j(L, ℤ_p(i)) means the continuous cohomology of the compact module ℤ_p(i), equal to lim_ν H^j(L, ℤ/p^ν(i)) (ArithmeticGaloisDuality R02.1).
- i ≠ 0.

**Proof.**

1. H^0 is the group of invariants (Mathlib ContinuousCohomology.zeroIso; Tau Ceti ContCohomology.H0). Under ℤ/p^ν(i) ≅ (ℚ_p/ℤ_p(i))[p^ν], the invariants are W_i^{(p)}(L)[p^ν], cyclic of order gcd(p^ν, w_i^{(p)}(L)) by L.6/p-adic-w-invariant.
2. Under these identifications the inclusion ℤ/p^ν(i) ⊂ ℤ/p^{ν+1}(i) is the inclusion (ℚ_p/ℤ_p(i))[p^ν] ⊂ (ℚ_p/ℤ_p(i))[p^{ν+1}], and the reduction ℤ/p^{ν+1}(i) → ℤ/p^ν(i) is multiplication by p from (ℚ_p/ℤ_p(i))[p^{ν+1}] to (ℚ_p/ℤ_p(i))[p^ν].
3. Once p^ν ≥ w, both groups equal W_i^{(p)}(L) ≅ ℤ/w, so the inclusions are the identity and the reductions are multiplication by p; the limit along multiplication by p of a finite p-group is 0, the colimit along identities is W_i^{(p)}(L).
4. H^0(L, ℤ_p(i)) = lim_ν H^0(L, ℤ/p^ν(i)) = 0 (invariants commute with limits); ℤ_p(i) is torsion-free so H^0(L, ℚ_p(i)) = H^0(L, ℤ_p(i)) ⊗ ℚ = 0.

**Acceptance.**

- L = ℚ_3, i = 2: H^0(ℚ_3, ℤ/9(2)) ≅ ℤ/3 and H^0(ℚ_3, ℤ/3(1)) = 0 (μ_3 ⊄ ℚ_3).
- L = ℚ_2, i = 2: H^0(ℚ_2, ℤ/2^ν(2)) ≅ ℤ/gcd(2^ν, 8).

**Depends on.** this roadmap: `L.6/p-adic-w-invariant`; other roadmaps: `ArithmeticKTheory:N.4/the-w-invariant`, `MotivicEtaleKTheory:M.1`; libraries: `mathlib:ContinuousCohomology.zeroIso`, `tauceti:TauCeti.ContCohomology.H0`.

**Sources.**

- `Kbook.2013`, VI.7, the étale calculation before Proposition VI.7.3 (PDF p. 516; book p. 508): “Now consider the change of coefficients µ⊗i m ⊂µ⊗i m2. The induced endomorphisms of Z/wi(E) = H0 et(E, µ⊗i m ) and Z/wi(E) = H2 et(E, µ⊗i+1 m ) are the identity map and the zero map, respectively.” — The H⁰ half of the change-of-coefficients computation.

### Twist and duality formulas for H² of a p-adic field

`L.6/local-duality-for-tate-twists` · lemma

Let L/ℚ_p be finite, ν ≥ 1 and j ∈ ℤ. Local Tate duality gives a natural isomorphism H^2(L, ℤ/p^ν(j)) ≅ Hom(H^0(L, ℤ/p^ν(1 − j)), ℚ/ℤ), and H^k(L, M) = 0 for k ≥ 3 and every finite p-primary G_L-module M. Consequently, for i ≠ 0: (a) H^2(L, ℤ/p^ν(i + 1)) is cyclic of order gcd(p^ν, w_i^{(p)}(L)); (b) for p^ν ≥ w_i^{(p)}(L) the reduction map H^2(L, ℤ/p^{ν+1}(i + 1)) → H^2(L, ℤ/p^ν(i + 1)) is bijective, so H^2(L, ℤ_p(i + 1)) = lim_ν H^2(L, ℤ/p^ν(i + 1)) ≅ ℤ/w_i^{(p)}(L); (c) the map induced by ℤ/p^ν(i + 1) ⊂ ℤ/p^{2ν}(i + 1) is zero for p^ν ≥ w_i^{(p)}(L), so H^2(L, ℚ_p/ℤ_p(i + 1)) = 0. In twist one (i = 0) the formulas differ: H^2(L, ℤ/p^ν(1)) = Br(L)[p^ν] ≅ ℤ/p^ν and H^2(L, ℚ_p/ℤ_p(1)) ≅ ℚ_p/ℤ_p.

**Hypotheses.**

- L is a finite extension of ℚ_p of degree d = [L : ℚ_p], with valuation ring V = 𝒪_L, residue field 𝔽_q (q = p^f) and ramification index e, so d = ef; p is any prime unless a hypothesis restricts it.
- Tate twists are MotivicEtaleKTheory M.1's Galois modules: ℤ/p^ν(i) = μ_{p^ν}^{⊗i}, ℤ_p(i) = lim_ν ℤ/p^ν(i) and ℚ_p/ℤ_p(i) = colim_ν ℤ/p^ν(i), for i ∈ ℤ, with the reduction maps ℤ/p^{ν+1}(i) → ℤ/p^ν(i) and the inclusions ℤ/p^ν(i) ⊂ ℤ/p^{ν+1}(i); H^j(L, M) is continuous cohomology of G_L = Gal(L^sep/L) (Mathlib continuousCohomology), and H^j(L, ℤ_p(i)) means the continuous cohomology of the compact module ℤ_p(i), equal to lim_ν H^j(L, ℤ/p^ν(i)) (ArithmeticGaloisDuality R02.1).
- i ≠ 0 for (a)–(c); the twist-one case is stated separately.
- Local Tate duality, finiteness and cohomological dimension two are imported from Tau Ceti's ClassFieldTheory Layer 5 (requested), for the named evaluation pairing Hom(M, μ) × M → μ.

**Proof.**

1. The Cartier dual of M = ℤ/p^ν(j) is Hom(M, μ_{p^ν}) = ℤ/p^ν(1 − j) (M.1's twists); local duality (ClassFieldTheory Layer 5, tateDualityPairing_perfect_mixed) gives H^2(L, M) ≅ H^0(L, M')^∨ naturally in M, and H^k(L, M) = 0 for k ≥ 3.
2. (a): H^0(L, ℤ/p^ν(−i)) is cyclic of order gcd(p^ν, w_{−i}^{(p)}(L)) = gcd(p^ν, w_i^{(p)}(L)) (L.6/h0-of-tate-twists; w_{−i} = w_i is ArithmeticKTheory N.4's API item WInvariant.neg_eq).
3. (b), (c): a map f: M → N induces H^2(f), dual to H^0(f'), f': N' → M'. The reduction ℤ/p^{ν+1}(i + 1) → ℤ/p^ν(i + 1) has dual the inclusion ℤ/p^ν(−i) ⊂ ℤ/p^{ν+1}(−i), which is the identity on H^0 once p^ν ≥ w (L.6/h0-of-tate-twists); the inclusion ℤ/p^ν(i + 1) ⊂ ℤ/p^{2ν}(i + 1) has dual the reduction ℤ/p^{2ν}(−i) → ℤ/p^ν(−i), which is multiplication by p^ν = 0 on ℤ/w.
4. The limit: H^2(L, ℤ_p(i + 1)) = lim_ν H^2(L, ℤ/p^ν(i + 1)) because the groups H^1(L, ℤ/p^ν(i + 1)) are finite, so no lim¹ term appears (ArithmeticGaloisDuality R02.1; finiteness from ClassFieldTheory Layer 5). The colimit: H^2(L, ℚ_p/ℤ_p(i + 1)) = colim_ν H^2(L, ℤ/p^ν(i + 1)) (cohomology of a profinite group commutes with filtered colimits of discrete modules), and the transition maps are eventually zero.
5. Twist one: H^2(L, μ_{p^ν}) = Br(L)[p^ν] ≅ ℤ/p^ν by ClassFieldTheory Layer 5 (h2MuEquivZMod_mixed); here H^0(L, ℤ/p^ν(0)) = ℤ/p^ν is not bounded in ν, which is why i = 0 is excluded from (a)–(c).

**Acceptance.**

- L = ℚ_3, i = 1: H^2(ℚ_3, ℤ_3(2)) ≅ ℤ/w_1^{(3)}(ℚ_3) = 0; i = 2: H^2(ℚ_3, ℤ_3(3)) ≅ ℤ/3.
- L = ℚ_2, i = 2: H^2(ℚ_2, ℤ_2(3)) ≅ ℤ/8.
- Twist one is different: H^2(ℚ_p, ℤ_p(1)) = lim_ν Br(ℚ_p)[p^ν] ≅ ℤ_p.

**Depends on.** this roadmap: `L.6/h0-of-tate-twists`, `L.6/p-adic-w-invariant`; other roadmaps: `ArithmeticKTheory:N.4/the-w-invariant`, `MotivicEtaleKTheory:M.1`, `ArithmeticGaloisDuality:R02.1`; libraries: `mathlib:continuousCohomology`.

**Sources.**

- `Kbook.2013`, VI.7, the étale calculation before Proposition VI.7.3 (PDF p. 516; book p. 508): “passing to the limit over m yields: H0 et(E, µ⊗i) ∼= Z/wi(E) and H2 et(E, µ⊗i+1) = 0, i > 0.” — Part (c) and the colimit of H⁰, in the source's all-primes form.
- `Weibel.Handbook.I5`, §5.6, before Theorem 61 (p. 165; PDF p. 27): “By duality, the group H2(E,µ⊗i+1 pν ) is also isomorphic to Z/wi.” — Part (a) for p^ν ≥ w_i, with w_i = w_i^{(p)}(E) in the survey's notation.

### H¹ of the Tate twists of a p-adic field: rank and torsion

`L.6/h1-of-tate-twists` · theorem

Let L/ℚ_p be finite of degree d and let i ∈ ℤ with i ∉ {0, 1}. (a) H^1(L, ℤ_p(i)) is a finitely generated ℤ_p-module of rank d. (b) The connecting map δ: H^0(L, ℚ_p/ℤ_p(i)) → H^1(L, ℤ_p(i)) of 0 → ℤ_p(i) → ℚ_p(i) → ℚ_p/ℤ_p(i) → 0 is injective with image the torsion submodule; hence H^1(L, ℤ_p(i))_tors ≅ W_i^{(p)}(L) ≅ ℤ/w_i^{(p)}(L) canonically and H^1(L, ℤ_p(i)) ≅ ℤ_p^d ⊕ ℤ/w_i^{(p)}(L), the splitting being non-canonical. For i = 1 the rank is d + 1 instead, which is why the rank statement is made for twists i ≥ 2.

**Hypotheses.**

- L is a finite extension of ℚ_p of degree d = [L : ℚ_p], with valuation ring V = 𝒪_L, residue field 𝔽_q (q = p^f) and ramification index e, so d = ef; p is any prime unless a hypothesis restricts it.
- Tate twists are MotivicEtaleKTheory M.1's Galois modules: ℤ/p^ν(i) = μ_{p^ν}^{⊗i}, ℤ_p(i) = lim_ν ℤ/p^ν(i) and ℚ_p/ℤ_p(i) = colim_ν ℤ/p^ν(i), for i ∈ ℤ, with the reduction maps ℤ/p^{ν+1}(i) → ℤ/p^ν(i) and the inclusions ℤ/p^ν(i) ⊂ ℤ/p^{ν+1}(i); H^j(L, M) is continuous cohomology of G_L = Gal(L^sep/L) (Mathlib continuousCohomology), and H^j(L, ℤ_p(i)) means the continuous cohomology of the compact module ℤ_p(i), equal to lim_ν H^j(L, ℤ/p^ν(i)) (ArithmeticGaloisDuality R02.1).
- i ≠ 0, 1.
- The Euler characteristic formula #H^0·#H^2/#H^1 = p^{−νd} for M = ℤ/p^ν(i) and the finiteness of H^j(L, M) for finite M are imported from Tau Ceti's ClassFieldTheory Layer 5 (requested).

**Proof.**

1. Finite level: for M = ℤ/p^ν(i), #H^1(L, M) = p^{νd}·#H^0(L, M)·#H^2(L, M) (Euler characteristic, ClassFieldTheory Layer 5), with #H^0 = gcd(p^ν, w_i^{(p)}) (L.6/h0-of-tate-twists) and #H^2 = gcd(p^ν, w_{i−1}^{(p)}) (L.6/local-duality-for-tate-twists with i − 1 ≠ 0).
2. H^1(L, ℤ_p(i)) = lim_ν H^1(L, ℤ/p^ν(i)) because the H^0(L, ℤ/p^ν(i)) are finite (ArithmeticGaloisDuality R02.1). It is a derived p-complete ℤ_p-module whose reduction mod p injects into the finite group H^1(L, ℤ/p(i)), hence finitely generated (topological Nakayama).
3. From 0 → ℤ_p(i) →(p^ν) ℤ_p(i) → ℤ/p^ν(i) → 0: 0 → H^1(L, ℤ_p(i))/p^ν → H^1(L, ℤ/p^ν(i)) → H^2(L, ℤ_p(i))[p^ν] → 0 and H^1(L, ℤ_p(i))[p^ν] ≅ H^0(L, ℤ/p^ν(i)) (as H^0(L, ℤ_p(i)) = 0). Writing H^1(L, ℤ_p(i)) ≅ ℤ_p^r ⊕ F with F finite, for large ν the orders give p^{νr}·#F·w_{i−1}^{(p)} = p^{νd}·w_i^{(p)}·w_{i−1}^{(p)} and #F = w_i^{(p)}, so r = d.
4. (b): H^0(L, ℚ_p(i)) = 0 (L.6/h0-of-tate-twists), so δ is injective; its image is killed by w_i^{(p)} and is the kernel of H^1(L, ℤ_p(i)) → H^1(L, ℚ_p(i)) = H^1(L, ℤ_p(i)) ⊗ ℚ (ArithmeticGaloisDuality R02.1, the V = T[1/p] regime), which is the torsion.
5. i = 1, for contrast: Kummer theory H^1(L, μ_{p^ν}) ≅ L^×/p^ν (Tau Ceti's kummerClassMap, surjectivity from ClassFieldTheory Layer 5's kummerEquiv_mixed) and L^× ≅ ℤ × μ(L) × ℤ_p^d give rank d + 1.

**Acceptance.**

- L = ℚ_p (d = 1), i = 2, p odd: H^1(ℚ_p, ℤ_p(2)) ≅ ℤ_p ⊕ ℤ/w_2^{(p)}(ℚ_p), which is ℤ_3 ⊕ ℤ/3 for p = 3 and ℤ_p for p ≥ 5.
- L = ℚ_2, i = 2: H^1(ℚ_2, ℤ_2(2)) ≅ ℤ_2 ⊕ ℤ/8.
- Finite level (corrected Handbook §5.6): #H^1(ℚ_3, ℤ/3(7)) = 3·#H^0·#H^2 = 3·1·3 = 9, not 27 (sourceIssues).
- i = 1: H^1(ℚ_p, ℤ_p(1)) has rank 2 = d + 1.

**Depends on.** this roadmap: `L.6/h0-of-tate-twists`, `L.6/local-duality-for-tate-twists`, `L.6/p-adic-w-invariant`; other roadmaps: `ArithmeticGaloisDuality:R02.1`, `MotivicEtaleKTheory:M.1`; libraries: `tauceti:TauCeti.kummerClassMap`, `mathlib:Module.finrank`.

**Sources.**

- `Weibel.Handbook.I5`, §5.6, before Theorem 61 (p. 165; PDF p. 27): “For all i, and ℓν > wi, the étale cohomology group H1(E,µ⊗i pν ) is isomorphic to (Z/pν)d ⊕Z/wi ⊕Z/wi−1, d = [E : Qp].” — The source's finite-level count; its range is corrected in sourceIssues and in L.6/finite-coefficient-k-groups-structure. The rank d is the rank here.
- `Kbook.2013`, Remark VI.7.4.3 (PDF p. 518; book p. 510): “Surprisingly, the cohomology groups H1et(E; µ⊗i m ) (for m = pν) were not known before the K-group K2i−1(E; Z/m) was calculated, circa 2000.” — The structure of H¹ at finite level is derived from K-theory in the source; the ℤ_p-rank and torsion here need only the Euler characteristic.

### H¹ of a p-adic field with coefficients ℚ_p/ℤ_p(i)

`L.6/h1-with-divisible-coefficients` · lemma

Let L/ℚ_p be finite of degree d and i ∉ {0, 1}. There is a natural exact sequence 0 → H^1(L, ℤ_p(i)) ⊗ ℚ_p/ℤ_p → H^1(L, ℚ_p/ℤ_p(i)) → H^2(L, ℤ_p(i)) → 0, so H^1(L, ℚ_p/ℤ_p(i)) ≅ (ℚ_p/ℤ_p)^d ⊕ ℤ/w_{i−1}^{(p)}(L), the divisible part being canonical and its complement not.

**Hypotheses.**

- L is a finite extension of ℚ_p of degree d = [L : ℚ_p], with valuation ring V = 𝒪_L, residue field 𝔽_q (q = p^f) and ramification index e, so d = ef; p is any prime unless a hypothesis restricts it.
- Tate twists are MotivicEtaleKTheory M.1's Galois modules: ℤ/p^ν(i) = μ_{p^ν}^{⊗i}, ℤ_p(i) = lim_ν ℤ/p^ν(i) and ℚ_p/ℤ_p(i) = colim_ν ℤ/p^ν(i), for i ∈ ℤ, with the reduction maps ℤ/p^{ν+1}(i) → ℤ/p^ν(i) and the inclusions ℤ/p^ν(i) ⊂ ℤ/p^{ν+1}(i); H^j(L, M) is continuous cohomology of G_L = Gal(L^sep/L) (Mathlib continuousCohomology), and H^j(L, ℤ_p(i)) means the continuous cohomology of the compact module ℤ_p(i), equal to lim_ν H^j(L, ℤ/p^ν(i)) (ArithmeticGaloisDuality R02.1).
- i ≠ 0, 1.

**Proof.**

1. The long exact sequence of 0 → ℤ_p(i) → ℚ_p(i) → ℚ_p/ℤ_p(i) → 0 (ArithmeticGaloisDuality R02.1, which treats T, V = T[1/p] and V/T separately) with H^1(L, ℚ_p(i)) = H^1(L, ℤ_p(i)) ⊗ ℚ and H^2(L, ℚ_p(i)) = H^2(L, ℤ_p(i)) ⊗ ℚ = 0, the group H^2(L, ℤ_p(i)) ≅ ℤ/w_{i−1}^{(p)}(L) being finite because i − 1 ≠ 0 (L.6/local-duality-for-tate-twists).
2. H^1(L, ℤ_p(i)) ⊗ ℚ/H^1(L, ℤ_p(i)) = H^1(L, ℤ_p(i)) ⊗ ℚ_p/ℤ_p ≅ (ℚ_p/ℤ_p)^d by L.6/h1-of-tate-twists (the torsion dies).
3. (ℚ_p/ℤ_p)^d is divisible, hence injective, so the sequence splits.

**Acceptance.**

- L = ℚ_3, i = 2: H^1(ℚ_3, ℚ_3/ℤ_3(2)) ≅ ℚ_3/ℤ_3 ⊕ ℤ/w_1^{(3)}(ℚ_3) = ℚ_3/ℤ_3.
- L = ℚ_3, i = 3: H^1(ℚ_3, ℚ_3/ℤ_3(3)) ≅ ℚ_3/ℤ_3 ⊕ ℤ/3.

**Depends on.** this roadmap: `L.6/h1-of-tate-twists`, `L.6/local-duality-for-tate-twists`; other roadmaps: `ArithmeticGaloisDuality:R02.1`.

**Sources.**

- `Kbook.2013`, VI.7, the étale calculation before Proposition VI.7.3 (PDF p. 516; book p. 508): “passing to the limit over m yields: H0 et(E, µ⊗i) ∼= Z/wi(E) and H2 et(E, µ⊗i+1) = 0, i > 0.” — The companion computation in degrees 0 and 2 with divisible coefficients; degree 1 is added here.

### Finite and completed coefficients do not see the residue field above degree one

`L.6/ring-of-integers-versus-field` · lemma

Let E be a local field (of either characteristic) with valuation ring V and residue field 𝔽_q of characteristic p, and ν ≥ 1. The localisation sequence K(𝔽_q) → K(V) → K(E) induces isomorphisms K_n(V; ℤ/p^ν) ≅ K_n(E; ℤ/p^ν) and K_n(V; ℤ_p) ≅ K_n(E; ℤ_p) for every n ≥ 2, and short exact sequences 0 → K_1(V; ℤ/p^ν) → K_1(E; ℤ/p^ν) → ℤ/p^ν → 0 and 0 → K_1(V; ℤ_p) → K_1(E; ℤ_p) → ℤ_p → 0, the right-hand maps being the valuation. In degree one the groups differ.

**Hypotheses.**

- E a local field: a finite extension of ℚ_p or 𝔽_q((t)); V its valuation ring.

**Proof.**

1. The localisation cofibre sequence K(𝔽_q) → K(V) → K(E) (KTheoryFiniteLocalFields:L.2/dvr-localisation) stays a cofibre sequence after smashing with the Moore spectrum and after the homotopy limit (L.1/completed-k-theory).
2. K_n(𝔽_q; ℤ/p^ν) ≅ ℤ/gcd(p^ν, q^{⌈n/2⌉} − 1) = 0 for n ≥ 1 and ℤ/p^ν for n = 0 (KTheoryFiniteLocalFields:L.1/finite-field-mod-m-groups), hence K_n(𝔽_q; ℤ_p) = 0 for n ≥ 1 and ℤ_p for n = 0.
3. The map i_*: K_0(𝔽_q) → K_0(V) is zero ([𝔽_q] = [V] − [V] from 0 → V →(π) V → 𝔽_q → 0), so K_1(E; −) → K_0(𝔽_q; −) is onto; it is the valuation in degree one (L.2/dvr-localisation, boundary of a uniformiser = 1).

**Acceptance.**

- V = ℤ_p, p odd: K_1(ℤ_p; ℤ_p) ≅ 1 + pℤ_p ≅ ℤ_p while K_1(ℚ_p; ℤ_p) ≅ ℤ_p²: the statement 'K_n(V; ℤ_p) ≅ K_n(E; ℤ_p) for all n > 0' of the K-book's proof of Theorem VI.7.4 fails at n = 1 (sourceIssues).
- V = 𝔽_q[[t]]: K_n(V; ℤ_p) ≅ K_n(𝔽_q((t)); ℤ_p) for n ≥ 2 (both are zero, L.6/equal-characteristic-completed-k-groups).

**Depends on.** this roadmap: `L.2/dvr-localisation`, `L.1/finite-field-mod-m-groups`, `L.1/completed-k-theory`, `L.1/k-theory-mod-m`.

**Sources.**

- `Kbook.2013`, Proof of Theorem VI.7.4 (PDF p. 518; book p. 510): “Kn(V ; Zp) ∼= Kn(E; Zp) for all n > 0. Hence it suffices to consider the p-adic group K2i−1(V ; Zp).” — The comparison, which the node states in its correct range n ≥ 2.
- `Weibel.Handbook.I5`, §5.6, before Theorem 61 (p. 165; PDF p. 27): “We now consider the p-adic completion of K(E). By 58, it suffices to consider the p-adic completion of K(V).” — The same reduction in the survey.

### Hesselholt–Madsen: K-theory of a local field agrees with étale K-theory

`L.6/hm-etale-comparison` · theorem

Let A be a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p > 2, and v ≥ 1. The canonical map γ_K: K_*(K; ℤ/p^v) → K^ét_*(K; ℤ/p^v) to Dwyer–Friedlander étale K-theory, K^ét(K) = hocolim_{L/K} ℍ^·(G_{L/K}, K(L)) over the finite Galois extensions L/K inside a fixed algebraic closure (MotivicEtaleKTheory M.7), is an isomorphism in degrees ≥ 1.

**Hypotheses.**

- A complete DVR, K of characteristic 0, k perfect of characteristic p > 2 (k need not be finite).
- K^ét is M.7's étale K-theory; its descent spectral sequence E²_{s,t} = H^{−s}(K, colim_L π_t F(L)) ⇒ π_{s+t}F^ét(K) for a functor F from finite subextensions to spectra, and Suslin's K_t(K̄; ℤ/p) ≅ μ_p^{⊗t/2} (t even, 0 for t odd), are requested from M.7.

**Proof.**

1. Reduce to v = 1 by induction on v with the cofibre sequences of coefficients ℤ/p → ℤ/p^v → ℤ/p^{v−1} and the five lemma (StableHomotopyKTheory:H.6/mod-l-homotopy-and-bockstein-sequence).
2. Form the commutative square with top row γ_K: K(K) → K^ét(K), bottom row γ_K: TC(A|K; p) → TC^ét(A|K; p), where TC^ét(A|K; p) is M.7's descent construction applied to L ↦ TC(A_L|L; p) (A_L the integral closure of A in L), and vertical maps the cyclotomic trace.
3. The left trace is an isomorphism on homotopy with ℤ/p coefficients in degrees ≥ 1 (KTheoryFiniteLocalFields:L.5/trace-isomorphism-for-local-field).
4. The descent spectral sequences of both right-hand terms have E²_{s,t} = H^{−s}(K, μ_p^{⊗t/2}): for K-theory by Suslin's theorem (M.7), for TC by KTheoryFiniteLocalFields:L.5/tc-of-log-dvr-mod-p applied to every finite L/K and passed to the colimit; the trace induces an isomorphism of E² terms, so the right trace is an isomorphism with ℤ/p coefficients.
5. It remains that γ_K on TC is an isomorphism in degrees ≥ 0. By tame descent (KTheoryFiniteLocalFields:L.5/log-thh-tame-descent, applied to K(μ_p)/K and to the maximal unramified extension) one may assume μ_p ⊂ K and k algebraically closed; then multiplication by the Bott element identifies TC_ε(A|K; p, ℤ/p) ⊗ μ_p^{⊗s} with TC_{2s+ε}(A|K; p, ℤ/p) on both sides (KTheoryFiniteLocalFields:L.5/log-de-rham-witt-tr-mod-p), reducing to degrees 0 and 1.
6. Degree 0: with k algebraically closed H²(K, μ_p) = 0, the edge map TC^ét_0 → H^0(K, ℤ/p) is an isomorphism and its composite with γ_K is the isomorphism of L.5/tc-of-log-dvr-mod-p. Degree 1: with ℚ_p/ℤ_p coefficients, colim_L TC_1(A_L|L; p, ℚ_p/ℤ_p) ≅ colim_L K_1(L; ℚ_p/ℤ_p) = μ_{p^∞}, and the composite with the edge map to H^0(K, μ_{p^∞}) is an isomorphism.

**Acceptance.**

- For K = ℚ_p (p odd), degree 1: K_1(ℚ_p; ℤ/p) = ℚ_p^×/p ≅ (ℤ/p)² and K^ét_1(ℚ_p; ℤ/p) = H^1(ℚ_p, μ_p) ≅ (ℤ/p)² (Kummer), consistent with γ an isomorphism.
- Degree 0 is excluded: K_0(K; ℤ/p) = ℤ/p while K^ét_0(ℚ_p; ℤ/p) contains H^2(ℚ_p, μ_p) ≅ ℤ/p as well.

**Depends on.** this roadmap: `L.5/trace-isomorphism-for-local-field`, `L.5/tc-of-log-dvr-mod-p`, `L.5/log-thh-tame-descent`, `L.5/log-de-rham-witt-tr-mod-p`, `L.1/k-theory-mod-m`; other roadmaps: `StableHomotopyKTheory:H.6/mod-l-homotopy-and-bockstein-sequence`, `MotivicEtaleKTheory:M.7`.

**Sources.**

- `HesselholtMadsen.2003`, Theorem 6.1.10 (Annals p. 103): “The canonical map is an isomorphism in degrees ≥1: γK: K∗(K, Z/pv) →K´et ∗(K, Z/pv).” — The statement.
- `HesselholtMadsen.2003`, Proof of Theorem 6.1.10 (Annals pp. 103–104): “Proof. It suffices to consider the case v = 1.” — The first step of the proof followed here.
- `HesselholtMadsen.2003`, Introduction (Annals p. 6): “It is also easy to see that the canonical map K∗(K, Z/pv) →K´et ∗(K, Z/pv) is an isomorphism in degrees ≥1.” — The same comparison announced in the introduction.

### Hesselholt–Madsen Theorem A: the Lichtenbaum–Quillen conjecture for local fields

`L.6/hm-theorem-a` · theorem · planet “Lichtenbaum–Quillen for local fields”

Let A be a complete discrete valuation ring with fraction field K of characteristic 0 and perfect residue field k of characteristic p > 2, and v ≥ 1. For s ≥ 1 there are natural isomorphisms K_{2s−1}(K; ℤ/p^v) ≅ H^1(K, μ_{p^v}^{⊗s}) and natural short exact sequences 0 → H^2(K, μ_{p^v}^{⊗(s+1)}) → K_{2s}(K; ℤ/p^v) → H^0(K, μ_{p^v}^{⊗s}) → 0, where H^* is the Galois cohomology of K; for v = 1 the sequence is naturally split, and Hesselholt–Madsen state the splitting K_{2s}(K; ℤ/p^v) ≅ H^0 ⊕ H^2 for every v (its naturality for v > 1 is recorded as a gap). The statement holds whether or not μ_{p^v} ⊂ K.

**Hypotheses.**

- A, K, k as in L.6/hm-etale-comparison; p > 2.
- cd_p(K) ≤ 2: K is complete discretely valued with perfect residue field of characteristic p (for K finite over ℚ_p this is ClassFieldTheory Layer 5's vanishing, requested; for general perfect k it is recorded as a gap).

**Proof.**

1. By L.6/hm-etale-comparison, K_*(K; ℤ/p^v) ≅ K^ét_*(K; ℤ/p^v) in degrees ≥ 1.
2. The descent spectral sequence for K^ét(K; ℤ/p^v) has E²_{s,t} = H^{−s}(K, μ_{p^v}^{⊗t/2}) for t even and 0 for t odd (Suslin; MotivicEtaleKTheory M.7), and E² vanishes for −s > 2 because cd_p(K) ≤ 2.
3. In total degree 2s − 1 only E²_{−1,2s} = H^1(K, μ^{⊗s}) is nonzero; in total degree 2s only E²_{0,2s} = H^0(K, μ^{⊗s}) and E²_{−2,2s+2} = H^2(K, μ^{⊗(s+1)}); all differentials change t by an odd amount or leave the three columns, so they vanish and the spectral sequence degenerates at E².
4. Splitting for v = 1: on the TC side the degree-zero summand is split off naturally by TC_0(A|K; p, ℤ/p) → TR_0(A|K; p, ℤ/p)^F (KTheoryFiniteLocalFields:L.5/tc-of-log-dvr-mod-p, HM Theorem 6.1.6), and the trace carries it to K-theory in degrees 2s ≥ 2 through L.6/hm-etale-comparison. For v > 1 the text read gives no separate argument for a natural splitting (gap); nothing in this layer uses it, since the limit and colimit arguments need only the exact sequence.

**Acceptance.**

- K = ℚ_3, s = 2, v = 1: K_3(ℚ_3; ℤ/3) ≅ H^1(ℚ_3, μ_3^{⊗2}) of order 3·#H^0·#H^2 = 3·3·1 = 9.
- K = ℚ_p, p ≥ 5, s = 1: K_2(ℚ_p; ℤ/p) ≅ H^0(ℚ_p, μ_p) ⊕ H^2(ℚ_p, μ_p^{⊗2}) = 0, consistent with K_2(ℚ_p) = μ_{p−1} ⊕ (uniquely divisible) and K_1(ℚ_p)[p] = 0.

**Depends on.** this roadmap: `L.6/hm-etale-comparison`, `L.5/tc-of-log-dvr-mod-p`, `L.6/local-duality-for-tate-twists`; other roadmaps: `MotivicEtaleKTheory:M.7`, `MotivicEtaleKTheory:M.1`.

**Sources.**

- `HesselholtMadsen.2003`, Theorem A (Annals p. 2): “Theorem A. There are natural isomorphisms for s ≥1, K2s(K, Z/pv) = H0(K, µ⊗s pv ) ⊕H2(K, µ⊗(s+1) pv ), K2s−1(K, Z/pv) = H1(K, µ⊗s pv ).” — The statement.
- `HesselholtMadsen.2003`, Introduction (Annals pp. 1–2): “The fields K we consider are complete discrete valuation fields of characteristic zero with perfect residue field k of characteristic p > 2.” — The hypotheses.
- `Kbook.2013`, Theorem VI.7.4, attribution (PDF p. 517; book p. 509): “This result was first proved in RW [161, 3.7] for p = 2, and in HM [88, thm. A] for p > 2.” — The K-book's attribution of the p-adic calculation to this theorem.

### Finite-coefficient K-groups of a p-adic field are Galois cohomology

`L.6/finite-coefficient-lichtenbaum-quillen` · theorem

Let L/ℚ_p be finite (any prime p, including p = 2), ν ≥ 1 and i ≥ 1. The étale Chern class c_{i,1}: K_{2i−1}(L; ℤ/p^ν) → H^1(L, μ_{p^ν}^{⊗i}) is an isomorphism, and there is a natural exact sequence 0 → H^2(L, μ_{p^ν}^{⊗(i+1)}) → K_{2i}(L; ℤ/p^ν) → H^0(L, μ_{p^ν}^{⊗i}) → 0 whose right-hand map is the composite K_{2i}(L; ℤ/p^ν) → K_{2i}(L^sep; ℤ/p^ν) ≅ μ_{p^ν}^{⊗i} (the edge map, vanishing on K_{2i}(L)/p^ν). The identifications are natural in L and compatible with the coefficient maps for ν ↦ ν ± 1. In particular every K_n(L; ℤ/p^ν) is finite, and K_0(L; ℤ/p^ν) = ℤ/p^ν.

**Hypotheses.**

- L is a finite extension of ℚ_p of degree d = [L : ℚ_p], with valuation ring V = 𝒪_L, residue field 𝔽_q (q = p^f) and ramification index e, so d = ef; p is any prime unless a hypothesis restricts it.
- Tate twists are MotivicEtaleKTheory M.1's Galois modules: ℤ/p^ν(i) = μ_{p^ν}^{⊗i}, ℤ_p(i) = lim_ν ℤ/p^ν(i) and ℚ_p/ℤ_p(i) = colim_ν ℤ/p^ν(i), for i ∈ ℤ, with the reduction maps ℤ/p^{ν+1}(i) → ℤ/p^ν(i) and the inclusions ℤ/p^ν(i) ⊂ ℤ/p^{ν+1}(i); H^j(L, M) is continuous cohomology of G_L = Gal(L^sep/L) (Mathlib continuousCohomology), and H^j(L, ℤ_p(i)) means the continuous cohomology of the compact module ℤ_p(i), equal to lim_ν H^j(L, ℤ/p^ν(i)) (ArithmeticGaloisDuality R02.1).
- c_{i,1} is MotivicEtaleKTheory M.8's étale Chern class; the comparison range comes from M.7.

**Proof.**

1. For every field F of characteristic ≠ p with cd_p(F) ≤ 2, M.7's Quillen–Lichtenbaum statement (deduced from the motivic spectral sequence of M.6 and the norm residue theorem of M.5) gives the displayed description of K_n(F; ℤ/p^ν) for n ≥ 1 (requested from MotivicEtaleKTheory M.7): in the spectral sequence E_2^{a,b} = H^{a−b}(F, ℤ/p^ν(−b)) ⇒ K_{−a−b}(F; ℤ/p^ν) the étale groups of cohomological degree 0, 1, 2 are the only nonzero terms, and each total degree contains at most two.
2. cd_p(L) = 2 and the finiteness of H^j(L, μ^{⊗i}) are ClassFieldTheory Layer 5 (requested) and L.6/local-duality-for-tate-twists; L has no real place, so p = 2 needs no modification.
3. For p odd the same result is L.6/hm-theorem-a with K = L (finite residue field), which also identifies the maps through the cyclotomic trace; for p = 2 the source is Rognes–Weibel (K-book: [161, 3.7]; Handbook: [51, (1.12)]).
4. The Chern class c_{i,1} is the map of the spectral sequence onto its unique nonzero graded piece in degree 2i − 1 (M.8 compatibility of Chern classes with the motivic filtration); the edge map in degree 2i is the map to K_{2i}(L^sep; ℤ/p^ν) (K-book Example VI.4.5(ii)).
5. Degree 0: K_0(L; ℤ/p^ν) = K_0(L)/p^ν = ℤ/p^ν by the universal coefficient sequence (L.1/k-theory-mod-m).

**Acceptance.**

- i = 1: K_1(L; ℤ/p^ν) = L^×/L^{×p^ν} ≅ H^1(L, μ_{p^ν}) (Kummer).
- L = ℚ_2, ν = 1, i = 2: K_3(ℚ_2; ℤ/2) ≅ H^1(ℚ_2, ℤ/2) ≅ ℚ_2^×/ℚ_2^{×2} ≅ (ℤ/2)³.
- L = ℚ_3, ν = 1, i = 7: K_{13}(ℚ_3; ℤ/3) ≅ H^1(ℚ_3, μ_3^{⊗7}) has order 9 (L.6/h1-of-tate-twists).

**Depends on.** this roadmap: `L.6/hm-theorem-a`, `L.6/local-duality-for-tate-twists`, `L.1/k-theory-mod-m`; other roadmaps: `MotivicEtaleKTheory:M.7`, `MotivicEtaleKTheory:M.8`, `MotivicEtaleKTheory:M.1`.

**Sources.**

- `Weibel.Handbook.I5`, Theorem 61 (p. 165; PDF p. 27): “Moreover, the first étale Chern classes K2i−1(E; Z/pν) = H1(E,µ⊗i pν ) are natural isomorphisms for all i and ν.” — The odd-degree statement.
- `Weibel.Handbook.I5`, Proof of Theorem 61 (p. 165; PDF p. 27): “(It also follows from the spectral sequence (5.1) for E, using the Voevodsky-Rost theorem.) In this case, Theorem 34 and a count shows that the étale Chern classes K2i−1(E; Z/pν) →H1 ét(E;µ⊗i pν ) are isomorphisms. If p = 2 this is proven in [51, (1.12)]” — The motivic route (M.5–M.7) used here, and the source for p = 2.
- `Kbook.2013`, Exercise VI.7.3 (PDF p. 520; book p. 512): “Show that the first étale Chern classes K2i−1(E; Z/pν) ∼= H1(E, µ⊗i pν ) are natural isomorphisms for all i and ν.” — The same statement in the K-book.

### Odd completed K-groups of a p-adic field are H¹

`L.6/odd-completed-k-groups-are-h1` · comparison

Let L/ℚ_p be finite and i ≥ 1. The étale Chern classes of L.6/finite-coefficient-lichtenbaum-quillen pass to the limit and give a natural isomorphism K_{2i−1}(L; ℤ_p) ≅ lim_ν K_{2i−1}(L; ℤ/p^ν) ≅ lim_ν H^1(L, ℤ/p^ν(i)) = H^1(L, ℤ_p(i)), compatible with ρ_ν and with the reduction H^1(L, ℤ_p(i)) → H^1(L, ℤ/p^ν(i)). The same holds for V: K_{2i−1}(V; ℤ_p) ≅ K_{2i−1}(L; ℤ_p) for i ≥ 2.

**Hypotheses.**

- L is a finite extension of ℚ_p of degree d = [L : ℚ_p], with valuation ring V = 𝒪_L, residue field 𝔽_q (q = p^f) and ramification index e, so d = ef; p is any prime unless a hypothesis restricts it.
- Tate twists are MotivicEtaleKTheory M.1's Galois modules: ℤ/p^ν(i) = μ_{p^ν}^{⊗i}, ℤ_p(i) = lim_ν ℤ/p^ν(i) and ℚ_p/ℤ_p(i) = colim_ν ℤ/p^ν(i), for i ∈ ℤ, with the reduction maps ℤ/p^{ν+1}(i) → ℤ/p^ν(i) and the inclusions ℤ/p^ν(i) ⊂ ℤ/p^{ν+1}(i); H^j(L, M) is continuous cohomology of G_L = Gal(L^sep/L) (Mathlib continuousCohomology), and H^j(L, ℤ_p(i)) means the continuous cohomology of the compact module ℤ_p(i), equal to lim_ν H^j(L, ℤ/p^ν(i)) (ArithmeticGaloisDuality R02.1).
- i ≥ 1.

**Proof.**

1. K_{2i}(L; ℤ/p^ν) is finite (L.6/finite-coefficient-lichtenbaum-quillen), so the Milnor sequence of L.1/completed-k-theory gives K_{2i−1}(L; ℤ_p) ≅ lim_ν K_{2i−1}(L; ℤ/p^ν).
2. The Chern classes are compatible with the reductions ℤ/p^{ν+1}(i) → ℤ/p^ν(i) (naturality in the coefficients, MotivicEtaleKTheory M.8), so they give an isomorphism of towers.
3. lim_ν H^1(L, ℤ/p^ν(i)) = H^1(L, ℤ_p(i)) because the H^0(L, ℤ/p^ν(i)) are finite (ArithmeticGaloisDuality R02.1; L.6/h0-of-tate-twists).
4. For V and i ≥ 2 use L.6/ring-of-integers-versus-field.

**Acceptance.**

- i = 1: K_1(L; ℤ_p) ≅ H^1(L, ℤ_p(1)) ≅ lim_ν L^×/p^ν, of rank d + 1.
- L = ℚ_2, i = 2: K_3(ℚ_2; ℤ_2) ≅ H^1(ℚ_2, ℤ_2(2)) ≅ ℤ_2 ⊕ ℤ/8.

**Depends on.** this roadmap: `L.6/finite-coefficient-lichtenbaum-quillen`, `L.1/completed-k-theory`, `L.6/h0-of-tate-twists`, `L.6/ring-of-integers-versus-field`; other roadmaps: `MotivicEtaleKTheory:M.8`, `ArithmeticGaloisDuality:R02.1`.

**Sources.**

- `Kbook.2013`, Corollary VI.7.4.1 (PDF p. 518; book p. 510): “Corollary 7.4.1. For i > 1 and all large ν we have K2i−1(E; Z/pν) ∼= H1 et(E, µ⊗i pν )” — The finite-level identification whose limit is taken here.
- `Weibel.Handbook.I5`, Theorem 61 (p. 165; PDF p. 27): “Moreover, the first étale Chern classes K2i−1(E; Z/pν) = H1(E,µ⊗i pν ) are natural isomorphisms for all i and ν.” — Naturality in ν, which makes the limit possible.

### Even completed K-groups of a p-adic field are H²

`L.6/even-completed-k-groups-are-h2` · comparison

Let L/ℚ_p be finite and i ≥ 1. Passing to the limit in the exact sequences 0 → H^2(L, ℤ/p^ν(i + 1)) → K_{2i}(L; ℤ/p^ν) → H^0(L, ℤ/p^ν(i)) → 0 of L.6/finite-coefficient-lichtenbaum-quillen gives a natural isomorphism K_{2i}(L; ℤ_p) ≅ H^2(L, ℤ_p(i + 1)), the H^0 terms contributing nothing in the limit. For V: K_{2i}(V; ℤ_p) ≅ K_{2i}(L; ℤ_p).

**Hypotheses.**

- L is a finite extension of ℚ_p of degree d = [L : ℚ_p], with valuation ring V = 𝒪_L, residue field 𝔽_q (q = p^f) and ramification index e, so d = ef; p is any prime unless a hypothesis restricts it.
- Tate twists are MotivicEtaleKTheory M.1's Galois modules: ℤ/p^ν(i) = μ_{p^ν}^{⊗i}, ℤ_p(i) = lim_ν ℤ/p^ν(i) and ℚ_p/ℤ_p(i) = colim_ν ℤ/p^ν(i), for i ∈ ℤ, with the reduction maps ℤ/p^{ν+1}(i) → ℤ/p^ν(i) and the inclusions ℤ/p^ν(i) ⊂ ℤ/p^{ν+1}(i); H^j(L, M) is continuous cohomology of G_L = Gal(L^sep/L) (Mathlib continuousCohomology), and H^j(L, ℤ_p(i)) means the continuous cohomology of the compact module ℤ_p(i), equal to lim_ν H^j(L, ℤ/p^ν(i)) (ArithmeticGaloisDuality R02.1).
- i ≥ 1.

**Proof.**

1. K_{2i+1}(L; ℤ/p^ν) is finite, so K_{2i}(L; ℤ_p) ≅ lim_ν K_{2i}(L; ℤ/p^ν) (L.1/completed-k-theory).
2. The inverse limit is exact on towers of finite groups; lim_ν H^0(L, ℤ/p^ν(i)) = 0 because the transition maps are multiplication by p on ℤ/w_i^{(p)}(L) (L.6/h0-of-tate-twists), and lim_ν H^2(L, ℤ/p^ν(i + 1)) = H^2(L, ℤ_p(i + 1)) (L.6/local-duality-for-tate-twists).
3. Naturality of the exact sequences in ν (MotivicEtaleKTheory M.8) makes the limit a map of towers.
4. For V use L.6/ring-of-integers-versus-field (i ≥ 1, so 2i ≥ 2).

**Acceptance.**

- L = ℚ_p, i = 1: K_2(ℚ_p; ℤ_p) ≅ H^2(ℚ_p, ℤ_p(2)) ≅ ℤ/w_1^{(p)}(ℚ_p), which is 0 for p odd and ℤ/2 for p = 2, matching Moore's theorem (μ_{p^∞}(ℚ_p) is trivial for p odd and {±1} for p = 2).
- At finite level the H^0 term is present: K_2(ℚ_2; ℤ/2) has order #H^0(ℚ_2, ℤ/2)·#H^2(ℚ_2, ℤ/2) = 4.

**Depends on.** this roadmap: `L.6/finite-coefficient-lichtenbaum-quillen`, `L.1/completed-k-theory`, `L.6/h0-of-tate-twists`, `L.6/local-duality-for-tate-twists`, `L.6/ring-of-integers-versus-field`; other roadmaps: `MotivicEtaleKTheory:M.8`.

**Sources.**

- `Kbook.2013`, Proof of Proposition VI.7.3 (PDF p. 517; book p. 509): “the spectral sequence (VI.4.2 4.2) with coeﬃcients Z/m degenerates completely and describes K2i(E; Z/m) as an extension of H0 et(E, µ⊗i m ) ∼= Z/wi(E) by H2 et(E, µ⊗i+1 m ) ∼= Z/wi(E).” — The finite-level extension whose limit is taken.
- `Kbook.2013`, Proof of Theorem VI.7.4 (PDF p. 518; book p. 510): “this implies that K2i(E; Zp) ∼= lim ←−K2i(E)/pν ∼= Z/w(p) i (E).” — The limit, computed in the source through the integral group.

### The completed K-groups of a p-adic field

`L.6/completed-k-groups-of-p-adic-fields` · theorem · planet “p-adic K-groups of a local field”

Let L be a finite extension of ℚ_p of degree d with valuation ring V, and n ≥ 2. Then K_n(V; ℤ_p) ≅ K_n(L; ℤ_p), and K_{2i}(L; ℤ_p) ≅ H^2(L, ℤ_p(i + 1)) ≅ ℤ/w_i^{(p)}(L) for i ≥ 1, K_{2i−1}(L; ℤ_p) ≅ H^1(L, ℤ_p(i)) ≅ ℤ_p^d ⊕ ℤ/w_i^{(p)}(L) for i ≥ 2. The torsion subgroup of K_{2i−1}(L; ℤ_p) is canonically the image of H^0(L, ℚ_p/ℤ_p(i)) = W_i^{(p)}(L); the complement ℤ_p^d is not canonical. Every K_n(L; ℤ_p), n ≥ 2, is a finitely generated ℤ_p-module; this says nothing about finite generation of K_n(L) (L.6/uniquely-divisible-summand).

**Hypotheses.**

- L is a finite extension of ℚ_p of degree d = [L : ℚ_p], with valuation ring V = 𝒪_L, residue field 𝔽_q (q = p^f) and ramification index e, so d = ef; p is any prime unless a hypothesis restricts it.
- n ≥ 2; for n = 1, K_1(L; ℤ_p) has rank d + 1 and K_1(V; ℤ_p) ≠ K_1(L; ℤ_p).
- All primes p, including p = 2 (via M.7; for p odd also via Hesselholt–Madsen).

**Proof.**

1. K_n(V; ℤ_p) ≅ K_n(L; ℤ_p) for n ≥ 2: L.6/ring-of-integers-versus-field.
2. Even degrees: L.6/even-completed-k-groups-are-h2 and the duality formula H^2(L, ℤ_p(i + 1)) ≅ ℤ/w_i^{(p)}(L) of L.6/local-duality-for-tate-twists (i ≠ 0).
3. Odd degrees: L.6/odd-completed-k-groups-are-h1 and L.6/h1-of-tate-twists (i ≥ 2, so i ∉ {0, 1}): rank d and torsion W_i^{(p)}(L).

**Acceptance.**

- L = ℚ_p (d = 1), n = 3: K_3(ℚ_p; ℤ_p) ≅ ℤ_p ⊕ ℤ/w_2^{(p)}(ℚ_p) (L.6/completed-k-groups-of-q-p).
- The rank of K_{2i−1}(L; ℤ_p) is d = [L : ℚ_p] for every i ≥ 2, independent of the ramification: for L = ℚ_p(ζ_p), d = p − 1.
- Handbook Remark 62: the rank agrees with Wagoner's continuous K-groups (not used in the proof).

**Depends on.** this roadmap: `L.6/ring-of-integers-versus-field`, `L.6/even-completed-k-groups-are-h2`, `L.6/odd-completed-k-groups-are-h1`, `L.6/local-duality-for-tate-twists`, `L.6/h1-of-tate-twists`.

**Sources.**

- `Weibel.Handbook.I5`, Theorem 61 (p. 165; PDF p. 27): “Theorem 61 Let E be a local field, of degree d over Qp, with ring of integers V. Then for n ≥2 we have:” — The theorem; its display gives ℤ/w_i^{(p)}(E) for n = 2i and (ℤ_p)^d ⊕ ℤ/w_i^{(p)}(E) for n = 2i − 1.
- `Kbook.2013`, Theorem VI.7.4 (PDF p. 517; book p. 509): “Theorem 7.4. Let E be a local field, of degree d over Qp, with ring of integers V . Then for n ≥2 we have:” — The same theorem in the K-book, with the same display.
- `Weibel.Handbook.I5`, Remark 62 (p. 165; PDF p. 27): “The fact that these groups were finitely generated Zp-modules of rank d was first obtained by Wagoner in [70], modulo the identification in [46] of Wagoner’s continuous K-groups with K∗(E; Z/p).” — The historical route through continuous K-theory, recorded but not followed.

### The completed K-groups of ℚ_p

`L.6/completed-k-groups-of-q-p` · application

For the field ℚ_p (d = 1) and j ≥ 2: K_{2j−1}(ℚ_p; ℤ_p) ≅ ℤ_p ⊕ ℤ/w_j^{(p)}(ℚ_p) and K_{2j−2}(ℚ_p; ℤ_p) ≅ ℤ/w_{j−1}^{(p)}(ℚ_p), with w_j^{(p)}(ℚ_p) = p^{1+v_p(j)} if (p − 1) | j and 1 otherwise (p odd), and w_j^{(2)}(ℚ_2) = 2 for j odd, 2^{2+v_2(j)} for j even. In particular: K_3(ℚ_2; ℤ_2) ≅ ℤ_2 ⊕ ℤ/8, K_3(ℚ_3; ℤ_3) ≅ ℤ_3 ⊕ ℤ/3, K_3(ℚ_p; ℤ_p) ≅ ℤ_p for p ≥ 5, K_{2p−3}(ℚ_p; ℤ_p) ≅ ℤ_p ⊕ ℤ/p for p odd, K_{11}(ℚ_3; ℤ_3) ≅ ℤ_3 ⊕ ℤ/9, K_4(ℚ_3; ℤ_3) ≅ ℤ/3, K_4(ℚ_2; ℤ_2) ≅ ℤ/8, K_5(ℚ_2; ℤ_2) ≅ ℤ_2 ⊕ ℤ/2, K_2(ℚ_2; ℤ_2) ≅ ℤ/2 and K_2(ℚ_p; ℤ_p) = 0 for p odd. The same groups are K_n(ℤ_p; ℤ_p) for n ≥ 2.

**Hypotheses.**

- p any prime; j ≥ 2 for the odd groups, j − 1 ≥ 1 for the even groups.

**Proof.**

1. Specialise L.6/completed-k-groups-of-p-adic-fields to L = ℚ_p, d = 1.
2. The values of w_j^{(p)}(ℚ_p) are L.6/p-adic-w-invariant-of-q-p: e.g. j = 2, p = 3: (3 − 1) | 2 and v_3(2) = 0, so 3; j = p − 1 (p odd): p^{1+0} = p; j = 6, p = 3: 3^{1+1} = 9; p = 2, j = 2: 2^{2+1} = 8; j = 3: 2; p ≥ 5, j = 2: (p − 1) ∤ 2, so 1.

**Acceptance.**

- K_3(ℚ_2; ℤ_2) ≅ ℤ_2 ⊕ ℤ/8: the 2-part of w_2(ℚ) = 24 appears locally.
- K_3(ℚ_5; ℤ_5) ≅ ℤ_5 is torsion-free, while K_7(ℚ_5; ℤ_5) ≅ ℤ_5 ⊕ ℤ/5 (j = 4 = p − 1).
- Recomputed by hand: w_2^{(3)}(ℚ_3) = 3 because u² − 1 has 3-adic valuation ≥ 1 for every u ∈ ℤ_3^× and exactly 1 for u = 2.

**Depends on.** this roadmap: `L.6/completed-k-groups-of-p-adic-fields`, `L.6/p-adic-w-invariant-of-q-p`.

**Sources.**

- `Kbook.2013`, Example VI.2.3.1 (PDF p. 479; book p. 471): “(The precise power of p is given in Exercise EVI.2.3 2.3 when E = Qp.)” — The source leaves the p-power for ℚ_p as an exercise; the node records the computed values.
- `Weibel.Handbook.I5`, Theorem 61 (p. 165; PDF p. 27): “Theorem 61 Let E be a local field, of degree d over Qp, with ring of integers V. Then for n ≥2 we have:” — The theorem specialised.

### Completed K₃ of an unramified p-adic field (the input of PadicHodgeRegulators D.3)

`L.6/completed-k3-of-unramified-fields` · application

Let L be a finite unramified extension of ℚ_p with valuation ring V. Then K_3(V; ℤ_p) ≅ K_3(L; ℤ_p) ≅ H^1(L, ℤ_p(2)) ≅ ℤ_p^{[L:ℚ_p]} ⊕ ℤ/w_2^{(p)}(L), with w_2^{(p)}(L) = 1 for p ≥ 5, 3 for p = 3 and 8 for p = 2. In particular, for p > 3, K_3(L; ℤ_p) is a free ℤ_p-module of rank [L : ℚ_p] and the Chern class identifies it with H^1(L, ℤ_p(2)). For p ∈ {2, 3} the torsion does not vanish, and for ramified L the torsion is ℤ/w_2^{(p)}(L), which can be nonzero for every p (for example L = ℚ_p(ζ_p)).

**Hypotheses.**

- L/ℚ_p finite unramified; p any prime, with the torsion-freeness only for p > 3.
- This is the field-level statement; the finite products of such fields in D.3 are handled by the product API of L.1/completed-k-theory, applied in D.3.

**Proof.**

1. L.6/completed-k-groups-of-p-adic-fields with n = 3, i = 2, and L.6/odd-completed-k-groups-are-h1 for the identification with H^1.
2. For L unramified, L and ℚ_p(ζ_p) are linearly disjoint (ℚ_p(ζ_p)/ℚ_p is totally ramified of degree p − 1), so r = [L(ζ_p) : L] = p − 1 for p odd; w_2^{(p)}(L) ≠ 1 iff r | 2 iff p = 3 (L.6/p-adic-w-invariant); for p = 3, L(ζ_3) has ramification index 2 and contains no primitive 9th root of unity, so a = 1 and w_2^{(3)}(L) = 3.
3. For p = 2: √−1 ∉ L (ℚ_2(√−1) is ramified), L(√−1) contains no primitive 8th root of unity, so a = 2; L is exceptional because the 2-adic cyclotomic character of G_L is still onto ℤ_2^× (L is linearly disjoint from ℚ_2(μ_{2^∞})); so w_2^{(2)}(L) = 2^{2+1} = 8.
4. For L = ℚ_p(ζ_p), r = 1, so w_2^{(p)}(L) = p^{a} ≥ p.

**Acceptance.**

- L = ℚ_{p^f} unramified of degree f, p = 5: K_3(ℚ_{5^f}; ℤ_5) ≅ ℤ_5^f.
- p = 3, L = ℚ_3: K_3(ℚ_3; ℤ_3) ≅ ℤ_3 ⊕ ℤ/3, so D.3's hypothesis p > 3 is exactly what makes the completed group torsion-free.
- An unramified computation is not an instance of a ramified one: for L = ℚ_5(ζ_5), K_3(L; ℤ_5) ≅ ℤ_5^4 ⊕ ℤ/5.

**Depends on.** this roadmap: `L.6/completed-k-groups-of-p-adic-fields`, `L.6/odd-completed-k-groups-are-h1`, `L.6/p-adic-w-invariant`.

**Sources.**

- `Weibel.Handbook.I5`, Theorem 61 (p. 165; PDF p. 27): “Theorem 61 Let E be a local field, of degree d over Qp, with ring of integers V. Then for n ≥2 we have:” — The case n = 3.
- `Weibel.Handbook.I5`, Proof of Theorem 61 (p. 165; PDF p. 27): “If p > 2 the first part is proven in [6] (see [25]).” — Reference [6] is Bökstedt–Madsen's unramified case, the case of this node for p odd (see sourceIssues for the attribution).

### K-groups of a p-adic field with ℚ_p/ℤ_p coefficients

`L.6/discrete-coefficient-k-groups` · comparison

Let L/ℚ_p be finite of degree d, and K_n(L; ℚ_p/ℤ_p) = colim_ν K_n(L; ℤ/p^ν) along the maps induced by ℤ/p^ν ⊂ ℤ/p^{ν+1}. For i ≥ 1, K_{2i}(L; ℚ_p/ℤ_p) ≅ H^0(L, ℚ_p/ℤ_p(i)) = W_i^{(p)}(L) ≅ ℤ/w_i^{(p)}(L), the map being the edge map to K_{2i}(L^sep; ℚ_p/ℤ_p) ≅ ℚ_p/ℤ_p(i); and for i ≥ 2, K_{2i−1}(L; ℚ_p/ℤ_p) ≅ H^1(L, ℚ_p/ℤ_p(i)) ≅ (ℚ_p/ℤ_p)^d ⊕ ℤ/w_{i−1}^{(p)}(L). The universal coefficient sequences 0 → K_n(L) ⊗ ℚ_p/ℤ_p → K_n(L; ℚ_p/ℤ_p) → K_{n−1}(L){p} → 0 hold for all n.

**Hypotheses.**

- L is a finite extension of ℚ_p of degree d = [L : ℚ_p], with valuation ring V = 𝒪_L, residue field 𝔽_q (q = p^f) and ramification index e, so d = ef; p is any prime unless a hypothesis restricts it.
- Tate twists are MotivicEtaleKTheory M.1's Galois modules: ℤ/p^ν(i) = μ_{p^ν}^{⊗i}, ℤ_p(i) = lim_ν ℤ/p^ν(i) and ℚ_p/ℤ_p(i) = colim_ν ℤ/p^ν(i), for i ∈ ℤ, with the reduction maps ℤ/p^{ν+1}(i) → ℤ/p^ν(i) and the inclusions ℤ/p^ν(i) ⊂ ℤ/p^{ν+1}(i); H^j(L, M) is continuous cohomology of G_L = Gal(L^sep/L) (Mathlib continuousCohomology), and H^j(L, ℤ_p(i)) means the continuous cohomology of the compact module ℤ_p(i), equal to lim_ν H^j(L, ℤ/p^ν(i)) (ArithmeticGaloisDuality R02.1).
- i ≥ 1 in even degrees and i ≥ 2 in odd degrees.

**Proof.**

1. Universal coefficients with ℤ/p^∞ = colim ℤ/p^ν: the colimit of the sequences of L.1/k-theory-mod-m (K-book Ex. IV.2.6), exact because filtered colimits are exact.
2. Colimit of L.6/finite-coefficient-lichtenbaum-quillen along the inclusions: the H^2(L, ℤ/p^ν(i + 1)) terms have eventually zero transition maps (L.6/local-duality-for-tate-twists (c)) and the H^0 terms have colimit W_i^{(p)}(L) (L.6/h0-of-tate-twists).
3. Odd degrees: colim_ν H^1(L, ℤ/p^ν(i)) = H^1(L, ℚ_p/ℤ_p(i)), described in L.6/h1-with-divisible-coefficients.

**Acceptance.**

- L = ℚ_3, i = 2: K_4(ℚ_3; ℚ_3/ℤ_3) ≅ ℤ/3 and K_3(ℚ_3; ℚ_3/ℤ_3) ≅ ℚ_3/ℤ_3 ⊕ ℤ/w_1^{(3)}(ℚ_3) = ℚ_3/ℤ_3.
- Consistency with L.6/divisible-rank-relation: the coranks satisfy t_i + λ_{i−1} = d.

**Depends on.** this roadmap: `L.6/finite-coefficient-lichtenbaum-quillen`, `L.6/local-duality-for-tate-twists`, `L.6/h0-of-tate-twists`, `L.6/h1-with-divisible-coefficients`, `L.1/k-theory-mod-m`.

**Sources.**

- `Kbook.2013`, Exercise IV.2.6 (PDF p. 292; book p. 284): “Then show that there is a universal coefficient sequence for m ≥3: 0 →(πmX) ⊗Z/ℓ∞→πm(X; Z/ℓ∞) ∂ −→(πm−1X)ℓ-tors →0.” — The universal coefficient sequence with divisible coefficients.
- `Kbook.2013`, Proof of Proposition VI.7.3 (PDF p. 517; book p. 509): “To see that K2i−1(E) has a cyclic summand of order wi(E), consider the spectral sequence (VI.4.2 4.2) with coeﬃcients Q/Z.” — The source's use of divisible coefficients.

### The p-primary torsion of the odd K-groups of a p-adic field

`L.6/p-primary-torsion-of-odd-k-groups` · theorem

Let L/ℚ_p be finite and i ≥ 1. Then K_{2i}(L) ⊗ ℚ_p/ℤ_p = 0, and the Bockstein K_{2i}(L; ℚ_p/ℤ_p) → K_{2i−1}(L){p} is an isomorphism, so K_{2i−1}(L){p} ≅ ℤ/w_i^{(p)}(L). This isomorphism is the p-primary part of the e-invariant e: K_{2i−1}(L)_tors → W_i(L); in particular e^{(p)}: K_{2i−1}(L){p} → W_i^{(p)}(L) is bijective. Also T_p(K_{2i−1}(L)) = 0.

**Hypotheses.**

- L is a finite extension of ℚ_p of degree d = [L : ℚ_p], with valuation ring V = 𝒪_L, residue field 𝔽_q (q = p^f) and ramification index e, so d = ef; p is any prime unless a hypothesis restricts it.
- i ≥ 1.
- The e-invariant is ArithmeticKTheory N.5's, built on Suslin's K_{2i−1}(L^sep)_tors ≅ μ(i) (MotivicEtaleKTheory M.7).

**Proof.**

1. K_{2i}(L; ℚ_p/ℤ_p) ≅ ℤ/w_i^{(p)}(L) is finite (L.6/discrete-coefficient-k-groups).
2. K_{2i}(L) ⊗ ℚ_p/ℤ_p is divisible and injects into a finite group, hence is zero; the universal coefficient sequence then gives K_{2i}(L; ℚ_p/ℤ_p) ≅ K_{2i−1}(L){p}.
3. The composite K_{2i}(L; ℚ_p/ℤ_p) → K_{2i}(L^sep; ℚ_p/ℤ_p) ≅ ℚ_p/ℤ_p(i) is injective with image W_i^{(p)}(L) (L.6/discrete-coefficient-k-groups), and under the Bocksteins for L and L^sep it is the e-invariant restricted to p-primary torsion (ArithmeticKTheory:N.5/e-invariant; K-book Example VI.4.5(ii)).
4. A group with finite p-primary torsion has zero Tate module (L.6/p-adic-tate-module).

**Acceptance.**

- L = ℚ_3, i = 2: K_3(ℚ_3){3} ≅ ℤ/3.
- L = ℚ_2, i = 2: K_3(ℚ_2){2} ≅ ℤ/8, the 2-part of the Harris–Segal summand ℤ/w_2(ℚ_2) = ℤ/24.
- i = 1: K_1(L){p} = μ_{p^∞}(L), of order w_1^{(p)}(L).

**Depends on.** this roadmap: `L.6/discrete-coefficient-k-groups`, `L.6/p-adic-tate-module`; other roadmaps: `ArithmeticKTheory:N.5/e-invariant`, `MotivicEtaleKTheory:M.7`.

**Sources.**

- `Kbook.2013`, Proof of Proposition VI.7.3 (PDF p. 517; book p. 509): “By the above remarks, it degenerates completely to yield K2i(E; Q/Z) ∼= Z/wi(E).” — The divisible-coefficient group, at all primes at once.
- `Kbook.2013`, Proof of Proposition VI.7.3 (PDF p. 517; book p. 509): “this implies that the e-invariant is an isomorphism: K2i(E; Q/Z) ≃ −→Z/wi(E).” — The identification with the e-invariant.

### The odd K-groups of a p-adic field and of its valuation ring

`L.6/odd-integral-k-groups` · theorem

Let L/ℚ_p be finite with residue field 𝔽_q, and i ≥ 2. Then K_{2i−1}(V) → K_{2i−1}(L) is an isomorphism, the torsion subgroup K_{2i−1}(L)_tors is cyclic of order w_i(L) = (q^i − 1)·w_i^{(p)}(L) and is mapped isomorphically onto W_i(L) by the e-invariant (the Harris–Segal summand), and T_i := K_{2i−1}(L)/K_{2i−1}(L)_tors is a torsion-free ℤ_(p)-module with T_i/pT_i finite. Hence K_{2i−1}(L) ≅ T_i ⊕ ℤ/w_i(L); the torsion subgroup and T_i (as a quotient) are canonical, a complement of the torsion is not.

**Hypotheses.**

- L is a finite extension of ℚ_p of degree d = [L : ℚ_p], with valuation ring V = 𝒪_L, residue field 𝔽_q (q = p^f) and ramification index e, so d = ef; p is any prime unless a hypothesis restricts it.
- i ≥ 2 (for i = 1, K_1(L) = L^× and the valuation ring differs).
- T_i is defined as a quotient so that it is canonical.

**Proof.**

1. K_{2i−1}(V) ≅ K_{2i−1}(L) for i ≥ 2 (KTheoryFiniteLocalFields:L.2/odd-k-ring-of-integers-equals-field).
2. Prime-to-p torsion: K_{2i−1}(L)_tors ⊇ ℤ/(q^i − 1), detected by the e-invariant, with complement a ℤ_(p)-module (KTheoryFiniteLocalFields:L.2/prime-to-p-ring-of-integers, KTheoryFiniteLocalFields:L.2/e-invariant-local-field).
3. p-primary torsion: ℤ/w_i^{(p)}(L) by L.6/p-primary-torsion-of-odd-k-groups; so the torsion is finite cyclic of order (q^i − 1)w_i^{(p)}(L) = w_i(L) (L.6/w-invariant-prime-to-p-factor) and e is bijective on it.
4. A bounded (here finite) subgroup that is pure (the torsion subgroup is) is a direct summand, so K_{2i−1}(L) ≅ T_i ⊕ ℤ/w_i(L); T_i is torsion-free and uniquely ℓ-divisible for ℓ ≠ p because the complement of L.2 is.
5. T_i/pT_i is a quotient of K_{2i−1}(L)/p ⊂ K_{2i−1}(L; ℤ/p), which is finite (L.6/finite-coefficient-lichtenbaum-quillen).

**Acceptance.**

- L = ℚ_3, i = 2: K_3(ℚ_3)_tors ≅ ℤ/24 (w_2(ℚ_3) = (3² − 1)·3 = 24).
- L = ℚ_5, i = 2: K_3(ℚ_5)_tors ≅ ℤ/24 (w_2(ℚ_5) = 5² − 1 = 24, w_2^{(5)} = 1).
- L = ℚ_2, i = 2: K_3(ℚ_2)_tors ≅ ℤ/((2² − 1)·8) = ℤ/24.

**Depends on.** this roadmap: `L.2/odd-k-ring-of-integers-equals-field`, `L.2/prime-to-p-ring-of-integers`, `L.2/e-invariant-local-field`, `L.6/p-primary-torsion-of-odd-k-groups`, `L.6/w-invariant-prime-to-p-factor`, `L.6/finite-coefficient-lichtenbaum-quillen`; libraries: `mathlib:CommGroup.torsion`.

**Sources.**

- `Kbook.2013`, Proposition VI.7.3 (PDF p. 517; book p. 509): “Proposition 7.3. For n > 0 we have Kn(E) ∼= Kn(V ) ⊕Kn−1(Fq), and the groups Kn(V ) are Z(p)-modules.” — The frame of the statement; the node treats the odd degrees.
- `Kbook.2013`, Proof of Proposition VI.7.3 (PDF p. 517; book p. 509): “this implies that K2i−1(E) ∼= Ti ⊕Z/wi(E) where Ti is torsionfree.” — The decomposition.

### The even K-groups of a p-adic field modulo p-powers

`L.6/even-k-groups-mod-p-powers` · lemma

Let L/ℚ_p be finite, i ≥ 1 and ν ≥ 1. Under L.6/finite-coefficient-lichtenbaum-quillen the two filtrations of K_{2i}(L; ℤ/p^ν) agree: the image of K_{2i}(L)/p^ν is the subgroup H^2(L, μ_{p^ν}^{⊗(i+1)}), and the Bockstein onto K_{2i−1}(L)[p^ν] is the edge map onto H^0(L, μ_{p^ν}^{⊗i}). Hence K_{2i}(L)/p^ν ≅ H^2(L, μ_{p^ν}^{⊗(i+1)}) ≅ ℤ/gcd(p^ν, w_i^{(p)}(L)) and K_{2i−1}(L)[p^ν] ≅ H^0(L, μ_{p^ν}^{⊗i}).

**Hypotheses.**

- L is a finite extension of ℚ_p of degree d = [L : ℚ_p], with valuation ring V = 𝒪_L, residue field 𝔽_q (q = p^f) and ramification index e, so d = ef; p is any prime unless a hypothesis restricts it.
- i ≥ 1, ν ≥ 1.

**Proof.**

1. The edge map K_{2i}(L; ℤ/p^ν) → H^0(L, μ^{⊗i}) factors through K_{2i}(L^sep; ℤ/p^ν) and vanishes on K_{2i}(L)/p^ν, because K_{2i}(L^sep)/p^ν = 0 (Suslin: K_{2i}(L^sep) is divisible; MotivicEtaleKTheory M.7; K-book Example VI.4.5(ii)); so K_{2i}(L)/p^ν ⊆ H^2.
2. The induced map K_{2i−1}(L)[p^ν] → H^0(L, μ^{⊗i}) is the p^ν-torsion of the e-invariant, a bijection by L.6/p-primary-torsion-of-odd-k-groups; comparing orders in the two short exact sequences gives K_{2i}(L)/p^ν = H^2.
3. #H^2(L, μ_{p^ν}^{⊗(i+1)}) = gcd(p^ν, w_i^{(p)}(L)) (L.6/local-duality-for-tate-twists).

**Acceptance.**

- L = ℚ_3, i = 2, ν ≥ 1: K_4(ℚ_3)/3^ν ≅ ℤ/3.
- i = 1: K_2(L)/p^ν ≅ H^2(L, μ_{p^ν}^{⊗2}) ≅ μ(L)/p^ν, consistent with Moore's theorem (L.3).

**Depends on.** this roadmap: `L.6/finite-coefficient-lichtenbaum-quillen`, `L.6/p-primary-torsion-of-odd-k-groups`, `L.6/local-duality-for-tate-twists`, `L.1/k-theory-mod-m`; other roadmaps: `MotivicEtaleKTheory:M.7`.

**Sources.**

- `Kbook.2013`, Proof of Proposition VI.7.3 (PDF p. 517; book p. 509): “By the previous paragraph, the quotient Z/wi(E) is identified with the m-torsion in K2i−1(E), so the kernel Z/wi(E) is identified with K2i(E)/m.” — The argument.
- `Kbook.2013`, Example VI.4.5(ii) (PDF p. 491; book p. 483): “Therefore the edge map vanishes on K2i(k)/m” — The vanishing used in the first step.

### The even K-groups of a p-adic field: divisible part and finite quotient

`L.6/even-integral-k-groups` · theorem · planet “Divisible and finite parts of local K-groups”

Let L/ℚ_p be finite with residue field 𝔽_q, and i ≥ 1. Put D_i = w_i(L)·K_{2i}(L). Then: (a) D_i = Div(K_{2i}(L)) = ⋂_{m ≥ 1} m·K_{2i}(L), and there is a canonical exact sequence 0 → D_i → K_{2i}(L) → ℤ/w_i(L) → 0, split non-canonically; (b) D_i ⊂ K_{2i}(V), D_i is a divisible ℤ_(p)-module, D_i ≅ ℚ^{(κ)} ⊕ (ℚ_p/ℤ_p)^{λ_i} with λ_i ≤ d = [L : ℚ_p], and K_{2i}(V) ≅ D_i ⊕ ℤ/w_i^{(p)}(L), i.e. K_{2i}(V) is the direct sum of a uniquely divisible group, a divisible p-group and a subgroup isomorphic to ℤ/w_i^{(p)}(L) (the p-primary finite component). For i = 1, D_1 is Moore's uniquely divisible U(L), so λ_1 = 0; the bound λ_i ≤ d is L.6/even-k-groups-tate-module.

**Hypotheses.**

- L is a finite extension of ℚ_p of degree d = [L : ℚ_p], with valuation ring V = 𝒪_L, residue field 𝔽_q (q = p^f) and ramification index e, so d = ef; p is any prime unless a hypothesis restricts it.
- i ≥ 1.
- κ and λ_i are cardinals (λ_i is finite, L.6/even-k-groups-tate-module). The source does not know whether λ_i can be nonzero for i ≥ 2.

**Proof.**

1. For every multiple m of w_i(L), K_{2i}(L)/m ≅ ℤ/w_i(L) and the reductions are bijective: the p-part is L.6/even-k-groups-mod-p-powers, the prime-to-p part is K_{2i}(L) = K_{2i}(V) ⊕ K_{2i−1}(𝔽_q) with K_{2i}(V) uniquely ℓ-divisible for ℓ ≠ p (KTheoryFiniteLocalFields:L.2/even-k-field-splitting, KTheoryFiniteLocalFields:L.2/prime-to-p-ring-of-integers).
2. (a) by L.6/divisible-subgroup-criterion with w = w_i(L).
3. (b) D_i maps to zero in the finite group K_{2i−1}(𝔽_q), so D_i ⊂ K_{2i}(V); K_{2i}(V)/D_i ↪ K_{2i}(L)/D_i ≅ ℤ/w_i(L) has cokernel K_{2i−1}(𝔽_q) ≅ ℤ/(q^i − 1) (L.1/quillen-k-groups), so K_{2i}(V)/D_i ≅ ℤ/w_i^{(p)}(L); D_i is injective, giving the splitting. D_i has no ℓ-torsion for ℓ ≠ p, so by the structure of divisible groups (L.6/maximal-divisible-subgroup) it is ℚ^{(κ)} ⊕ (ℚ_p/ℤ_p)^{(λ_i)}.
4. i = 1: K_2(L) = U(L) ⊕ μ(L) with U(L) uniquely divisible (KTheoryFiniteLocalFields:L.3/moore-theorem), so D_1 = U(L) and λ_1 = 0.

**Acceptance.**

- L = ℚ_3, i = 2: K_4(ℚ_3) ≅ D_2 ⊕ ℤ/24 with K_4(ℤ_3) ≅ D_2 ⊕ ℤ/3 and K_4(ℚ_3)/D_2 ≅ ℤ/8 ⊕ ℤ/3.
- L = ℚ_p, p ≥ 5, i = 2: K_4(ℤ_p) = D_2 is divisible (w_2^{(p)}(ℚ_p) = 1).
- i = 1: consistency with Moore's theorem K_2(L) ≅ U(L) ⊕ μ(L) (L.3) and K_2(V) ≅ U(L) ⊕ μ_{p^∞}(L).

**Depends on.** this roadmap: `L.6/even-k-groups-mod-p-powers`, `L.6/divisible-subgroup-criterion`, `L.6/maximal-divisible-subgroup`, `L.2/even-k-field-splitting`, `L.2/prime-to-p-ring-of-integers`, `L.1/quillen-k-groups`, `L.3/moore-theorem`.

**Sources.**

- `Kbook.2013`, Proposition VI.7.3 (PDF p. 517; book p. 509): “When n = 2i, Kn(V ) is the direct sum of Z/w(p) i (E) and a divisible Z(p)-module.” — Part (b).
- `Kbook.2013`, Proof of Proposition VI.7.3 (PDF p. 517; book p. 509): “Thus K2i(E) ∼= Di ⊕Z/wi(E), and K2i(V ) ∼= Di ⊕Z/w(p) i (E).” — Parts (a) and (b).
- `Weibel.Handbook.I5`, Theorem 61 (p. 165; PDF p. 27): “Finally, each K2i(V) is the direct sum of a uniquely divisible group, a divisible p-group and a subgroup isomorphic to Z/w(p) i (E).” — The three components of (b).
- `Kbook.2013`, Warning VI.7.5 (PDF p. 518; book p. 510): “I do not know any example where a Z/p∞appears in K2i(E).” — The open status of λ_i for i ≥ 2.

### The Tate module of the even K-groups and the finiteness of the divisible p-rank

`L.6/even-k-groups-tate-module` · lemma

Let L/ℚ_p be finite of degree d and i ≥ 1, and let D_i = Div(K_{2i}(L)) ≅ ℚ^{(κ)} ⊕ (ℚ_p/ℤ_p)^{(λ_i)} (L.6/even-integral-k-groups). Then T_p(K_{2i}(L)) = T_p(D_i) ≅ ℤ_p^{λ_i}, it is a quotient of K_{2i+1}(L; ℤ_p), and λ_i ≤ d; λ_1 = 0.

**Hypotheses.**

- L is a finite extension of ℚ_p of degree d = [L : ℚ_p], with valuation ring V = 𝒪_L, residue field 𝔽_q (q = p^f) and ramification index e, so d = ef; p is any prime unless a hypothesis restricts it.
- i ≥ 1.

**Proof.**

1. K_{2i}(L) ≅ D_i ⊕ ℤ/w_i(L), and the finite summand has zero Tate module, so T_p(K_{2i}(L)) = T_p(D_i) = T_p((ℚ_p/ℤ_p)^{(λ_i)}) (L.6/p-adic-tate-module; the ℚ-part contributes nothing).
2. L.6/completion-exact-sequence for n = 2i + 1 (finiteness from L.6/finite-coefficient-lichtenbaum-quillen): K_{2i+1}(L; ℤ_p) → T_p(K_{2i}(L)) is onto, and K_{2i+1}(L; ℤ_p) ≅ ℤ_p^d ⊕ ℤ/w_{i+1}^{(p)}(L) (L.6/completed-k-groups-of-p-adic-fields, 2i + 1 = 2(i + 1) − 1 with i + 1 ≥ 2); a torsion-free quotient of it has rank ≤ d, which bounds the cardinal λ_i.
3. λ_1 = 0 because D_1 = U(L) is uniquely divisible (L.6/even-integral-k-groups).

**Acceptance.**

- L = ℚ_p: λ_i ∈ {0, 1} for every i.
- The source knows no example with λ_i ≠ 0 (K-book Warning VI.7.5).

**Depends on.** this roadmap: `L.6/even-integral-k-groups`, `L.6/p-adic-tate-module`, `L.6/completion-exact-sequence`, `L.6/completed-k-groups-of-p-adic-fields`, `L.6/finite-coefficient-lichtenbaum-quillen`.

**Sources.**

- `Kbook.2013`, Warning VI.7.5 (PDF p. 518; book p. 510): “Any of the Zp’s in K2i−1(V ; Zp) could come from either a Z(p) in K2i−1(V ) or a Z/p∞in K2i−2(V ).” — A ℤ/p^∞ in K_{2i−2}(V) contributes a ℤ_p to K_{2i−1}(V; ℤ_p) through the Tate module, which bounds λ_{i−1}.
- `Kbook.2013`, Proof of Theorem VI.7.4 (PDF p. 518; book p. 510): “K2i−1(V ; Zp) is the direct sum of the finite p-group Z/w(p) i (E) and two finitely generated torsionfree Zp-modules: the Tate module of Di−1 and Ti ⊗Z Zp.” — The Tate module of D_{i−1} as a summand of the completed group.

### How the rank [L : ℚ_p] splits between odd lattices and even divisible parts

`L.6/divisible-rank-relation` · theorem

Let L/ℚ_p be finite of degree d and i ≥ 2. With T_i = K_{2i−1}(L)/torsion (L.6/odd-integral-k-groups) and D_{i−1} = Div(K_{2i−2}(L)) (L.6/even-integral-k-groups), put t_i = dim_{𝔽_p} T_i/pT_i and λ_{i−1} = dim_{𝔽_p} D_{i−1}[p]. Then there is a natural exact sequence 0 → T_i^∧ ⊕ ℤ/w_i^{(p)}(L) → K_{2i−1}(L; ℤ_p) → T_p(D_{i−1}) → 0 with T_i^∧ = lim_ν T_i/p^ν ≅ ℤ_p^{t_i} and T_p(D_{i−1}) ≅ ℤ_p^{λ_{i−1}}, and t_i + λ_{i−1} = d. Consequently either T_i is not p-divisible or D_{i−1} has p-torsion; and since λ_1 = 0, t_2 = d.

**Hypotheses.**

- L is a finite extension of ℚ_p of degree d = [L : ℚ_p], with valuation ring V = 𝒪_L, residue field 𝔽_q (q = p^f) and ramification index e, so d = ef; p is any prime unless a hypothesis restricts it.
- i ≥ 2.

**Proof.**

1. L.6/completion-exact-sequence for n = 2i − 1 (finiteness from L.6/finite-coefficient-lichtenbaum-quillen): 0 → lim_ν K_{2i−1}(L)/p^ν → K_{2i−1}(L; ℤ_p) → T_p(K_{2i−2}(L)) → 0.
2. lim_ν K_{2i−1}(L)/p^ν = T_i^∧ ⊕ ℤ/w_i^{(p)}(L): split K_{2i−1}(L) ≅ T_i ⊕ ℤ/w_i(L) (L.6/odd-integral-k-groups) and note that the prime-to-p part dies; T_i^∧ ≅ ℤ_p^{t_i} by L.6/torsion-free-lattice-lemma.
3. T_p(K_{2i−2}(L)) = T_p(D_{i−1}) ≅ ℤ_p^{λ_{i−1}} (L.6/even-k-groups-tate-module).
4. Rank count: K_{2i−1}(L; ℤ_p) has rank d (L.6/completed-k-groups-of-p-adic-fields), so t_i + λ_{i−1} = d.
5. λ_1 = 0 by L.6/even-integral-k-groups (Moore).

**Acceptance.**

- L = ℚ_p, i = 2: t_2 = 1 and λ_1 = 0.
- The same count from divisible coefficients: K_{2i−1}(L; ℚ_p/ℤ_p) ≅ (ℚ_p/ℤ_p)^d ⊕ ℤ/w_{i−1}^{(p)} is an extension of K_{2i−2}(L){p} ≅ (ℚ_p/ℤ_p)^{λ_{i−1}} ⊕ ℤ/w_{i−1}^{(p)} by (ℚ_p/ℤ_p)^{t_i} (L.6/discrete-coefficient-k-groups).

**Depends on.** this roadmap: `L.6/completion-exact-sequence`, `L.6/odd-integral-k-groups`, `L.6/even-k-groups-tate-module`, `L.6/torsion-free-lattice-lemma`, `L.6/completed-k-groups-of-p-adic-fields`, `L.6/finite-coefficient-lichtenbaum-quillen`, `L.6/even-integral-k-groups`.

**Sources.**

- `Kbook.2013`, Remark VI.7.3.1 (PDF p. 517; book p. 509): “Remark 7.3.1. Either Ti fails to be p-divisible, or else Di−1 has p-torsion.” — The dichotomy.
- `Kbook.2013`, Proof of Theorem VI.7.4 (PDF p. 518; book p. 510): “K2i−1(V ; Zp) is the direct sum of the finite p-group Z/w(p) i (E) and two finitely generated torsionfree Zp-modules: the Tate module of Di−1 and Ti ⊗Z Zp.” — The exact sequence; the source's T_i ⊗ ℤ_p must be read as the p-adic completion (sourceIssues).

### The structure of K_{2i−1}(L; ℤ/p^ν) and of H¹(L, μ_{p^ν}^{⊗i})

`L.6/finite-coefficient-k-groups-structure` · theorem

Let L/ℚ_p be finite of degree d, i ≥ 2 and ν ≥ 1. Then K_{2i−1}(L; ℤ/p^ν) ≅ H^1(L, μ_{p^ν}^{⊗i}) ≅ (ℤ/p^ν)^d ⊕ ℤ/gcd(p^ν, w_i^{(p)}(L)) ⊕ ℤ/gcd(p^ν, w_{i−1}^{(p)}(L)). In particular, for p^ν ≥ max(w_i^{(p)}(L), w_{i−1}^{(p)}(L)) the group is (ℤ/p^ν)^d ⊕ ℤ/w_i^{(p)}(L) ⊕ ℤ/w_{i−1}^{(p)}(L); the hypothesis p^ν > w_i^{(p)}(L) alone does not suffice.

**Hypotheses.**

- L is a finite extension of ℚ_p of degree d = [L : ℚ_p], with valuation ring V = 𝒪_L, residue field 𝔽_q (q = p^f) and ramification index e, so d = ef; p is any prime unless a hypothesis restricts it.
- i ≥ 2, ν ≥ 1.

**Proof.**

1. For p^ν ≠ 2 the universal coefficient sequence 0 → K_{2i−1}(L)/p^ν → K_{2i−1}(L; ℤ/p^ν) → K_{2i−2}(L)[p^ν] → 0 splits (L.1/k-theory-mod-m; split unless p^ν ≡ 2 mod 4).
2. K_{2i−1}(L)/p^ν ≅ T_i/p^ν ⊕ ℤ/gcd(p^ν, w_i^{(p)}) with T_i/p^ν ≅ (ℤ/p^ν)^{t_i} (L.6/odd-integral-k-groups, L.6/torsion-free-lattice-lemma); K_{2i−2}(L)[p^ν] ≅ D_{i−1}[p^ν] ⊕ ℤ/gcd(p^ν, w_{i−1}^{(p)}) ≅ (ℤ/p^ν)^{λ_{i−1}} ⊕ ℤ/gcd(p^ν, w_{i−1}^{(p)}) (L.6/even-integral-k-groups).
3. t_i + λ_{i−1} = d (L.6/divisible-rank-relation).
4. p^ν = 2: every group in sight is killed by 2 (H^1(L, ℤ/2) is an 𝔽_2-vector space) and #H^1(L, ℤ/2) = 2^{d+2} by the Euler characteristic (L.6/h1-of-tate-twists), matching (ℤ/2)^d ⊕ ℤ/2 ⊕ ℤ/2 since w_i^{(2)}, w_{i−1}^{(2)} are even.
5. The identification with H^1 is L.6/finite-coefficient-lichtenbaum-quillen.

**Acceptance.**

- L = ℚ_3, i = 7, ν = 1: (ℤ/3) ⊕ ℤ/gcd(3, 1) ⊕ ℤ/gcd(3, 9) = (ℤ/3)², of order 9, agreeing with the Euler characteristic count; the Handbook's formula would give ℤ/3 ⊕ ℤ/9 (sourceIssues).
- L = ℚ_2, i = 2, ν = 3: (ℤ/8) ⊕ ℤ/8 ⊕ ℤ/2.

**Depends on.** this roadmap: `L.1/k-theory-mod-m`, `L.6/odd-integral-k-groups`, `L.6/even-integral-k-groups`, `L.6/torsion-free-lattice-lemma`, `L.6/divisible-rank-relation`, `L.6/h1-of-tate-twists`, `L.6/finite-coefficient-lichtenbaum-quillen`.

**Sources.**

- `Kbook.2013`, Corollary VI.7.4.1 (PDF p. 518; book p. 510): “Corollary 7.4.1. For i > 1 and all large ν we have K2i−1(E; Z/pν) ∼= H1 et(E, µ⊗i pν ) ∼= (Z/pν)[E:Qp] ⊕Z/w(p) i (E) ⊕Z/w(p) i−1(E).” — The statement for large ν; the node gives all ν.
- `Weibel.Handbook.I5`, §5.6, before Theorem 61 (p. 165; PDF p. 27): “For all i, and ℓν > wi, the étale cohomology group H1(E,µ⊗i pν ) is isomorphic to (Z/pν)d ⊕Z/wi ⊕Z/wi−1, d = [E : Qp].” — The survey's version, whose range is corrected here (sourceIssues).

### K₃ of a p-adic valuation ring contains a ℤ_(p)-lattice of rank [L : ℚ_p]

`L.6/k3-torsion-free-lattice` · theorem

Let L/ℚ_p be finite of degree d with valuation ring V. Then K_3(V) = K_3(L) contains a subgroup P ≅ ℤ_(p)^d, meeting the torsion trivially, whose p-adic completion P ⊗ ℤ_p maps isomorphically onto the torsion-free quotient ℤ_p^d of K_3(V; ℤ_p) ≅ ℤ_p^d ⊕ ℤ/w_2^{(p)}(L). Writing T_2 = K_3(L)/torsion, T_2 = Div(T_2) ⊕ R with P ⊂ R and R/P uniquely divisible. Whether 0 → P → K_3(V)/(torsion ⊕ Div) → R/P → 0 splits is not known.

**Hypotheses.**

- L is a finite extension of ℚ_p of degree d = [L : ℚ_p], with valuation ring V = 𝒪_L, residue field 𝔽_q (q = p^f) and ramification index e, so d = ef; p is any prime unless a hypothesis restricts it.

**Proof.**

1. t_2 = d, since λ_1 = 0 (L.6/divisible-rank-relation; Moore's theorem through L.6/even-integral-k-groups).
2. Apply L.6/torsion-free-lattice-lemma to T_2 (a torsion-free ℤ_(p)-module with T_2/p ≅ 𝔽_p^d, L.6/odd-integral-k-groups), and lift P along a splitting K_3(L) ≅ T_2 ⊕ ℤ/w_2(L).
3. The completion of P maps onto T_2^∧ ≅ ℤ_p^d, which is the torsion-free quotient of K_3(V; ℤ_p) (L.6/divisible-rank-relation with T_p(D_1) = 0; L.6/completed-k-groups-of-p-adic-fields).

**Acceptance.**

- L = ℚ_p: K_3(ℤ_p) contains ℤ_(p) with completion the ℤ_p summand of K_3(ℤ_p; ℤ_p).
- The completion of P is not all of K_3(V; ℤ_p) when w_2^{(p)}(L) ≠ 1, e.g. L = ℚ_3 or ℚ_2 (sourceIssues: K-book Corollary VI.7.4.2).

**Depends on.** this roadmap: `L.6/divisible-rank-relation`, `L.6/torsion-free-lattice-lemma`, `L.6/odd-integral-k-groups`, `L.6/completed-k-groups-of-p-adic-fields`, `L.6/even-integral-k-groups`.

**Sources.**

- `Weibel.Handbook.I5`, Corollary 63 (p. 166; PDF p. 28): “Corollary 63 K3(V) contains a torsion free subgroup isomorphic to Zd (p), whose p-adic completion is isomorphic to the torsion free part of K3(V; Zp) = (Zp)d ⊕Z/w(p) 2 .” — The statement.
- `Weibel.Handbook.I5`, After Corollary 63 (p. 166; PDF p. 28): “(p) →K3(V) →U3 →0 splits (see Warning 60).” — The open splitting question, 'I doubt that the extension 0 → Z_(p)^d → K3(V) → U3 → 0 splits'.
- `Kbook.2013`, Corollary VI.7.4.2 (PDF p. 518; book p. 510): “Corollary 7.4.2. K3(V ) contains a torsionfree subgroup isomorphic to Zd (p), whose p-adic completion is isomorphic to K3(V ; Zp) ∼= (Zp)d.” — The K-book's version, corrected here (sourceIssues).

### Even degrees: integral, divisible, completed and cohomological data compared

`L.6/even-integral-to-completed-comparison` · comparison

Let L/ℚ_p be finite and i ≥ 1. The completion map κ: K_{2i}(L) → K_{2i}(L; ℤ_p) ≅ H^2(L, ℤ_p(i + 1)) ≅ ℤ/w_i^{(p)}(L) is surjective, with kernel w_i^{(p)}(L)·K_{2i}(L) = D_i ⊕ K_{2i}(L){p′}, where D_i is the divisible part and K_{2i}(L){p′} ≅ ℤ/(q^i − 1) the prime-to-p torsion. The four passages are: D_i ↪ K_{2i}(L) (kernel 0, cokernel ℤ/w_i(L)); K_{2i}(L) → K_{2i}(L)/D_i ≅ ℤ/w_i(L) (kernel D_i, cokernel 0); ℤ/w_i(L) → K_{2i}(L; ℤ_p) (projection onto the p-part: kernel ℤ/(q^i − 1), cokernel 0); K_{2i}(L; ℤ_p) → H^2(L, ℤ_p(i + 1)) (isomorphism). On the p-primary torsion, K_{2i}(L){p} ≅ (ℚ_p/ℤ_p)^{λ_i} ⊕ ℤ/w_i^{(p)}(L) → K_{2i}(L; ℤ_p) is onto with kernel the divisible p-group D_i{p}.

**Hypotheses.**

- L is a finite extension of ℚ_p of degree d = [L : ℚ_p], with valuation ring V = 𝒪_L, residue field 𝔽_q (q = p^f) and ramification index e, so d = ef; p is any prime unless a hypothesis restricts it.
- i ≥ 1.

**Proof.**

1. T_p(K_{2i−1}(L)) = 0 (L.6/p-primary-torsion-of-odd-k-groups), so L.6/completion-exact-sequence gives K_{2i}(L; ℤ_p) = lim_ν K_{2i}(L)/p^ν.
2. K_{2i}(L)/p^ν ≅ ℤ/gcd(p^ν, w_i^{(p)}) stabilises (L.6/even-k-groups-mod-p-powers), so κ is onto and its kernel is p^N K_{2i}(L) for p^N ≥ w_i^{(p)}, which is w_i^{(p)}(L)·K_{2i}(L).
3. In K_{2i}(L) ≅ D_i ⊕ ℤ/w_i(L) (L.6/even-integral-k-groups) multiplication by w_i^{(p)} fixes D_i and the prime-to-p part and kills the p-part.
4. The identification with H^2 is L.6/even-completed-k-groups-are-h2.

**Acceptance.**

- L = ℚ_3, i = 2: κ: K_4(ℚ_3) → K_4(ℚ_3; ℤ_3) ≅ ℤ/3 has kernel D_2 ⊕ ℤ/8.
- L = ℚ_p, p ≥ 5, i = 1: κ: K_2(ℚ_p) → K_2(ℚ_p; ℤ_p) = 0 has kernel K_2(ℚ_p) = U ⊕ μ_{p−1}.
- Warning (Handbook 60): knowing K_{2i}(L; ℤ_p) does not determine K_{2i}(L); the kernel contains the uncountable divisible D_i.

**Depends on.** this roadmap: `L.6/p-primary-torsion-of-odd-k-groups`, `L.6/completion-exact-sequence`, `L.6/even-k-groups-mod-p-powers`, `L.6/even-integral-k-groups`, `L.6/even-completed-k-groups-are-h2`.

**Sources.**

- `Weibel.Handbook.I5`, Proof of Theorem 61 (p. 165; PDF p. 27): “Since the Tate module of any abelian group is torsion free, and K2i(E; Zp) is finite, we see that the Tate module of K2i−1(E) vanishes and the p-adic completion of K2i(E) is Z/wi.” — The completion of the even groups.
- `Weibel.Handbook.I5`, Warning 60 (p. 164; PDF p. 26): “Even if we know Kn(R; Zℓ) for all primes, we may not still be able to determine the underlying abelian group Kn(R) exactly from this information.” — Why the kernel of κ must be recorded separately.

### Odd degrees: integral, divisible, completed and cohomological data compared

`L.6/odd-integral-to-completed-comparison` · comparison

Let L/ℚ_p be finite of degree d and i ≥ 2. The completion map κ: K_{2i−1}(L) → K_{2i−1}(L; ℤ_p) ≅ H^1(L, ℤ_p(i)) has kernel Div(K_{2i−1}(L)) ⊕ K_{2i−1}(L){p′} = ⋂_ν p^ν K_{2i−1}(L), where Div(K_{2i−1}(L)) ≅ Div(T_i) is a ℚ-vector space and K_{2i−1}(L){p′} ≅ ℤ/(q^i − 1); its image is dense for the p-adic topology; and its cokernel sits in a natural exact sequence 0 → T_i^∧/R_i → coker κ → T_p(D_{i−1}) → 0, with R_i = T_i/Div(T_i), T_i^∧/R_i a ℚ-vector space and T_p(D_{i−1}) ≅ ℤ_p^{λ_{i−1}}. On torsion κ restricts to the isomorphism K_{2i−1}(L){p} ≅ ℤ/w_i^{(p)}(L) = K_{2i−1}(L; ℤ_p)_tors = image of H^0(L, ℚ_p/ℤ_p(i)). The finite generation of K_{2i−1}(L; ℤ_p) over ℤ_p does not transfer to K_{2i−1}(L).

**Hypotheses.**

- L is a finite extension of ℚ_p of degree d = [L : ℚ_p], with valuation ring V = 𝒪_L, residue field 𝔽_q (q = p^f) and ramification index e, so d = ef; p is any prime unless a hypothesis restricts it.
- i ≥ 2.

**Proof.**

1. κ factors as K_{2i−1}(L) → lim_ν K_{2i−1}(L)/p^ν ↪ K_{2i−1}(L; ℤ_p) with cokernel T_p(K_{2i−2}(L)) = T_p(D_{i−1}) (L.6/completion-exact-sequence, L.6/divisible-rank-relation).
2. In K_{2i−1}(L) ≅ T_i ⊕ ℤ/w_i(L) (L.6/odd-integral-k-groups): ⋂_ν p^ν of the finite part is its prime-to-p part, and ⋂_ν p^ν T_i = Div(T_i) (L.6/torsion-free-lattice-lemma (b)); Div(K_{2i−1}(L)) = Div(T_i) because the torsion is finite (L.6/maximal-divisible-subgroup).
3. The cokernel of R_i → T_i^∧ is a ℚ-vector space (L.6/torsion-free-lattice-lemma (d)); the snake lemma for the two-step factorisation gives the exact sequence.
4. Torsion: L.6/p-primary-torsion-of-odd-k-groups and L.6/completed-k-groups-of-p-adic-fields.
5. The identification with H^1 is L.6/odd-completed-k-groups-are-h1.

**Acceptance.**

- L = ℚ_3, i = 2: κ kills Div(K_3(ℚ_3)) ⊕ ℤ/8 and maps K_3(ℚ_3){3} = ℤ/3 onto the torsion of K_3(ℚ_3; ℤ_3) ≅ ℤ_3 ⊕ ℤ/3.
- Degree one, V = ℤ_p (p odd), for contrast: lim_ν K_1(ℤ_p)/p^ν ≅ 1 + pℤ_p ≅ ℤ_p does not determine K_1(ℤ_p) ⊗ ℤ_(p) (Handbook Warning 60; K-book Warning VI.7.5).

**Depends on.** this roadmap: `L.6/completion-exact-sequence`, `L.6/divisible-rank-relation`, `L.6/odd-integral-k-groups`, `L.6/torsion-free-lattice-lemma`, `L.6/maximal-divisible-subgroup`, `L.6/p-primary-torsion-of-odd-k-groups`, `L.6/completed-k-groups-of-p-adic-fields`, `L.6/odd-completed-k-groups-are-h1`.

**Sources.**

- `Kbook.2013`, Warning VI.7.5 (PDF p. 518; book p. 510): “Unfortunately, I do not know how to reconstruct the homotopy groups Kn(V ) from the information in VI.7.4 7.4. Any of the Zp’s in K2i−1(V ; Zp) could come from either a Z(p) in K2i−1(V ) or a Z/p∞in K2i−2(V ).” — The two sources of the ℤ_p's that the cokernel sequence separates.
- `Weibel.Handbook.I5`, Remark 62 (p. 165; PDF p. 27): “Unfortunately, I do not know how to reconstruct the “integral” homotopy groups Kn(V) from the information in 61.” — The same caveat in the survey.

### Milnor K-groups of a local field in degrees ≥ 3

`L.6/milnor-k-of-local-fields` · theorem

Let E be a local field (finite over ℚ_p or isomorphic to 𝔽_q((t))) and n ≥ 3. Then the Milnor K-group K^M_n(E) is uniquely divisible. If char E = 0 it is moreover uncountable. (The sources also assert uncountability when char E = p, citing Tate; the argument they give does not apply in characteristic p, and this case is recorded as a gap.)

**Hypotheses.**

- E a nonarchimedean local field with finite residue field 𝔽_q of characteristic p; n ≥ 3.
- K^M_n is K2SymbolsBrauer T.2's Milnor K-theory; K^M_n(E) ≅ H^n(E, ℤ(n)) (Nesterenko–Suslin–Totaro) is imported from MotivicEtaleKTheory M.4, and the norm-residue and Beilinson–Lichtenbaum inputs from M.5; Geisser–Levine and Bloch–Kato–Gabber (characteristic p) are requested from M.5.

**Proof.**

1. ℓ-divisibility, every prime ℓ: if E contains no primitive ℓ-th root of unity then K_2(E)/ℓ ≅ μ(E)/ℓ = 0 (Moore's theorem, KTheoryFiniteLocalFields:L.3/moore-theorem), so K^M_n(E) = K_2(E)·K^M_{n−2}(E) is ℓ-divisible; if μ_ℓ ⊂ E, then K_2(E)/ℓ ≅ μ_ℓ and for every x ∉ E^{×ℓ} some y gives a generator {x, y} (KTheoryFiniteLocalFields:L.3/norm-residue-split-surjective); for a product {a, b, c} with {b, c} ∉ ℓK_2(E) choose a′, b′ ∉ E^{×ℓ} with {b′, c} ≡ 0 and {a′, b′} ≡ {a, b} modulo ℓK_2(E), so {a, b, c} ≡ {a′, b′, c} ≡ 0 modulo ℓK^M_3(E) (K-book Ex. III.7.4); higher n follow by multiplying.
2. Unique m-divisibility for m invertible in E: from 0 → ℤ(n) → ℤ(n) → ℤ/m(n) → 0 and K^M_n ≅ H^n(E, ℤ(n)) one gets H^{n−1}(E, ℤ/m(n)) → K^M_n(E) →(m) K^M_n(E) → H^n(E, ℤ/m(n)), and by Beilinson–Lichtenbaum (M.5) these are H^{n−1}_et(E, μ_m^{⊗n}) and H^n_et(E, μ_m^{⊗n}), which vanish for n ≥ 4 because cd_ℓ(E) = 2 for ℓ | m (ClassFieldTheory Layer 5 in characteristic 0; the same for 𝔽_q((t)) and ℓ ≠ p). For n = 3 the m-torsion is a quotient of H^2(E, μ_m^{⊗3}) ≅ ℤ/gcd(m, w_2(E)) (L.6/local-duality-for-tate-twists); comparing the sequences for m² and m, the map on H² is the identity and the map m²K^M_3 → mK^M_3 is multiplication by m, hence zero, so the torsion vanishes.
3. p-torsion when char E = p: K_n(E) has no p-torsion and the kernel of K^M_n(E) → K_n(E) is uniquely p-divisible (Geisser–Levine, K-book Theorem VI.4.7; requested from M.5), so K^M_n(E) has no p-torsion.
4. Uncountability in characteristic 0: E has uncountable transcendence degree over ℚ, and the dlog map K^M_n(E) → Ω^n_E has image of that cardinality (K-book Ex. III.7.14 with Ex. III.6.11, valid in characteristic 0).
5. Characteristic p: Ω^n_E = 0 for n ≥ 2 because {t} is a p-basis of 𝔽_q((t)), so the dlog argument gives nothing; the claim is recorded as a gap (Tate's paper, cited by the Handbook, was not read).

**Acceptance.**

- E = ℚ_p, n = 3: K^M_3(ℚ_p) is a ℚ-vector space of uncountable dimension.
- n = 2 is different: K^M_2(E) = K_2(E) has the finite summand μ(E) (Moore).
- E = 𝔽_q((t)): K^M_n(E)/p ≅ Ω^n_{E,log} = 0 for n ≥ 2, consistent with p-divisibility.

**Depends on.** this roadmap: `L.3/moore-theorem`, `L.3/norm-residue-split-surjective`, `L.6/local-duality-for-tate-twists`; other roadmaps: `K2SymbolsBrauer:T.2/milnor-k-theory`, `MotivicEtaleKTheory:M.4`, `MotivicEtaleKTheory:M.5`.

**Sources.**

- `Kbook.2013`, Proposition VI.7.1 (PDF p. 515; book p. 507): “Proposition 7.1. Let E be a local field. For n ≥3, KM n (E) is an uncountable, uniquely divisible group.” — The statement; its uncountability in characteristic p is a gap (sourceIssues).
- `Kbook.2013`, Proof of Proposition VI.7.1 (PDF p. 515; book p. 507): “Since Hn et(E, −) = 0 for n ≥3, this immediately implies that KM n (E) is uniquely m-divisible for n > 3 (and m-divisible for n = 3).” — The cohomological-dimension step.
- `Kbook.2013`, Exercise III.7.4 (PDF p. 265; book p. 257): “Let F be a local field with valuation v and finite residue field k. Show that KM n (F) is divisible for all n ≥3.” — The divisibility step and its hint.
- `Weibel.Handbook.I5`, §5.6, after Theorem 57 (p. 163; PDF p. 25): “Since the transcendence degree of E over Q is uncountable, it follows from Moore’s theorem and the arguments in [40] that the Milnor K-groups KM n (E) are uncountable, uniquely divisible abelian groups for n ≥3.” — The survey's account in characteristic 0.

### Local K-groups are not finitely generated: the Milnor summand

`L.6/uniquely-divisible-summand` · theorem

Let E be a local field with valuation ring V and n ≥ 3. The natural map K^M_n(E) → K_n(E) is split injective, so K_n(E) contains the uniquely divisible group K^M_n(E) as a direct summand, and so does K_n(V) (as K_n(E) ≅ K_n(V) ⊕ K_{n−1}(𝔽_q) and K^M_n(E) maps to zero in the finite group K_{n−1}(𝔽_q)). For n = 2, K_2(E) ⊇ U(E), uncountable and uniquely divisible. Hence K_n(E) and K_n(V) are uncountable and not finitely generated when n = 2, and when n ≥ 2 and char E = 0, although for E finite over ℚ_p every K_n(E; ℤ_p) is a finitely generated ℤ_p-module: finite generation of a completed group does not transfer to K_n(E).

**Hypotheses.**

- E a local field (either characteristic); n ≥ 3 for the Milnor summand.
- Uncountability for n ≥ 3 uses L.6/milnor-k-of-local-fields and is therefore stated only in characteristic 0.

**Proof.**

1. The composite K^M_n(E) → K_n(E) →(c_{n,n}) H^{n,n}(E) ≅ K^M_n(E) is multiplication by (−1)^{n−1}(n − 1)! (K-book Lemma V.11.13; requested from MotivicEtaleKTheory M.6), the first map being K2SymbolsBrauer:T.2/graded-map.
2. K^M_n(E) is uniquely divisible for n ≥ 3 (L.6/milnor-k-of-local-fields), so (−1)^{n−1}(n − 1)! is an automorphism of it and ((−1)^{n−1}(n − 1)!)^{−1} ∘ c_{n,n} is a retraction.
3. K_n(E) ≅ K_n(V) ⊕ K_{n−1}(𝔽_q) (KTheoryFiniteLocalFields:L.2/even-k-field-splitting for n even; K_{n−1}(𝔽_q) = 0 for n odd, KTheoryFiniteLocalFields:L.2/odd-k-ring-of-integers-equals-field); a divisible group maps to zero in a finite group, so the summand lies in K_n(V).
4. n = 2: U(E) is uncountable and uniquely divisible (KTheoryFiniteLocalFields:L.3/moore-kernel-uncountable, KTheoryFiniteLocalFields:L.3/moore-theorem).
5. Finite generation of the completed groups: L.6/completed-k-groups-of-p-adic-fields.

**Acceptance.**

- E = ℚ_p, n = 3: K_3(ℚ_p; ℤ_p) ≅ ℤ_p ⊕ ℤ/w_2^{(p)} is finitely generated while K_3(ℚ_p) ⊇ K^M_3(ℚ_p) is uncountable.
- E = 𝔽_q((t)), n = 2: K_2(E; ℤ_p) = 0 (L.6/equal-characteristic-completed-k-groups) while K_2(E) ⊇ U(E) is uncountable.

**Depends on.** this roadmap: `L.6/milnor-k-of-local-fields`, `L.2/even-k-field-splitting`, `L.2/odd-k-ring-of-integers-equals-field`, `L.3/moore-kernel-uncountable`, `L.3/moore-theorem`, `L.6/completed-k-groups-of-p-adic-fields`; other roadmaps: `K2SymbolsBrauer:T.2/graded-map`, `MotivicEtaleKTheory:M.6`.

**Sources.**

- `Kbook.2013`, VI.7, p-adic local fields (PDF p. 516; book p. 508): “Thus, as in the equicharacteristic case, Kn(E) will contain an uncountable uniquely divisible summand about which we can say very little.” — The conclusion.
- `Kbook.2013`, Lemma V.11.13 (PDF p. 466; book p. 458): “Lemma 11.13. Let F be a field. Then the composition of KM i (F) →Ki(F) and ci,i : Ki(F) →Hi,i(Spec(F)) ∼= KM i (F) is multiplication by (−1)i−1(i−1)!.” — The retraction.
- `Weibel.Handbook.I5`, §5.6, after Theorem 57 (p. 163; PDF p. 25): “By [61], this is a summand of the Quillen K-group Kn(E). As in the equicharacteristic case, Kn(E) will contain an uncountable uniquely divisible summand about which we can say very little.” — The same in the survey.

### Hesselholt–Madsen Theorem D: the p-adic homotopy type of K(L)

`L.6/hm-theorem-d` · theorem · planet “Hesselholt–Madsen homotopy type”

Let L be a finite extension of ℚ_p of degree d with p odd and valuation ring V. Let r = [L(ζ_p) : L], p^a = #μ_{p^∞}(L(ζ_p)), g ∈ ℤ_p^× a topological generator and k = g^{p^{a−1}(p−1)/r}. Then after p-completion ℤ × BGL(L)^+ ≃ FΨ^k × BFΨ^k × U^d and ℤ × BGL(V)^+ ≃ FΨ^k × BFΨ^k × U^{d−1} × SU, where FΨ^k is the homotopy fibre of Ψ^k − 1: ℤ × BU → BU (p-completed, with the p-adic Adams operation Ψ^k). In particular π_{2i−1}(FΨ^k) ≅ ℤ_p/(k^i − 1) ≅ ℤ/w_i^{(p)}(L), which recovers the groups of L.6/completed-k-groups-of-p-adic-fields.

**Hypotheses.**

- L is a finite extension of ℚ_p of degree d = [L : ℚ_p], with valuation ring V = 𝒪_L, residue field 𝔽_q (q = p^f) and ramification index e, so d = ef; p is any prime unless a hypothesis restricts it.
- p odd.
- The p-adic homotopy type of étale K-theory of L (Dwyer–Mitchell and Thomason, cited by Hesselholt–Madsen as [45] and [8]) was not read; it is recorded as a gap.
- The p-adic Adams operations Ψ^k, k ∈ ℤ_p^×, on the p-completion of BU are requested from RefinedTraceMethods RT.4:topological; FΨ^q for integral q is L.1/fpsi.

**Proof.**

1. By L.6/hm-etale-comparison, K(L)^∧_p → K^ét(L)^∧_p is an equivalence on connective covers above degree 0; the homotopy type of K^ét(L)^∧_p is the cited étale calculation (gap).
2. Homotopy groups check: π_{2i−1}(FΨ^k) = ℤ_p/(k^i − 1) and v_p(k^i − 1) = a + v_p(i) if r | i and 0 otherwise, because g^m ≡ 1 mod p iff (p − 1) | m and v_p(g^{(p−1)m′} − 1) = 1 + v_p(m′); with m = p^{a−1}(p − 1)i/r this matches L.6/p-adic-w-invariant.
3. The degree count: π_{2i}(BFΨ^k) = π_{2i−1}(FΨ^k) = ℤ/w_i^{(p)} and π_{2i−1}(U^d) = ℤ_p^d give L.6/completed-k-groups-of-p-adic-fields; π_1 = ℤ_p (from BFΨ^k) ⊕ ℤ_p^d ⊕ ℤ/w_1^{(p)} matches (L^×)^∧_p.

**Acceptance.**

- L = ℚ_p, p odd: r = p − 1, a = 1, k = g; π_3 = ℤ_p ⊕ ℤ_p/(g² − 1), and ℤ_p/(g² − 1) ≅ ℤ/w_2^{(p)}(ℚ_p) (ℤ/3 for p = 3, 0 for p ≥ 5).
- L = ℚ_p(ζ_p): r = 1, k = g^{p−1}, and π_{2i−1}FΨ^k ≅ ℤ/p^{1+v_p(i)} for every i.

**Depends on.** this roadmap: `L.6/hm-etale-comparison`, `L.6/p-adic-w-invariant`, `L.6/completed-k-groups-of-p-adic-fields`, `L.1/completed-k-theory`, `L.1/fpsi`; other roadmaps: `RefinedTraceMethods:RT.4:topological`, `MotivicEtaleKTheory:M.7`.

**Sources.**

- `HesselholtMadsen.2003`, Theorem D (Annals p. 6): “Theorem D. If K is a finite extension of Qp, then after p-completion Z × BGL(K)+ ≃FΨgpa−1d × BFΨgpa−1d × U |K :Qp|, where d = (p −1)/|K(µp) : K|, a = max{v | µpv ⊂K(µp)}, and where g ∈Z× p is a topological generator.” — The statement for the field.
- `HesselholtMadsen.2003`, Introduction, before Theorem D (Annals p. 6): “For K a finite extension of Qp, the p-adic homotopy type of the K´et(K) is known by [45] and [8].” — The unread input (gap).
- `Kbook.2013`, Theorem VI.7.9 (PDF p. 519; book p. 511): “Theorem 7.9. (HM [88, thm.D]) Let E be a local field, of degree d over Qp, with p odd. Then after p-completion, there is a number k (given below) so that” — The K-book's version, which adds the valuation ring.
- `Weibel.Handbook.I5`, Theorem 67 (p. 167; PDF p. 29): “It is an easy exercise, left to the reader, to check that π2i−1FΨk = Zp/(ki −1) is Z/wi for all i.” — The homotopy-group check, with w_i = w_i^{(p)}(E) in the survey's notation.

### The de Rham–Witt complex of 𝔽_q[[t]] and 𝔽_q((t)), and 1 − F on its relative part

`L.6/power-series-de-rham-witt` · lemma

Let k = 𝔽_q, V = k[[t]], E = k((t)) and I = (t). (a) W_nΩ^q_V = 0 and W_nΩ^q_E = 0 for every n ≥ 1 and q ≥ 2, hence WΩ^q_V = WΩ^q_E = 0 for q ≥ 2. (b) On the relative groups WΩ^q_{(V,I)} = ker(WΩ^q_V → WΩ^q_k) the map 1 − F is surjective for every q, and its kernel is canonically isomorphic to the big de Rham–Witt group 𝕎Ω^{q−1}_k = ∏_{j ∈ I_p} WΩ^{q−1}_k, where I_p is the set of positive integers prime to p. Since WΩ^0_k = W(k) and WΩ^m_k = 0 for m ≥ 1 (k perfect), the kernel is ∏_{j ∈ I_p} W(k) for q = 1 and 0 for q ≠ 1.

**Hypotheses.**

- E = 𝔽_q((t)) with valuation ring V = 𝔽_q[[t]], maximal ideal I = (t) and residue field 𝔽_q, q = p^f; 𝔽_q ⊂ V is the canonical coefficient field (the roots of x^q = x), so V → 𝔽_q is split.
- WΩ is the p-typical de Rham–Witt complex of Bloch–Deligne–Illusie (CrystallineCohomology CR.4), WΩ^q = lim_R W_nΩ^q.

**Proof.**

1. Geisser–Hesselholt's Theorem B with A = k (a noetherian 𝔽_p-algebra finite over its p-th powers): every ω ∈ W_nΩ^q_{k[[t]]} is uniquely a convergent series Σ a_{0,i}[t]^i + Σ b_{0,i}[t]^{i−1}d[t] + Σ_{s ≥ 1, j ∈ I_p} (V^s(a_{s,j}[t]^j) + dV^s(b_{s,j}[t]^j)) with a_{s,i} ∈ W_{n−s}Ω^q_k and b_{s,i} ∈ W_{n−s}Ω^{q−1}_k. For q ≥ 2 all coefficient groups vanish because W_mΩ^m′_k = 0 for m′ ≥ 1 (k perfect), so W_nΩ^q_V = 0 (the polynomial case is CR.4's basic Witt differentials; the extension to power series is this theorem).
2. W_nΩ^*_E is the localisation of W_nΩ^*_V at the Teichmüller [t] (compatibility of de Rham–Witt with étale maps and localisation, CR.4), hence also zero in degrees q ≥ 2.
3. (b) Geisser–Hesselholt Proposition 2.8 (surjectivity of 1 − F on WΩ^q_{(A[[t]],(t))}) and the computation at the end of their §2: the kernel is the product over I_p of copies of WΩ^{q−1}_A, i.e. the big de Rham–Witt group; put A = k.

**Acceptance.**

- q = 1: ker(1 − F | WΩ^1_{(V,I)}) ≅ ∏_{j ∈ I_p} W(𝔽_q), matching U_1 = 1 + t𝔽_q[[t]] ≅ big Witt vectors of 𝔽_q (K-book VI.7) through dlog.
- The analogue for a mixed-characteristic valuation ring is false: the log de Rham–Witt groups of 𝒪_L are nonzero in degree 2 (L.5).

**Depends on.** other roadmaps: `CrystallineCohomology:CR.4`; libraries: `mathlib:WittVector`.

**Sources.**

- `GeisserHesselholt.2006`, Theorem B (introduction, p. 3 of the author preprint): “Theorem B Let A be a noetherian Fp-algebra and suppose that A is finitely generated as an Ap-module. Then every element ω(n) ∈WnΩq A[[t]] can be written uniquely as an infinite series” — The expansion used in (a).
- `GeisserHesselholt.2006`, Proposition 2.8 (p. 16 of the author preprint): “Proposition 2.8 Let A be a noetherian Fp-algebra and suppose that A is a finitely generated Ap-module. Then the map 1 −F : WΩq (R,I) →WΩq (R,I) is surjective.” — Surjectivity in (b).
- `GeisserHesselholt.2006`, End of §2 (p. 18 of the author preprint): “It follows that the kernel of 1 −F is isomorphic to a product indexed by Ip of copies of WΩq−1 A . This group is canonically isomorphic to the big de Rham Witt group WΩq−1 A introduced in [9].” — The kernel in (b).

### Geisser–Hesselholt: p-adic K-theory of regular local 𝔽_p-algebras is the kernel of 1 − F

`L.6/geisser-hesselholt-regular-local` · theorem

Let A be a regular local 𝔽_p-algebra. Then the composite K_q(A; ℤ_p) → TC_q(A; p) → WΩ^q_A of the cyclotomic trace and the map of the long exact sequence ⋯ → TC_q(A; p) → WΩ^q_A →(1−F) WΩ^q_A → TC_{q−1}(A; p) → ⋯ is an isomorphism onto ker(1 − F: WΩ^q_A → WΩ^q_A), for every q ≥ 0. The same holds for the relative groups of A[[t]] and the ideal (t) when A is moreover finite over A^p.

**Hypotheses.**

- A regular local 𝔽_p-algebra (for example 𝔽_q, 𝔽_q[[t]] or 𝔽_q((t))).

**Proof.**

1. The TC sequence for regular 𝔽_p-algebras: KTheoryFiniteLocalFields:L.5/tc-of-regular-fp-algebra (from L.5/tr-of-smooth-fp-algebra and Popescu).
2. Essentially smooth local A: K_q(A) is p-torsion-free and K_q(A)/p^n is generated by symbols (Geisser–Levine; requested from MotivicEtaleKTheory M.5), so K_q(A) → TR^n_q(A; p) factors through W_nΩ^q_A; the induced K_q(A)/p^n → W_nΩ^q_A is injective with image W_nΩ^q_{A,log} (Bloch–Kato–Gabber and Geisser–Levine, M.5).
3. Illusie I.5.7.4 (CrystallineCohomology CR.4): W_nΩ^q_{A,log} ⊆ ker(R − F: W_nΩ^q_A → W_{n−1}Ω^q_A) ⊆ W_nΩ^q_{A,log} + Fil^{n−1}W_nΩ^q_A; passing to the limit over n identifies the image with ker(1 − F).
4. All statements commute with filtered colimits, and a regular local 𝔽_p-algebra is a filtered colimit of essentially smooth local ones (Popescu), which gives the general case; K_q(A; ℤ_p) is the p-completed group of L.1/completed-k-theory, TC(A; p) being p-complete.
5. Relative version: apply the absolute statement to A[[t]] and to A and take kernels (the splitting A → A[[t]] → A).

**Acceptance.**

- A = 𝔽_q: WΩ^q_{𝔽_q} = W(𝔽_q) for q = 0 and 0 otherwise; ker(1 − F) = ℤ_p = K_0(𝔽_q; ℤ_p), and K_q(𝔽_q; ℤ_p) = 0 for q ≥ 1 (L.1).
- A = 𝔽_q((t)), q ≥ 2: WΩ^q = 0, so K_q(𝔽_q((t)); ℤ_p) = 0 (L.6/equal-characteristic-completed-k-groups).

**Depends on.** this roadmap: `L.5/tc-of-regular-fp-algebra`, `L.5/tr-of-smooth-fp-algebra`, `L.4/p-typical-tc`, `L.1/completed-k-theory`; other roadmaps: `CrystallineCohomology:CR.4`, `MotivicEtaleKTheory:M.5`.

**Sources.**

- `GeisserHesselholt.2006`, Theorem 3.1 (p. 19 of the author preprint): “Theorem 3.1 Let A be a regular local Fp-algebra. Then the composite map Kq(A, Zp) →TCq(A; p) →WΩq A is an isomorphism onto the kernel of 1 −F.” — The statement.
- `GeisserHesselholt.2006`, Proof of Theorem 3.1 (p. 19 of the author preprint): “Suppose first that A is an essentially smooth local Fp-algebra. Then it was proved in [5] that Kq(A) is p-torsion free and that Kq(A)/pn is generated by symbols.” — The Geisser–Levine input.
- `Kbook.2013`, Theorem VI.4.7 (PDF p. 493; book p. 485): “Theorem 4.7. Let k be a field of characteristic p. Then for all n ≥0, (a) for all ν > 0, the map KM n (k)/pν →Kn(k; Z/pν) is an isomorphism; (b) Kn(k) has no p-torsion;” — The Geisser–Levine theorem for fields, as the K-book states it.

### Relative p-adic K-theory of 𝔽_q[[t]] is the big de Rham–Witt group of 𝔽_q

`L.6/equal-characteristic-relative-k-theory` · theorem

Let V = 𝔽_q[[t]] and I = (t). Then K(V) ≃ K(𝔽_q) ∨ K(V, I), split by the coefficient field 𝔽_q ⊂ V, and there is a canonical isomorphism K_q(V, I; ℤ_p) ≅ 𝕎Ω^{q−1}_{𝔽_q} = ∏_{j ∈ I_p} WΩ^{q−1}_{𝔽_q}. Hence K_q(V, I; ℤ_p) = 0 for q ≠ 1 and K_1(V, I; ℤ_p) ≅ ∏_{j ∈ I_p} W(𝔽_q), which is the group U_1 = 1 + t𝔽_q[[t]] = K_1(V, I) (the big Witt vectors of 𝔽_q).

**Hypotheses.**

- E = 𝔽_q((t)) with valuation ring V = 𝔽_q[[t]], maximal ideal I = (t) and residue field 𝔽_q, q = p^f; 𝔽_q ⊂ V is the canonical coefficient field (the roots of x^q = x), so V → 𝔽_q is split.
- I_p is the set of positive integers prime to p.

**Proof.**

1. The maps 𝔽_q → V → 𝔽_q compose to the identity, so K(V) ≃ K(𝔽_q) ∨ K(V, I) with K(V, I) the fibre of K(V) → K(𝔽_q) (Geisser–Hesselholt, introduction).
2. L.6/geisser-hesselholt-regular-local (relative version, A = 𝔽_q, which is finite over its p-th powers) identifies K_q(V, I; ℤ_p) with ker(1 − F) on WΩ^q_{(V,I)}; L.6/power-series-de-rham-witt (b) identifies that kernel with 𝕎Ω^{q−1}_{𝔽_q} and computes it.
3. Degree one: K_1(V, I) = (1 + I)^× = U_1 because V is local (SK_1 = 0; KTheoryLowDegrees U.3 as requested by L.3), and U_1 is already a p-adically complete ℤ_p-module, the product over I_p of copies of W(𝔽_q) (K-book VI.7 and Ex. VI.7.2).

**Acceptance.**

- K_2(𝔽_q[[t]], (t); ℤ_p) = 0.
- K_1(𝔽_q[[t]], (t); ℤ_p) ≅ ∏_{j ∈ I_p} W(𝔽_q) is not a finitely generated ℤ_p-module (K-book Ex. VI.7.1–7.2: not even free).

**Depends on.** this roadmap: `L.6/geisser-hesselholt-regular-local`, `L.6/power-series-de-rham-witt`, `L.1/completed-k-theory`; other roadmaps: `KTheoryLowDegrees:U.3`; libraries: `mathlib:WittVector`.

**Sources.**

- `GeisserHesselholt.2006`, End of §2 (p. 18 of the author preprint): “This also implies a canonical isomorphism Kq(A[[t]], (t), Zp) ∼ −→WΩq−1 A with the relative p-adic K-group on the left.” — The isomorphism, with A = 𝔽_q.
- `GeisserHesselholt.2006`, Introduction (p. 2 of the author preprint): “The K-theory spectra of the rings R and R/Is naturally decompose as wedge sums” — The splitting.
- `Kbook.2013`, VI.7, equicharacteristic local fields (PDF p. 515; book p. 507): “In this case, µ(E) = F× q , and U1 = 1 + πFq[[π]] is isomorphic to the big Witt vectors of Fq (II.II.4.3 4.3), which is the product of a countably infinite number of copies of Zp” — The description of U_1 in degree one.

### p-adic and mod-p^ν K-theory of 𝔽_q[[t]] and 𝔽_q((t)) vanish above degree one

`L.6/equal-characteristic-completed-k-groups` · theorem

Let E = 𝔽_q((t)) and V = 𝔽_q[[t]]. Then K_q(V; ℤ_p) = K_q(E; ℤ_p) = 0 for q ≥ 2, K_1(V; ℤ_p) ≅ U_1 and K_1(E; ℤ_p) ≅ U_1 × ℤ_p; and K_q(E; ℤ/p^ν) = K_q(V; ℤ/p^ν) = 0 for q ≥ 2 and every ν, with K_1(E; ℤ/p^ν) = E^×/E^{×p^ν}. So the completion map κ: K_q(E) → K_q(E; ℤ_p) is zero for q ≥ 2: in equal characteristic there is no analogue of the rank [L : ℚ_p] or of the p-primary finite components.

**Hypotheses.**

- E = 𝔽_q((t)) with valuation ring V = 𝔽_q[[t]], maximal ideal I = (t) and residue field 𝔽_q, q = p^f; 𝔽_q ⊂ V is the canonical coefficient field (the roots of x^q = x), so V → 𝔽_q is split.

**Proof.**

1. K_q(𝔽_q; ℤ_p) = 0 for q ≥ 1 (L.1/completed-k-theory, test completedGroup_finiteField_char), so K_q(V; ℤ_p) = K_q(V, I; ℤ_p), which L.6/equal-characteristic-relative-k-theory computes.
2. L.6/ring-of-integers-versus-field gives K_q(E; ℤ_p) ≅ K_q(V; ℤ_p) for q ≥ 2 and the degree-one extension 0 → U_1 → K_1(E; ℤ_p) → ℤ_p → 0, split since ℤ_p is free. Independently, L.6/geisser-hesselholt-regular-local for the field E and WΩ^q_E = 0 (L.6/power-series-de-rham-witt (a)) give K_q(E; ℤ_p) = 0 for q ≥ 2.
3. Finite coefficients: K(E; ℤ_p)/p^ν ≃ K(E)/p^ν (L.1/completed-k-theory, API completed_mod) gives 0 → K_q(E; ℤ_p)/p^ν → K_q(E; ℤ/p^ν) → K_{q−1}(E; ℤ_p)[p^ν] → 0; for q ≥ 2 the outer terms vanish, K_1(E; ℤ_p) = U_1 × ℤ_p being torsion-free ((1 + x)^p = 1 + x^p in characteristic p). The same for V.
4. Second route: Geisser–Levine, K_q(E; ℤ/p^ν) ≅ K^M_q(E)/p^ν, with K^M_q(E)/p ≅ Ω^q_{E,log} ⊆ Ω^q_E = 0 for q ≥ 2 (MotivicEtaleKTheory M.5). Third route: Clausen–Mathew–Morrow's Theorem 6.5 with d = 1.

**Acceptance.**

- K_3(𝔽_q((t)); ℤ_p) = 0, while K_3(ℚ_p; ℤ_p) ≅ ℤ_p ⊕ ℤ/w_2^{(p)}(ℚ_p).
- K_2(𝔽_q((t)); ℤ/p) = 0, consistent with Moore's theorem: K_2(E) = U(E) ⊕ 𝔽_q^× with U(E) uniquely divisible and #𝔽_q^× prime to p.
- K_1(𝔽_q[[t]]; ℤ_p) ≅ U_1 is not finitely generated, unlike K_1(ℤ_p; ℤ_p) ≅ ℤ_p (p odd).

**Depends on.** this roadmap: `L.6/equal-characteristic-relative-k-theory`, `L.6/geisser-hesselholt-regular-local`, `L.6/power-series-de-rham-witt`, `L.1/completed-k-theory`, `L.6/ring-of-integers-versus-field`; other roadmaps: `MotivicEtaleKTheory:M.5`.

**Sources.**

- `GeisserHesselholt.2006`, Theorem 3.1 (p. 19 of the author preprint): “Theorem 3.1 Let A be a regular local Fp-algebra. Then the composite map Kq(A, Zp) →TCq(A; p) →WΩq A is an isomorphism onto the kernel of 1 −F.” — Applied to A = 𝔽_q((t)), where WΩ^q = 0 for q ≥ 2.
- `CMM.2018`, Theorem 6.5 (p. 52): “The map K(R)/pr →TC(R)/pr is an equivalence in degrees ≥d for any r.” — The third route to the finite-coefficient vanishing, with d = 1 for 𝔽_q((t)) and 𝔽_q[[t]].

### The K-groups of 𝔽_q((t)) and 𝔽_q[[t]] are uniquely p-divisible above degree one

`L.6/equal-characteristic-unique-p-divisibility` · lemma

Let E = 𝔽_q((t)) and V = 𝔽_q[[t]]. For q ≥ 2, K_q(E) and K_q(V) are uniquely p-divisible, and K_q(E), K_q(V) have no p-torsion for q ≥ 1.

**Hypotheses.**

- E = 𝔽_q((t)) with valuation ring V = 𝔽_q[[t]], maximal ideal I = (t) and residue field 𝔽_q, q = p^f; 𝔽_q ⊂ V is the canonical coefficient field (the roots of x^q = x), so V → 𝔽_q is split.

**Proof.**

1. The universal coefficient sequence 0 → K_q(E)/p → K_q(E; ℤ/p) → K_{q−1}(E)[p] → 0 (L.1/k-theory-mod-m) with K_q(E; ℤ/p) = 0 for q ≥ 2 (L.6/equal-characteristic-completed-k-groups) gives K_q(E)/p = 0 for q ≥ 2 and K_{q−1}(E)[p] = 0 for q ≥ 2.
2. The same for V.

**Acceptance.**

- K_2(𝔽_q((t))) = U(E) ⊕ 𝔽_q^× is uniquely p-divisible, since U(E) is uniquely divisible and p ∤ q − 1.
- K_1(𝔽_q((t))) = E^× has no p-torsion ((1 + x)^p = 1 + x^p) but is not p-divisible (t is not a p-th power).

**Depends on.** this roadmap: `L.6/equal-characteristic-completed-k-groups`, `L.1/k-theory-mod-m`.

**Sources.**

- `Kbook.2013`, Proof of Theorem VI.7.2 (PDF p. 516; book p. 508): “It suffices to show that Un is uncountable and uniquely p-divisible when n ≥2” — The p-divisibility the source reduces to; here it comes from the de Rham–Witt computation.
- `Kbook.2013`, Theorem VI.4.7 (PDF p. 493; book p. 485): “Theorem 4.7. Let k be a field of characteristic p. Then for all n ≥0, (a) for all ν > 0, the map KM n (k)/pν →Kn(k; Z/pν) is an isomorphism; (b) Kn(k) has no p-torsion;” — Geisser–Levine's form of the same conclusion for E.

### The K-groups of 𝔽_q((t)) and 𝔽_q[[t]]

`L.6/equal-characteristic-integral-structure` · theorem · planet “K-theory of equal-characteristic local fields”

Let E = 𝔽_q((t)), V = 𝔽_q[[t]] and n ≥ 2. There are canonical isomorphisms K_n(E) ≅ K_n(V) ⊕ K_{n−1}(𝔽_q) and K_n(V) ≅ K_n(𝔽_q) ⊕ U_n, where U_n = ker(K_n(V) → K_n(𝔽_q)) = K_n(V, (t)) is uniquely divisible. Thus K_{2i}(E) ≅ U_{2i} ⊕ ℤ/(q^i − 1) and K_{2i+1}(E) = K_{2i+1}(V) ≅ U_{2i+1} ⊕ ℤ/(q^{i+1} − 1); the torsion of K_n(E) is K_n(𝔽_q) ⊕ K_{n−1}(𝔽_q), of order prime to p, and Div(K_n(E)) = U_n. U_2 = U(E) is uncountable (Moore's kernel) and U_n ⊇ K^M_n(E) as a direct summand for n ≥ 3. With finite coefficients: K_n(E; ℤ/m) ≅ K_n(𝔽_q; ℤ/m) ⊕ K_{n−1}(𝔽_q; ℤ/m) for p ∤ m, and K_n(E; ℤ/p^ν) = 0.

**Hypotheses.**

- E = 𝔽_q((t)) with valuation ring V = 𝔽_q[[t]], maximal ideal I = (t) and residue field 𝔽_q, q = p^f; 𝔽_q ⊂ V is the canonical coefficient field (the roots of x^q = x), so V → 𝔽_q is split.
- n ≥ 2.
- The uncountability of U_n for n ≥ 3 asserted by the sources is recorded as a gap (see L.6/milnor-k-of-local-fields).

**Proof.**

1. K_n(E) ≅ K_n(V) ⊕ K_{n−1}(𝔽_q): KTheoryFiniteLocalFields:L.2/even-k-field-splitting for n even (canonical); for n odd, K_{n−1}(𝔽_q) = 0 and K_n(V) ≅ K_n(E) (KTheoryFiniteLocalFields:L.2/odd-k-ring-of-integers-equals-field).
2. K_n(V) ≅ K_n(𝔽_q) ⊕ U_n from the canonical section 𝔽_q ⊂ V (L.6/equal-characteristic-relative-k-theory).
3. U_n is uniquely ℓ-divisible for ℓ ≠ p: K(V, (t))/ℓ ≃ 0 by rigidity (KTheoryFiniteLocalFields:L.2/rigidity-finite-residue-field).
4. U_n is uniquely p-divisible: it is a direct summand of K_n(V), which is uniquely p-divisible for n ≥ 2 (L.6/equal-characteristic-unique-p-divisibility).
5. The torsion statement and Div(K_n(E)) = U_n follow (L.6/maximal-divisible-subgroup); K_n(𝔽_q) is L.1/quillen-k-groups.
6. U_2 = K_2(V) = U(E), the kernel of the norm residue map, which is uncountable (KTheoryFiniteLocalFields:L.3/moore-equal-characteristic, KTheoryFiniteLocalFields:L.3/moore-kernel-uncountable). For n ≥ 3, K^M_n(E) is a uniquely divisible direct summand (L.6/uniquely-divisible-summand).
7. Finite coefficients: prime to p from rigidity and the split localisation sequence (L.2); p-power coefficients from L.6/equal-characteristic-completed-k-groups.

**Acceptance.**

- n = 3: K_3(𝔽_q((t))) ≅ U_3 ⊕ ℤ/(q² − 1), the Harris–Segal summand K_3(𝔽_q).
- n = 2: K_2(𝔽_q((t))) ≅ U(E) ⊕ 𝔽_q^×, Moore's theorem in characteristic p (L.3), with the tame symbol as the projection.
- No p-torsion anywhere in positive degrees, in contrast with ℤ/w_i^{(p)}(L) for p-adic L.

**Depends on.** this roadmap: `L.2/even-k-field-splitting`, `L.2/odd-k-ring-of-integers-equals-field`, `L.2/rigidity-finite-residue-field`, `L.6/equal-characteristic-completed-k-groups`, `L.6/equal-characteristic-relative-k-theory`, `L.6/equal-characteristic-unique-p-divisibility`, `L.6/maximal-divisible-subgroup`, `L.1/quillen-k-groups`, `L.3/moore-equal-characteristic`, `L.3/moore-kernel-uncountable`, `L.6/uniquely-divisible-summand`.

**Sources.**

- `Kbook.2013`, Theorem VI.7.2 (PDF p. 516; book p. 508): “Theorem 7.2. Let V = Fq[[π]] be the ring of integers in the local field E = Fq((π)). For n ≥2 there are uncountable, uniquely divisible abelian groups Un and canonical isomorphisms:” — The statement; the uncountability for n ≥ 3 is a gap (sourceIssues).
- `Kbook.2013`, Proof of Theorem VI.7.2 (PDF p. 516; book p. 508): “Un is uniquely ℓ-divisible for all ℓ̸ = p and n > 0. It suffices to show that Un is uncountable and uniquely p-divisible when n ≥2” — The structure of the proof.
- `Weibel.Handbook.I5`, Theorem 56 (p. 162; PDF p. 24): “Theorem 56 Let V = Fq[[π]] be the ring of integers in the local field E = Fq((π)). For n ≥2 there are uncountable, uniquely divisible abelian groups Un so that” — The same theorem in the survey.
- `Weibel.Handbook.I5`, Proof of Theorem 56 (p. 163; PDF p. 25): “If n ≥2 then KM n (E) is a summand of the Quillen K-group Kn(E) by [61]. On the other hand, Geisser and Levine proved in [19] that the complementary summand is uniquely p-divisible.” — The survey's p-divisibility argument; this node uses the de Rham–Witt route instead.

## L.7 — Local-to-global compatibility

*Coverage: partial.* The stage text asks for the compatibility of local restriction and transfer, arithmetic Chern classes, Hilbert symbols and cyclotomic traces with completion of a number field at a finite place. The completion maps are L.7/completion-map; restriction and transfer are L.7/restriction-completion-square and L.7/transfer-completion-formula; the localisation boundary, which N's local conditions need, is L.7/boundary-completion-compatibility, from L.7/boundary-at-a-prime-via-localisation and Karoubi's square L.7/karoubi-completion-square; Hilbert symbols are L.7/hilbert-symbol-completion, including the kernel of K₂(F) → K₂(F_v) on torsion classes that ArithmeticKTheory N.6 requests; étale Chern classes are L.7/etale-chern-class-completion and L.7/unramified-chern-class-reduction, the latter supplying HabiroNumberFields HB.2's request (CGZ Lemma 4.1); cyclotomic traces are L.7/cyclotomic-trace-completion, on L.4's localisation square. 'D's regulator map' and 'the completed K₃ model' are L.7/semilocal-completed-map with its restriction and transfer compatibilities; the completed groups K_n(F_v; ℤ_p) themselves are L.6's, and the unramified p > 3 regulator theorem, the Frobenius compatibility and the regulator export stay with PadicHodgeRegulators D.3–D.4 (restructure). The stage text concerns finite places only: the real places that N.6's wild kernel also uses are not supplied here (restructure).

- Remaining: The semilocal equivalence E ⊗_F F_v ≅ ∏_{w|v} E_w (NumberFieldArithmetic Layer 5) is requested, not planned here.
- Remaining: Étale Chern classes and their functoriality (MotivicEtaleKTheory M.8), the étale–Galois comparison and henselian rigidity for étale cohomology (M.1), unramified subgroups and inflation (ArithmeticGaloisDuality D7) and the naturality of the cyclotomic trace (RefinedTraceMethods RT.3) are requested.
- Remaining: L.7/hilbert-symbol-completion (c) inherits the Merkurjev gap of L.3.
- Remaining: Karoubi's square is planned for discrete valuation rings only; the general Proposition V.7.5 is proposed for GeneralAlgebraicKTheory (restructure).

### The completion maps K_n(F) → K_n(F_v)

`L.7/completion-map` · definition · planet “Completion maps K_n(F) → K_n(F_v)”

Setting (pinned for the layer): F is a number field, 𝓞_F its ring of integers, v ∈ HeightOneSpectrum 𝓞_F a finite place, F_v = v.adicCompletion F (a nonarchimedean local field by Tau Ceti's isNonarchimedeanLocalField_adicCompletion), 𝓞_v = v.adicCompletionIntegers F, 𝓞_(v) the localisation of 𝓞_F at v, and k(v) = 𝓞_F/v, identified with the residue field of F_v by Tau Ceti's residueFieldEquivAdicCompletion. K-groups are Quillen's (GeneralAlgebraicKTheory K.1), with finite coefficients K_n(−; ℤ/m) and ℓ-adic coefficients K_n(−; ℤ_ℓ) as in StableHomotopyKTheory H.6. Definition: c_v : K_n(F) → K_n(F_v) is the map induced by the ring homomorphism F → F_v (base change P(F) → P(F_v)); likewise c_v : K_n(𝓞_F) → K_n(𝓞_v) and K_n(𝓞_(v)) → K_n(𝓞_v), and, by the same functoriality on spectra, c_v : K_n(F; ℤ/m) → K_n(F_v; ℤ/m) and K_n(F; ℤ_ℓ) → K_n(F_v; ℤ_ℓ). These are the maps K_{2i}(F) → K_{2i}(F_v) of the wild kernel. c_v is a homomorphism of graded rings K_*(F) → K_*(F_v), compatible with the maps from K_*(𝓞_F), with the Bockstein sequences and with change of coefficients.

**Hypotheses.**

- F is a number field and v a finite place; F_v is the completion (not an arbitrary local field with an embedding).
- Real and complex places are outside this layer's text (see coverage).

**Proof.**

1. K-theory is a functor of rings (GeneralAlgebraicKTheory K.1/K-groups-of-exact-categories: a ring map induces A′ ⊗_A −); apply it to F → F_v and 𝓞_F → 𝓞_v → F_v.
2. Products: base change is monoidal, so c_v is multiplicative (K.7/biexact-pairings-and-products).
3. Coefficients: smash the map of K-theory spectra with the Moore spectrum, and take the ℓ-adic completion (H.6/mod-l-homotopy-and-bockstein-sequence, H.6/l-adic-completion-milnor-sequence); naturality gives compatibility with the universal coefficient sequences.
4. Low degrees: on K_0 = ℤ it is the identity (rank); on K_1(F) = F^× it is the inclusion F^× ⊂ F_v^× (determinant, KTheoryLowDegrees U.3); on K_2 it sends {a, b} to {a, b}.

**API.**

- `completionMap` (data): completionMap F v n : K_n(F) →+ K_n(F_v), induced by F → v.adicCompletion F.
- `completionMap_symbol` (simp): completionMap F v 2 {a, b} = {a, b}, and more generally c_v of a product of K_1-classes is the product of their images.
- `completionMap_one` (compatibility): On K_1(F) = F^× the map is Mathlib's coercion F^× → (v.adicCompletion F)^×.
- `completionMap_zero` (simp): On K_0(F) = ℤ the map is the identity.
- `completionMap_mul` (structure): c_v is a homomorphism of graded rings K_*(F) → K_*(F_v).
- `completionMap_integers` (compatibility): c_v ∘ (K_n(𝓞_F) → K_n(F)) = (K_n(𝓞_v) → K_n(F_v)) ∘ c_v.
- `completionMap_coefficients` (compatibility): c_v commutes with K_n(−) → K_n(−; ℤ/m) → K_{n−1}(−)[m] and with change of coefficients.
- `completionMap_restriction` (functoriality): L.7/restriction-completion-square.
- `completionMap_transfer` (functoriality): L.7/transfer-completion-formula.
- `completionMap_boundary` (compatibility): L.7/boundary-completion-compatibility.

**Unit tests.**

- `completionMap_K1_rat` (computation): F = ℚ, v = 5: completionMap on K_1 sends 2 to the unit 2 ∈ ℤ₅^× and 10 to an element of valuation one.
- `completionMap_K0` (degenerate): On K_0 the map ℤ → ℤ is the identity, for every v.
- `completionMap_K2_dyadic` (computation): F = ℚ, v = 2: completionMap {−1, −1} ≠ 0 in K_2(ℚ₂), since its norm residue symbol is −1 (L.3/norm-residue-map).
- `completionMap_not_injective` (non-example): F = ℚ, v = 3: completionMap {−1, −1} = 0 in K_2(ℚ₃) (norm residue symbol 1, and Moore's theorem), although {−1, −1} ≠ 0 in K_2(ℚ) (the real sign symbol, K-book Example III.6.2.1): one completion does not detect K_2(F).
- `completionMap_K1_coe` (compatibility): The degree-one map agrees with Mathlib's algebraMap F (v.adicCompletion F) on units.

**Acceptance.**

- c_5 on K_1(ℚ): 2 ↦ 2 ∈ ℚ₅^×, a unit, and 5 ↦ 5, of valuation one.
- c_2{−1, −1} ≠ 0 in K_2(ℚ₂) while c_3{−1, −1} = 0 in K_2(ℚ₃).
- The completion is Mathlib's v.adicCompletion F; no choice of embedding is involved.

**Used by.**

- ArithmeticKTheory N.6/tame-and-wild-kernels: the wild kernel is ⨅_v ker c_v in degree 2i
- PadicHodgeRegulators D.4: the localisation map from global K_3 to the completions above p (through L.7/semilocal-completed-map)
- HabiroNumberFields HB.2/local-maps-at-primes-of-norm-minus-one: the local Chern maps at a prime q are Chern classes of c_q(x) (L.7/unramified-chern-class-reduction)
- L.7/boundary-completion-compatibility and L.7/hilbert-symbol-completion: the localisation boundary and the Hilbert symbols factor through c_v

**Depends on.** this roadmap: `L.1/k-theory-mod-m`; other roadmaps: `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`, `GeneralAlgebraicKTheory:K.7/biexact-pairings-and-products`, `StableHomotopyKTheory:H.6/mod-l-homotopy-and-bockstein-sequence`, `StableHomotopyKTheory:H.6/l-adic-completion-milnor-sequence`, `KTheoryLowDegrees:U.3`; libraries: `mathlib:NumberField`, `mathlib:IsDedekindDomain.HeightOneSpectrum`, `mathlib:IsDedekindDomain.HeightOneSpectrum.adicCompletion`, `mathlib:IsDedekindDomain.HeightOneSpectrum.adicCompletionIntegers`, `tauceti:IsDedekindDomain.HeightOneSpectrum.isNonarchimedeanLocalField_adicCompletion`, `tauceti:IsDedekindDomain.HeightOneSpectrum.residueFieldEquivAdicCompletion`.

**Sources.**

- `Kbook.2013`, Wild Kernels V.6.8.2 (PDF p. 421; book p. 413): “In fact, divK2i(F) is isomorphic to the wild kernel, defined as the intersection (over all valuations v on F) of the kernels of all maps K2i(F) → K2i(Fv).” — The maps K_{2i}(F) → K_{2i}(F_v) that this definition names (the isomorphism claimed in the same sentence is corrected in ArithmeticKTheory N.6).
- `Weibel.Handbook.I5`, Example 65 (p. 166; PDF p. 28): “There is a subgroup of K2i−1(F) isomorphic to Zr2 by Theorem 6; its image in ⊕K2i−1(Ej) is a subgroup of rank at most r2, while ⊕K2i−1(Ej; Zp) has rank d = [Ej : Qp].” — The completion maps to the completions E_j = F_v at the places over p, integrally and p-adically.

### Restriction commutes with completion

`L.7/restriction-completion-square` · lemma

Setting (pinned for the layer): F is a number field, 𝓞_F its ring of integers, v ∈ HeightOneSpectrum 𝓞_F a finite place, F_v = v.adicCompletion F (a nonarchimedean local field by Tau Ceti's isNonarchimedeanLocalField_adicCompletion), 𝓞_v = v.adicCompletionIntegers F, 𝓞_(v) the localisation of 𝓞_F at v, and k(v) = 𝓞_F/v, identified with the residue field of F_v by Tau Ceti's residueFieldEquivAdicCompletion. K-groups are Quillen's (GeneralAlgebraicKTheory K.1), with finite coefficients K_n(−; ℤ/m) and ℓ-adic coefficients K_n(−; ℤ_ℓ) as in StableHomotopyKTheory H.6. Let E/F be a finite extension of number fields and w a place of E over v, with ι_{w/v} : F_v → E_w the continuous extension of F → E (Tau Ceti's adicCompletionExtension). Then c_w ∘ res_{E/F} = (ι_{w/v})_* ∘ c_v : K_n(F) → K_n(E_w) for all n, with ℤ/m and ℤ_ℓ coefficients, and the same for 𝓞_F → 𝓞_E. Consequently res_{E/F} maps ⋂_v ker c_v into ⋂_w ker c_w.

**Hypotheses.**

- E/F finite; w.asIdeal lies over v.asIdeal.

**Proof.**

1. The square of rings F → E → E_w, F → F_v → E_w commutes (Tau Ceti's adicCompletionExtension_coe).
2. K-theory is a functor of rings, and composites of base changes are base changes along the composite up to a natural isomorphism, which induces the identity on K-groups (K.1/K-groups-of-exact-categories).
3. Coefficients: the same square of spectra smashed with Moore spectra (L.7/completion-map).

**Acceptance.**

- Degree one: x ∈ F^× goes to x ∈ E_w^× along both paths.
- ℚ ⊂ ℚ(i) at v = 5: the two places w₁, w₂ give two different maps K_n(ℚ(i)) → K_n(ℚ₅), both restricting to c_5 on K_n(ℚ).
- The wild kernel of F is carried into the wild kernel of E (the functoriality ArithmeticKTheory N.6 uses).

**Depends on.** this roadmap: `L.7/completion-map`; other roadmaps: `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`; libraries: `tauceti:IsDedekindDomain.HeightOneSpectrum.adicCompletionExtension`, `tauceti:IsDedekindDomain.HeightOneSpectrum.adicCompletionExtension_coe`.

**Sources.**

- `Kbook.2013`, IV.6.3.3 (PDF p. 328; book p. 320): “if S is flat as an R-module, the exact base change functor ⊗RS : M(R) → M(S) induces a covariant map f∗: G(R) → G(S) hence maps f∗: Gn(R) → Gn(S) for all n.” — Base change along ring maps, the functoriality composed here along F → E → E_w and F → F_v → E_w.

### Transfer commutes with completion

`L.7/transfer-completion-formula` · theorem · planet “Transfer and completion”

Setting (pinned for the layer): F is a number field, 𝓞_F its ring of integers, v ∈ HeightOneSpectrum 𝓞_F a finite place, F_v = v.adicCompletion F (a nonarchimedean local field by Tau Ceti's isNonarchimedeanLocalField_adicCompletion), 𝓞_v = v.adicCompletionIntegers F, 𝓞_(v) the localisation of 𝓞_F at v, and k(v) = 𝓞_F/v, identified with the residue field of F_v by Tau Ceti's residueFieldEquivAdicCompletion. K-groups are Quillen's (GeneralAlgebraicKTheory K.1), with finite coefficients K_n(−; ℤ/m) and ℓ-adic coefficients K_n(−; ℤ_ℓ) as in StableHomotopyKTheory H.6. Let E/F be a finite extension of number fields. Then c_v ∘ N_{E/F} = Σ_{w | v} N_{E_w/F_v} ∘ c_w : K_n(E) → K_n(F_v) for all n ≥ 0, with ℤ/m and ℤ_ℓ coefficients, where N denotes the transfer (restriction of scalars, GeneralAlgebraicKTheory K.3/resolution-theorem) and w runs over the places of E above v; the same holds for 𝓞_E → 𝓞_F with 𝓞_w, 𝓞_v. Equivalently, under E ⊗_F F_v ≅ ∏_{w|v} E_w (NumberFieldArithmetic Layer 5's semilocal equivalence) it is the base-change formula g^* f_* = f′_* g′^* for g : Spec F_v → Spec F and f : Spec E → Spec F. In degree one it is N_{E/F}(x) = ∏_{w|v} N_{E_w/F_v}(x) in F_v^×; in degree zero, [E : F] = Σ_{w|v} [E_w : F_v].

**Hypotheses.**

- E/F finite (separable, as in characteristic 0), so E ⊗_F F_v is reduced and is the product of the completions E_w.
- The semilocal equivalence is NumberFieldArithmetic Layer 5's (request); Tau Ceti's adicCompletionExtension supplies the individual maps F_v → E_w.

**Proof.**

1. Restriction of scalars followed by base change, P(E) → P(F) → P(F_v), is naturally isomorphic to base change followed by restriction of scalars, P(E) → P(E ⊗_F F_v) → P(F_v): (M_F) ⊗_F F_v ≅ (M ⊗_E (E ⊗_F F_v))_{F_v}. Isomorphic exact functors induce equal maps on K-groups (K.1).
2. E ⊗_F F_v ≅ ∏_{w|v} E_w compatibly with the maps from E (the semilocal equivalence), so K(E ⊗_F F_v) ≅ ∏_w K(E_w) (finite products, K.1 and K.7/invariance-products-and-colimits), and restriction of scalars along F_v → ∏_w E_w is the sum of the restrictions along F_v → E_w (additivity).
3. Degree one: the transfer on K_1 of a finite field extension is the field norm (Mathlib's Algebra.norm, through the determinant), giving the classical local–global norm formula.
4. Coefficients: the functors act on the spectra, so the formula holds after smashing with Moore spectra and completing (H.6).

**Acceptance.**

- ℚ(i)/ℚ, v = 5 (split): N(2 + i) = 5 = (2 + i)(2 − i), the product of the images under the two embeddings ℚ(i) → ℚ₅.
- ℚ(i)/ℚ, v = 3 (inert): N(2 + i) = 5 = N_{ℚ₉/ℚ₃}(2 + i).
- Degree zero: 2 = 1 + 1 at 5, 2 = 2 at 3 and at 2.
- For x = res_{E/F}(y) the formula gives c_v(N_{E/F} res y) = Σ_w [E_w : F_v]·c_v(y) = [E : F]·c_v(y).

**Depends on.** this roadmap: `L.7/completion-map`, `L.7/restriction-completion-square`; other roadmaps: `GeneralAlgebraicKTheory:K.3/resolution-theorem`, `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`, `GeneralAlgebraicKTheory:K.7/invariance-products-and-colimits`, `StableHomotopyKTheory:H.6/mod-l-homotopy-and-bockstein-sequence`; libraries: `mathlib:Algebra.norm`.

**Sources.**

- `Kbook.2013`, Base change Theorem V.3.7.2 (PDF p. 398; book p. 390): “Base change Theorem 3.7.2. Let f : X → Y be a proper morphism of quasi-projective schemes and g : Y′ → Y a morphism of finite flat dimension, Tor-independent of X, and set X′ = X ×Y Y′ so there is a cartesian square” — The base-change formula, applied to f : Spec E → Spec F and g : Spec F_v → Spec F (a flat map of fields, so Tor-independent).
- `Kbook.2013`, Base change Theorem V.3.7.2, conclusion (PDF p. 398): “If in addition f has finite flat dimension, so that f∗: K(X) → K(Y) is defined then g∗f∗ ≃ f′∗g′∗ as maps K(X) → K(Y′).” — The conclusion g^* f_* = f′_* g′^*; here X′ = Spec(E ⊗_F F_v) = ⊔_w Spec E_w.

### The boundary at a prime is the boundary of the local ring

`L.7/boundary-at-a-prime-via-localisation` · lemma

Let R be a Dedekind domain with fraction field F, 𝔭 a non-zero prime, R_𝔭 the discrete valuation ring and k(𝔭) = R/𝔭 = R_𝔭/𝔭R_𝔭. The 𝔭-component ∂_𝔭 : K_n(F) → K_{n−1}(k(𝔭)) of the boundary of the localisation sequence of R (ArithmeticKTheory N.2) equals the boundary of the localisation sequence of R_𝔭 ⊂ F. More precisely, M ↦ M_𝔭 maps the localisation sequence of R to that of R_𝔭: it is K_n(R) → K_n(R_𝔭) on the middle terms, the identity on K_n(F), and on the fibre terms the projection ⊕_𝔮 K_{n−1}(k(𝔮)) → K_{n−1}(k(𝔭)). The same holds with ℤ/m coefficients.

**Hypotheses.**

- R is a Dedekind domain; the localisation sequences are those of Quillen's theorem for the Serre subcategories of torsion modules (GeneralAlgebraicKTheory K.3).

**Proof.**

1. R_𝔭 is flat over R (Mathlib's IsLocalization.flat), so − ⊗_R R_𝔭 : M(R) → M(R_𝔭) is exact; it carries torsion modules to torsion modules and induces the identity M(F) → M(F) on the quotient categories.
2. Quillen's localisation sequence is functorial for exact functors of pairs (K.3/abelian-localization-theorem), giving a map of long exact sequences.
3. On torsion modules: (R/𝔮)_𝔭 = 0 for 𝔮 ≠ 𝔭 and (R/𝔭)_𝔭 = k(𝔭); under dévissage (K.3/devissage-theorem) the induced map ⊕_𝔮 K(k(𝔮)) → K(k(𝔭)) is the projection.

**Acceptance.**

- Degree one: ∂_𝔭(f) = ord_𝔭(f) for both sequences.
- Degree two: ∂_𝔭 is the (K-book's) tame symbol at 𝔭 for both sequences (V.6.6.1).
- The components at primes other than 𝔭 are killed, as they must be.

**Depends on.** other roadmaps: `ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain`, `ArithmeticKTheory:N.2/finite-support`, `GeneralAlgebraicKTheory:K.3/abelian-localization-theorem`, `GeneralAlgebraicKTheory:K.3/devissage-theorem`; libraries: `mathlib:IsLocalization.flat`.

**Sources.**

- `Kbook.2013`, V.6.6.1 (PDF p. 417; book p. 409): “Since the p-component of ∂ factors through the localization K2(R) → K2(Rp) and the localization sequence for Rp, we may suppose that R is a DVR with parameter π.” — The factorisation of the 𝔭-component through R_𝔭, stated by the source in degree two; the argument is the same in every degree.

### Karoubi's square for a discrete valuation ring and its completion

`L.7/karoubi-completion-square` · theorem

Let R be a discrete valuation ring with fraction field F, uniformiser π and residue field k, and R̂ its π-adic completion, with fraction field F̂ and residue field k. Base change along R → R̂ maps the localisation sequence of R ⊂ F to that of R̂ ⊂ F̂, and on the fibre terms it is, under dévissage K(M_π(R)) ≃ K(k) ≃ K(M_π(R̂)), the identity of K(k). Hence (a) ∂̂ ∘ c = ∂ : K_n(F) → K_{n−1}(k) for c : K_n(F) → K_n(F̂); (b) the square K(R) → K(R̂), K(F) → K(F̂) is homotopy cartesian; (c) there is a Mayer–Vietoris sequence ⋯ → K_n(R) → K_n(R̂) ⊕ K_n(F) → K_n(F̂) → K_{n−1}(R) → ⋯; (d) the same holds with ℤ/m and ℤ_ℓ coefficients. This is Karoubi's Proposition V.7.5 for S = {π^n} in the regular case; the general statement belongs to GeneralAlgebraicKTheory (see restructure).

**Hypotheses.**

- R is a discrete valuation ring (so regular, and K = G for R, F, R̂, F̂).
- For a number field, R = 𝓞_(v), R̂ = 𝓞_v = v.adicCompletionIntegers F, F̂ = F_v.

**Proof.**

1. R̂ is torsion-free, hence flat, over R (Mathlib's IsDedekindDomain.flat_iff_torsion_eq_bot), so − ⊗_R R̂ is exact, preserves π-torsion modules and induces M(F) → M(F̂) on the quotients.
2. k ⊗_R R̂ = R̂/πR̂ = k (for R = 𝓞_(v): Tau Ceti's residueFieldEquivAdicCompletionIntegers), so under dévissage (K.3/devissage-theorem) the map K(M_π(R)) → K(M_π(R̂)) is induced by the identity of k; it is an equivalence.
3. Functoriality of Quillen localisation (K.3/abelian-localization-theorem, with the resolution theorem K.3/resolution-theorem identifying G with K) gives a map of homotopy fibration sequences which is an equivalence on fibres; (a) is the commutativity of its boundary square, and (b) follows (StableHomotopyKTheory H.2/homotopy-fibre-and-long-exact-sequence).
4. (c) is the long exact sequence of the homotopy cartesian square; (d) by smashing with Moore spectra and completing (H.6).

**Acceptance.**

- n = 1: ∂[f] = ord(f) = ord(c f).
- Degrees ≤ 1 of (c): the boundary K_1(F̂) → K_0(R) = ℤ vanishes because ℤ → ℤ ⊕ ℤ is injective, so the sequence reads 0 → R^× → R̂^× ⊕ F^× → F̂^× → 0 and 0 → ℤ → ℤ ⊕ ℤ → ℤ → 0; exactness at F̂^× says F̂^× = R̂^×·F^× (every element of F̂^× is a unit times a power of π).
- R = ℤ_(p), R̂ = ℤ_p (K-book Example V.7.5.1).

**Depends on.** other roadmaps: `GeneralAlgebraicKTheory:K.3/abelian-localization-theorem`, `GeneralAlgebraicKTheory:K.3/devissage-theorem`, `GeneralAlgebraicKTheory:K.3/resolution-theorem`, `StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence`, `StableHomotopyKTheory:H.6/mod-l-homotopy-and-bockstein-sequence`; libraries: `tauceti:IsDedekindDomain.HeightOneSpectrum.residueFieldEquivAdicCompletionIntegers`, `mathlib:IsDedekindDomain.HeightOneSpectrum.adicCompletionIntegers`, `mathlib:IsDedekindDomain.flat_iff_torsion_eq_bot`, `mathlib:IsDiscreteValuationRing`.

**Sources.**

- `Kbook.2013`, Proposition V.7.5 (PDF p. 432; book p. 424): “Proposition 7.5. (Karoubi) Let f : A → B be a ring homomorphism and S a central multiplicatively closed set of nonzerodivisors in A such that f(S) is a central set of nonzerodivisors in B. Assume that f : A/sA ≅ B/sB for all s ∈ S.” — The hypotheses, for A = R, B = R̂, S = {π^n}.
- `Kbook.2013`, Proposition V.7.5, conclusions (PDF p. 432): “Then: (1) the functor HS(A) → HS(B) is an equivalence;” — The identification of the fibre terms, (a) and (b).
- `Kbook.2013`, Example V.7.5.1 (PDF p. 432): “Example 7.5.1. The proposition applies to S = {pn} and the rings Z → Z(p) → Ẑp (p-adics).” — The completion of a local ring of ℤ, the model case.

### The localisation boundary at a finite place factors through the completion

`L.7/boundary-completion-compatibility` · theorem · planet “Localization boundary at a finite place”

Setting (pinned for the layer): F is a number field, 𝓞_F its ring of integers, v ∈ HeightOneSpectrum 𝓞_F a finite place, F_v = v.adicCompletion F (a nonarchimedean local field by Tau Ceti's isNonarchimedeanLocalField_adicCompletion), 𝓞_v = v.adicCompletionIntegers F, 𝓞_(v) the localisation of 𝓞_F at v, and k(v) = 𝓞_F/v, identified with the residue field of F_v by Tau Ceti's residueFieldEquivAdicCompletion. K-groups are Quillen's (GeneralAlgebraicKTheory K.1), with finite coefficients K_n(−; ℤ/m) and ℓ-adic coefficients K_n(−; ℤ_ℓ) as in StableHomotopyKTheory H.6. Then ∂_v = ∂̂_v ∘ c_v : K_n(F) → K_{n−1}(k(v)) for all n ≥ 1, and likewise with ℤ/m and ℤ_ℓ coefficients, where ∂_v is the v-component of the boundary of the localisation sequence of 𝓞_F (ArithmeticKTheory N.2) and ∂̂_v that of 𝓞_v ⊂ F_v (L.2/dvr-localisation). Consequences: ker c_v ⊆ ker ∂_v, so the wild kernel lies in the kernel of the boundary; in degree two ∂_v{a, b} = ∂_{F_v}{a, b} for the tame symbols (both normalisations); in degree one ord_v(f) = ord_{F_v}(c_v f). The same holds for the rings of S-integers, for v ∉ S.

**Hypotheses.**

- The boundary normalisation is the K-book's (T.3/localization-boundary) on both sides; the statement holds in either normalisation.

**Proof.**

1. L.7/boundary-at-a-prime-via-localisation: ∂_v is the boundary of 𝓞_(v) ⊂ F.
2. L.7/karoubi-completion-square with R = 𝓞_(v), whose completion is 𝓞_v with fraction field F_v: the boundary of 𝓞_(v) ⊂ F is ∂̂_v ∘ c_v.
3. Residue fields: k(v) = 𝓞_F/v = 𝓞_(v)/v𝓞_(v) = 𝓀[F_v] (Tau Ceti's residueFieldEquivAdicCompletion).
4. Degree two: both boundaries are the tame symbols (T.3/localization-boundary), so ∂_v{a, b} = ∂_{F_v}{a, b}.

**Acceptance.**

- F = ℚ, v = 5, n = 2: ∂_5{2, 5} = 2 in 𝔽₅^× (roadmap normalisation), computed in ℚ or in ℚ₅.
- With ℤ/m coefficients for v ∤ m this is the residue compatibility HabiroNumberFields HB.2 needs.
- A class in the wild kernel has ∂_v = 0 at every finite v, as ArithmeticKTheory N.6 uses.

**Depends on.** this roadmap: `L.7/boundary-at-a-prime-via-localisation`, `L.7/karoubi-completion-square`, `L.7/completion-map`, `L.2/dvr-localisation`; other roadmaps: `K2SymbolsBrauer:T.3/localization-boundary`; libraries: `tauceti:IsDedekindDomain.HeightOneSpectrum.residueFieldEquivAdicCompletion`.

**Sources.**

- `Kbook.2013`, V.6.6.1 (PDF p. 417): “Since the p-component of ∂ factors through the localization K2(R) → K2(Rp) and the localization sequence for Rp, we may suppose that R is a DVR with parameter π.” — The first factorisation.
- `Weibel.Handbook.I5`, Proof of Corollary 35 (p. 154; PDF p. 16): “and K2i−1(OS; Z/ℓν) is the kernel of K2i−1(F; Z/ℓν) → ⊕℘K2i−2(k(℘); Z/ℓν) by 7” — The boundary maps to the residue fields at the primes outside S, whose local form this node provides.

### The Hilbert symbols of a number field are those of its completions

`L.7/hilbert-symbol-completion` · theorem · planet “Hilbert symbols of the completions”

Setting (pinned for the layer): F is a number field, 𝓞_F its ring of integers, v ∈ HeightOneSpectrum 𝓞_F a finite place, F_v = v.adicCompletion F (a nonarchimedean local field by Tau Ceti's isNonarchimedeanLocalField_adicCompletion), 𝓞_v = v.adicCompletionIntegers F, 𝓞_(v) the localisation of 𝓞_F at v, and k(v) = 𝓞_F/v, identified with the residue field of F_v by Tau Ceti's residueFieldEquivAdicCompletion. K-groups are Quillen's (GeneralAlgebraicKTheory K.1), with finite coefficients K_n(−; ℤ/m) and ℓ-adic coefficients K_n(−; ℤ_ℓ) as in StableHomotopyKTheory H.6. Let w_v = #μ(F_v) and h_v := h_{F_v} ∘ c_v : K_2(F) → μ(F_v), with h_{F_v} the norm residue map of L.3/norm-residue-map. (a) h_v{a, b} = (a, b)_{F_v,w_v}. (b) For m with μ_m ⊆ F, the m-th power Hilbert symbol at v of T.7/global-reciprocity, (a, b)_{v,m} := (a, b)_{F_v,m}, equals h_v{a, b}^{w_v/m}, read in μ_m(F) ≅ μ_m(F_v). (c) For x in the torsion subgroup of K_2(F): c_v(x) = 0 iff h_v(x) = 1; so on torsion classes the kernel of K_2(F) → K_2(F_v) is the kernel of the Hilbert symbol at v. (d) For d | Nv − 1, (a, b)_{F_v,d} = ω(∂_v{a, b})^{−(Nv−1)/d}, with ∂_v the tame symbol at v of the global field (L.3/tame-component and L.7/boundary-completion-compatibility).

**Hypotheses.**

- F is a number field and v a finite place.
- (c) uses Moore's theorem for F_v, which in characteristic 0 rests on Merkurjev's theorem (cited).

**Proof.**

1. (a): c_v{a, b} = {a, b} (L.7/completion-map) and the definition of h_{F_v}.
2. (b): L.3/norm-residue-power-compatibility.
3. (c): c_v(x) is a torsion element of K_2(F_v), and h_{F_v} is injective on K_2(F_v)_tors (L.3/moore-theorem (b)).
4. (d): L.3/tame-component for F_v, and ∂_{F_v}{a, b} = ∂_v{a, b} (L.7/boundary-completion-compatibility).

**Acceptance.**

- F = ℚ, x = {−1, −1}: h_2(x) = −1 and h_p(x) = 1 for p odd; so c_p(x) = 0 for p odd and c_2(x) ≠ 0.
- F = ℚ, x = {−1, 3}: h_3(x) = −1, so c_3(x) ≠ 0.
- Since K_2 of a number field is torsion (K2SymbolsBrauer T.5/tame-kernel-sequence with the finiteness of K_2(𝓞_F)), (c) describes ker c_v on all of K_2(F), which is what ArithmeticKTheory N.6/tame-and-wild-kernels uses.

**Depends on.** this roadmap: `L.7/completion-map`, `L.3/norm-residue-map`, `L.3/norm-residue-power-compatibility`, `L.3/moore-theorem`, `L.3/tame-component`, `L.7/boundary-completion-compatibility`; other roadmaps: `K2SymbolsBrauer:T.7/classical-local-symbols`.

**Sources.**

- `Kbook.2013`, Wild Kernels V.6.8.2 (PDF p. 421): “Tate observed that divKn(F) can be nonzero even for K2. In fact, divK2i(F) is isomorphic to the wild kernel, defined as the intersection (over all valuations v on F) of the kernels of all maps K2i(F) → K2i(Fv).” — The kernels of K_2(F) → K_2(F_v), described here by the Hilbert symbols.
- `Kbook.2013`, Moore's Theorem III.6.2.4 (PDF p. 241): “If F is a local field, then K2(F) is the direct sum of a uniquely divisible abelian group U and a finite cyclic group, isomorphic under the norm residue symbol to the group µ = µm of roots of unity in F.” — The local input for (c).

### Étale Chern classes commute with completion

`L.7/etale-chern-class-completion` · theorem · planet “Étale Chern classes and completion”

Setting (pinned for the layer): F is a number field, 𝓞_F its ring of integers, v ∈ HeightOneSpectrum 𝓞_F a finite place, F_v = v.adicCompletion F (a nonarchimedean local field by Tau Ceti's isNonarchimedeanLocalField_adicCompletion), 𝓞_v = v.adicCompletionIntegers F, 𝓞_(v) the localisation of 𝓞_F at v, and k(v) = 𝓞_F/v, identified with the residue field of F_v by Tau Ceti's residueFieldEquivAdicCompletion. K-groups are Quillen's (GeneralAlgebraicKTheory K.1), with finite coefficients K_n(−; ℤ/m) and ℓ-adic coefficients K_n(−; ℤ_ℓ) as in StableHomotopyKTheory H.6. Let m ≥ 1 and i ≥ 1. The étale Chern classes c_{i,n} : K_n(X; ℤ/m) → H^{2i−n}_et(X, μ_m^{⊗i}) of MotivicEtaleKTheory M.8 (Grothendieck's theory, K-book Example V.11.10) satisfy res_v ∘ c^F_{i,n} = c^{F_v}_{i,n} ∘ c_v, where res_v : H^j(F, μ_m^{⊗i}) → H^j(F_v, μ_m^{⊗i}) is the pull-back along Spec F_v → Spec F, i.e. restriction to a decomposition group G_{F_v} ⊆ G_F (independent of the place of F^sep chosen over v, conjugation acting trivially on cohomology). The same holds for 𝓞_F[1/m] → 𝓞_v when v ∤ m, and for the first étale Chern class K_{2i−1}(F; ℤ/ℓ^ν) → H^1(F, μ_{ℓ^ν}^{⊗i}) of Handbook §5.4. In degree one c_{1,1} is the Kummer map (Tau Ceti's kummerMap), and the statement is that res_v κ_F(a) = κ_{F_v}(a).

**Hypotheses.**

- m is invertible on the schemes considered (always on Spec F and Spec F_v; on Spec 𝓞_v when v ∤ m).
- The Chern classes, their functoriality and their compatibility with residues are MotivicEtaleKTheory M.8's (request); the étale–Galois comparison for fields is M.1's (request).

**Proof.**

1. Functoriality axiom of a theory of Chern classes (K-book V.11.5 (1)) for the morphism Spec F_v → Spec F, passed to Chern class homomorphisms on K-theory with coefficients (V.11.8, V.11.10), as exported by M.8.
2. Identify H^j_et(Spec F, −) and H^j_et(Spec F_v, −) with Galois cohomology (M.1); the pull-back is restriction along G_{F_v} → G_F.
3. Compose with c_v on K-theory with coefficients (L.7/completion-map).
4. Degree one: c_{1,1} is the determinant followed by the Kummer map (V.11.10), and the Kummer map is natural in the field.

**Acceptance.**

- n = 1, i = 1: for a ∈ F^×, res_v κ_F(a) = κ_{F_v}(a) in H^1(F_v, μ_m) = F_v^×/F_v^{×m}.
- n = 2, i = 2: c_{2,2}{a, b} restricts to c_{2,2}{a, b} over F_v, consistently with T.7/chern-class-agreement on both sides.
- The comparison involves a decomposition group, not an arbitrary embedding of Galois groups.

**Depends on.** this roadmap: `L.7/completion-map`; other roadmaps: `MotivicEtaleKTheory:M.8`, `MotivicEtaleKTheory:M.1`, `K2SymbolsBrauer:T.7/chern-class-agreement`; libraries: `tauceti:TauCeti.kummerMap`.

**Sources.**

- `Kbook.2013`, Definition V.11.5 (PDF p. 462; book p. 454): “(1) Functoriality. For each compatible system φ of morphisms X −f→ X′, G → f∗G′ and F → f∗F′ we have ci(φ∗ρ) = φ∗ci(ρ).” — The functoriality axiom applied to Spec F_v → Spec F.
- `Kbook.2013`, Example V.11.10 (PDF p. 464): “This yields a theory of étale Chern classes and hence (by 11.8) Chern class maps ci,n : Kn(X; Z/m) → H2i−n(X, Rπ∗µ⊗im) = H2i−net(X, µ⊗im).” — The étale Chern classes with finite coefficients.
- `Weibel.Handbook.I5`, §5.4 (p. 153; PDF p. 15): “If F is a field containing 1/ℓ, there is a canonical map from K2i−1(F; Z/ℓν) to H1ét(F, µ⊗iℓν), called the first étale Chern class.” — The first étale Chern class of a field, to which the node applies with F and F_v.

### Local Chern classes of integral classes are unramified and reduce to the residue field

`L.7/unramified-chern-class-reduction` · theorem

Setting (pinned for the layer): F is a number field, 𝓞_F its ring of integers, v ∈ HeightOneSpectrum 𝓞_F a finite place, F_v = v.adicCompletion F (a nonarchimedean local field by Tau Ceti's isNonarchimedeanLocalField_adicCompletion), 𝓞_v = v.adicCompletionIntegers F, 𝓞_(v) the localisation of 𝓞_F at v, and k(v) = 𝓞_F/v, identified with the residue field of F_v by Tau Ceti's residueFieldEquivAdicCompletion. K-groups are Quillen's (GeneralAlgebraicKTheory K.1), with finite coefficients K_n(−; ℤ/m) and ℓ-adic coefficients K_n(−; ℤ_ℓ) as in StableHomotopyKTheory H.6. Let v ∤ m (m = ℓ^ν with ℓ ≠ char k(v)) and i, n ≥ 1, j = 2i − n. (a) For x in the image of K_n(𝓞_F[1/m]; ℤ/m) → K_n(F; ℤ/m), res_v c^F_{i,n}(x) lies in the unramified subgroup H^j_ur(F_v, μ_m^{⊗i}), the image of H^j_et(𝓞_v, μ_m^{⊗i}) = H^j(k(v), μ_m^{⊗i}) under inflation. (b) Under the rigidity isomorphisms K_n(𝓞_v; ℤ/m) ≅ K_n(k(v); ℤ/m) (Gabber, L.2/rigidity-finite-residue-field) and H^j_et(𝓞_v, μ_m^{⊗i}) ≅ H^j(k(v), μ_m^{⊗i}), the local Chern class of c_v(x) is the inflation of the finite-field Chern class of the reduction x̄ ∈ K_n(k(v); ℤ/m). (c) For n = 3, i = 2, j = 1, with K_3(𝓞_F) = K_3(F) (ArithmeticKTheory N.2/N.5): the map K_3(F)/m → H^1(F_v, ℤ/m(2)) lands in the unramified classes and equals the Chern class of the reduction in K_3(k(v))/m, which is CGZ Lemma 4.1's diagram, the local Chern map c_{ζ,q} of HabiroNumberFields HB.2.

**Hypotheses.**

- v ∤ m; the rigidity for étale cohomology of the henselian ring 𝓞_v is M.1's, the unramified subgroup and inflation are ArithmeticGaloisDuality D7's (requests).

**Proof.**

1. (a): by L.7/etale-chern-class-completion for 𝓞_F[1/m] → 𝓞_v → F_v, res_v c^F(x) is the restriction of c^{𝓞_v}(x|_{𝓞_v}) ∈ H^j_et(𝓞_v, μ_m^{⊗i}); its image in H^j(F_v) is by definition unramified.
2. Identify H^j_et(𝓞_v, μ_m^{⊗i}) ≅ H^j(k(v), μ_m^{⊗i}) (étale cohomology of a henselian local ring with m invertible, M.1) and the map to H^j(F_v) with inflation along G_{F_v} → G_{k(v)} (D7).
3. (b): naturality for 𝓞_v → k(v) and Gabber rigidity for K-theory with coefficients (L.2/rigidity-finite-residue-field).
4. (c): specialise; the residue of res_v c(x) at v is the boundary of x, which vanishes on classes from 𝓞_F[1/m] (L.7/boundary-completion-compatibility with coefficients).

**Acceptance.**

- n = i = 1, m | Nv − 1: a unit u ∈ 𝓞_F^× has κ_{F_v}(u) unramified, the inflation of κ_{k(v)}(ū) ∈ k(v)^×/m.
- A uniformiser at v has a ramified Kummer class (its residue in H^0(k(v), ℤ/m) is 1): the S-integral hypothesis in (a) is needed.
- For q ≡ −1 mod p^m (CGZ §4.1), H^1(k(v), ℤ/n(2)) ≅ 𝔽_{q²}^×/𝔽_{q²}^{×n}.

**Depends on.** this roadmap: `L.7/etale-chern-class-completion`, `L.7/boundary-completion-compatibility`, `L.7/completion-map`, `L.2/rigidity-finite-residue-field`; other roadmaps: `MotivicEtaleKTheory:M.1`, `ArithmeticGaloisDuality:D7`.

**Sources.**

- `CGZ.BlochUnits.2021`, §4.1, proof of Lemma 4.1 (arXiv v3, p. 21): “The image of H1et(OF[1/p]) in the cohomology of OF,q for q prime to p lands in the subgroup H1ur of unramified classes. This subgroup is precisely the image of H1(O/q, Z/nZ(2)) under inflation.” — Statement (a) with the inflation description, in degree one and weight two.
- `CGZ.BlochUnits.2021`, §4.1, proof of Lemma 4.1 (arXiv v3, p. 22): “The identification of the two lower horizontal lines is a reflection of Gabber rigidity, which implies that K3(OF,q; Zp) ≃ K3(Fq) ⊗ Zp.” — Statement (b)–(c): the finite-field Chern class through rigidity.

### Cyclotomic traces commute with completion

`L.7/cyclotomic-trace-completion` · theorem

Setting (pinned for the layer): F is a number field, 𝓞_F its ring of integers, v ∈ HeightOneSpectrum 𝓞_F a finite place, F_v = v.adicCompletion F (a nonarchimedean local field by Tau Ceti's isNonarchimedeanLocalField_adicCompletion), 𝓞_v = v.adicCompletionIntegers F, 𝓞_(v) the localisation of 𝓞_F at v, and k(v) = 𝓞_F/v, identified with the residue field of F_v by Tau Ceti's residueFieldEquivAdicCompletion. K-groups are Quillen's (GeneralAlgebraicKTheory K.1), with finite coefficients K_n(−; ℤ/m) and ℓ-adic coefficients K_n(−; ℤ_ℓ) as in StableHomotopyKTheory H.6. Let v | p. The cyclotomic traces tr : K(A) → TC(A; p) (RefinedTraceMethods RT.3, in the convention of L.4) satisfy tr_{𝓞_v} ∘ c_v ≃ TC(c_v) ∘ tr_{𝓞_F} as maps K(𝓞_F) → TC(𝓞_v; p). Composed with Hesselholt–Madsen's trace map of localisation sequences for 𝓞_v ⊂ F_v (L.4/k-tc-localization-square), the composite K(𝓞_F) → K(F) →c_v K(F_v) →tr TC(𝓞_v | F_v; p) equals K(𝓞_F) →tr TC(𝓞_F; p) → TC(𝓞_v; p) → TC(𝓞_v | F_v; p). With ℤ/p^ν coefficients in degrees ≥ 1 the local trace K(F_v) → TC(𝓞_v | F_v; p) is an isomorphism for p odd (Hesselholt–Madsen, through L.4 and L.5), so the global-to-local map K_*(F; ℤ/p^ν) → K_*(F_v; ℤ/p^ν) is computed there by TC of 𝓞_v.

**Hypotheses.**

- v | p; for the isomorphism statement p > 2, as in Hesselholt–Madsen.
- The trace and its naturality are RT.3's (request); the localisation ladder is L.4's.

**Proof.**

1. Naturality of the cyclotomic trace for the exact functor − ⊗_{𝓞_F} 𝓞_v : P(𝓞_F) → P(𝓞_v) (RT.3: 'prove its naturality').
2. Functoriality: K(𝓞_F) → K(F) → K(F_v) equals K(𝓞_F) → K(𝓞_v) → K(F_v) (L.7/completion-map).
3. The right-hand square of L.4/k-tc-localization-square: tr ∘ j_* = j_* ∘ tr for 𝓞_v ⊂ F_v.
4. Compose the two commutative squares.

**Acceptance.**

- Degree one with ℤ/p coefficients: K_1(F_v; ℤ/p) = F_v^×/F_v^{×p} ≅ TC_1(𝓞_v | F_v; p, ℤ/p) (Hesselholt–Madsen), and the global class of a ∈ 𝓞_F[1/p]^× maps to the class of a.
- The compatibility is a statement about maps, not about abstract groups.

**Depends on.** this roadmap: `L.7/completion-map`, `L.4/k-tc-localization-square`; other roadmaps: `RefinedTraceMethods:RT.3`.

**Sources.**

- `HesselholtMadsen.2003`, Introduction, PDF pp. 2–3 (arXiv v2, 22 January 2004): “For any linear category with cofibrations and weak equivalences in the sense of [48], one has the cyclotomic trace tr: K(C) → TC(C; p) from K-theory to topological cyclic homology, [7].” — The cyclotomic trace, natural in the category.
- `HesselholtMadsen.2003`, Introduction, PDF pp. 2–3 (arXiv v2, 22 January 2004): “By [19, Th. D], the first two vertical maps from the left induce isomorphisms of homotopy groups with Z/pv-coefficients in degrees ≥ 0. It follows that the remaining two vertical maps induce isomorphisms” — The trace map of localisation sequences for 𝓞_v ⊂ F_v and its isomorphism range.

### The semilocal completed K-theory map above p

`L.7/semilocal-completed-map` · construction · planet “Semilocal completed K-theory map”

Setting (pinned for the layer): F is a number field, 𝓞_F its ring of integers, v ∈ HeightOneSpectrum 𝓞_F a finite place, F_v = v.adicCompletion F (a nonarchimedean local field by Tau Ceti's isNonarchimedeanLocalField_adicCompletion), 𝓞_v = v.adicCompletionIntegers F, 𝓞_(v) the localisation of 𝓞_F at v, and k(v) = 𝓞_F/v, identified with the residue field of F_v by Tau Ceti's residueFieldEquivAdicCompletion. K-groups are Quillen's (GeneralAlgebraicKTheory K.1), with finite coefficients K_n(−; ℤ/m) and ℓ-adic coefficients K_n(−; ℤ_ℓ) as in StableHomotopyKTheory H.6. For a prime p, define λ_{F,p} : K_n(F) → ∏_{v|p} K_n(F_v; ℤ_p) as (c_v)_{v|p} followed by K_n(F_v) → K_n(F_v; ℤ_p). Under F ⊗_ℚ ℚ_p ≅ ∏_{v|p} F_v (NumberFieldArithmetic Layer 5's semilocal equivalence), K(F ⊗ ℚ_p)^∧_p ≃ ∏_{v|p} K(F_v)^∧_p (finite products commute with K-theory and with p-completion), and λ_{F,p} is the map induced by F → F ⊗_ℚ ℚ_p. For n = 3 and F with p unramified, the target is the completed K₃ of the product L = ∏_{v|p} F_v used by PadicHodgeRegulators D.3–D.4, and λ_{F,3} is the localisation map from global K₃ that D.4 consumes. It is compatible with restriction and transfer: for E/F finite, λ_{E,p} ∘ res = (ι)_* ∘ λ_{F,p} and λ_{F,p} ∘ N_{E/F} = (Σ_{w|v} N_{E_w/F_v})_{v} ∘ λ_{E,p}.

**Hypotheses.**

- p a prime; the completed groups K_n(F_v; ℤ_p) are L.6's (derived p-completion of the K-theory spectrum, StableHomotopyKTheory H.6).
- The semilocal equivalence is requested from NumberFieldArithmetic Layer 5.

**Proof.**

1. Define λ_{F,p} componentwise from L.7/completion-map and the completion map of spectra (H.6/l-adic-completion-milnor-sequence).
2. Product form: the semilocal equivalence and finite-product compatibility of K-theory (K.7/invariance-products-and-colimits); p-completion commutes with finite products of spectra.
3. Restriction: L.7/restriction-completion-square at each w | v, followed by completion.
4. Transfer: L.7/transfer-completion-formula, followed by completion (the transfers are maps of spectra, so they commute with p-completion).

**API.**

- `semilocalCompletionMap` (constructor): semilocalCompletionMap F p n : K_n(F) →+ ∏ v|p, K_n(F_v; ℤ_p).
- `semilocalCompletionMap_apply` (simp): Its v-component is c_v followed by the completion map of L.7/completion-map.
- `semilocalCompletionMap_eq_tensor` (characterisation): Under F ⊗_ℚ ℚ_p ≅ ∏_{v|p} F_v, it is the map induced by F → F ⊗_ℚ ℚ_p followed by p-completion.
- `semilocalCompletionMap_restriction` (functoriality): Compatibility with restriction along E/F.
- `semilocalCompletionMap_transfer` (functoriality): Compatibility with transfer along E/F.
- `semilocalCompletionMap_one` (compatibility): In degree one it is F^× → ∏_{v|p} (F_v^×)^∧_p.

**Unit tests.**

- `semilocalCompletionMap_rat` (degenerate): F = ℚ: one place above p, and the map is K_n(ℚ) → K_n(ℚ_p) → K_n(ℚ_p; ℤ_p).
- `semilocalCompletionMap_K1_split` (computation): F = ℚ(i), p = 5: in degree one the two components of 2 + i are 2 + i and 2 − i in (ℚ₅^×)^∧_5, of valuations 1 and 0 for one choice of labelling.
- `semilocalCompletionMap_K1_not_injective` (non-example): F = ℚ, p odd, n = 1: −1 ∈ ℚ^× maps to the torsion element −1, which dies in (ℚ_p^×)^∧_p ≅ ℤ_p × (1 + pℤ_p) for p odd (the p-completion kills μ_{p−1}), so λ is not injective on torsion prime to p.
- `semilocalCompletionMap_transfer_K1` (compatibility): In degree one, compatibility with transfer is N_{E/F}(x) = ∏_{w|v} N_{E_w/F_v}(x), the classical local–global norm formula.

**Acceptance.**

- n = 1: λ_{F,p} is F^× → ∏_{v|p} lim_ν F_v^×/F_v^{×p^ν}, the product of the p-adic completions of the local multiplicative groups.
- F = ℚ: λ_{ℚ,p} = c_p followed by K_n(ℚ_p) → K_n(ℚ_p; ℤ_p).
- Global finite generation does not make λ_{F,p} injective after ⊗ ℤ_p (Leopoldt-type questions, Handbook Examples 65–66).

**Used by.**

- PadicHodgeRegulators D.4: the localisation map from global K₃ to the completions above p, to which D.3's regulator is applied
- PadicHodgeRegulators D.3: its target is the completed K₃ of a product of local fields
- ArithmeticKTheory N.5–N.6: the p-adic local conditions on odd K-groups (Handbook Examples 65–66)

**Depends on.** this roadmap: `L.7/completion-map`, `L.7/restriction-completion-square`, `L.7/transfer-completion-formula`; other roadmaps: `StableHomotopyKTheory:H.6/l-adic-completion-milnor-sequence`, `GeneralAlgebraicKTheory:K.7/invariance-products-and-colimits`, `KTheoryFiniteLocalFields:L.6`.

**Sources.**

- `Kbook.2013`, IV.2.9 (PDF p. 290; book p. 282): “The ℓ-adic completion of a spectrum E, Êℓ, is the homotopy limit (over ν) of the spectra E ∧ P∞(Z/ℓν). We let πn(E; Zℓ) denote the homotopy groups of this spectrum; if E = K(R) we write Kn(R; Zℓ)” — The completed groups K_n(F_v; ℤ_p) in the target.
- `Kbook.2013`, Example VI.7.8 (PDF p. 519): “By Borel’s Theorem IV.1.18, there is a subgroup of K4k+1(F) isomorphic to Zd for all k > 0; its image in ⊕K4k+1(Ej) is a subgroup of rank d. Although ⊕K4k+1(Ej; Zp) also has rank d” — The global-to-local map into the completed K-theory of the completions above p.

## Mistakes found in the sources

Recorded under PROTOCOL.md section 18. Each has been checked at its locator by an independent review; the nodes above use the corrected statements.

### KTheoryFiniteLocalFields/E1 — error (affects nothing)

- **Where:** `Kbook.2013`, IV.1, paragraph before Theorem IV.1.12, PDF p. 277 (draft p. 269).
- **Printed:** the Brauer lifting of the trivial and standard n-dimensional representations of GLn(Fq) are n-dimensional complex representations, given by homomorphisms 1n, idn : GLn(Fq) →U.
- **Correction:** The Brauer lift of the standard representation is an element of R_C(GL_n(F_q)) of virtual dimension n, in general not a representation; ρ_n is obtained from the virtual representation β(id_n) − n through the Atiyah map R_C(G) → [BG, Z × BU], not as B of a homomorphism into U.
- **Reason:** For GL_2(F_3) and the natural representation, the Brauer character χ (ι an embedding of F_9^× into C^×) has ⟨χ, χ⟩ = (1/48)Σ|χ(g)|^2 = 2 and no linear constituent (computed by enumerating the 48 elements). A genuine character of degree 2 with ⟨χ, χ⟩ = 2 would be a sum of two distinct linear characters; so χ is a virtual character (a difference of irreducible characters of degrees 4 and 2). The source's own Example IV.5.8 correctly places the Brauer lift in R_C(G).
- **Known:** new.

### KTheoryFiniteLocalFields/E2 — error (affects nothing)

- **Where:** `Kbook.2013`, Example IV.5.8, PDF p. 323 (draft p. 315).
- **Printed:** Let Fq be a finite field, and F×q →C× a homomorphism. It induces a homomorphism RFq(G) →RC(G) called the Brauer lifting.
- **Correction:** Fix an injective homomorphism \bar F_q^× → C^× (equivalently, compatible embeddings of all F_{q^n}^×); it induces the Brauer lifting R_{F_q}(G) → R_C(G).
- **Reason:** The Brauer character evaluates the chosen map on the eigenvalues of group elements, which lie in extensions of F_q: the element (0 −1; 1 0) of GL_2(F_3) has eigenvalues ±i ∈ F_9 \ F_3, on which a homomorphism defined on F_3^× gives no value. Injectivity is needed for the character to be a Brauer character (a non-injective map on μ_{q−1} gives a different class function).
- **Known:** new.

### KTheoryFiniteLocalFields/E3 — misprint (affects nothing)

- **Where:** `Kbook.2013`, Proposition IV.2.7, PDF p. 289 (draft p. 281).
- **Printed:** then πm(X; Z/ℓ) is naturally isomorphic to πm(X; Z/q1) × πm(X; Z/q1).
- **Correction:** π_m(X; Z/ℓ) ≅ π_m(X; Z/q_1) × π_m(X; Z/q_2) (also in the last line of the proof).
- **Reason:** The proof takes P = P_1 ∨ P_2 with P_i = P^m(Z/q_i); the second factor is [P^m(Z/q_2), X].
- **Known:** new.

### KTheoryFiniteLocalFields/E4 — misprint (affects nothing)

- **Where:** `Kbook.2013`, Example IV.2.6, PDF p. 289 (draft p. 281).
- **Printed:** Quillen’s computation of K∗(Fq) in 1.13 shows that Kn(k) = 0 for m even (m ≥2)
- **Correction:** K_m(k) = 0 for m even, m ≥ 2.
- **Reason:** The index variable of the sentence is m ('K_m(k) = Q/Z[1/p] for m odd').
- **Known:** new.

### KTheoryFiniteLocalFields/E5 — error (affects a stated result)

- **Where:** `Kbook.2013`, Corollary V.6.9.2, PDF p. 422 (draft p. 414).
- **Printed:** If R is a discrete valuation domain whose residue ﬁeld k is ﬁnite, then for all i > 0: K2i−1(R) ∼= K2i−1(F)
- **Correction:** K_{2i−1}(R) ≅ K_{2i−1}(F) for i ≥ 2; for i = 1 there is instead the exact sequence 0 → R^× → F^× → Z → 0 (the valuation).
- **Reason:** K_1(R) = R^× and K_1(F) = F^×, and a uniformiser is not a unit. In the localisation sequence the term after K_{2i−1}(F) is K_{2i−2}(k), which is 0 only for i ≥ 2 (for i = 1 it is K_0(k) = Z).
- **Known:** new.

### KTheoryFiniteLocalFields/E6 — error (affects a stated result)

- **Where:** `Kbook.2013`, Proposition VI.7.3, first sentence, PDF p. 517 (draft p. 509).
- **Printed:** For n > 0 we have Kn(E) ∼= Kn(V ) ⊕Kn−1(Fq), and the groups Kn(V ) are Z(p)-modules.
- **Correction:** For n > 0, K_n(E) ≅ K_n(V) ⊕ K_{n−1}(F_q); the groups K_{2i}(V) (i ≥ 1) are Z_(p)-modules, while K_{2i−1}(V) is the direct sum of Z/(q^i − 1) (its prime-to-p torsion) and a Z_(p)-module.
- **Reason:** K_1(V) = V^× contains the Teichmüller group μ_{q−1}, which is not uniquely ℓ-divisible for ℓ | q − 1 (e.g. V = Z_5, μ_4); more generally the second sentence of the same proposition gives K_{2i−1}(V) ⊇ Z/w_i(E), whose prime-to-p part Z/(q^i − 1) is nonzero for q > 2. Also 'K_{2i−1}(V) ≅ K_{2i−1}(E)' in the second sentence and the proof holds only for i ≥ 2.
- **Known:** new.

### KTheoryFiniteLocalFields/E7 — misprint (affects nothing)

- **Where:** `Kbook.2013`, Proposition VI.7.3, proof, last paragraph, PDF p. 517.
- **Printed:** K2i−1(V ; Z/ℓν) is isomorphic to Z/w(ℓ) i (E)⊕Ti/ℓνTi⊕ℓν(Di) for large ν. By Gabber Rigidity IV.2.10, K2i−1(V ; Z/ℓν) and K2i−1(Fq; Z/ℓν) ∼= w(ℓ) i (Fq) are isomorphic.
- **Correction:** … ≅ Z/w^{(ℓ)}_i(E) ⊕ T_i/ℓ^νT_i ⊕ ℓ^ν(D_{i−1}), and K_{2i−1}(F_q; Z/ℓ^ν) ≅ Z/w^{(ℓ)}_i(F_q); the conclusion is T_i/ℓ^νT_i = ℓ^ν(D_{i−1}) = 0, which gives the claim for all D_j by varying i.
- **Reason:** By the Universal Coefficient Theorem the torsion term of K_{2i−1}(V; Z/ℓ^ν) is ℓ^νK_{2i−2}(V), and K_{2i−2}(V) = D_{i−1} ⊕ Z/w^{(p)}_{i−1}(E); the p-group contributes no ℓ-torsion.
- **Known:** new.

### KTheoryFiniteLocalFields/E8 — error (affects a stated result)

- **Where:** `Kbook.2013`, Proposition V.6.10 and its proof, PDF p. 423 (draft p. 415).
- **Printed:** If the residue ﬁeld is Fq and q ≡1 (mod m), then K∗(E; Z/m) is a free Z/m[β]-module on generators 1 and z, where β is the Bott element and z is the class of π in K1(E; Z/m) = E×/E×m.
- **Correction:** K_*(R; Z/m) ≅ K_*(F_q; Z/m) ≅ Z/m[β, ζ]/(ζ^2) (Remark IV.1.13.1), not Z/m[β]; hence K_*(E; Z/m) is a free K_*(R; Z/m)-module on 1 and z, that is a free Z/m[β]-module on 1, ζ, z, ζz, with ζ the class of a generator of the Teichmüller units (for m = ℓ^ν ∉ {2, 3, 4, 8}; additively for every m prime to p with m | q − 1).
- **Reason:** E = Q_11, m = 5: K_1(Q_11; Z/5) = Q_11^×/Q_11^{×5} ≅ Z/5 (from μ_10) ⊕ Z/5 (from 11^Z) has order 25, while a free Z/5[β]-module on 1 and z has Z/5 in degree 1. Likewise K_2(Q_11; Z/5) = K_2(Q_11)/5 ⊕ 5K_1(Q_11) has order 25. The error is in the proof's 'K_*(R; Z/m) ≅ K_*(F_q; Z/m) ≅ Z/m[β]', which drops ζ.
- **Known:** new.

### KTheoryFiniteLocalFields/E9 — error (affects a stated result)

- **Where:** `Kbook.2013`, Example V.6.10.2, PDF p. 423.
- **Printed:** Taking the direct limit over all E, we see that K∗(Eq; Z/m) = Z/m[β].
- **Correction:** K_*(E_q; Z/m) ≅ Z/m[β, ζ]/(ζ^2) ≅ K_*(F_q; Z/m): the limit over totally ramified extensions kills z but not the class ζ of a generator of F_q^×, whose image stays nonzero because every E has residue field F_q.
- **Reason:** In E_q, an m-th root of a Teichmüller generator ω of μ_{q−1} would be a unit whose residue is an m-th root of ω̄ in F_q, which does not exist when m | q − 1 and ω̄ generates F_q^×; so [ω] ≠ 0 in K_1(E_q; Z/m) = E_q^×/m.
- **Known:** new.

### KTheoryFiniteLocalFields/E10 — gap (affects the proof)

- **Where:** `Kbook.2013`, Proposition VI.1.4, proof, PDF pp. 473–474 (draft pp. 465–466).
- **Printed:** For each q ≡1 (mod m), we saw in Example V.6.10.2 (which uses Gabber rigidity) that K∗(Eq; Z/m) = Z/m[β].
- **Correction:** K_*(E_q; Z/m) = Z/m[β, ζ]/(ζ^2); the conclusion K_*(\bar Q_p; Z/m) = Z/m[β] still holds because in the direct limit over q the class ζ_q maps to 0 in K_1(E_{q^m}; Z/m) (ζ_q is an m-th power in F_{q^m}^× since (q^m − 1)/(q − 1) ≡ m ≡ 0 mod m).
- **Reason:** Inherited from Example V.6.10.2 (previous entry); the step 'the map K_*(E_q; Z/m) → K_*(E_{q′}; Z/m) is an isomorphism' is false in degree 1, but the colimit is unaffected.
- **Known:** new.

### KTheoryFiniteLocalFields/E11 — misprint (affects nothing)

- **Where:** `Kbook.2013`, Theorem V.6.7, proof (PDF p. 418) against Theorem V.6.9.1, proof (PDF p. 422).
- **Printed:** Consider the map Kn(k) →Kn+1(F) sending a to {s, a}; we have ∂({s, a}) = {∂(s), a} = [k] · a = a.
- **Correction:** With the convention of the proof of V.6.9.1 (∂{a′, s′} = {a′, ∂s′}, left linearity), ∂({s, a}) = (−1)^n a for a ∈ K_n(k); either convention gives a section of ∂ up to sign. L.2/dvr-localisation fixes left linearity.
- **Reason:** Graded commutativity gives {s, a} = (−1)^n{a, s}; the two proofs use opposite linearity conventions for the same boundary, so both formulas cannot hold for odd n unless 2a = 0.
- **Known:** new.

### KTheoryFiniteLocalFields/E12 — misprint (affects nothing)

- **Where:** `Kbook.2013`, Corollary V.6.9.2, proof, PDF pp. 422–423.
- **Printed:** the image of a under K2i+1(F; Z/ℓ) →K2i(F) is sent by ∂ to b.
- **Correction:** … is sent by ∂ to ± the Bockstein of b, a generator of K_{2i−1}(k) ≅ Z/ℓ.
- **Reason:** b ∈ K_{2i}(k; Z/ℓ) while ∂ of an element of K_{2i}(F) lies in K_{2i−1}(k); the localisation boundary and the Bockstein anticommute (L.2/localisation-bockstein-compatibility).
- **Known:** new.

### KTheoryFiniteLocalFields/E13 — error (affects a stated result)

- **Where:** `Weibel.Handbook.I5`, Proposition 58, p. 164.
- **Printed:** If i > 0 there is a summand of K2i−1(V) ∼= K2i−1(E) isomorphic to K2i−1(Fq) ∼= Z|(qi −1), detected by the e-invariant.
- **Correction:** K_{2i−1}(V) ≅ K_{2i−1}(E) only for i ≥ 2; for i = 1 the summand is μ_{q−1} ⊂ V^× = K_1(V), and K_1(E) = E^× ≅ V^× × Z.
- **Reason:** As for K-book Corollary V.6.9.2: a uniformiser is not a unit.
- **Known:** new.

### KTheoryFiniteLocalFields/E14 — gap (affects the proof)

- **Where:** `Weibel.Handbook.I5`, Proposition 58, proof, p. 164.
- **Printed:** Since Kn(V; Z|ℓ) = Z|ℓ, we also see that K2i(V) is uniquely ℓ-divisible.
- **Correction:** K_n(V; Z/ℓ) ≅ K_n(F_q; Z/ℓ) ≅ Z/gcd(ℓ, q^{⌈n/2⌉} − 1) for n ≥ 1, which is 0 when ℓ ∤ q^{⌈n/2⌉} − 1. Unique ℓ-divisibility of K_{2i}(V) follows from the Bockstein sequences for all ℓ^ν compared with those of F_q (L.2/odd-k-l-torsion, L.2/even-k-uniquely-l-divisible).
- **Reason:** For V with residue field F_2 and ℓ = 5: K_1(V; Z/5) = V^×/5 ≅ F_2^×/5 = 0 ≠ Z/5.
- **Known:** new.

### KTheoryFiniteLocalFields/E15 — misprint (affects nothing)

- **Where:** `Mestel.2014`, §5.4 'The Brauer lift of k(µl)', p. 12.
- **Printed:** viewing k(µl) as a k-vector space of dimension r −1.
- **Correction:** Dimension r; r is the least integer with l | q^r − 1 (the text says 'l divides rq'); the map k(µ_l) ⊗_k \bar k → \bar k^r is z ⊗ w ↦ (zw, z^q w, …, z^{q^{r−1}} w), and the eigenvalues of z are z, z^q, …, z^{q^{r−1}} (without the 1 listed in the text).
- **Reason:** k(µ_l) = F_{q^r} has dimension r over F_q (the essay itself uses 'dimension r' in §8.1); with the printed map the first coordinate would not be multiplicative in z, and a list of r + 1 eigenvalues cannot belong to an r-dimensional representation; the essay's formula (5.1), χ_L(z) = Σ_{i=0}^{r−1} ι(z^{q^i}), is the corrected one.
- **Known:** new.

### KTheoryFiniteLocalFields/E16 — misprint (affects nothing)

- **Where:** `Haine.2016`, Example 4.9 and Example 4.12, pp. 6.
- **Printed:** 𝜆𝑘(𝑎) = 1/𝑘!𝑎(𝑎−1) ⋯(𝑎−𝑘−1)
- **Correction:** λ^k(a) = a(a − 1)⋯(a − k + 1)/k! (the last factor is a − k + 1), in both examples.
- **Reason:** λ^k(n) = C(n, k) = n(n−1)⋯(n−k+1)/k!; with the printed last factor the product has k + 1 factors and λ^1(n) = n(n − 2) instead of n.
- **Known:** new.

### KTheoryFiniteLocalFields/E17 — error (affects a stated result)

- **Where:** `Kbook.2013`, VI.7, paragraph before Proposition VI.7.1, and Proposition VI.7.1 (PDF p. 515; book p. 507), author-hosted draft of 29 August 2013.
- **Printed:** We also saw in Moore’s Theorem (Chapter III, Theorem 6.2.4 and Ex. 6.11) that K2(E) ≅ U2 ⊕ F×q, where U2 is an uncountable, uniquely divisible abelian group. Since K2(E) ≅ K2(V) ⊕ F×q by V.6.9.2, this implies that K2(V) ≅ U2. … The group K2(E) is the sum of F×q and an uncountable, uniquely divisible group.
- **Correction:** K₂(E) ≅ U₂ ⊕ μ(E) and K₂(V) ≅ U₂ ⊕ μ_{p^∞}(E); the printed forms hold exactly when μ_p ⊄ E (always in characteristic p).
- **Reason:** For E = ℚ₂, {−1, −1} is an element of order two of K₂(ℚ₂) (its Hilbert symbol is −1, Example III.6.2.5), and it lies in K₂(ℤ₂); but 𝔽₂^× = 1 and a uniquely divisible group has no 2-torsion, so K₂(ℚ₂) ≇ U₂ ⊕ 𝔽₂^× and K₂(ℤ₂) ≇ U₂. Theorem III.6.2.4 itself has the correct term μ.
- **Known:** Weibel's errata for GSM 145, p. 558: 'K2(E) ≅ U2 ⊕ µ(E) (not ...⊕ F×q)', 'K2(V) ≅ U2 should be K2(V) ≅ U2 ⊕ µp∞(E)', '(VI.7.1): “sum of F×q” should be “sum of µ(E)”'..

### KTheoryFiniteLocalFields/E18 — error (affects the proof)

- **Where:** `Kbook.2013`, Exercise III.6.11 (PDF p. 252; book p. 244), author-hosted draft of 29 August 2013.
- **Printed:** If F is a field of transcendence degree κ over the ground field, Ω1F is a vector space of dimension κ. … In particular, if F is a local field then the uniquely divisible summand U of K2(F) in Moore’s Theorem (6.2.4) is uncountable.
- **Correction:** The dimension statement holds in characteristic 0 only; in characteristic p the dimension of Ω¹_F is the p-degree of F. So the argument gives the uncountability of U only for local fields of characteristic 0; for local fields of characteristic p it follows instead from Corollary III.6.3.2 (|K₂(F)| = |F|) and the finiteness of μ(F).
- **Reason:** F = 𝔽_q((t)) has uncountable transcendence degree over 𝔽_p but p-basis {t}, so Ω¹_F = F·dt is one-dimensional and Ω²_F = 0: the image of K₂(F) → Ω²_F is zero, not of rank κ. (For a perfect field of characteristic p, Ω¹ = 0.) Also, in characteristic p the image in Ω² is an 𝔽_p-vector space, so it has rank 0 as an abelian group.
- **Known:** new.

### KTheoryFiniteLocalFields/E19 — gap (affects the proof)

- **Where:** `Kbook.2013`, Theorem III.6.6 and the paragraph after Theorem III.6.6.1 (PDF p. 245), Theorem III.6.7 (PDF p. 246), Izhboldin's Theorem III.7.8 and Corollary III.7.8.3 (PDF pp. 259–261).
- **Printed:** We omit the proof of Hilbert’s Theorem 90 for K2 (and for KMn; see 7.8.4 below), since the proof does not involve K-theory, contenting ourselves with two special cases: when p = char(F) (7.8.3) and the following special case.
- **Correction:** The case p = char F is not proved independently in the book: Theorem III.6.7 uses Hilbert 90 for K₂ for the degree-p Artin–Schreier extension F(x)/F(y); Corollary III.7.8.3, which the text offers as the proof of that case, uses Izhboldin's Theorem III.7.8 ('Since K^M_n(F) has no p-torsion'), and the proof of Theorem III.7.8 begins 'the case n = 2 being Theorem III.6.7'. Theorem III.6.7 therefore rests on Merkurjev–Suslin's Hilbert 90 [125], not on 7.8.3.
- **Reason:** Following the references: III.6.7 → III.6.6 (p = char F) → III.7.8.3 → III.7.8 (n = 2) → III.6.7 is a cycle; none of the steps supplies an independent argument for n = 2.
- **Known:** new.

### KTheoryFiniteLocalFields/E20 — misprint (affects nothing)

- **Where:** `Weibel.Handbook.I5`, §5.6, sentence before Theorem 57 (p. 163; PDF p. 25), author copy.
- **Printed:** For K2, there is a norm residue symbol K2(E) → µ(E) and we have the following result; see [75, III.6.6].
- **Correction:** [72, III.6.6]: reference [72] is Weibel's K-book manuscript (where, in the 2013 draft, the result is Moore's Theorem III.6.2.4); [75] is 'An introduction to homological algebra'.
- **Reason:** The reference list gives [72] = 'Charles Weibel, Algebraic K-theory, http://math.rutgers.edu/~weibel/' and [75] = 'An introduction to homological algebra, Cambridge Studies in Advanced Mathematics, vol. 38'; Moore's theorem is not in the latter.
- **Known:** new.

### KTheoryFiniteLocalFields/E21 — misprint (affects nothing)

- **Where:** `Weibel.Handbook.I5`, Proof of Theorem 57 (p. 163; PDF p. 25), author copy.
- **Printed:** The fact that U2 is torsion free (hence uniquely divisible) was proven by Tate [66] when char(F) = p, and by Merkurjev [37] when char(F) = 0.
- **Correction:** char(E) = p and char(E) = 0: the local field of §5.6 is E (F denotes a global field in this chapter).
- **Reason:** Theorem 57 and the whole of §5.6 are stated for the local field E; the sentence was carried over from the K-book, where the local field is called F.
- **Known:** new.

### KTheoryFiniteLocalFields/E22 — error (affects a stated result)

- **Where:** `Weibel.Handbook.I5`, §5.6, first two paragraphs (p. 162; PDF p. 24), author copy.
- **Printed:** It is well known that V× = µ(E) × U1, where µ(E) is the group of roots of unity in E (or V), and where U1 is a free Zp-module. In the equi-characteristic case, where char(E) = p, it is well known that V = Fq[[π]] and E = Fq((π)) [55], so µ(E) = F×q , and U1 = W(Fq) has rank [Fq : Fp] over Zp = W(Fp).
- **Correction:** In characteristic p, U₁ = 1 + πF_q[[π]] is the group of big Witt vectors of F_q, a countably infinite product of copies of ℤ_p, which is torsion-free but not a free ℤ_p-module and not of finite rank; 'free' and 'rank [F_q : F_p]' hold only in characteristic 0 (where U₁ has rank [E : ℚ_p] modulo torsion).
- **Reason:** K-book VI.7 (PDF p. 515): 'U1 = 1 + πFq[[π]] is isomorphic to the big Witt vectors of Fq (II.4.3), which is the product of a countably infinite number of copies of Zp', and Exercises VI.7.1–VI.7.2 show that this product is not a free ℤ_p-module; the p-typical W(F_q) of rank f = [F_q : F_p] is the wrong Witt vector group.
- **Known:** Corrected in the author's subsequent K-book (draft of 29 August 2013), VI.7 and Exercise VI.7.2.

### KTheoryFiniteLocalFields/E23 — misprint (affects nothing)

- **Where:** `HesselholtMadsen.2003`, Lemma 2.2.3, p. 34 (Annals 158 (2003); arXiv:math/9910186v2, same text in the TeX e-print).
- **Printed:** Then the element d log πK generates the A-module ω1 (A,M)/W (k), and its annihilator is the ideal generated by φ′K(πK)πK. This ideal contains p.
- **Correction:** The annihilator (φ'_K(π_K)π_K) is contained in pA: φ'_K(π_K)π_K = p(π_Kθ'_K(π_K) − e_Kθ_K(π_K)). It equals pA exactly when p ∤ e_K; when p | e_K it is strictly smaller and does not contain p.
- **Reason:** From φ_K(x) = x^e + pθ_K(x) and π^e = −pθ_K(π): πφ'_K(π) = eπ^e + pπθ'_K(π) = p(πθ'_K(π) − eθ_K(π)), and the second factor is a unit iff p ∤ e. Example: A = Z_p[π] with π^p = p (φ = x^p − p, θ = −1, e = p): πφ'(π) = pπ^p = p², so the annihilator is (p²), which does not contain p. The proof of Corollary 2.2.5 uses the correct inclusion (it needs p | π_Kφ'_K(π_K) to identify the p-torsion of A/(π_Kφ'_K(π_K)) with A/p·dlog(−p)), so nothing downstream is affected.
- **Known:** new.

### KTheoryFiniteLocalFields/E24 — gap (affects the proof)

- **Where:** `HesselholtMadsen.2003`, Proposition 3.2.2 and Addendum 3.2.3, p. 48; with Hesselholt–Madsen 2004 (Ann. Sci. ENS 37), introduction, p. 4 of the author copy.
- **Printed:** Proof. This is a fairly straightforward application of the Freyd adjoint functor theorem, [31, p. 116]. For a detailed proof, we refer the reader to [17, §1].
- **Correction:** A proof of the existence of the initial log Witt complex W_•ω^*_{(R,M)}, of the surjectivity of λ: ω^*_{(W_•(R),M)} → W_•ω^*_{(R,M)} and of W_1ω^*_{(R,M)} ≅ ω^*_{(R,M)} (Addendum 3.2.3) for log rings: [17, §1] and [17, Th. D] treat only Witt complexes without log structure.
- **Reason:** [17] (Hesselholt–Madsen, 'On the de Rham-Witt complex in mixed characteristic') proves Theorem A (initial Witt complex) and Theorem D for Z_(p)-algebras without log structure, and its introduction states: 'The notion of a Witt complex and theorem A above generalize to log-rings; see [HM 2003, §3] for details.' The two papers thus refer to each other for the log case, and neither writes out the solution-set argument or the analogue of Theorem D with the extra generators dlog a and relations F dlog_n a = dlog_{n−1} a.
- **Known:** new.

### KTheoryFiniteLocalFields/E25 — gap (affects the proof)

- **Where:** `HesselholtMadsen.2003`, Remark 2.4.2, p. 43, used in the proof of Lemma 5.6.1, p. 95.
- **Printed:** An argument similar to [27, §5] shows that for m > 0, there exists a noncanonical isomorphism π2m−1(T(A|K), Zp) ∼= A/(mπKφ′K(πK)) and that π2m(T(A|K), Zp) vanishes.
- **Correction:** A proof of the vanishing of π_{2m}(T(A|K);Z_p) for m > 0 (the only part used in Lemma 5.6.1), e.g. by the Bockstein spectral sequence from Theorem 2.4.1 with dκ = κ dlog(−p).
- **Reason:** The remark is asserted without proof, but Lemma 5.6.1 (used for n > 3 in Proposition 3.3.6, Addendum 3.3.7 and Theorem 3.3.8, hence in Theorem C) needs that π_*(T(A|K);Z_p) is concentrated in odd degrees apart from degree 0.
- **Known:** new.

### KTheoryFiniteLocalFields/E26 — misprint (affects nothing)

- **Where:** `HesselholtMadsen.2003`, citations of reference [19] (Hesselholt–Madsen, Topology 36): proof of Lemma 2.2.4 (p. 35) and of Proposition 2.3.4 (p. 39) '[19, Lemma 5.5]'; §2.4 (p. 40) '[19, Th. 5.2, Cor. 5.5]'; proofs of Proposition 3.3.6 (pp. 53–54) and Addendum 3.3.7 (p. 55) '[19, Th. 5.5]', '[19, Prop. 3.3]'; proof of Proposition 3.3.1 '[19, Lemma 3.3]'.
- **Printed:** But HHi(k) = 0, for i > 0, since k is perfect, [19, Lemma 5.5].
- **Correction:** In the author-hosted version of [19] (Topology 36 (1997), 29–101) the cited results are Lemma 4.5 (HH_*(k) = k), Theorem 4.2 and Corollary 4.5 (π_*T(k)), Theorem 4.5 (TR of perfect fields with F, V, R), Proposition 2.3 (the exact sequence for π_0) and Lemma 2.3.1 (relations on π_*(T(A)^C)); §5 of that version treats finite W(k)-algebras and has no Theorem 5.5.
- **Reason:** Comparison of each citation with the statements of the author-hosted PDF of [19] (§§2.3 and 4); the contents match one section lower than the numbers cited.
- **Known:** new (the journal version of [19] was not compared).

### KTheoryFiniteLocalFields/E27 — error (affects a stated result)

- **Where:** `Weibel.Handbook.I5`, §5.6, the paragraph before Theorem 61 (p. 165; PDF p. 27), author copy.
- **Printed:** For all i, and ℓν > wi, the étale cohomology group H1(E,µ⊗i pν ) is isomorphic to (Z/pν)d ⊕Z/wi ⊕Z/wi−1, d = [E : Qp].
- **Correction:** For i ≥ 2 and every ν ≥ 1: H^1(E, μ_{p^ν}^{⊗i}) ≅ (ℤ/p^ν)^d ⊕ ℤ/gcd(p^ν, w_i) ⊕ ℤ/gcd(p^ν, w_{i−1}), with w_j = w_j^{(p)}(E); so the printed form holds once p^ν ≥ max(w_i, w_{i−1}). 'ℓν' is a misprint for p^ν, and i = 1 (where w_0 is undefined) and i ≤ 0 are excluded.
- **Reason:** E = ℚ_3, i = 7, ν = 1: w_7^{(3)}(ℚ_3) = 1 < 3 and w_6^{(3)}(ℚ_3) = 9, so the printed form gives ℤ/3 ⊕ ℤ/9, of order 27 and not killed by 3. But H^1(ℚ_3, μ_3^{⊗7}) is killed by 3, and the Euler characteristic gives #H^1 = 3·#H^0·#H^2 = 3·1·3 = 9 (H^0 = 0 because χ^7 ≡ χ mod 3 is nontrivial; H^2 ≅ H^0(ℚ_3, ℤ/3(−6))^∨ = ℤ/3).
- **Known:** Corrected, for large ν, in the K-book (2013), Corollary VI.7.4.1: 'For i > 1 and all large ν'..

### KTheoryFiniteLocalFields/E28 — misprint (affects nothing)

- **Where:** `Weibel.Handbook.I5`, Proof of Theorem 61 (p. 165; PDF p. 27), author copy.
- **Printed:** If p > 2 the first part is proven in [6] (see [25]).
- **Correction:** If p > 2 the first part is Hesselholt–Madsen [25, Theorem A] together with the Galois-cohomology count; [6] (Bökstedt–Madsen, 'Algebraic K-theory of local number fields: the unramified case') proves it only for unramified E.
- **Reason:** The reference list gives [6] = 'M. Bökstedt and I. Madsen, Algebraic K-theory of local number fields: the unramified case', which does not treat ramified E; Theorem 61 is stated for every finite E/ℚ_p. (Observed by author C of this job.)
- **Known:** The K-book (2013), before Theorem VI.7.4, attributes the case p > 2 to 'HM [88, thm. A]'..

### KTheoryFiniteLocalFields/E29 — misprint (affects nothing)

- **Where:** `Weibel.Handbook.I5`, Theorem 67 (p. 167; PDF p. 29), author copy.
- **Printed:** Set r = [E(µp) : E], and let pa be the number of p-primary roots of unity in E(µp). If r is a topological generator of Z× p , then k = rn, n = pa−1(p −1)|r.
- **Correction:** If γ is a topological generator of ℤ_p^×, then k = γ^n with n = p^{a−1}(p − 1)/r; the letter r cannot denote both the degree [E(μ_p) : E] and the generator.
- **Reason:** Read literally, r is the degree [E(μ_p) : E] of the previous sentence. For E ⊇ μ_p this is r = 1, which is not a topological generator of ℤ_p^×, and k = 1^n = 1 would make Ψ^k − 1 null, so π_{2i−1}FΨ^1 ≅ π_{2i}(BU)^∧_p = ℤ_p instead of the finite group ℤ/w_i^{(p)}(E) the theorem requires.
- **Known:** The K-book (2013), Theorem VI.7.9, writes 'If γ is a topological generator of Z×p, then k = γn', and Hesselholt–Madsen's Theorem D uses g..

### KTheoryFiniteLocalFields/E30 — error (affects nothing)

- **Where:** `Kbook.2013`, Proof of Theorem VI.7.4 (PDF p. 518; book p. 510), author-hosted draft of 29 August 2013.
- **Printed:** Kn(V ; Zp) ∼= Kn(E; Zp) for all n > 0.
- **Correction:** For all n ≥ 2; for n = 1 there is a short exact sequence 0 → K_1(V; ℤ_p) → K_1(E; ℤ_p) → ℤ_p → 0 (the valuation).
- **Reason:** V = ℤ_p, p odd: K_1(ℤ_p; ℤ_p) ≅ (ℤ_p^×)^∧_p = 1 + pℤ_p ≅ ℤ_p, while K_1(ℚ_p; ℤ_p) ≅ (ℚ_p^×)^∧_p ≅ ℤ_p². The localisation sequence has K_0(𝔽_q; ℤ_p) = ℤ_p in the relevant place.
- **Known:** new.

### KTheoryFiniteLocalFields/E31 — error (affects the proof)

- **Where:** `Kbook.2013`, Proof of Theorem VI.7.4 (PDF p. 518; book p. 510), author-hosted draft of 29 August 2013.
- **Printed:** K2i−1(V ; Zp) is the direct sum of the finite p-group Z/w(p) i (E) and two finitely generated torsionfree Zp-modules: the Tate module of Di−1 and Ti ⊗Z Zp.
- **Correction:** The second module is the p-adic completion lim_ν T_i/p^νT_i ≅ ℤ_p^{t_i}, not T_i ⊗_ℤ ℤ_p.
- **Reason:** T_i contains the image of the uncountable uniquely divisible summand K^M_{2i−1}(E) (Proposition VI.7.1, characteristic 0, 2i − 1 ≥ 3), a ℚ-vector space V; then V ⊗_ℤ ℤ_p = V ⊗_ℚ ℚ_p is a nonzero ℚ_p-vector space of uncountable dimension, so T_i ⊗ ℤ_p is not finitely generated and does not embed in the finitely generated K_{2i−1}(V; ℤ_p).
- **Known:** new.

### KTheoryFiniteLocalFields/E32 — misprint (affects nothing)

- **Where:** `Kbook.2013`, Proof of Theorem VI.7.4 (PDF pp. 517–518; book pp. 509–510), author-hosted draft of 29 August 2013.
- **Printed:** It is classical that the groups H∗et(E; Z/pν) are finitely generated groups, and that the H∗et(E; Z/p) are finitely generated Zp-modules.
- **Correction:** The groups H^*_et(E; ℤ/p^ν) are finite, and the H^*(E; ℤ_p(i)) are finitely generated ℤ_p-modules.
- **Reason:** H^*(E; ℤ/p) is an 𝔽_p-vector space, so calling it a finitely generated ℤ_p-module says nothing new; the statement the proof needs, and the classical one, is about ℤ_p coefficients (Tate).
- **Known:** new.

### KTheoryFiniteLocalFields/E33 — error (affects a stated result)

- **Where:** `Kbook.2013`, Corollary VI.7.4.2 (PDF p. 518; book p. 510), author-hosted draft of 29 August 2013.
- **Printed:** Corollary 7.4.2. K3(V ) contains a torsionfree subgroup isomorphic to Zd (p), whose p-adic completion is isomorphic to K3(V ; Zp) ∼= (Zp)d.
- **Correction:** … whose p-adic completion is isomorphic to the torsion-free quotient ℤ_p^d of K_3(V; ℤ_p) ≅ ℤ_p^d ⊕ ℤ/w_2^{(p)}(E).
- **Reason:** By Theorem VI.7.4 itself K_3(V; ℤ_p) ≅ ℤ_p^d ⊕ ℤ/w_2^{(p)}(E), and w_2^{(p)}(E) ≠ 1 for E = ℚ_3 (w = 3) and E = ℚ_2 (w = 8), so K_3(V; ℤ_p) ≇ ℤ_p^d there.
- **Known:** Stated correctly in Handbook I.5 (2005), Corollary 63: 'the torsion free part of K3(V; Zp) = (Zp)d ⊕ Z/w(p) 2'..

### KTheoryFiniteLocalFields/E34 — misprint (affects nothing)

- **Where:** `Kbook.2013`, Exercise VI.7.4 (PDF p. 520; book p. 512), author-hosted draft of 29 August 2013.
- **Printed:** In Theorem VI.7.9 7.9, check that π2i−1FΨk ∼= Zp/(ki−1) is Z/wi(E) for all i.
- **Correction:** … is ℤ/w_i^{(p)}(E) for all i.
- **Reason:** ℤ_p/(k^i − 1) is a p-group, while w_i(E) = (q^i − 1)·w_i^{(p)}(E) (Example VI.2.3.1) has the prime-to-p factor q^i − 1 > 1; e.g. E = ℚ_5, i = 1: ℤ_5/(k − 1) = 0 but w_1(ℚ_5) = 4.
- **Known:** The Handbook's Theorem 67 is correct in its notation, where w_i denotes w_i^{(p)}(E) throughout §5.6..

### KTheoryFiniteLocalFields/E35 — error (affects nothing)

- **Where:** `Kbook.2013`, Proof of Proposition VI.7.1 (PDF p. 515; book p. 507), author-hosted draft of 29 August 2013.
- **Printed:** which by duality is Z/(w2, m), where w2 = w2(E) is q2 −1 by
- **Correction:** w_2(E) = (q² − 1)·w_2^{(p)}(E) (Example VI.2.3.1); it equals q² − 1 only when w_2^{(p)}(E) = 1, for instance in characteristic p or for m prime to p.
- **Reason:** E = ℚ_3: w_2(ℚ_3) = 8·3 = 24 ≠ q² − 1 = 8. In characteristic 0 every m is invertible in E, so p | m is allowed in the argument.
- **Known:** new.

### KTheoryFiniteLocalFields/E36 — gap (affects the proof)

- **Where:** `Kbook.2013`, Proof of Proposition VI.7.1 and proof of Theorem VI.7.2 (PDF pp. 515–516; book pp. 507–508), author-hosted draft of 29 August 2013.
- **Printed:** The group is uncountable by Ex. III.EIII.7.14 7.14, and divisibility follows easily from Moore’s Theorem
- **Correction:** In characteristic p the uncountability of K^M_n(E), n ≥ 3 (and hence of U_n, n ≥ 3, in Theorem VI.7.2) needs another argument; the Handbook attributes it to Tate.
- **Reason:** Exercise III.7.14 bounds #K^M_n(F) below by the image of dlog in Ω^n_F, using Exercise III.6.11 (dim Ω^1_F equals the transcendence degree). For F = 𝔽_q((t)), {t} is a p-basis, Ω^1_F = F dt and Ω^n_F = 0 for n ≥ 2, so the image is zero and no lower bound results. (Author B of this job records the failure of Exercise III.6.11 in characteristic p for n = 2.)
- **Known:** new.

## Gaps

### Quillen's vanishing of the mod-p homology of GL(F_q) is cited, not proved

Quillen 1972 (Ann. of Math. 96), §11, proves H̃_*(GL(F_q); F_p) = 0 stably. The K-book cites Theorem IV.1.12 without proof, Haine refers to Quillen §11, and Mestel omits it ('it is in section 11 of Quillen's paper, but is omitted here for reasons of space'). Quillen's paper was not available. NEXT SOURCE ACTION: read Quillen 1972 §11 (or Fiedorowicz–Priddy, Homology of classical groups over finite fields, LNM 674) and decompose it.

Needed by: `L.1/gl-mod-p-acyclic`, `L.1/quillen-homology-iso`, `L.1/quillen-fibration`.

### The prime 2 in Quillen's cohomology comparison is not treated in the sources read

Mestel assumes ℓ ≠ 2 ('The case l = 2 introduces some technicalities that are not included here for reasons of space, but can be found in Quillen's paper'); the ring structure of H^*(FΨ^q; F_2) (e_{jr}^2 need not vanish by graded commutativity) and the Sylow count (the lifting-the-exponent formula fails at 2) both need Quillen's separate argument. The additive computation of H^*(FΨ^q; F_2) (Eilenberg–Moore) holds as stated. NEXT SOURCE ACTION: Quillen 1972, the case ℓ = 2 of §§8–10.

Needed by: `L.1/fpsi-cohomology-ring`, `L.1/gl-cohomology-detection`, `L.1/quillen-homology-iso`.

### Quillen's detection lemmas for GL_n(F_q) are cited, not proved

Mestel's Lemma 33 (every abelian subgroup of exponent a power of ℓ is conjugate into C^m; 'Proof. Omitted. See Quillen's paper, lemma 12') and Lemma 34 (detection by abelian subgroups passes to Σ_m ⋉ G^m; Quillen, The Adams conjecture, Topology 10 (1971), Prop. 3.4) are not proved in any source read; nor are Cartan–Eilenberg's Sylow detection (XII.10) and Totaro's description of H^*(C; F_ℓ)^π (the additive groups are Mathlib's Rep.FiniteCyclicGroup.groupCohomologyIsoEven/Odd; the cup-product structure is not). NEXT SOURCE ACTION: Quillen 1971 §3 and 1972 §§8–9.

Needed by: `L.1/gl-cohomology-detection`.

### Green's theorem on Brauer characters is cited, not proved

That g ↦ S(ι(λ_1(g)), …, ι(λ_n(g))) is a virtual character (Green, The characters of the finite general linear groups, Trans. AMS 80 (1955), Theorem 1) is cited by the K-book (implicitly, Example IV.5.8), Haine (Theorem 5.8) and Mestel (Theorem 14); no proof was read. It is a statement about finite-group representation theory, closest to a representation-theory roadmap; no atlas stage names it. NEXT SOURCE ACTION: Serre, Linear representations of finite groups, §18 (Brauer's characterisation of characters), or Green 1955.

Needed by: `L.1/green-virtual-character`, `L.1/brauer-lift`.

### Atiyah–Segal vanishing of K̃U^1 on classifying spaces is cited, not proved

K̃U^1(BG) = [BG, U] = 0 for finite G (Mestel Theorem 15, citing Benson; Haine Lemma 6.10, citing Atiyah–Segal) and the vanishing of lim^1 for the tower K̃U^0(BGL_n(F_q)) (needed for [BGL(F_q), U] = 0 and [BGL(F_q), BU] = lim_n [BGL_n(F_q), BU]) are not proved in the sources read. Requested from RefinedTraceMethods RT.4:topological (Part II proposal).

Needed by: `L.1/fpsi-lifting`, `L.1/quillen-map`, `L.1/frobenius-is-adams`.

### The Eilenberg–Moore spectral sequence is cited, not constructed

Mestel's Theorem 19 cites Hatcher's unfinished notes on spectral sequences for the Eilenberg–Moore spectral sequence of a homotopy pullback over a simply connected base with finite type cohomology, and Lemmas 17–18 (Künneth for Tor, Tor over a polynomial ring) cite May's notes. StableHomotopyKTheory H.6's text ('Construct exact couples ... and the passage from towers to spectral sequences') is the closest owner and is requested.

Needed by: `L.1/fpsi-cohomology`.

### Browder's computation of the mod-ℓ ring of a finite field and the Araki–Toda multiplications are cited, not proved

K-book Remark IV.1.13.1 and Scholium IV.2.8.1 cite Browder (Algebraic K-theory with coefficients Z/p, LNM 657, 1978) for K_*(F_q; Z/ℓ) ≅ Z/ℓ[β, ζ]/(ζ^2), the ring isomorphism of the even part with π_{2*}(BU; Z/ℓ), and the ring structure on E ∧ P^∞(Z/ℓ^ν) when E has no positive even homotopy; Theorem IV.2.8 rests on Araki–Toda through Neisendorfer. None was read. The multiplications are requested from StableHomotopyKTheory H.6.

Needed by: `L.1/browder-mod-l-ring`, `L.1/mod-m-products`, `L.1/algebraic-closure-mod-m-ring`, `L.2/mod-m-local-field-ring`.

### Hiller's universality of the representation-ring map is cited, not proved

K-book Proposition IV.5.7 ('proven by obstruction theory ... See Hiller [89, 2.4]') is needed for the compatibility of the Quillen–Hiller operations with Brauer lifting (Example IV.5.8) and hence for ψ^k = k^i on K_{2i−1}(F_q) (Example IV.5.9.2). Requested from SchemeKTheoryOperations S.6 with the operations. L.1/frobenius-is-adams does not depend on it.

Needed by: `L.1/adams-on-finite-field-k`.

### The decomposition of Quillen's proof follows an expository essay whose computations were not all re-derived

Mestel's Part III essay (2014) supplies the structure of nodes L.1/fpsi-cohomology through L.1/quillen-homology-iso. Its Lemma 21 (the Bockstein of ẽ_i), the construction of Definition 24 and the arithmetic of Lemma 32 were checked; Lemma 25 and Lemmas 26–29 (the classes of W on BC, the addition maps μ, ν and the product formula) were read but not independently re-derived, and misprints were found in §5.4 (sourceIssues). NEXT SOURCE ACTION: compare with Quillen 1972 §§8–9.

Needed by: `L.1/fpsi-cohomology-ring`, `L.1/gl-cohomology-detection`.

### Gabber's rigidity theorem is cited, not proved

K-book Theorem IV.2.10 is stated without proof ('Gabber proves that ...'); Clausen–Mathew–Morrow state it as Theorem 1.4 and use it (Remark 4.37 describes the two halves of Gabber's proof and says they use only the second, also due to Gillet–Thomason). Gabber (Contemp. Math. 126, 1992), Suslin (On the K-theory of local fields, JPAA 34, 1984) and Gillet–Thomason (JPAA 34, 1984) were not available. Every L.2 node rests on this theorem. NEXT SOURCE ACTION: Gabber 1992, or the axiomatic rigidity argument of CMM §4.2 together with Gillet–Thomason for henselisations of smooth algebras at rational points.

Needed by: `L.2/gabber-rigidity`, `L.2/rigidity-finite-residue-field`, `L.2/henselian-dvr-mod-m-splitting`.

### Merkurjev's theorem on the torsion in K₂ of local fields was not obtained

Merkurjev, 'On the torsion in K₂ of local fields', Ann. of Math. 118 (1983), 375–381 (K-book reference [124], Handbook reference [37]) proves that the kernel U(E) of the norm residue map has no p-torsion when char E = 0. Both sources cite it without proof (K-book, proof of Theorem III.6.2.4; Handbook, proof of Theorem 57). It is the only input of Moore's theorem in characteristic 0 that this layer does not decompose. Everything else is proved from the nodes: prime-to-p torsion-freeness from L.2, and p-divisibility from the degree-two norm residue theorem with local duality. A continuation that obtains the paper should decompose its argument (it uses the structure of K₂ of the p-cyclotomic extension and the Merkurjev–Suslin theorem).

Needed by: `L.3/merkurjev-p-torsion-free`, `L.3/moore-theorem`, `L.3/moore-mixed-characteristic`, `L.3/ring-of-integers-subgroup`, `L.7/hilbert-symbol-completion`.

### Hilbert's Theorem 90 for K₂ in the Artin–Schreier case has no proof in the sources read and no owner

L.3/k2-no-p-torsion-char-p (K-book Theorem III.6.7) needs the exactness of K₂(E) →(1−σ) K₂(E) →N K₂(F) for the Artin–Schreier extension F(x)/F(y), y = x^p − x, in characteristic p. The K-book states Hilbert's Theorem 90 for K₂ (Theorem III.6.6) citing Merkurjev–Suslin [125] and Gille–Szamuely [66, 8.4], and says it proves the special case p = char F in Corollary III.7.8.3; but that corollary uses Izhboldin's Theorem III.7.8, whose case n = 2 is Theorem III.6.7 itself (sourceIssues). No stage of the atlas plans Hilbert 90 for K₂. Next step: obtain Merkurjev–Suslin's argument for the characteristic-p case (or a proof through Bloch–Kato–Gabber and the Bloch–Kato divisibility of p-torsion that avoids III.6.7) and route it to its owner (restructure).

Needed by: `L.3/k2-no-p-torsion-char-p`, `L.3/moore-theorem`, `L.3/moore-equal-characteristic`.

### The tame formula for the d-th power norm residue symbol is stated in the sources read only for d = 2 over ℚ_p

L.3/tame-component states (a, b)_{E,d} = ω(∂_v{a, b})^{−(q−1)/d} for d | q − 1 in the pinned normalisations. The K-book states only Exercise III.6.7 (d = 2, E = ℚ_p, where the sign is invisible). The node's proof is the classical computation from local class field theory (units are norms from unramified extensions; a uniformiser acts on unramified extensions as arithmetic Frobenius), checked on ℚ₅ with d = 4 and ℚ₇ with d = 3. It should be compared with Serre, Local Fields, Chapter XIV §3, Proposition 8, and Neukirch, Algebraic Number Theory V (3.4), which were not read; the sign depends on the variable order of T.7 and on the Frobenius normalisation of ClassFieldTheory Layer 6, both pinned in the node.

Needed by: `L.3/tame-component`, `L.3/hilbert-symbol-components`, `L.3/ring-of-integers-subgroup`, `L.3/moore-equal-characteristic`.

### Moore's own proof of the divisibility was not read; the characteristic-zero p-part is proved by another route

The K-book and the Handbook cite the divisibility of U(E) to Moore's appendix in Milnor's 'Introduction to algebraic K-theory' (not available). This layer proves it prime by prime from other inputs: at ℓ ≠ p from L.2's unique ℓ-divisibility of K₂(𝒪); at p in characteristic p from Bloch–Kato–Gabber and Ω²_E = 0; at p in characteristic 0 from the degree-two norm residue theorem (MotivicEtaleKTheory M.5, Merkurjev–Suslin) and the duality count #H²(E, μ_{p^ν}^{⊗2}) = #μ_{p^ν}(E) of K-book VI.7, p. 516, which is the method of the proof of Proposition VI.7.1 transposed to degree two. The reviewer should check that no input of that route itself uses Moore's theorem; Tate's local theorem (MotivicEtaleKTheory M.3) is deliberately not used.

Needed by: `L.3/moore-kernel-p-divisible-mixed-characteristic`, `L.3/moore-theorem`.

### Cyclotomic structure on T(C) for a linear Waldhausen category is only sketched

HM §1.2 construct T-equivariant maps ρ_p^*(T(C)_{n,V})^{C_p} → T(C)_{n,ρ_p^*V^{C_p}} 'by a construction similar to that of [HM 1997, §2]' and state that 'one can prove' that the resulting orthogonal spectrum has a cyclotomic structure; no proof is given. HM 1997 §§1–2 (read) do it for FSPs, not for THH^{(n)}(N^w_• S^{(n)}_• C). RefinedTraceMethods RT.2 constructs cyclotomic structures on THH of spectral categories; the gap is the comparison of HM's linear-category model with that construction (Blumberg–Mandell §§3–4 treat spectral categories and can serve as the modern route).

Needed by: `L.4/thh-of-linear-waldhausen-category`, `L.4/tr-pro-spectrum`.

### Proofs cited but not read in HM §1: McCarthy's additivity, Bökstedt's approximation lemma, Waldhausen's Lemma 1.4.1 and Theorem 1.6.4, Thomason–Trobaugh 1.9.8, Cartan–Eilenberg XVII.1.2

HM prove Lemmas 1.3.1, 1.3.2, 1.3.9, 1.3.10, Corollary 1.3.4, Theorem 1.4.1 and Lemma 1.5.3 in full. The following are used by citation only: McCarthy's additivity theorem for the cyclic nerve (J. Pure Appl. Algebra 93, 1994), said to generalise 'mutatis mutandis' to Φ (Theorem 1.3.5); Bökstedt's approximation lemma (Proposition 1.3.8); Waldhausen's Lemma 1.4.1 (Lemma 1.3.3) and the proof of his Theorem 1.6.4 (Theorem 1.3.11); Thomason–Trobaugh's approximation Theorem 1.9.8 (Theorem 1.5.2, Proposition 1.5.4); Cartan–Eilenberg XVII Proposition 1.2 (Proposition 1.5.4). None of these sources is freely available to this job. GeneralAlgebraicKTheory K.4 plans the K-theory versions (Φ = ob); the THH versions must be proved for Φ = THH^{C_r}, or replaced by the localisation theorems of Blumberg–Mandell (arXiv:0802.3938, Theorems 1.1, 7.1) for spectral categories.

Needed by: `L.4/thh-additivity-theorem`, `L.4/thh-structure-maps-f-equivalences`, `L.4/isomorphism-nerve-degeneracy-equivalence`, `L.4/thh-fibration-theorem`, `L.4/thh-torsion-complexes-f-equivalence`, `L.4/thh-projective-complexes-f-equivalence`, `L.4/three-by-three-lemma`.

### The Dundas–McCarthy equivalence criterion, Morita invariance and Dundas dévissage for THH are cited, not proved

Proposition 1.5.1 is quoted from Dundas–McCarthy (J. Pure Appl. Algebra 109, 1996, Prop. 2.3.3), Morita invariance from the same paper (Prop. 2.1.5) and dévissage T(C^b_z(M_k)) ≃ T(C^b_z(M^q_A)) from Dundas (J. Pure Appl. Algebra 129, 1998, Th. 1); none was read. Dévissage is genuinely special to HM's linear-category model: for the spectral (DK) enhancement the analogous statement fails (Blumberg–Mandell's fibre THH(Perf_{A-tors}) is not THH(k)), so this input must be proved for HM's model and cannot be replaced by a localisation theorem for stable ∞-categories.

Needed by: `L.4/dundas-mccarthy-equivalence-criterion`, `L.4/dvr-tr-agrees-with-ring-tr`, `L.4/thh-torsion-complexes-f-equivalence`.

### Existence of the de Rham–Witt complex with log poles: the two sources refer to each other

HM 2003 Proposition 3.2.2 ('a fairly straightforward application of the Freyd adjoint functor theorem … For a detailed proof, we refer the reader to [HM 2004, §1]') and Addendum 3.2.3 (from [HM 2004, Th. D]); HM 2004 §1 and Theorem D treat only Witt complexes without log structure, and HM 2004's introduction says 'The notion of a Witt complex and theorem A above generalize to log-rings; see [HM 2003, §3] for details.' So no read source proves the existence of the initial log Witt complex, the surjectivity of λ: ω^*_{(W_•(R),M)} → W_•ω^*_{(R,M)} or W_1ω^*_{(R,M)} ≅ ω^*_{(R,M)}. The non-log arguments of HM 2004 §1 (solution set for Freyd's theorem; Theorem D via the construction P(E)) are expected to carry over; this must be written out (see the source issue).

Needed by: `L.5/log-de-rham-witt-complex`, `L.5/log-de-rham-witt-level-one`.

### Lindenstrauss–Madsen, THH of number rings, not read

HM use Lindenstrauss–Madsen (Trans. AMS 352, 2000) Theorems 4.4, 4.6 (π̄_*T(A) as a k-algebra), Theorem 5.1 (π_*(T(A);Z_p)), Proposition 4.3 (in Proposition 5.3.1) and §5 (Remark 2.4.2). The paper is not on arXiv and was not obtained; the statements are recorded as HM quote them (nodes L.5/thh-of-dvr-mod-p, L.5/thh-of-dvr-p-adic). A formalisation must prove them, e.g. by the Bökstedt spectral sequence for THH(A) relative to THH(W(k)) or by the modern computation of THH of complete DVRs through THH(A/S[z]) (Krause–Nikolaus, Liu–Wang), not read here.

Needed by: `L.5/thh-of-dvr-mod-p`, `L.5/thh-of-dvr-p-adic`, `L.5/log-thh-mod-p`, `L.5/log-thh-low-degrees`, `L.5/reduction-mod-p-of-thh-dvr`, `L.5/norm-restriction-exact-low-degrees`, `L.5/log-de-rham-witt-tr-level-two`.

### Remark 2.4.2 (π_*(T(A|K);Z_p)) is stated without proof but used in Lemma 5.6.1

HM: 'An argument similar to [LM, §5] shows that for m > 0, there exists a noncanonical isomorphism π_{2m−1}(T(A|K),Z_p) ≅ A/(mπ_Kφ'_K(π_K)) and that π_{2m}(T(A|K),Z_p) vanishes.' The proof of Lemma 5.6.1 uses that π_*(T(A|K);Z_p) is concentrated in odd degrees apart from degree 0. Supply the Bockstein spectral sequence argument from Theorem B (dκ = κ dlog(−p)).

Needed by: `L.5/log-thh-p-adic`, `L.5/frobenius-surjective-odd-degrees`.

### Tsalidis' theorem (Addendum 5.4.4) not read; the Nikolaus–Scholze replacement must be checked

Addendum 5.4.4 passes from C_p to C_{p^n} by 'the main theorem of [Tsalidis, Topology 37, 1998]', not read. Nikolaus–Scholze Corollary II.4.9 (read) proves: for a genuine C_{p^n}-spectrum X with X, Φ^{C_p}X, …, Φ^{C_{p^{n−1}}}X bounded below and (Y^{C_p})^_p → (Y^{hC_p})^_p an isomorphism on π_i for i ≥ k, the map (X^{C_{p^n}})^_p → (X^{hC_{p^n}})^_p is an isomorphism on π_i for i ≥ k. Its application to X = T(A|K) (bounded below by node L.4/log-thh-bounded-below; for cyclotomic spectra 'one needs to check the hypothesis only for Y = X') from Theorem 5.4.3 must be written out, including the passage between p-completed and mod p statements (Theorem 5.4.3 is mod p in degrees ≥ 0).

Needed by: `L.5/gamma-hat-all-levels`.

### Inputs from Hesselholt–Madsen 1997 and other papers cited in HM 2003 §§3–5 and not decomposed

Cited results used as black boxes: HM 1997 Lemma 3.3 / Hesselholt 1996 Lemmas 1.5.1, 1.5.6 (FdV = d, Fd[a] = [a]^{p−1}d[a] on TR; statements read in Hesselholt 1996), HM 1997 Proposition 3.3 (exactness of 0 → hTR_0 → TR_0 → TR_0 → 0), Bökstedt–Madsen (Astérisque 226) for the induction in Proposition 5.5.4, Noether/Fröhlich (normal integral bases for tame extensions) in Theorem 2.4.3, Serre's power series with f∘φ = φ∘g (Local class field theory §3) in Lemma 5.2.1, and the cyclic-polytope geometry of HM 1997b §3 (Theorem 3.1.2, proofs of Arnold, Totaro, Boij) behind Theorem B there. The proofs of Propositions 5.5.4 and 5.5.5 were read for their structure; their degree bookkeeping is recorded as proof steps but not split further.

Needed by: `L.5/tr-log-dvr-is-log-witt-complex`, `L.5/norm-restriction-exact-low-degrees`, `L.5/tate-spectral-sequence-unramified`, `L.5/tate-spectral-sequence-deeply-ramified`, `L.5/log-thh-tame-descent`, `L.5/lubin-tate-unit-polynomial`, `L.5/cyclic-bar-construction-of-truncated-monoid`.

### Continuity and perfect-field inputs of HM 1997 Theorem D

Theorem D rests on McCarthy's theorem (imported from RefinedTraceMethods RT.3), HM 1997 Theorem 5.1 (TC^top(A)^_p ≃ TC(A)^_p, not decomposed here), the continuity K^top(A)^_p ≃ K(A)^_p (HM 1997 Appendix B after Suslin–Yufryakov, statements only) and K(k)^_p ≃ HZ_p for perfect k (Quillen for finite k, KTheoryFiniteLocalFields L.1; Kratzer, 'λ-structure en K-théorie algébrique', for general perfect k, not read). For the local fields of L.6 (finite k) only the finite-field case is needed.

Needed by: `L.5/trace-equivalence-finite-witt-algebras`, `L.5/trace-isomorphism-for-local-field`.

### Galois-cohomology inputs of Theorem 6.1.6 without an identified owner

Theorem 6.1.6 uses, for a complete discretely valued field K of characteristic 0 with perfect residue field k of characteristic p: Serre's exact sequence 0 → H^2(k,μ_p) → H^2(K,μ_p) → H^1(k,Z/p) → 0 (Local Fields p. 186), H^2(k,μ_p) = 0 for k perfect of characteristic p (p. 157), and Artin–Schreier with the normal basis theorem H^1(k,Z/p) ≅ k/(φ − 1)k. No stage text read names these for perfect (not necessarily finite) residue fields; for finite k they are part of local class field theory (Tau Ceti ClassFieldTheory). The Tate twists and Kummer theory are requested from MotivicEtaleKTheory M.1 and Tau Ceti ProfiniteCohomology layer 9.

Needed by: `L.5/tc-of-log-dvr-mod-p`.

### TR^n_{q−λ}(k;p) for perfect k and the Geisser–Hesselholt TC sequence are cited

Hesselholt 2005 §3.12 quotes TR^n_{q−λ}(k;p) ≅ W_r(k) (q = 2m, ℓ_{n−r} ≤ m < ℓ_{n−1−r}) from Hesselholt–Madsen's 'cyclic polytopes' paper (Proposition 9.1 there, statement not located in the copy read) and the TC long exact sequence for regular F_p-algebras is quoted by Geisser–Hesselholt 2006 from their earlier papers (not read).

Needed by: `L.5/twisted-tr-of-regular-fp-algebra`, `L.5/relative-k-of-truncated-polynomial-over-perfect-field`, `L.5/tc-of-regular-fp-algebra`.

### Uncountability of the Milnor K-groups K^M_n(E), n ≥ 3, and of U_n, n ≥ 3, for E = 𝔽_q((t)) is not proved in the sources read

K-book Proposition VI.7.1 says 'The group is uncountable by Ex. III.7.14', and Theorem VI.7.2 uses Proposition VI.7.1 for U_n, n ≥ 3. Exercise III.7.14 bounds #K^M_n(F) below through the dlog map to Ω^n_F with Ω^1_F of dimension equal to the transcendence degree (Ex. III.6.11); for F = 𝔽_q((t)) the p-basis {t} gives Ω^n_F = 0 for n ≥ 2, so the argument gives nothing (sourceIssues; compare the L.3 finding on Ex. III.6.11). The Handbook (proof of Theorem 56) attributes the statement to Tate, 'Relations between K2 and Galois cohomology' (its reference [66]), which was not read. Unique divisibility is proved (L.6/milnor-k-of-local-fields); only uncountability in characteristic p for n ≥ 3 is open here. Next source action: read Tate [66] §§4–5 or find another argument (for example residue maps along non-continuous valuations of 𝔽_q((t))).

Needed by: `L.6/milnor-k-of-local-fields`, `L.6/uniquely-divisible-summand`, `L.6/equal-characteristic-integral-structure`.

### The p-adic homotopy type of étale K-theory of a p-adic field (input of Hesselholt–Madsen Theorem D) was not read

Hesselholt–Madsen, Introduction: 'For K a finite extension of Qp, the p-adic homotopy type of the Két(K) is known by [45] and [8]' (Thomason, 'Algebraic K-theory and étale cohomology'; Dwyer–Mitchell). Theorem D follows from that calculation and L.6/hm-etale-comparison. Neither paper was obtained, and the K-book's extension to the valuation ring (K(V)^∧_p ≃ SU × U^{d−1} × FΨ^k × BFΨ^k) is stated without proof. L.6/hm-theorem-d records the statement and checks its homotopy groups against L.6/completed-k-groups-of-p-adic-fields; the equivalence of spaces is not decomposed.

Needed by: `L.6/hm-theorem-d`.

### cd_p(K) ≤ 2 for a complete discretely valued field K of characteristic 0 with perfect, not necessarily finite, residue field has no owner

Hesselholt–Madsen's Theorem A holds for such K, and its derivation from Theorem 6.1.10 needs the vanishing of H^j(K, M) for j ≥ 3 and finite p-primary M (Serre, Galois cohomology II.4.3). For finite residue fields this is the local-field case requested from ClassFieldTheory Layer 5 (which does not list it among its exports either). No stage of the atlas states it for perfect infinite residue fields. L.6 uses only the finite-residue-field case.

Needed by: `L.6/hm-theorem-a`.

### The natural splitting of K_{2s}(K; ℤ/p^v) ≅ H^0 ⊕ H^2 for v > 1 is asserted by Hesselholt–Madsen without a separate argument in the text read

Theorem A states natural isomorphisms K_{2s}(K, Z/p^v) = H^0(K, μ^{⊗s}) ⊕ H^2(K, μ^{⊗(s+1)}). Theorem 6.1.6 gives the natural splitting only for v = 1 (the retraction TC_0 → TR_0^F); for v > 1 the descent spectral sequence gives the extension, and the splitting's naturality is not argued in §6. Nothing in L.6 uses the splitting: the limit and colimit arguments need only the exact sequence, which L.6/hm-theorem-a and L.6/finite-coefficient-lichtenbaum-quillen state.

Needed by: `L.6/hm-theorem-a`.

### The Geisser–Levine theorem has no stage that names it

L.6's equal-characteristic route (Geisser–Hesselholt Theorem 3.1) and the p-torsion step of L.6/milnor-k-of-local-fields use Geisser–Levine, 'The K-theory of fields in characteristic p' (Invent. Math. 139 (2000)), K-book Theorem VI.4.7, and its extension to essentially smooth local 𝔽_p-algebras. MotivicEtaleKTheory M.5 names only the 'Bloch–Gabber–Kato logarithmic differential statement'; the request to M.5 asks for Geisser–Levine as well. Next action: M.5 (or M.6, where the motivic spectral sequence with ℤ/p^ν coefficients in characteristic p lives) adopts it.

Needed by: `L.6/geisser-hesselholt-regular-local`, `L.6/equal-characteristic-completed-k-groups`, `L.6/milnor-k-of-local-fields`.

## Requests

What this roadmap imports, by supplier.

### ArithmeticGaloisDuality:D7

The unramified subgroups H^j_ur(F_v, M) ⊆ H^j(F_v, M) for unramified finite coefficients, identified with the image of inflation from the residue field, and the restriction maps H^j(F, M) → H^j(F_v, M) (D7: 'Specify topological restricted products, unramified subgroups, their transition maps').

Needed by: `L.7/unramified-chern-class-reduction`.

### ArithmeticGaloisDuality:R02.1

R02.1's text: 'Construct cohomology for lattices and their torsion quotients through a comparison with the canonical continuous-cohomology construction. Prove the relevant Mittag–Leffler and lim¹ statements before interchanging cohomology and inverse limit. Treat T, V=T[1/p], and V/T separately.' L.6 needs, for G = G_L (L/ℚ_p finite) and T = ℤ_p(i): H^j(G, T) ≅ lim_ν H^j(G, T/p^ν) when the H^{j−1}(G, T/p^ν) are finite; H^j(G, T[1/p]) ≅ H^j(G, T) ⊗ ℚ; H^j(G, V/T) ≅ colim_ν H^j(G, T/p^ν); and finite generation of H^j(G, T) over ℤ_p when H^j(G, T/p) is finite.

Needed by: `L.6/local-duality-for-tate-twists`, `L.6/h1-of-tate-twists`, `L.6/h1-with-divisible-coefficients`, `L.6/odd-completed-k-groups-are-h1`.

### CrystallineCohomology:CR.4

On the Witt-vector carrier: the Frobenius F: W_n(A) → W_{n−1}(A), Verschiebung V: W_{n−1}(A) → W_n(A) and restriction R on Mathlib's TruncatedWittVector (Mathlib has F and V only on the untruncated WittVector), and the Witt complexes of Hesselholt–Madsen over Z_(p)-algebras (p odd) and over F_p-algebras with R, F, V, the relations FV = p, FdV = d, Fd[a] = [a]^{p−1}d[a], the initial Witt complex W_•Ω^*_A with surjection Ω^*_{W_•(A)} → W_•Ω^*_A, the standard filtration and, for smooth (and regular) F_p-algebras, the classical de Rham–Witt complex of Bloch–Deligne–Illusie. CR.4's text: 'Construct Witt complexes W_nΩ, restriction, Frobenius, Verschiebung, Teichmuller lifts and dlog, using the existing Witt-vector carrier. Prove the full relations and universal property … For smooth algebras over a perfect F_p-field prove agreement with the classical de Rham–Witt complex.' L.5 defines only the log version W_•ω^*_{(R,M)} and compares it with this ordinary complex for the trivial log structure. CR.4's text: 'Construct Witt complexes W_nΩ, restriction, Frobenius, Verschiebung, Teichmuller lifts and dlog, using the existing Witt-vector carrier. ... Compute polynomial basic Witt differentials, localization and étale descent'. L.6 needs the de Rham–Witt complex W_nΩ^*_A of 𝔽_p-algebras with F, V, R, d, its compatibility with localisation (W_nΩ_{A[1/f]} = W_nΩ_A[1/[f]]), the basic Witt differentials of k[t] for k perfect, the logarithmic subgroups W_nΩ^q_{A,log}, and Illusie's I.5.7.4: W_nΩ^q_{A,log} ⊆ ker(R − F) ⊆ W_nΩ^q_{A,log} + Fil^{n−1}W_nΩ^q_A for smooth A.

Needed by: `L.4/pi0-tr-is-witt-vectors`, `L.5/log-witt-complex`, `L.5/log-de-rham-witt-complex`, `L.5/tr-of-smooth-fp-algebra`, `L.5/tc-of-regular-fp-algebra`, `L.5/twisted-tr-of-regular-fp-algebra`, `L.5/relative-k-of-truncated-polynomial-regular-fp`, `L.6/power-series-de-rham-witt`, `L.6/geisser-hesselholt-regular-local`, `L.5/residue-field-to-witt-mod-p`, `L.5/modified-verschiebung`.

### CrystallineCohomology:CR.5:log-algebra

Prelog rings (R, α: M → (R,·)) with the group completion M^gp and morphisms of prelog rings; the induced prelog structure on W_n(R) through the Teichmüller map; log derivations (D, Dlog) into an R-module and the universal one ω^1_{(R,M)} = (Ω^1_R ⊕ (R ⊗ M^gp))/⟨dα(a) − α(a) ⊗ a⟩ with absolute Ω^1_R; the log differential graded rings (E^*, M) (a dga with prelog structure α: M → E^0 and Dlog: M → E^1, d∘Dlog = 0, dα(a) = α(a)Dlog a) and the universal one ω^*_{(R,M)} = Λ^*_R ω^1_{(R,M)}. CR.5:log-algebra's text: 'The early prefix constructs prelog rings, associated log structures on the étale site, charts, groupification, integral/fine/saturated monoids … Prove the explicit log differential module and residue maps for the standard semistable chart O_K[x_1,…,x_d]/(x_1…x_r−pi)'. L.5 uses the absolute log differentials of the canonical prelog structure M = A ∩ K^× of a complete DVR (the case d = r = 1 of that chart) and proves their DVR-specific structure itself (residue sequence, cyclicity, torsion, tame base change).

Needed by: `L.5/log-witt-complex`, `L.5/log-differentials-residue-sequence`, `L.5/relative-log-differentials-of-dvr`, `L.5/log-de-rham-witt-complex`, `L.5/tr-log-structure-maps`, `L.5/log-de-rham-witt-level-one`, `L.5/homotopy-orbit-de-rham-witt-module`.

### GeneralAlgebraicKTheory:K.7

K.7's text: 'Construct external products from biexact functors and their associativity, unit and symmetry homotopies. For commutative rings obtain graded-commutative K-groups. Prove compatibility with relative groups, localisation boundaries and transfers.' L.1 needs K(R) as a homotopy commutative ring spectrum (for K(R)/ℓ^ν to be a ring spectrum); L.2 needs the K_*(O)-linearity of the localisation boundary of a DVR, ∂(x·y) = r(x)·∂(y), with its sign stated (the K-book uses both orders, see sourceIssues).

Needed by: `L.1/mod-m-products`, `L.2/dvr-localisation`, `L.1/k-theory-mod-m`, `L.1/restriction-and-transfer`, `L.1/finite-field-products-vanish`, `L.2/even-k-field-splitting`, `L.4/thh-of-linear-waldhausen-category`, `L.1/completed-k-theory`, `L.7/completion-map`, `L.7/transfer-completion-formula`, `L.7/semilocal-completed-map`.

### K2SymbolsBrauer:T.2:symbols

Compatibility, not a supply: T.2:symbols' text 'Prove Matsumoto's theorem that the resulting map K₂ᴹ(F) → K₂(F) is an isomorphism' gives K2SymbolsBrauer:T.2/k2-finite-field (K_2(F_q) = 0 by symbols); L.1/degree-two-symbols recovers K_2(F_q) = 0 in Quillen's model and should cite it, but K2SymbolsBrauer--T.1's nodes T.1/k2-definition and T.1/k2-pi2 cite the umbrella stage GeneralAlgebraicKTheory:K.2, which puts T.1 and T.2 downstream of L.1 (see restructure). Requested: cite GeneralAlgebraicKTheory:K.2:plus there instead.

Needed by: `L.1/degree-two-symbols`.

### KTheoryLowDegrees:U.3

SK₁(A) = 0 for a commutative semilocal ring A, hence K₁(𝒪) = 𝒪^× for the valuation ring of a local field and K₁ of a field is its unit group (U.3: 'Prove SK₁ vanishing for fields and commutative semilocal rings by explicit elementary reduction'). U.3's text: 'Prove SK₁ vanishing for fields and commutative semilocal rings by explicit elementary reduction'. L.6 needs K_1(𝔽_q[[t]], (t)) = 1 + t𝔽_q[[t]], i.e. K_1(V) = V^× for the local ring V = 𝔽_q[[t]] (the same statement author B requests for L.3).

Needed by: `L.3/local-k2-localisation-sequence`, `L.7/completion-map`, `L.6/equal-characteristic-relative-k-theory`.

### KTheoryLowDegrees:U.5

U.5's text: 'For a finite projective algebra extension construct transfer by restriction of scalars. Prove that, on a field's unit group, this agrees with the field norm. ... the boundary map from a discrete valuation field's units to K₀ of its residue field equals the valuation with the chosen convention.' L.1 uses the norm statement for finite fields; L.2 uses the boundary statement ∂[π] = [k] = 1 for a DVR.

Needed by: `L.1/determinant-degree-one`, `L.2/dvr-localisation`.

### KTheoryLowDegrees:U.6

U.6's text: 'Use H.3 and K.2 to identify π₁ BGL(A)⁺ with the explicit quotient. ... the comparison must identify determinant and transfer, not merely provide an abstract isomorphism. Compute K₁ of Z, finite fields, ...'. L.1 imports K_1(F_q) = GL(F_q)/E(F_q) ≅ F_q^× by the determinant, natural in F_q.

Needed by: `L.1/determinant-degree-one`.

### MotivicEtaleKTheory:M.1

The comparison of étale cohomology of Spec F with Galois cohomology of G_F for fields, compatible with pull-back along field extensions (restriction to decomposition groups), and, for a complete discrete valuation ring 𝒪_v with residue field k(v) and m invertible in k(v), H^j_et(Spec 𝒪_v, μ_m^{⊗i}) ≅ H^j(k(v), μ_m^{⊗i}) (M.1: 'scheme étale sites/Galois comparison'). The finite Tate twists μ_p^{⊗s} (s ∈ Z) of the absolute Galois group G_K of a complete discretely valued field K of characteristic 0 as discrete G_K-modules, and their continuous cohomology H^i(K, μ_p^{⊗s}), functorial for finite extensions, with the Kummer identification H^1(K,μ_p) ≅ K^×/K^{×p}. M.1's text: 'Import finite/continuous Tate twists and compact coefficient derived limits from ArithmeticGaloisDuality … prove agreement with finite/discrete cohomology, Kummer localization and transfer.' L.5 states HM's Theorem 6.1.6 in these groups; the residue field k is only assumed perfect. M.1's text: 'Import finite/continuous Tate twists and compact coefficient derived limits from ArithmeticGaloisDuality ... Q/Z(j) uses primewise compatible twists, not the ordinary tensor power of Q/Z.' L.6 needs, for a finite extension L of ℚ_p and i ∈ ℤ, the continuous G_L-modules ℤ/p^ν(i) = μ_{p^ν}^{⊗i}, ℤ_p(i), ℚ_p(i) and ℚ_p/ℤ_p(i) with the reduction maps, the inclusions ℤ/p^ν(i) ⊂ ℤ/p^{ν+1}(i), the identification ℤ/p^ν(i) ≅ (ℚ_p/ℤ_p(i))[p^ν], and the Cartier duality Hom(ℤ/p^ν(j), μ_{p^ν}) ≅ ℤ/p^ν(1 − j).

Needed by: `L.7/etale-chern-class-completion`, `L.7/unramified-chern-class-reduction`, `L.5/tc-of-log-dvr-mod-p`, `L.6/h0-of-tate-twists`, `L.6/local-duality-for-tate-twists`, `L.6/h1-of-tate-twists`, `L.6/finite-coefficient-lichtenbaum-quillen`, `L.6/hm-theorem-a`.

### MotivicEtaleKTheory:M.4

M.4's text: 'Define motivic cohomology by these cycle complexes and prove the low-weight descriptions: weight zero, units/Picard in weight one, field Milnor K-theory on the diagonal'. L.6 needs K^M_n(F) ≅ H^n(F, ℤ(n)) for every field F and n ≥ 0 (Nesterenko–Suslin–Totaro), compatible with the coefficient sequence 0 → ℤ(n) → ℤ(n) → ℤ/m(n) → 0.

Needed by: `L.6/milnor-k-of-local-fields`.

### MotivicEtaleKTheory:M.5

Two statements of M.5 ('For a field F and a prime ℓ invertible in F, prove K_j^M(F)/ℓ^r ≅ H^j(F, μ_{ℓ^r}^{⊗j})' and 'At the residue characteristic use the separate Bloch–Gabber–Kato logarithmic differential statement where L requires it'): (i) in degree j = 2, K₂(E)/p^ν ≅ H²(E, μ_{p^ν}^{⊗2}) for E a finite extension of ℚ_p (Merkurjev–Suslin), proved without Moore's theorem for local fields; (ii) Bloch–Kato–Gabber in degree two, K^M_2(F)/p ≅ ν(2)_F ⊆ Ω²_F for a field F of characteristic p (K-book Theorem III.7.7.2). M.5's texts: 'For a field F and a prime ℓ invertible in F, prove K_j^M(F)/ℓ^r ≅ H^j(F, μ_{ℓ^r}^{⊗j})' and 'At the residue characteristic use the separate Bloch–Gabber–Kato logarithmic differential statement where L requires it.' L.6 needs: (i) the Beilinson–Lichtenbaum consequence H^j(F, ℤ/m(n)) ≅ H^j_et(F, μ_m^{⊗n}) for j ≤ n and m invertible in F; (ii) Bloch–Kato–Gabber, K^M_n(F)/p ≅ Ω^n_{F,log} for fields of characteristic p; (iii) the Geisser–Levine theorem (K-book Theorem VI.4.7): for a field k of characteristic p, K^M_n(k)/p^ν ≅ K_n(k; ℤ/p^ν), K_n(k) has no p-torsion, and the kernel and cokernel of K^M_n(k) → K_n(k) are uniquely p-divisible; and its form for essentially smooth local 𝔽_p-algebras A used by Geisser–Hesselholt: K_q(A) is p-torsion-free and K_q(A)/p^n ≅ W_nΩ^q_{A,log}, generated by symbols. No stage text names (iii); see gaps.

Needed by: `L.3/moore-kernel-p-divisible-mixed-characteristic`, `L.3/k2-p-divisible-equal-characteristic`, `L.6/milnor-k-of-local-fields`, `L.6/geisser-hesselholt-regular-local`, `L.6/equal-characteristic-completed-k-groups`.

### MotivicEtaleKTheory:M.6

M.6's text: 'Identify the cycle-theoretic Chern character with the one constructed in S.7, including product and residue normalisations', with SchemeKTheoryOperations S.7: 'Higher Chow groups and the higher Chern character belong to M'. L.6 needs the Chern classes c_{i,i}: K_i(F) → H^{i,i}(F) ≅ K^M_i(F) of a field and K-book Lemma V.11.13: the composite K^M_i(F) → K_i(F) → K^M_i(F) is multiplication by (−1)^{i−1}(i − 1)!.

Needed by: `L.6/uniquely-divisible-summand`.

### MotivicEtaleKTheory:M.7

M.7's text: 'Construct étale K-theory through descent of finite-coefficient K-theory spectra, and the comparison from ordinary K-theory. Prove the relevant rigidity and étale descent theorems. Deduce Quillen–Lichtenbaum from M.5 and M.6 with an explicit degree range determined by the appropriate cohomological dimension.' L.6 needs: (i) for a field F of characteristic ≠ p with cd_p(F) ≤ 2 — in particular every finite extension of ℚ_p, for every p including 2 — and ν ≥ 1, i ≥ 1: the étale Chern class c_{i,1}: K_{2i−1}(F; ℤ/p^ν) ≅ H^1(F, μ_{p^ν}^{⊗i}) and a natural exact sequence 0 → H^2(F, μ_{p^ν}^{⊗(i+1)}) → K_{2i}(F; ℤ/p^ν) → H^0(F, μ_{p^ν}^{⊗i}) → 0 whose right map is the edge map to K_{2i}(F^sep; ℤ/p^ν), natural in F and in the coefficient maps; (ii) the Galois descent spectrum F^ét(K) = hocolim_{L/K} ℍ^·(G_{L/K}, F(L)) of a functor F from finite subextensions of K̄/K to spectra, with its natural map F(K) → F^ét(K) and the strongly convergent spectral sequence E²_{s,t} = H^{−s}(K, colim_L π_t F(L)) ⇒ π_{s+t}F^ét(K) (Hesselholt–Madsen (6.1.8)–(6.1.9)), applied to F = K(−; ℤ/p^v) (Dwyer–Friedlander étale K-theory) and to F = TC(−|−; p, ℤ/p^v); (iii) Suslin's theorem for an algebraically closed field F̄ of characteristic ≠ p: K_*(F̄; ℤ/p^v) ≅ ℤ/p^v[β], K_{2i−1}(F̄)_tors ≅ μ(i) as an Aut(F̄)-module and K_{2i}(F̄) uniquely divisible for i ≥ 1 (K-book VI.1.6–1.7.1).

Needed by: `L.6/finite-coefficient-lichtenbaum-quillen`, `L.6/hm-etale-comparison`, `L.6/hm-theorem-a`, `L.6/p-primary-torsion-of-odd-k-groups`, `L.6/even-k-groups-mod-p-powers`, `L.6/hm-theorem-d`.

### MotivicEtaleKTheory:M.8

The étale Chern classes c_{i,n} : K_n(X; ℤ/m) → H^{2i−n}_et(X, μ_m^{⊗i}) for schemes X over ℤ[1/m] (M.8: 'Construct étale Chern classes … Prove compatibility with the higher K-theory Chern character, residues, norms and products'), with their functoriality in morphisms of schemes (K-book Definition V.11.5 (1)) and their compatibility with the localisation boundary; used for Spec F_v → Spec F, Spec 𝓞_v → Spec 𝓞_F[1/m] and Spec k(v) → Spec 𝓞_v. M.8's text: 'Construct étale Chern classes, real Deligne cycle-class maps and the rational regulator from motivic cohomology. Prove compatibility with the higher K-theory Chern character, residues, norms and products.' L.6 needs the étale Chern classes c_{i,j}: K_n(F; ℤ/p^ν) → H^{2i−n}(F, μ_{p^ν}^{⊗i}) of fields F with 1/p ∈ F, natural in F, compatible with the reductions ℤ/p^{ν+1} → ℤ/p^ν and inclusions ℤ/p^ν ⊂ ℤ/p^{ν+1} of coefficients, and compatible with the motivic filtration of M.6 (so that c_{i,1} is the projection onto the unique graded piece of K_{2i−1}(F; ℤ/p^ν) when cd_p(F) ≤ 2).

Needed by: `L.7/etale-chern-class-completion`, `L.7/unramified-chern-class-reduction`, `L.6/finite-coefficient-lichtenbaum-quillen`, `L.6/odd-completed-k-groups-are-h1`, `L.6/even-completed-k-groups-are-h2`.

### RefinedTraceMethods:RT.1

Hochschild homology HH_*(A) of commutative rings (cyclic model, Connes' B, relative groups for an ideal), cyclic homology HC and negative cyclic homology HC^- with the SBI sequence, the smooth characteristic-zero HKR isomorphism Ω^*_A ≅ HH_*(A) and its extension to filtered colimits (so to regular noetherian Q-algebras by Popescu), and étale base change HH_*(B) ≅ B ⊗_A HH_*(A) for A → B étale. RT.1's text: 'Construct the Hochschild chain complex of an associative algebra … Define faces, degeneracies, cyclic operators and Connes's B … Prove Morita invariance, external products, base change under actual Tor hypotheses and the smooth characteristic-zero HKR comparison.' L.5 uses it for HH_*(k) = k for perfect k, HH_* of k[x]/(x^e), the rational relative cyclic homology of truncated polynomial algebras and the characteristic-zero comparison with differential forms.

Needed by: `L.4/connes-operator`, `L.5/hochschild-homology-of-perfect-field`, `L.5/hochschild-homology-of-truncated-polynomial-algebra`, `L.5/relative-cyclic-homology-of-truncated-polynomial-algebra`, `L.5/relative-k-of-truncated-polynomial-char-zero`, `L.5/log-differentials-divisible-part`, `L.5/log-thh-low-degrees`.

### RefinedTraceMethods:RT.2

THH of spectral categories (in particular of Z-linear categories via Eilenberg–Mac Lane spectra of the Hom-groups) by cyclic realisation, with the T-action as coherent data and its genuine cyclotomic structure (genuine C_{p^n}-fixed points, restriction R through geometric fixed points, inclusion F, transfer V), homotopy orbits, homotopy fixed points and Tate constructions with the norm cofibre sequence and multiplicative structure, and the agreement of the classical genuine TR/TC with the Nikolaus–Scholze TC for bounded-below cyclotomic spectra. RT.2's text: 'Construct THH of spectral categories and E₁-algebras by cyclic realization. Give the S¹-action as coherent data … Construct restriction, homotopy orbits, homotopy fixed points and Tate constructions with their norm/fibre sequence and multiplicative structure … State bounded-below/completion hypotheses when using the modern fixed-point formula, and prove agreement with the classical genuine-equivariant TR/TC formulation used by local K-theory calculations.' L.4 builds Hesselholt–Madsen's T(C) of a linear Waldhausen category, its TR^n, R, F, V and TC(C;p) on these foundations and specialises the comparison to T(k), T(A), T(A|K).

Needed by: `L.4/thh-of-linear-waldhausen-category`, `L.4/tr-pro-spectrum`, `L.4/norm-restriction-cofibre-sequence`, `L.4/p-typical-tc`, `L.4/hm-conventions-agree-with-nikolaus-scholze`, `L.4/log-thh-bounded-below`, `L.4/multiplicative-tate-spectral-sequence`, `L.4/dundas-mccarthy-equivalence-criterion`, `L.4/thh-structure-maps-f-equivalences`, `L.4/connes-operator`, `L.4/tr-homotopy-orbit-spectral-sequence`, `L.4/integral-and-p-typical-tc-agree-after-completion`, `L.4/thh-additivity-theorem`, `L.4/dvr-tr-agrees-with-ring-tr`, `L.5/log-thh-tame-descent`, `L.5/gamma-hat-all-levels`, `L.5/thh-of-perfect-field`, `L.5/thh-of-pointed-monoid-algebra`.

### RefinedTraceMethods:RT.3

The cyclotomic trace K(A) → TC(A; p) and its naturality in exact functors (RT.3: 'Construct the Dennis/cyclotomic trace from the same K-theory functor and prove its naturality'), applied to − ⊗_{𝓞_F} 𝓞_v. The cyclotomic trace K(C) → TC(C;p) for linear Waldhausen categories (in particular C^b_z(P_A), C^b_q(P_A) and C^b_z(P_A)^q), natural in exact functors and multiplicative for bi-exact symmetric monoidal structures; McCarthy's theorem that for a map of rings R → R̄ with nilpotent kernel the square K(R) → TC(R), K(R̄) → TC(R̄) is homotopy cartesian after profinite (p-)completion; Goodwillie's rational theorem K_q(A,I) ⊗ Q ≅ HC_{q−1}(A,I) ⊗ Q for I nilpotent. RT.3's text: 'Construct the Dennis/cyclotomic trace from the same K-theory functor and prove its naturality, multiplicativity and compatibility with support/relative fibres. Prove the relative nilpotent comparison theorem with its connective input and p-completion assumptions, and the rational relative K/cyclic-homology comparison with the stated nilpotence hypotheses.' RT.3's own tests ('Test a square-zero extension and a truncated polynomial algebra') are to stay at the low-degree boundary comparisons it states; the full calculations are L.5's (restructure entry).

Needed by: `L.7/cyclotomic-trace-completion`, `L.4/thh-of-linear-waldhausen-category`, `L.4/tr-pro-spectrum`, `L.4/k-tc-localization-square`, `L.5/trace-equivalence-finite-witt-algebras`, `L.5/relative-k-of-truncated-polynomial-over-perfect-field`, `L.5/relative-k-of-truncated-polynomial-regular-fp`, `L.5/relative-k-of-truncated-polynomial-char-zero`.

### RefinedTraceMethods:RT.4:topological

RT.4:topological's text: 'Construct topological complex K-theory from vector bundles, prove Bott periodicity and its spectrum-level multiplication ... Identify π_*ku=ℤ[β] and π_*KU=ℤ[β,β⁻¹]'. L.1 uses BU as a homotopy-commutative H-group with π_{2i}(BU) ≅ Z, π_{2i−1}(BU) = 0, and additionally needs, beyond that text: (a) Adams operations ψ^k: BU → BU as H-maps representing ψ^k on K̃U^0, with ψ^jψ^k ≃ ψ^{jk}, ψ^kψ^q ≃ ψ^qψ^k, ψ^k = k^i on π_{2i}(BU) = K̃U(S^{2i}) (K-book Example II.4.4.1) and ψ^q acting by q^i on the mod-ℓ Chern class c_i ∈ H^{2i}(BU; F_ℓ); (b) the λ-ring structure on [X, BU] (K-book Example IV.5.7.1); (c) the Atiyah map R_C(G) → [BG, Z × BU] as a λ-ring homomorphism; (d) K̃U^1(BG) = 0 for finite G and the vanishing of lim^1 of K̃U^0(BGL_n(F_q)) (Atiyah–Segal). Items (a)–(d) are proposed as 'RefinedTraceMethods, Part II' in restructure if RT.4:topological does not take them. RT.4:topological's text: 'Construct topological complex K-theory from vector bundles, prove Bott periodicity and its spectrum-level multiplication, and define ku as the connective cover of KU.' L.6 needs, beyond that text and beyond L.1's request for integral Adams operations: the p-adic Adams operations Ψ^k, k ∈ ℤ_p^×, on the p-completions of ℤ × BU and BU, acting on π_{2i} by k^i, so that FΨ^k = hofib(Ψ^k − 1) is defined for p-adic k (Hesselholt–Madsen Theorem D, K-book Theorem VI.7.9).

Needed by: `L.1/fpsi`, `L.1/fpsi-homotopy`, `L.1/fpsi-lifting`, `L.1/quillen-map`, `L.1/fpsi-cohomology`, `L.1/frobenius-is-adams`, `L.1/adams-on-finite-field-k`, `L.6/hm-theorem-d`.

### SchemeKTheoryOperations:S.6

S.6's text: 'Construct λ-operations using a genuine higher K-theory construction, not just the exterior-power functor on objects. Establish Adams operations ψ^k and their multiplication law.' L.1 needs these for affine schemes in the Quillen–Hiller form of K-book IV.5: λ^k and ψ^k on K_0(A) × [X, BGL(A)^+] for commutative A, induced from the representation rings R_A(GL_n(A)) through q (Proposition IV.5.3, Example IV.5.3.1), natural in A, with ψ^jψ^k = ψ^{jk}, ψ^k additive on K_n(A) for n > 0, ψ^p = Φ^* on R_A(G) when pA = 0 (Ex. II.4.2(b)), and Hiller's universality (Proposition IV.5.7) for maps to representable functors.

Needed by: `L.1/adams-psi-p-frobenius`, `L.1/adams-on-finite-field-k`.

### StableHomotopyKTheory:H.6

H.6's text: 'Define E/m as the cofiber of multiplication by m on a spectrum. Prove the Bockstein exact sequence ... Construct exact couples from filtered spectra and convergence statements ... These are used in M and L'. L.1 needs, beyond the Bockstein node StableHomotopyKTheory:H.6/mod-l-homotopy-and-bockstein-sequence: (a) the homotopy associative and commutative multiplication on the Moore spectrum P^∞(Z/ℓ^ν) for ℓ^ν ∉ {2, 3, 4, 8} (Araki–Toda; K-book IV.2, Products) and Browder's scholium for spectra with no positive even homotopy; (b) the Eilenberg–Moore spectral sequence H^*(X ×_B Y; k) ⇐ Tor_{H^*(B)}(H^*(X), H^*(Y)) for a fibration over a simply connected base with finite type cohomology, used for H^*(FΨ^q; F_ℓ).

Needed by: `L.1/mod-m-products`, `L.1/fpsi-cohomology`, `L.1/k-theory-mod-m`, `L.1/bott-element`, `L.2/rigidity-l-adic`, `L.2/localisation-bockstein-compatibility`, `L.2/odd-k-l-torsion`, `L.4/p-typical-tc`, `L.4/moore-spectrum-splitting-for-hz-modules`, `L.4/integral-and-p-typical-tc-agree-after-completion`, `L.4/multiplicative-tate-spectral-sequence`, `L.5/thh-of-dvr-p-adic`, `L.5/log-thh-mod-p`, `L.5/log-thh-p-adic`, `L.5/connecting-map-of-kappa`, `L.5/bott-element-in-tr`, `L.5/gamma-hat-all-levels`, `L.5/frobenius-surjective-odd-degrees`, `L.5/log-de-rham-witt-tr-mod-pv`, `L.5/roots-of-unity-torsion-in-log-drw`, `L.5/thh-of-perfect-field`, `L.5/trace-equivalence-finite-witt-algebras`, `L.5/trace-isomorphism-for-local-field`, `L.5/thh-of-truncated-polynomial-algebra`, `L.5/relative-tc-of-truncated-polynomial-algebra`, `L.5/relative-k-of-truncated-polynomial-over-perfect-field`, `L.5/relative-k-of-truncated-polynomial-regular-fp`, `L.5/relative-k-of-truncated-polynomial-char-zero`, `L.5/tc-of-regular-fp-algebra`, `L.1/completed-k-theory`, `L.6/completion-exact-sequence`, `L.6/hm-etale-comparison`, `L.7/completion-map`, `L.7/transfer-completion-formula`, `L.7/karoubi-completion-square`, `L.7/semilocal-completed-map`.

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality

Local Tate duality for finite Galois modules of a p-adic field (Layer 5's 'duality'), in the form #H²(E, μ_{p^ν}^{⊗2}) = #H⁰(E, μ_{p^ν}) (K-book VI.7, p. 516: 'H²(E, μ_m^{⊗i+1}) is isomorphic to H⁰(E, μ_m^{⊗i})'). Layer 5's 'Construct local Tate duality from the evaluation pairing Hom(A,μ_n) × A → μ_n' (tateDualityPairing_perfect_mixed), 'Prove finiteness of H⁰, H¹, H² (finite_H), the cardinality Euler characteristic', 'h2MuEquivZMod_mixed : H²(F,μ_n) ≃ ZMod n' and 'kummerEquiv_mixed is valid for every n ≠ 0', for F/ℚ_p finite; used for M = ℤ/p^ν(j) and its dual ℤ/p^ν(1 − j), and for #H^0·#H^2/#H^1 = p^{−νd}. L.6 also needs H^k(F, M) = 0 for k ≥ 3 and finite M (cd_p F = 2), which Layer 5's exported list does not name.

Needed by: `L.3/moore-kernel-p-divisible-mixed-characteristic`, `L.6/local-duality-for-tate-twists`, `L.6/h1-of-tate-twists`, `L.6/finite-coefficient-lichtenbaum-quillen`, `L.6/hm-theorem-a`, `L.6/milnor-k-of-local-fields`.

### tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity

Local reciprocity for finite abelian extensions (localArtinEquiv and its multiplicative form normResidue), with the arithmetic normalisation 'localArtinMap(π_K) = arithmeticFrobenius for an unramified extension' and the triviality of the Artin image of units on unramified extensions; used for the tame formula and for the norm criterion of the norm residue symbol.

Needed by: `L.3/tame-component`, `L.3/norm-residue-local-reciprocity`.

### tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions

Layer 0's 'Finite extensions, I' (finiteExtension_isNonarchimedeanLocalField: a finite extension of a nonarchimedean local field is one, with no structure assumed on L) and 'Finite extensions, II' (its integer ring is the integral closure, a henselian DVR with finite residue field). L.2 applies its henselian-DVR results to every finite subextension of L^sep.

Needed by: `L.2/w-invariant-local-field`, `L.2/separable-closure-l-torsion`, `L.2/e-invariant-local-field`.

### tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group

From Layer 1's 'Structure of Kˣ': 'Prove that the torsion subgroup μ(K) is finite', with the API items 'finiteness of μ(K) and its order' and 'the p-part and the prime-to-p part of μ(K)', together with 𝒪[K]ˣ ≃ μ_{q−1} × U(K,1) and U(K,1) pro-p; used to write μ(E) = μ_{q−1}(E) × μ_{p^∞}(E) of order w = (q − 1)p^a, with a = 0 in characteristic p. Layer 1's 'Structure of Kˣ': 'Prove that the torsion subgroup μ(K) is finite', with its p-part and prime-to-p part, applied to K = L(ζ_p) and L(√−1) for L/ℚ_p finite, so that the exponent a of L.6/p-adic-w-invariant is finite.

Needed by: `L.3/norm-residue-map`, `L.3/hilbert-symbol-components`, `L.3/moore-mixed-characteristic`, `L.6/p-adic-w-invariant`.

### tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius

Layer 2: 'For every f ≥ 1 there is exactly one unramified intermediate field K_f of AlgebraicClosure K with [K_f : K] = f' and the residue correspondence Gal(L/K) ≃ Gal(𝓀[L]/𝓀[K]) with the Frobenius; with Layer 4's exact sequence 1 → I_K → G_K → Ẑ → 1. L.2 uses that the residue fields of finite subextensions exhaust \bar F_q and that G_L acts on residue fields through a surjection onto Gal(\bar F_q/F_q).

Needed by: `L.2/w-invariant-local-field`, `L.2/separable-closure-l-torsion`, `L.2/e-invariant-local-field`.

### tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places

Layer 5.3's 'semilocalEquiv v : K_v ⊗[K] L ≃ₐ[K_v] ∏ (w : W v), L_w' with its value on pure tensors, and Layer 5.2's completionAlgHom v w with its tower equation; used for the transfer and semilocal completion formulas (Tau Ceti's adicCompletionExtension supplies the individual maps K_v → L_w at the pinned commit).

Needed by: `L.7/transfer-completion-formula`, `L.7/semilocal-completed-map`.

### tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory

Surjectivity of the Kummer map K^×/K^{×n} → H^1(G_K, μ_n) for n invertible in the field K (Hilbert 90 for K^sep/K), completing Tau Ceti's TauCeti.kummerClassMap (injective by TauCeti.kummerClassMap_injective). The layer's title: 'The Galois interface: Hilbert 90 and Kummer theory'. L.5 uses it with n = p for the degree-one case of Theorem 6.1.6 (K^×/K^{×p} = K_1(K;Z/p) ≅ TC_1(A|K;p,Z/p) ≅ H^1(K,μ_p)).

Needed by: `L.5/tc-of-log-dvr-mod-p`.

## Structural proposals

### Rigidity for henselian pairs is owned by L.2; MotivicEtaleKTheory M.7 imports it

*ownership.* M.7's text asks to 'Prove the relevant rigidity and étale descent theorems', and the reviewed audit lists M.7 as a duplicate of L.2's rigidity target. The atlas places L.2 upstream of M.7 (M.7 requires KTheoryFiniteLocalFields:L.2; stage edge L.2 → M.7), so the rigidity theorem for henselian pairs with coefficients prime to the residue characteristic (Gabber, with Suslin's and Gillet–Thomason's cases) is planned once, as L.2/gabber-rigidity, and M.7 imports it. Proposal: narrow M.7's rigidity target to 'import L.2's rigidity for henselian pairs; prove Suslin's rigidity for extensions of algebraically closed fields (K-book VI.1.1–VI.1.3) and the Aut(F)-module structure of the torsion in K_*(F^sep) (VI.1.6, VI.1.7.1)', which is not a henselian-pair statement and which ArithmeticKTheory N.1's packet records as ownerless. L.2 supplies its ℓ ≠ p case for separable closures of local fields (L.2/separable-closure-l-torsion).

### Finite-coefficient K-theory of rings is planned in L.1

*ownership.* ArithmeticKTheory N.1's packet records the gap 'K-theory with finite coefficients has no supplier stage' and names GeneralAlgebraicKTheory K.7 or KTheoryFiniteLocalFields L.1 as candidates. L.1 is the first layer that computes with it and is upstream of all its consumers (L.2, ArithmeticKTheory N.5–N.6, MotivicEtaleKTheory M.7, HabiroNumberFields HB.1), so it is planned here: L.1/k-theory-mod-m (K(R)/m through StableHomotopyKTheory H.6's cofibre), L.1/bott-element and L.1/mod-m-products. If the orchestrator prefers GeneralAlgebraicKTheory, these three nodes move unchanged to a 'GeneralAlgebraicKTheory, Part II: coefficients' layer upstream of L.1.

### K2SymbolsBrauer T.1 cites the umbrella GeneralAlgebraicKTheory:K.2, which blocks L.1 from importing K_2(F_q) = 0

*cycle.* In the stage graph built from atlas requires, stage edges and all packet prerequisites, K2SymbolsBrauer:T.1:classical, T.1:plus and T.2:symbols lie downstream of KTheoryFiniteLocalFields:L.1, through L.1 → ArithmeticKTheory:N.3:ranks → K3BlochGroups:V.2 (node V.2/k3-rank-borel) → V.4 → GeneralAlgebraicKTheory:K.2:low-degree-comparisons → GeneralAlgebraicKTheory:K.2 → K2SymbolsBrauer:T.1:classical (nodes T.1/k2-definition and T.1/k2-pi2 cite the umbrella stage GeneralAlgebraicKTheory:K.2). With those two citations replaced by GeneralAlgebraicKTheory:K.2:plus the path disappears (checked). Until then L.1/degree-two-symbols proves K_2(F_q) = 0 from Quillen's computation and records the agreement with K2SymbolsBrauer:T.2/k2-finite-field as an acceptance check, not a prerequisite, as the brief's instruction to import it would close a cycle.

### RefinedTraceMethods, Part II: Adams operations and classifying spaces in topological K-theory

*part-ii.* L.1 needs, and RT.4:topological's text does not state: Adams operations ψ^k on BU as H-maps with ψ^k = k^i on π_{2i}(BU) and their action on Chern classes; the λ-ring structure on [X, BU]; the Atiyah map R_C(G) → [BG, Z × BU]; and the Atiyah–Segal vanishing K̃U^1(BG) = 0 for finite G with the lim^1 vanishing for BGL(F_q). Proposal: add them to RT.4:topological or form 'RefinedTraceMethods, Part II: Adams operations and representations in KU', upstream of L.1 (requested; see requests).

### Proposed sub-layers of L.1

*sub-layers.* L.1 is broad. Proposed sub-layers, with their nodes: L.1a 'Brauer lifting and FΨ^q' (brauer-character, green-virtual-character, brauer-lift, brauer-lift-frobenius-invariant, brauer-lift-lambda-ring, brauer-lift-stabilisation, brauer-lift-cyclic, fpsi, fpsi-homotopy, fpsi-lifting, quillen-map); L.1b 'Quillen's cohomology comparison' (fpsi-cohomology, fpsi-cohomology-ring, gl-sylow-in-wreath, gl-cohomology-detection, gl-mod-p-acyclic, quillen-homology-iso, quillen-fibration, quillen-k-groups); L.1c 'Galois structure, transfers and coefficients' (the remaining L.1 nodes). The planets (at most six) are Brauer lifting, the space FΨ^q, Quillen's theorem on BGL(F_q)^+, K-theory of finite fields, K-theory with finite coefficients, Bott element.

### Duplicates listed by the audit for L.1 and L.2 are imported, not re-planned

*ownership.* K₀(F_q) = Z: baseline TauCeti.SplitK0.finrankEquiv and KTheoryLowDegrees Z.2. K₁(F_q) and the determinant: KTheoryLowDegrees U.6 (with the norm from U.5). K₂(F_q) = 0 by symbols: K2SymbolsBrauer T.2/k2-finite-field (the audit's 'T.5' duplicate; the T.3 packet moved it to T.2), compared in L.1/degree-two-symbols. K₃(F_q): K3BlochGroups V.5 specialises L.1 and consumes L.1/quillen-k-groups, L.1/finite-field-galois-descent and L.1/finite-field-transfer-formulas. KU and Bott periodicity: RefinedTraceMethods RT.4:topological. The plus construction: StableHomotopyKTheory H.3 and GeneralAlgebraicKTheory K.2:plus. The Bockstein sequence: StableHomotopyKTheory H.6. Rigidity: owned here (first entry).

### The global-to-local K-theory map above p is owned by L.7; PadicHodgeRegulators D.4 imports it

*ownership.* The reviewed audit lists PadicHodgeRegulators D.4 as duplicating L.7. L.7's text: 'This supplies N's local conditions and D's regulator map. The unramified p>3 K₃ regulator theorem is owned by D, using the completed K₃ model established here.' D.4's text: 'identify F⊗Q_p with its product of completions. Construct the localisation map from global K₃, compare with all local embeddings, and apply D.3. Prove compatibility with norm/trace and with Frobenius.' Proposal: L.7 owns the map λ_{F,p} : K_n(F) → ∏_{v|p} K_n(F_v; ℤ_p) in every degree with its restriction and transfer compatibilities (L.7/semilocal-completed-map, L.7/restriction-completion-square, L.7/transfer-completion-formula); the completed groups are L.6's; D.4 is narrowed to the Frobenius compatibility, the application of D.3 and the export of the regulator, and imports λ_{F,3}. Add the stage link L.7 → D.4; it creates no cycle (D.4 is neither upstream nor downstream of L.7 in the current graph of atlas requires, stage edges and packet prerequisites).

### Hilbert's Theorem 90 for K₂ and the torsion theorems for K₂ of fields have no owner

*ownership.* K-book III.6.6 (Hilbert 90 for K₂), III.6.7 (no p-torsion in characteristic p), III.6.8 (Tate–Suslin: elements of exponent n are {ζ, x}) and Izhboldin's III.7.8 are planned by no stage (K3BlochGroups records Izhboldin as a gap, and no K2SymbolsBrauer stage text names them). L.3 needs III.6.7 and plans it as L.3/k2-no-p-torsion-char-p in the generality of all fields of characteristic p. Proposal: K2SymbolsBrauer (a Part II after T.4, 'Hilbert 90 and torsion in K₂ of fields') owns Hilbert 90 for K₂ and III.6.7–III.6.8, and L.3/k2-no-p-torsion-char-p moves there when that part exists.

### Karoubi's square in general belongs to GeneralAlgebraicKTheory

*ownership.* L.7/karoubi-completion-square is Karoubi's Proposition V.7.5 for a discrete valuation ring and its completion, the only case L.7 uses. The general statement (A → B with A/sA ≅ B/sB for a central multiplicative set S of non-zero-divisors, with the equivalence H_S(A) ≃ H_S(B), the homotopy cartesian square and the Mayer–Vietoris sequence) is a fundamental theorem of ring K-theory and fits GeneralAlgebraicKTheory K.3 (localisation) or K.5 (relative theory and excision). Proposal: GeneralAlgebraicKTheory plans it in general and L.7's node becomes its specialisation.

### Real places of a number field are outside L.7's text but inside N.6's wild kernel

*rescope.* L.7's text concerns 'completion of a number field at a finite place'. ArithmeticKTheory N.6/tame-and-wild-kernels intersects the kernels of K_{2i}(F) → K_{2i}(F_v) over all places, the real ones included, and in degree two needs that the kernel of K₂(F) → K₂(ℝ) on torsion is the kernel of the sign symbol, i.e. K₂(ℝ) = {±1} ⊕ (uniquely divisible) (K-book Example III.7.2(c), whose unique divisibility is left there to 'the norm map'). Proposal: N.6 (or K2SymbolsBrauer T.5, which owns the real sign symbol) states the real-place map and K₂(ℝ); L.7 is not widened.

### The localisation splitting of K₂ of a local field is L.2's

*move-nodes.* The splitting u ↦ {ω(u), π} of the tame symbol K₂(E) → k^× and its independence of π are the case i = 1 of L.2/even-k-field-splitting (author A), so L.3 plans no separate node and cites it; L.3/local-k2-localisation-sequence keeps only the K₂-specific exactness and the identification of the boundary with the tame symbol.

### General TR/TC comparison is RT.2's; L.4 owns the Hesselholt–Madsen specialisation

*ownership.* The reviewed audit lists RefinedTraceMethods RT.2 as duplicating L.4's 'comparison with the classical TR/Frobenius convention'. The packet keeps one owner for each piece: RT.2 owns the general agreement of genuine (Bökstedt–Hsiang–Madsen) TR/TC with Nikolaus–Scholze for bounded-below cyclotomic spectra; L.4 owns Hesselholt–Madsen's model T(C) of a linear Waldhausen category, their indexing TR^n = T(C)^{C_{p^{n−1}}}, the convention TC = hofib(R − F), π_0 TR^n = W_n, the verification that T(k), T(A), T(A|K) are bounded below, and the localisation sequences (nodes L.4/hm-conventions-agree-with-nikolaus-scholze, L.4/log-thh-bounded-below, L.4/tr-localization-sequence, L.4/k-tc-localization-square). The nilpotent (McCarthy) and rational (Goodwillie) relative theorems are imported from RT.3 and applied, not planned, in L.5.

### THH analogues of Waldhausen's additivity, fibration and resolution theorems are owned by L.4

*ownership.* No stage text of RefinedTraceMethods or GeneralAlgebraicKTheory states additivity, fibration, resolution or localisation theorems for THH^{C_r} of Waldhausen categories; HM §1.3–1.5 need them for the localisation square that L.4's text assigns to this layer ('prove the localization square'). They are planned here (nodes L.4/thh-additivity-theorem … L.4/thh-projective-complexes-f-equivalence) with the K-theory versions of GeneralAlgebraicKTheory K.3/K.4 cited as their Φ = ob cases. If RefinedTraceMethods adopts localisation for spectral categories (Blumberg–Mandell), RT.2 would be the natural owner of the general theorems and L.4 would keep the DVR application and the dévissage input.

### RT.3 and RT.6 test calculations import from L.5 only where the graph allows

*ownership.* The audit lists RT.3 ('Test a square-zero extension and a truncated polynomial algebra') and RT.6 ('the finite-field THH comparison consumed by local K-theory, … the square-zero relative trace') as duplicating L.5's calculations. RT.3 is upstream of L.4 and L.5, so RT.3 cannot import them (RT.3 → L.4 → L.5 → RT.3 would be a cycle): its tests must stay at the low-degree boundary comparisons with K₂ symbols that RT.3's text states. RT.6 is not upstream of L.5; its acceptance examples should cite L.5/thh-of-perfect-field and L.5/relative-k-of-truncated-polynomial-char-zero (proposed link KTheoryFiniteLocalFields:L.5 → RefinedTraceMethods:RT.6) instead of recomputing them. The full calculations (Hesselholt–Madsen's K_{2m−1}(k[x]/(x^n),(x)) ≅ W_{mn}(k)/V_nW_m(k), Hesselholt's characteristic-zero formula) are owned by L.5.

### CrystallineCohomology CR.5:log-algebra should own absolute log differentials of prelog rings

*rescope.* L.5 needs, for an arbitrary prelog ring (R,M), the module ω^1_{(R,M)} = (Ω^1_R ⊕ R ⊗ M^gp)/⟨dα(a) − α(a) ⊗ a⟩ with absolute Ω^1_R and the universal log dga ω^*_{(R,M)} (HM §2.2, after Kato). CR.5:log-algebra's text constructs prelog rings and 'the explicit log differential module … for the standard semistable chart', which presupposes the general notion; it should state the general construction explicitly (it is the most foundational owner), and L.5 imports it (request). L.5 keeps the DVR-specific results (residue sequence, cyclicity, torsion, tame and wild base change).

### 'Logarithmic de Rham–Witt' in HL.2 and 'de Rham–Witt with log poles' in L.5 are different objects

*ownership.* The audit flags HigherLocalFieldsAndHigherClassFieldTheory HL.2 ('introduce logarithmic de Rham–Witt/Artin–Schreier–Witt coefficients for the wild characteristic case') as overlapping L.5. HL.2's object is W_nΩ^r_log ⊂ W_nΩ^r of a characteristic-p field (generated by dlog forms; built from CR.4's ordinary complex), used with the Bloch–Kato–Gabber symbol. L.5's object is Hesselholt–Madsen's W_•ω^*_{(A,M)} for a mixed-characteristic complete DVR with log poles at the closed point (p odd), used to compute TR(A|K). Answer to HL's request ('the logarithmic and discrete-valuation de Rham-Witt comparison for complete discrete valuation rings'): L.5 supplies L.5/log-de-rham-witt-complex, L.5/log-de-rham-witt-dvr-mod-p (explicit basis with the ramification invariant r(i,e_K)), L.5/log-differentials-residue-sequence and, in equal characteristic, L.5/tr-of-smooth-fp-algebra (TR of k[[t]] is WΩ of CR.4). It does not supply W_nΩ^r_log or the Bloch–Kato graded pieces of the Milnor K filtration, which remain HL.1/HL.2's targets on CR.4.

### Proposed sub-layers of L.4 and L.5 for the atlas

*sub-layers.* L.4 (35 nodes): L.4a 'Hesselholt–Madsen TR and TC' (thh-of-linear-waldhausen-category, thh-structure-maps-f-equivalences, tr-pro-spectrum, norm-restriction-cofibre-sequence, p-typical-tc, connes-operator, moore-spectrum-splitting-for-hz-modules, tr-homotopy-orbit-spectral-sequence, pi0-tr-is-witt-vectors, hm-conventions-agree-with-nikolaus-scholze, integral-and-p-typical-tc-agree-after-completion, log-thh-bounded-below, three-by-three-lemma); L.4b 'Tate cohomology and the Tate spectral sequence' (tate-cohomology-hm-model, tate-cohomology-ring-of-odd-cyclic-group, multiplicative-tate-spectral-sequence, tate-spectral-sequence-connes-module, tate-d2-is-connes-operator); L.4c 'Localisation for THH of Waldhausen categories' (the fifteen nodes from exact-simplicial-homotopy-invariance to k-tc-localization-square). L.5 (83 nodes): L.5a 'Witt vectors and log differentials of complete DVRs' (complete-dvr-eisenstein-presentation … hochschild-homology-of-perfect-field); L.5b 'De Rham–Witt with log poles and TR in low degrees' (log-witt-complex … connecting-map-of-kappa); L.5c 'The Tate spectral sequence and Theorem C' (lubin-tate-unit-polynomial … tc-of-log-dvr-mod-p); L.5d 'Perfect fields, truncated polynomial and regular F_p-algebras' (thh-of-perfect-field … tc-of-regular-fp-algebra). With sub-layers each could show up to six planets; at the stage level the packet marks six per stage.

### Hesselholt–Madsen Theorem D (1997) and the trace isomorphism for local fields are placed in L.5

*ownership.* K(A)^_p ≃ TC(A;p)^_p[0,∞) for finite W(k)-algebras needs TC of perfect fields (an L.5 calculation), so it is L.5/trace-equivalence-finite-witt-algebras, and the resulting tr: K_i(K;Z/p^v) ≅ TC_i(A|K;p,Z/p^v) (i ≥ 1) is L.5/trace-isomorphism-for-local-field. HM 2003's Theorems A and D and the étale comparison 6.1.10 are K-theoretic and belong to L.6, which consumes these nodes.

### The completed K₃ carrier and its rank and torsion are owned by L.6; PadicHodgeRegulators D.3 imports them

*ownership.* The reviewed audit lists PadicHodgeRegulators:D.3 as duplicating L.6 ('Identifies the completed K₃(L; ℤ_p) of unramified L/ℚ_p with a local H¹ group, free of rank equal to the local degree: the j = 2 case of this layer's rank and torsion statement'). The atlas edge L.6 → D.3 already exists and the accepted RS-26 keeps 'The KTheoryFiniteLocalFields:L.6 cohomology/rank input' as an import. Proposal: L.6 owns the carrier K(R; ℤ_p) (L.1/completed-k-theory, with the product comparison as its API item KTheory.completed_prod), the identification K_3(L; ℤ_p) ≅ H^1(L, ℤ_p(2)) ≅ ℤ_p^{[L:ℚ_p]} ⊕ ℤ/w_2^{(p)}(L) for every finite L/ℚ_p (L.6/completed-k-groups-of-p-adic-fields, L.6/odd-completed-k-groups-are-h1) and its unramified p > 3 torsion-free case (L.6/completed-k3-of-unramified-fields). D.3's first part ('identify completed K₃ with the appropriate local H¹ group and show it is free of rank equal to the total local degree') becomes the application of these nodes factorwise to a finite product; D.3 keeps the dilogarithm integrality, the reduction modulo p, the spanning and the equal-rank conclusion. D.4 consumes L.7's global-to-local map (author B's restructure entry).

### Abelian-group tools for divisible components: one owner

*ownership.* L.6 plans the maximal divisible subgroup Div(A) (L.6/maximal-divisible-subgroup), the p-adic Tate module (L.6/p-adic-tate-module) and the lattice lemma for torsion-free ℤ_(p)-modules (L.6/torsion-free-lattice-lemma), none of which the pinned libraries have. ArithmeticKTheory:N.6/divisible-subgroup defines the different subgroup ⋂_m mA for number fields; N.6 is downstream of L.6 (through L.7), so it can cite L.6's API item maxDivisible_le_iInf (Div(A) ⊆ ⋂_m mA, with equality for torsion-free groups and for divisible-plus-bounded groups, which covers the K-groups of local fields). Proposal: keep both notions, each with one owner, and let N.6 cite L.6 for the comparison; if a foundational algebra roadmap is created, the three L.6 nodes move there unchanged.

### Stage links that L.6's prerequisites add

*links.* L.6's nodes use, besides its atlas requirements (L.3, L.5, M.7): MotivicEtaleKTheory M.1, M.4, M.5, M.6 and M.8; ArithmeticGaloisDuality R02.1; CrystallineCohomology CR.4; RefinedTraceMethods RT.4:topological; ArithmeticKTheory N.4 and N.5 (w-invariant and e-invariant nodes); K2SymbolsBrauer T.2 (Milnor K-theory and its graded map); StableHomotopyKTheory H.6; GeneralAlgebraicKTheory K.1, K.3, K.7; and Tau Ceti ClassFieldTheory Layer 5 and LocalFieldsRamification Layer 1 (the link RT-AREA-ktheory-1/38 proposed). Each was checked against the graph of atlas requires, stage edges and all packet and decomposition prerequisites: none is downstream of L.6, so no cycle arises.

### The local–global examples of K-book VI.7.6–7.8 (Handbook 64–66) belong to L.7

*ownership.* K-book Examples VI.7.6–7.8 (Handbook Examples 64–66) compare K_*(ℤ) or K_*(F) of a number field F with the completed groups ⊕_{v|p} K_n(F_v; ℤ_p): Rognes' theorem that K_{4k+1}(ℤ) ⊗ ℤ_2 → K_{4k+1}(ℤ_2; ℤ_2) is an isomorphism for k > 1, the rank count r_2 against Σ[F_v : ℚ_p], and the Leopoldt/Soulé injectivity question for totally real fields. They use L.6's completed groups (L.6/completed-k-groups-of-p-adic-fields) and the global-to-local map of L.7 (author B's L.7/semilocal-completed-map). Proposal: L.7 (or ArithmeticKTheory N.5) plans them as applications; L.6 plans no node for them. Rognes' theorem itself (Rognes, 'Algebraic K-theory of the two-adic integers', J. Pure Appl. Algebra 134 (1999)) was not read.

### Proposed sub-layers of L.6 for the atlas

*sub-layers.* L.6a Completed carrier and abelian-group tools: completed-k-theory, maximal-divisible-subgroup, p-adic-tate-module, completion-exact-sequence, divisible-subgroup-criterion, torsion-free-lattice-lemma. L.6b Galois cohomology of Tate twists: p-adic-w-invariant, w-invariant-prime-to-p-factor, p-adic-w-invariant-of-q-p, h0-of-tate-twists, local-duality-for-tate-twists, h1-of-tate-twists, h1-with-divisible-coefficients. L.6c Étale comparison: ring-of-integers-versus-field, hm-etale-comparison, hm-theorem-a, finite-coefficient-lichtenbaum-quillen, discrete-coefficient-k-groups. L.6d Completed K-groups: odd-completed-k-groups-are-h1, even-completed-k-groups-are-h2, completed-k-groups-of-p-adic-fields, completed-k-groups-of-q-p, completed-k3-of-unramified-fields, hm-theorem-d. L.6e Integral groups and comparison maps: p-primary-torsion-of-odd-k-groups, odd-integral-k-groups, even-k-groups-mod-p-powers, even-integral-k-groups, even-k-groups-tate-module, divisible-rank-relation, finite-coefficient-k-groups-structure, k3-torsion-free-lattice, even-integral-to-completed-comparison, odd-integral-to-completed-comparison, milnor-k-of-local-fields, uniquely-divisible-summand. L.6f Equal characteristic: power-series-de-rham-witt, geisser-hesselholt-regular-local, equal-characteristic-relative-k-theory, equal-characteristic-completed-k-groups, equal-characteristic-unique-p-divisibility, equal-characteristic-integral-structure. The six planets fall one each in L.6a, L.6c, L.6d (two), L.6e and L.6f.

## Dependencies between the layers

Within the roadmap, the nodes of each layer use the nodes of these other layers; the graph is acyclic.

- **L.2** uses L.1.
- **L.3** uses L.2.
- **L.5** uses L.1, L.4.
- **L.6** uses L.1, L.2, L.3, L.4, L.5.
- **L.7** uses L.1, L.2, L.3, L.4.

The atlas requirements of each layer:

- **L.1** requires `GeneralAlgebraicKTheory:K.2:plus`, `GeneralAlgebraicKTheory:K.3`, `RefinedTraceMethods:RT.4:topological`, `StableHomotopyKTheory:H.6`.
- **L.2** requires `KTheoryFiniteLocalFields:L.1`, `MotivicEtaleKTheory:M.1`.
- **L.3** requires `K2SymbolsBrauer:T.7`, `KTheoryFiniteLocalFields:L.2`.
- **L.4** requires `RefinedTraceMethods:RT.2`, `RefinedTraceMethods:RT.3`.
- **L.5** requires `CrystallineCohomology:CR.4`, `KTheoryFiniteLocalFields:L.4`.
- **L.6** requires `KTheoryFiniteLocalFields:L.3`, `KTheoryFiniteLocalFields:L.5`, `MotivicEtaleKTheory:M.7`.
- **L.7** requires `KTheoryFiniteLocalFields:L.6`.

## What this blueprint does not claim

- **Missing proofs.** The proofs no obtainable source contains are not supplied. The main ones are Quillen's computation of the cohomology of GL(𝔽_q), Green's theorem on Brauer characters, Gabber's rigidity, Merkurjev's theorem on the torsion of K₂ and the existence of the log de Rham–Witt complex. Each is a gap with the nodes that need it.
- **Integral finite generation.** No finite generation of the integral K-groups of a local field is asserted: the completed groups are finitely generated ℤ_p-modules, the integral groups are not.
- **p = 2.** Nothing is asserted at p = 2 for the trace-theoretic results, which assume p odd. The p = 2 case of the local-field descriptions rests on MotivicEtaleKTheory M.7.
- **Formalisation.** Nothing here is formalised. The suggested Lean file names the objects and states what the pinned libraries can express; the rest is recorded there as comments.
